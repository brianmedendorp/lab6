----------------------------------------------------------------------------------
-- Engineer: Brian Medendorp
-- Module Name: full_radio_tb - testbench
-- Description: test bench for lab6 IP core
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.all;
use uv

entity full_radio_tb is
--  empty on purpose
end full_radio_tb;

architecture testbench of full_radio_tb is
    constant TB_CLOCK_PERIOD    : time := 8 ns;
    signal clk_tb               : std_logic := '0';
    signal reset_tb             : std_logic := '1';

begin
    -- clocking and reset --
    clk_tb <= not clk_tb after TB_CLOCK_PERIOD/2;
    reset_tb <= '0' after 20 ns;
    
    
    
    






end architecture ; -- testbench