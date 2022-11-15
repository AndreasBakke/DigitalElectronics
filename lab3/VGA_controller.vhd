LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY VGA_controller IS
    PORT(
        KEY: IN std_logic_vector(0 DOWNTO 0) := "1"; --async reset button KEY(0) active low
        CLOCK_50: IN std_logic := '0'; -- 50MHZ clock signal.
        VGA_R: OUT std_logic_vector(7 DOWNTO 0); --VGA red signals
        VGA_G: OUT std_logic_vector(7 DOWNTO 0); --VGA green signals
        VGA_B: OUT std_logic_vector(7 DOWNTO 0); --VGA blue signals
        VGA_CLK: OUT std_logic; -- VGA clock (should we use this)?
        VGA_BLANK_N: OUT std_logic := '1'; -- Not used, but need to be driven correctly
        VGA_HS: OUT std_logic;
        VGA_VS: OUT std_logic;
        VGA_SYNC_N: OUT std_logic := '1' -- Not used, but need to be driven correctly
    );
BEGIN 

END VGA_controller; 



ARCHITECTURE Behav of VGA_controller IS
    COMPONENT vgaPLL IS
        port (
		refclk   : in  std_logic := '0'; --  refclk.clk
		rst      : in  std_logic := '0'; --   reset.reset
		outclk_0 : out std_logic;        -- outclk0.clk
		outclk_1 : out std_logic;        -- outclk1.clk
		locked   : out std_logic         --  locked.export
	);
    END COMPONENT;
   
    COMPONENT synchronous_counter IS
        GENERIC(N: integer := 16);
        PORT(
        clk, RSTn, clear, en, UDn: IN std_logic;
        value: OUT std_logic_vector(N-1 DOWNTO 0)
        );
    END COMPONENT;
    
    TYPE StateType IS (a,b,c,d); --statnames used for both vsync and hsync
    SIGNAL currstate_h, nextstate_h, currstate_v, nextstate_v: StateType;
    
    
    SIGNAL key_not, clk, buff_clk_vga, l, rst_n, h_sync, v_sync: std_logic;
    SIGNAL clear_h, clear_v: std_logic;
    SIGNAL h_count, v_count: std_logic_vector(9 DOWNTO 0);
    CONSTANT a_h_count : integer := 96; ---targetcount (0 indexed)
    CONSTANT b_h_count : integer := 48;
    CONSTANT c_h_count : integer := 640;
    CONSTANT d_h_count : integer := 16;
    
    CONSTANT a_v_count : integer := 2; --targetcount (0 indexed counting)
    CONSTANT b_v_count : integer := 33;
    CONSTANT c_v_count : integer := 480;
    CONSTANT d_v_count : integer := 10;
    
BEGIN
    key_not <= NOT KEY(0);
    VGA_HS <= h_sync;
    VGA_VS <= v_sync;
    
    
    vgaPLL_0: vgaPLL PORT MAP(refclk => CLOCK_50, rst => key_not, outclk_0 => clk, outclk_1 => VGA_CLK, locked => l); --PLL for board
    --Simulated pll for simulation:
	 --VGA_CLK <= NOT clk;
--    l <= '1';
--    clockGenerator: PROl <= '1';
--    clockGenerator: PROCESS(CLOCK_50) IS BEGIN --creates 2 25MHZ signal
--        IF rising_edge(clock_50) THEN
--            if clk = '0' THEN
--                clk <= '1';
--            ELSE
--                clk <= '0';
--            END IF;
--        END IF;
--    END PROCESS;
--    CESS(CLOCK_50) IS BEGIN --creates 2 25MHZ signal
--        IF rising_edge(clock_50) THEN
--            if clk = '0' THEN
--                clk <= '1';
--            ELSE
--                clk <= '0';
--            END IF;
--        END IF;
--    END PROCESS;
    
    rst_n <= KEY(0) AND l; -- Reset if either locked from pll or key_0 is 0

    h_counter: synchronous_counter
        GENERIC MAP(N => 10)
        PORT MAP(clk => clk, RSTn => rst_n, clear => clear_h, en => '1', UDn => '0', value => h_count);
    v_counter: synchronous_counter
        GENERIC MAP(N => 10)
        PORT MAP(clk => h_sync, RSTn => rst_n, clear => clear_v, en => '1', UDn => '0', value => v_count);

    --Counters:
    
    stateReg: PROCESS(clk, rst_n)
    BEGIN
        IF rst_n = '0' THEN
            currstate_h <= a;
            currstate_v <= a;
        ELSIF rising_edge(clk) THEN
            currstate_h <= nextstate_h;
            currstate_v <= nextstate_v;
        END IF;
    END PROCESS; --h_StateReg

        
    h_combLogic: PROCESS(h_count, currstate_h) IS
    BEGIN
    CASE currstate_h IS
       WHEN a=>
            h_sync <= '0'; VGA_R <= (OTHERS => '0'); VGA_G <= (OTHERS => '0'); VGA_B <= (OTHERS => '0');
            IF unsigned(h_count) >= a_h_count THEN
                nextstate_h <= b; clear_h <= '1';
            ELSE
                nextstate_h <= a; clear_h <= '0';
            END IF;
        WHEN b=>
            h_sync <= '1'; VGA_R <= (OTHERS => '0'); VGA_G <= (OTHERS => '0'); VGA_B <= (OTHERS => '0');
            IF unsigned(h_count) >= b_h_count THEN
                nextstate_h <= c; clear_h <= '1';
            ELSE
                nextstate_h <= b; clear_h <= '0';
            END IF;
        WHEN c=>
            h_sync <= '1';
            IF currstate_v = c THEN --output logic
                IF unsigned(v_count) <= 239 THEN --half height
                    IF unsigned(h_count) <= 319 THEN --half width
                        VGA_R <= (OTHERS => '1'); VGA_G <= (OTHERS => '0'); VGA_B <= (OTHERS => '0');
                    ELSE
                        VGA_R <= (OTHERS => '0'); VGA_G <= (OTHERS => '1'); VGA_B <= (OTHERS => '0');
                    END IF;
                ELSE
                 IF unsigned(h_count) <= 319 THEN --half width
                        VGA_R <= (OTHERS => '0'); VGA_G <= (OTHERS => '0'); VGA_B <= (OTHERS => '1');
                    ELSE
                        VGA_R <= (OTHERS => '1'); VGA_G <= (OTHERS => '1'); VGA_B <= (OTHERS => '1');
                    END IF;
                END IF;
            ELSE
                 VGA_R <= (OTHERS => '0'); VGA_G <= (OTHERS => '0'); VGA_B <= (OTHERS => '0');
            END IF;
            
            IF unsigned(h_count) >= c_h_count THEN --nextstate logic
                nextstate_h <= d; clear_h <= '1';
            ELSE
                nextstate_h <= c; clear_h <= '0';
            END IF;
         WHEN d=>
            h_sync <= '1'; VGA_R <= (OTHERS => '0'); VGA_G <= (OTHERS => '0'); VGA_B <= (OTHERS => '0');
            IF unsigned(h_count) >= d_h_count THEN --nextstate logic
                nextstate_h <= a; clear_h <= '1';
            ELSE
                nextstate_h <= d; clear_h <= '0';
            END IF;
			-- ADD WHEN OTHERS
        END CASE;
   END PROCESS;--h_nextstate
   
   
    v_combLogic: PROCESS(v_count) IS
    BEGIN
        CASE currstate_V IS
        WHEN a=>
            v_sync <= '0';
            IF unsigned(v_count) >= a_v_count THEN
                nextstate_v <= b; clear_v <= '1';
            ELSE
                nextstate_v <= a; clear_v <= '0';
            END IF;
            
        WHEN b=>
            v_sync <= '1';
            IF unsigned(v_count) >= b_v_count THEN
                nextstate_v <= c; clear_v <= '1';
            ELSE
                nextstate_v <= b; clear_v <= '0';
            END IF;
            
        WHEN c=>
            v_sync <= '1';
            IF unsigned(v_count) >= c_v_count THEN
                nextstate_v <= d; clear_v <= '1';
            ELSE
                nextstate_v <= c; clear_v <= '0';
            END IF;
            
         WHEN d=>
            v_sync <= '1';
            IF unsigned(v_count) >= d_v_count THEN
                nextstate_v <= a; clear_v <= '1';
            ELSE
                nextstate_v <= d; clear_v <= '0';
            END IF;
            --ADD WHEN OTHERS
        END CASE;
    END PROCESS; --v_combLogic

END Behav;