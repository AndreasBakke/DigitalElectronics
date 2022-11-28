#include <stdio.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "altera_avalon_timer_regs.h"
#include "altera_avalon_performance_counter.h"
#include "sys/alt_irq.h"


//Global variables
int key_edge;
int led_position;
int test;


//Declare functions used in init
void init_all();
void init_timer();
void init_BUTTONS_interrupts();
void update_leds();
long factorial(int); //IMPORTANT to define factorial function to avoid error due to recursion

int main()
{
  alt_putstr("Lab5 started! \n");
  init_all();
  /*
   * EULER COMPUTATIONS
   */
  long time;
  double euler;
  int i, j;
  for (j = 0; j <15; j++){
	  PERF_RESET(PERFORMANCE_COUNTER_0_BASE); //Reset Performance Counter
	  PERF_START_MEASURING(PERFORMANCE_COUNTER_0_BASE); //Start Performance Counter
	  PERF_BEGIN(PERFORMANCE_COUNTER_0_BASE,1); // Begin performance counter
	  euler = 0;
	  for(i = 0; i < j; i++){
		  euler += (double)1/(factorial(i)); //Need to cast to double to not get 2.00000
	  }
	  PERF_END(PERFORMANCE_COUNTER_0_BASE,1);
	  time=(long)perf_get_section_time(PERFORMANCE_COUNTER_0_BASE,1); //Gets time as number of clock cycles.
	  time= time/50;
	  alt_putstr("Euler aprx. = %.10f \n", euler);
	  alt_putstr("Time = %ld usec\n",time); //time in microseconds
  }

  while (1);

  return 0; //Should never get here
}

/*
 * Factorial function for reursively finding factorial.
 */
long factorial(int n){

	  if (n == 0){
		  return 1;
	  }else{
		  return(n * factorial(n-1));
	  }
 }


void init_all() // From Lab5 figure17
{
	init_timer();
	init_BUTTONS_interrupts();
	led_position =0x01; //Initialize led to first position
	key_edge=0;
}

/*
 * TIMER INTERRUPT ROUTINE
 *  Modified from Lab5 figure 18
*/

static void timer_isr(void *contect) //Timer should be set to interrupt ever 250ms;
{
	IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE, 0x00); //Clear interrupt by writing 0s
	if ((key_edge & 0x01)==1)
	{
		led_position = (led_position+1)%8; //increments 0->7 and around
		if (led_position <= 0){ //If led is 0 or somehow negative, set next position to led 7
			led_position = 0b10000000;
		}
		else
		{
			led_position = led_position >> 1;
		}
	}
	else if((key_edge & 0x02)==1) {
		if (led_position >= 0b10000000){ //If led is 2^7 or somehow more, set next position to led 7
			led_position = 0b00000001;
		}
		else
		{
			led_position = led_position << 1; //Left shift
		}

	}
	update_leds();
}

/*
* TIMER INITIALIZATION ROUTINE
*/
void init_timer()
{
/* Write in the PERIOD register the value 0xbebc20 corresponding to 12.500.000 (250ms with 50mHZ clock) */
	IOWR_ALTERA_AVALON_TIMER_PERIODL(TIMER_0_BASE, 0xbc20);
	IOWR_ALTERA_AVALON_TIMER_PERIODH(TIMER_0_BASE, 0x00be);
	test=alt_ic_isr_register(TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID, TIMER_0_IRQ, timer_isr, NULL,NULL);
	if (test == 0)
		printf("Timer Interrupt Routine Registered\n");
		IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE, ALTERA_AVALON_TIMER_CONTROL_ITO_MSK | ALTERA_AVALON_TIMER_CONTROL_CONT_MSK | ALTERA_AVALON_TIMER_CONTROL_START_MSK);
}

/*
 * DISPLAY ROUTINE
 */

void update_leds(){
	//write value of led position
	IOWR_ALTERA_AVALON_PIO_DATA(LEDR_BASE, led_position & 0xff);
}

/*
 * BUTTON ROUTINE
 */

static void button_isr(void* context)
{
	/* Read the edge capture register from the button PIO
	into destination pointed by an appropriately cast pointer
 */
	*(volatile int*) context = IORD_ALTERA_AVALON_PIO_EDGE_CAP(KEYS_BASE);
	/* Write to the edge capture register to reset it */
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(KEYS_BASE, 0x3);
}

/*
* BUTTONS Initialization Routine
*/
void init_BUTTONS_interrupts()
{
	/* Enable 2 button interrupts */
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(KEYS_BASE, 0x3);
	/* Reset the edge capture register. */
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(KEYS_BASE, 0x3);
	/*
	 * Register the ISR.
	 * Uses the new API interface
	 * */
	test=alt_ic_isr_register(KEYS_IRQ_INTERRUPT_CONTROLLER_ID, KEYS_IRQ, button_isr, (void*) &key_edge, 0x0);
	if (test == 0) printf("PIO Interrupt Routine Registered\n");
}

