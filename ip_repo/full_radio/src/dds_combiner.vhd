----------------------------------------------------------------------------------
-- Engineer: Brian Medendorp
-- Module Name: dds_combiner - rtl
-- Project Name: lab5
-- Description: Multiplier of signal generator dds and mixer dds
--              Both DDS compilers are in unit circle mode so ouput amplitude is halfed -> no overflow concerns
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.all;

entity dds_combiner is
    Port ( aclk : in std_logic;                                 --125MHz system clock
           s_sigGen_tdata : in std_logic_vector(15 downto 0);   -- signal real data
           s_sigGen_tvalid : in std_logic;
           s_mixer_tdata : in std_logic_vector(31 downto 0);    -- mixer real/img data -> img[31:16], real[15:0]
           s_mixer_tvalid : in std_logic;
           m_real_tdata : out std_logic_vector(15 downto 0);    -- combined real data
           m_real_tvalid : out std_logic;
           m_imag_tdata : out std_logic_vector(15 downto 0);     -- combined imag data
           m_imag_tvalid : out std_logic);
end dds_combiner;

architecture rtl of dds_combiner is
    signal sigGen_real  : signed(15 downto 0) := (others =>'0');
    signal mixer_real   : signed(15 downto 0) := (others =>'0');
    signal mixer_imag   : signed(15 downto 0) := (others =>'0');
    
    signal combined_real    : signed(31 downto 0) := (others =>'0');
    signal combined_imag    : signed(31 downto 0) := (others =>'0');
    signal shifted_real     : signed(31 downto 0) := (others =>'0');
    signal shifted_imag     : signed(31 downto 0) := (others =>'0');
    constant GAIN_FACTOR : natural := 14; -- amount to shift multiplication output by
    
begin
    
    --- SIGNAL ASSIGNMENTS ---
    -- typcast to signed values for arithmetic
    sigGen_real <= signed(s_sigGen_tdata);
    mixer_real <= signed(s_mixer_tdata(15 downto 0));
    mixer_imag <= signed(s_mixer_tdata(31 downto 16));
    
    --- CONTROL PROCESS ---
    combine_proc : process(aclk, sigGen_real, mixer_real, mixer_imag)
    begin
        if(rising_edge(aclk)) then
            combined_real <= sigGen_real * mixer_real;
            combined_imag <= sigGen_real * mixer_imag;
        else
            -- no change
            combined_real <= combined_real;
            combined_imag <= combined_imag;
        end if;
    end process combine_proc;
    
    scale_proc : process(aclk, combined_real, combined_imag)
    begin
        if(rising_edge(aclk)) then
            shifted_real <= shift_right(combined_real, GAIN_FACTOR);
            shifted_imag <= shift_right(combined_imag, GAIN_FACTOR);
        else
            shifted_real <= shifted_real;
            shifted_imag <= shifted_imag;
        end if;
    end process scale_proc;
    
    
    --- OUPUT ASSIGNEMNT ---
    m_real_tdata <= std_logic_vector(shifted_real(15 downto 0));
    m_imag_tdata <= std_logic_vector(shifted_imag(15 downto 0));
    
    m_real_tvalid <= s_sigGen_tvalid and s_mixer_tvalid;
    m_imag_tvalid <= s_sigGen_tvalid and s_mixer_tvalid;

end rtl;
