library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity Test_Project is
    generic 
    (
    num_led : integer := 4;
    clockrate : integer := 10000000;
    blink : integer := 2    
    );
    
    port
    (
    clk : in std_logic;
    reset : in std_logic;
    ledout : out std_logic_vector(num_led - 1 downto 0)
    );
    
end Test_Project;

architecture Behavioral of Test_Project is

constant maxer: integer := clockrate/blink;
constant bit_depth : integer := integer(ceil(log2(real(maxer))));
signal count_reg : unsigned(bit_depth - 1 downto 0) := (others => '0');
signal led_reg : std_logic_vector(num_led - 1 downto 0) := "0000";

begin

ledout <= led_reg;
asdf: process(clk)
begin
if (rising_edge(clk)) then
if (reset = '0') or (count_reg = maxer) then
count_reg <= (others => '0');
else count_reg <= count_reg + 1;
end if;
end if;
end process;

awwe: process(clk)
begin
if (rising_edge(clk)) then
if (count_reg = maxer) then
led_reg <= not led_reg;
end if;
end if;
end process;

end Behavioral;