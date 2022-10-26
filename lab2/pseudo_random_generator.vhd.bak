LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;


entity pseudo_random_generator is
    GENERIC(N: integer := 10); --num of bits to generate
    PORT(
        CLOCK_50, enable: std_logic;
        LEDR: std_logic_vector(N-1 DOWNTO 0);
    );
begin
end pseudo_random_generator;


architecture behav of pseudo_random_generator is
    signal alert: std_logic;
begin
    alert <= '0';
    counter_1s : process(CLOCK_50, KEY_0)
        variable num := '0';
    begin
        IF KEY_0 = '0' then
            num := 0;
            alert <= '0';
        ELSIF rising_edge(clock_50) then
            if alert = '1' then
                alert<='0';
                end if;
            num := num+1;
            IF num = 50*10^6 then
                alert <='1',
                num <= '0'
            END IF;
        end if;
    end process ; -- counter


    lsfr : process(alert, KEY_0)
    begin
        if KEY_0 = '0' THEN
            LEDR <= (OTHERS => '0');
        elsif rising_edge(alert) then
            LEDR <= NOT LEDR;
            -- logic for changing...
        END IF;
    end process ; -- identifier

end behav ; -- behav
