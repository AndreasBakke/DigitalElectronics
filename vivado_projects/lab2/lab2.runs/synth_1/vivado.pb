
?
Command: %s
53*	vivadotcl2S
?synth_design -top pseudo_random_generator -part xc7k70tfbv676-12default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7k70t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7k70t2default:defaultZ17-349h px? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
42default:defaultZ8-7079h px? 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px? 
`
#Helper process launched with PID %s4824*oasys2
281332default:defaultZ8-7075h px? 
?
%s*synth2?
?Starting Synthesize : Time (s): cpu = 00:00:02 ; elapsed = 00:00:03 . Memory (MB): peak = 2627.164 ; gain = 0.000 ; free physical = 2151 ; free virtual = 12314
2default:defaulth px? 
?
synthesizing module '%s'638*oasys2+
pseudo_random_generator2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
162default:default8@Z8-638h px? 
W
%s
*synth2?
+	Parameter N bound to: 32 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2'
synchronous_counter2default:default2{
g/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/new/synchronous_counter.vhd2default:default2
52default:default2(
synchronus_counter_12default:default2'
synchronous_counter2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
312default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2'
synchronous_counter2default:default2}
g/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/new/synchronous_counter.vhd2default:default2
162default:default8@Z8-638h px? 
W
%s
*synth2?
+	Parameter N bound to: 32 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2'
synchronous_counter2default:default2
02default:default2
12default:default2}
g/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/new/synchronous_counter.vhd2default:default2
162default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2+
pseudo_random_generator2default:default2
02default:default2
12default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
162default:default8@Z8-256h px? 
?
%s*synth2?
?Finished Synthesize : Time (s): cpu = 00:00:03 ; elapsed = 00:00:04 . Memory (MB): peak = 2627.164 ; gain = 0.000 ; free physical = 3159 ; free virtual = 13329
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Constraint Validation : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 2627.164 ; gain = 0.000 ; free physical = 3225 ; free virtual = 13400
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Loading part: xc7k70tfbv676-1
2default:defaulth p
x
? 
V
Loading part %s157*device2#
xc7k70tfbv676-12default:defaultZ21-403h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 2635.168 ; gain = 8.004 ; free physical = 3219 ; free virtual = 13402
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2!
lsfr.test_reg2default:default2+
pseudo_random_generator2default:defaultZ8-802h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                 iSTATE0 |                               01 | 00000000000000000000000000000000
2default:defaulth p
x
? 
?
%s
*synth2s
_                  iSTATE |                               10 | 00000000000000000000000000000001
2default:defaulth p
x
? 
.
%s
*synth2
*
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2!
lsfr.test_reg2default:default2
one-hot2default:default2+
pseudo_random_generator2default:defaultZ8-3354h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 2635.168 ; gain = 8.004 ; free physical = 3196 ; free virtual = 13385
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    2 Bit        Muxes := 2     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2!
LEDR_reg[9]/Q2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6859h px? 
?
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6858h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2!
LEDR_reg[8]/Q2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6859h px? 
?
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6858h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2!
LEDR_reg[7]/Q2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6859h px? 
?
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6858h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2!
LEDR_reg[6]/Q2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6859h px? 
?
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6858h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2!
LEDR_reg[5]/Q2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6859h px? 
?
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6858h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2!
LEDR_reg[4]/Q2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6859h px? 
?
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6858h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2!
LEDR_reg[3]/Q2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6859h px? 
?
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6858h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2!
LEDR_reg[2]/Q2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6859h px? 
?
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6858h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2!
LEDR_reg[1]/Q2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6859h px? 
?
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6858h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
1st2default:default2!
LEDR_reg[0]/Q2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6859h px? 
?
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2default:default2
2nd2default:default2
GND2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6859h px? 
?
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2default:default2?
t/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.srcs/sources_1/imports/lab2/pseudo_random_generator.vhd2default:default2
342default:default8@Z8-6858h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2/
FSM_onehot_lsfr.test_reg[1]2default:default2+
pseudo_random_generator2default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2/
FSM_onehot_lsfr.test_reg[0]2default:default2+
pseudo_random_generator2default:defaultZ8-3332h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 2635.168 ; gain = 8.004 ; free physical = 2913 ; free virtual = 13107
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Timing Optimization : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 2635.168 ; gain = 8.004 ; free physical = 2915 ; free virtual = 13109
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Technology Mapping : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 2635.168 ; gain = 8.004 ; free physical = 2909 ; free virtual = 13104
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished IO Insertion : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 2635.168 ; gain = 8.004 ; free physical = 3308 ; free virtual = 13104
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 2635.168 ; gain = 8.004 ; free physical = 3308 ; free virtual = 13104
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 2635.168 ; gain = 8.004 ; free physical = 3308 ; free virtual = 13104
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 2635.168 ; gain = 8.004 ; free physical = 3308 ; free virtual = 13104
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 2635.168 ; gain = 8.004 ; free physical = 3308 ; free virtual = 13104
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 2635.168 ; gain = 8.004 ; free physical = 3308 ; free virtual = 13104
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
B
%s*synth2*
+------+-----+------+
2default:defaulth px? 
B
%s*synth2*
|      |Cell |Count |
2default:defaulth px? 
B
%s*synth2*
+------+-----+------+
2default:defaulth px? 
B
%s*synth2*
|1     |OBUF |    10|
2default:defaulth px? 
B
%s*synth2*
+------+-----+------+
2default:defaulth px? 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
? 
N
%s
*synth26
"+------+---------+-------+------+
2default:defaulth p
x
? 
N
%s
*synth26
"|      |Instance |Module |Cells |
2default:defaulth p
x
? 
N
%s
*synth26
"+------+---------+-------+------+
2default:defaulth p
x
? 
N
%s
*synth26
"|1     |top      |       |    10|
2default:defaulth p
x
? 
N
%s
*synth26
"+------+---------+-------+------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 2635.168 ; gain = 8.004 ; free physical = 3308 ; free virtual = 13104
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
s
%s
*synth2[
GSynthesis finished with 0 errors, 30 critical warnings and 3 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Runtime : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 2635.168 ; gain = 8.004 ; free physical = 3307 ; free virtual = 13103
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Complete : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 2635.176 ; gain = 8.004 ; free physical = 3307 ; free virtual = 13103
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2635.1762default:default2
0.0002default:default2
33902default:default2
131892default:defaultZ17-722h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2635.1762default:default2
0.0002default:default2
32702default:default2
130962default:defaultZ17-722h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
2a178c532default:defaultZ4-1430h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
172default:default2
32default:default2
302default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
synth_design: 2default:default2
00:00:142default:default2
00:00:112default:default2
2635.1762default:default2
8.0122default:default2
34782default:default2
133042default:defaultZ17-722h px? 
u
%s6*runtcl2Y
ESynthesis results are not added to the cache due to CRITICAL_WARNING
2default:defaulth px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2y
e/home/andreasb/intelFPGA_lite/21.1/vivado_projects/lab2/lab2.runs/synth_1/pseudo_random_generator.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2?
?Executing : report_utilization -file pseudo_random_generator_utilization_synth.rpt -pb pseudo_random_generator_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Sun Oct 23 14:16:44 20222default:defaultZ17-206h px? 


End Record