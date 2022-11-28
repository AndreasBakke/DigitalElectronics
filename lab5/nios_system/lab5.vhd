library ieee;
use ieee.std_logic_1164.all;


entity lab5 is
port (
	KEY : in std_logic_vector(2 downto 0);
	CLOCK_50 : in std_logic;
	LEDR : out std_logic_vector(7 downto 0);
	DRAM_DQ : inout std_logic_vector (15 downto 0);
	DRAM_ADDR : out std_logic_vector (12 downto 0);
	DRAM_BA : out std_logic_vector (1 downto 0);
	DRAM_CAS_N, DRAM_RAS_N, DRAM_CLK : out std_logic;
	DRAM_CKE, DRAM_CS_N, DRAM_WE_N : out std_logic;
	DRAM_UDQM, DRAM_LDQM : out std_logic);
end lab5;



architecture Structure of lab5 is
	component nios_system is
		port (
		clk_clk          : in    std_logic                     := '0';             --        clk.clk
		keys_export      : in    std_logic_vector(1 downto 0)  := (others => '0'); --       keys.export
		leds_export      : out   std_logic_vector(7 downto 0);                     --       leds.export
		reset_reset      : in    std_logic                     := '0';             --      reset.reset
		sdram_clk_clk    : out   std_logic;                                        --  sdram_clk.clk
		sdram_wire_addr  : out   std_logic_vector(12 downto 0);                    -- sdram_wire.addr
		sdram_wire_ba    : out   std_logic_vector(1 downto 0);                     --           .ba
		sdram_wire_cas_n : out   std_logic;                                        --           .cas_n
		sdram_wire_cke   : out   std_logic;                                        --           .cke
		sdram_wire_cs_n  : out   std_logic;                                        --           .cs_n
		sdram_wire_dq    : inout std_logic_vector(15 downto 0) := (others => '0'); --           .dq
		sdram_wire_dqm   : out   std_logic_vector(1 downto 0);                     --           .dqm
		sdram_wire_ras_n : out   std_logic;                                        --           .ras_n
		sdram_wire_we_n  : out   std_logic                                         --           .we_n
	);
	end component nios_system;
	
	begin
	
	NiosII : component nios_system
	
	port map (
	clk_clk => CLOCK_50,
	keys_export => KEY(2 downto 1),
	leds_export => LEDR,
	reset_reset => not KEY(0),
	sdram_wire_addr => DRAM_ADDR,
	sdram_wire_ba => DRAM_BA,
	sdram_wire_cas_n => DRAM_CAS_N,
	sdram_wire_cke => DRAM_CKE,
	sdram_wire_cs_n => DRAM_CS_N,
	sdram_wire_dq => DRAM_DQ,
	sdram_wire_dqm(1) => DRAM_UDQM,
	sdram_wire_dqm(0) => DRAM_LDQM,
	sdram_wire_ras_n => DRAM_RAS_N,
	sdram_wire_we_n => DRAM_WE_N,
	sdram_clk_clk => DRAM_CLK
	
	
	);
end Structure;