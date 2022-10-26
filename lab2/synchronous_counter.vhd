LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY synchronous_counter IS
	GENERIC(N: integer := 16);
	PORT(
	clk, RSTn, clear, en, UDn: IN std_logic;
	value: OUT std_logic_vector(N-1 DOWNTO 0)
	);
BEGIN
END synchronous_counter;



architecture behav of synchronous_counter is
begin
	sequential_logic : process(clk, RSTn)
    variable Q: unsigned(N-1 DOWNTO 0);

	begin
		if NOT (RSTn = '1') then
			Q := (OTHERS => '0');
			value <= std_logic_vector(Q);
		elsif rising_edge(clk) then
			if clear='1' then
				Q := (OTHERS => '0');
			elsif UDn = '1' AND en = '1' then
				Q := Q-1;
			elsif UDn = '0' AND en = '1' then
			 	Q := Q+1;
			end if; --clear logic
            value <= std_logic_vector(Q);
		end if ; -- rst logic
	end process ; -- sequential_logic

end behav ; -- behav



/*system spec
 two task
 counter
 two alarms
 set counter to interrupt (low level ISR1) then generate event for other task


 *Some lines are omitted here that will be already present
 *
 */

//libraries
#include "ee.h"
#include "ee_irq.h"

//Low level hardware specific definitions
#define __USE_LEDS__
#define __USE_BUTTONS__
#include "board/axiom_mpc5674fxmb/inc/ee_board.h"

volatile unsigned int ERROR_FLAG = 0;

//add task by declaring
DeclareTask( Task1);
DeclareTask( Task2);
//add events by declaring
DeclareEvent( TimerEvent1);
DeclareEvent( TimerEvent2);

/* some prototypes... */
//Advice only: define all prototypes of functions created in the project
//two functions and two global variables
//two function
void mydelay(unsigned long int del); //to form a loop creating a delay
void led_blink(unsigned char theled); //to change led configuration: blinking or not blinking

//global variables to set global status of led
volatile int led_status = 0; //command compiler to not optimize the variable
volatile int myErrorCounter; //to count number of errors to check the error hook working
/**/

/* just a dummy delay */
void mydelay(unsigned long int del) { //for loop stupid. busy wait
	volatile long int i; //compiler may remove because loop and no return of value  so volatile.
	for (i = 0; i < del; i++) {
		//empty
	}
}
/**/

/* Added for a finest debugger (run-time) tuning */
int tunable_delay = 50000;
/**/

/* sets and resets a led configuration passed as parameter, leaving the other
 * bits unchanged...
 */
void led_blink(unsigned char theled) { //Exam: not asked to write this function just implement?
	/* DisableAllInterrupts(); //process gets control and work without interruption. Scheduler stopped. if single core.
	led_status |= theled; //ledStatus = ledStatus bitwiseor theled unsafe but in C works. The desired led set to 1.
	EE_leds(led_status); //targetBoard EE,
	EnableAllInterrupts(); //disable enable similar to synchronization lock and unlock for the system
	mydelay((long int) tunable_delay); */

	DisableAllInterrupts();
	led_status ^= theled; //flip the desired led status. bitwise AND NOT
	EE_leds(led_status);
	EnableAllInterrupts();

}

//Exam: asked to fill the function
/* BUTTON_0 interrupts activate Task2. */
static void Buttons_Interrupt(void) { //ISR1 not needed in OIL but still used service routine hardware specific.
//	set alarmtask2 :> run task2*/ //Exam comment to be filled with code
	led_blink(0x01);
	EE_buttons_clear_ISRflag(BUTTON_0); //exam: filled.
}

static void Counter_Interrupt(void) {
	CounterTick(myCounter);

	EE_e200z7_setup_decrementer(2000); //target board specific
}

void ErrorHook(StatusType Error) { //executed when system catches error
	myErrorCounter++; //increment global counter //just in case although not executed due to infinite loop
	ERROR_FLAG = Error; // global variable set to error
	led_blink(0xFF);
}

/*
 * The StartupHook in this case is used to initialize the Button and timer
 * interrupts
 */
void StartupHook(void) { //runs at boot . can be done at initial part in main. hook more elegant
	EE_buttons_init(BUTTON_0, 3); //low level function. implementation board specific

	//in datasheet of ERIKA
	EE_e200z7_register_ISR(46 + 16, Buttons_Interrupt, 1); //initialize interrupts
	EE_e200z7_register_ISR(10, Counter_Interrupt, 0); //in datasheet of Erika
	EE_e200z7_setup_decrementer(2000); ////in datasheet of Erika

}

TASK( Task1) {
	//led_blink(0b10000000); //Basic tasks
	//TerminateTask();	//Basic Tasks


	//Extended Task
	EventMaskType mask1;

	while(1){
		WaitEvent(TimerEvent1); //wait any event? No. why specify event? Ans: event we want to wait. more than one event with bitwise |
				{
					GetEvent(Task1, &mask1); //to check which event received
					if (mask1 & TimerEvent1) {
						led_blink(0b00001000); //blink led 3
						ClearEvent(TimerEvent1);
					}
				}
	};
	TerminateTask(); //safety
}

TASK( Task2) {
	//led_blink(0b10000000); //Basic tasks
	//TerminateTask();	//Basic Tasks


	//Extended Task
	EventMaskType mask2;

	while(1){
		WaitEvent(TimerEvent2); //wait any event? No. why specify event? Ans: event we want to wait. more than one event with bitwise |
				{
					GetEvent(Task2, &mask2); //to check which event received
					if (mask2 & TimerEvent2) {
						led_blink(0b10000000); //blink led 7
						ClearEvent(TimerEvent2);
					}
				}
	};
	TerminateTask(); //safety
}

int main(void) {
	EE_leds_init();
	StartOS(OSDEFAULTAPPMODE);
	EE_e200z7_enableIRQ();

	for (;;) {

	}
	return 0;

}

//some errors are false flags






CPU test_application {
	OS EE {
	//board setup
		EE_OPT = "DEBUG";
		EE_OPT = "__USE_LEDS__";
		EE_OPT = "__USE_BUTTONS__";
		EE_OPT = "__E200ZX_EXECUTE_FROM_RAM__";
		EE_OPT = "EE_ISR_DYNAMIC_TABLE";
		EE_OPT = "EE_LAUTERBACH_DEMO_SIM";
		//flags for compiler
		CFLAGS = "";
		ASFLAGS = "";
		LDFLAGS = "";

		//target CPU information (chip)
		CPU_DATA = PPCE200ZX {
			MODEL = E200Z7;
			APP_SRC = "code.c";
			MULTI_STACK = TRUE {
				IRQ_STACK = TRUE {
					SYS_SIZE = 4096; //stack

				};
			};
			COMPILER_TYPE = GNU;
			/* VLE = TRUE; */
		};
		MCU_DATA = PPCE200ZX { //MCU information
			MODEL = MPC5674F;
		};

		//all above standard common
		STATUS = EXTENDED;
		STARTUPHOOK = TRUE; //* 
		ERRORHOOK = TRUE; //*
		SHUTDOWNHOOK = FALSE;
		PRETASKHOOK = FALSE;
		POSTTASKHOOK = FALSE;
		USEGETSERVICEID = FALSE;
		USEPARAMETERACCESS = FALSE;
		USERESSCHEDULER = TRUE;

		/* Setup Kernel Type */
		KERNEL_TYPE = ECC2; //Conformance class ECC2, tells which kernel type we want

		/* Enable ORTI support for Lauterbach Tracer */
		ORTI_SECTIONS = ALL;
	};
    
    EVENT TimerEvent1 {
		MASK = AUTO;
	};
	EVENT TimerEvent2 {
		MASK = AUTO;
	};
	
    
    TASK Task1 {
		PRIORITY = 0x01;   /* Equal priorities */
		SCHEDULE = FULL;
		AUTOSTART = TRUE;
		STACK = PRIVATE {
			SYS_SIZE = 1024;
		};
		ACTIVATION = 1;
		EVENT = TimerEvent1;
	};	
	
	
    TASK Task2 {
		PRIORITY = 0x02;   /* Equal priorities */
		SCHEDULE = NON;
		AUTOSTART = TRUE;	
		STACK = PRIVATE { //define stack size. Private stack : not shared. local to task.
			SYS_SIZE = 1024;
		};
 		ACTIVATION = 1;
 		EVENT = TimerEvent2;
    };
    
    COUNTER myCounter{
    	TICKSPERBASE = 1;
    	MAXALLOWEDVALUE = 0xFFFF;
    	MINCYCLE =2;
    };
    
  
    ALARM AlarmTask1 {
    	COUNTER = myCounter;
    	ACTION = SETEVENT {
			TASK = Task1; //send to task1
			EVENT = TimerEvent1; //timer event
		};
		AUTOSTART = TRUE { //start when counter at 250 then every 500
			ALARMTIME = 250;
			CYCLETIME = 100;	
		};
    };
    
   
    
     ALARM AlarmTask2 {
    	COUNTER = myCounter;
    	ACTION = SETEVENT {
    		TASK = Task2;
    		EVENT = TimerEvent2;
    	};
    	AUTOSTART = TRUE {
    		ALARMTIME = 250;
    		CYCLETIME = 200;
    	};
    };
};
