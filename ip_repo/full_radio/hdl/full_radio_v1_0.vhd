library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity full_radio_v1_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 4
	);
	port (
		-- Users to add ports here
        
        m_axis_tvalid : out std_logic;
		m_axis_tdata : out std_logic_Vector(31 downto 0);
		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S00_AXI
		s00_axi_aclk	: in std_logic;
		s00_axi_aresetn	: in std_logic;
		s00_axi_awaddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_awprot	: in std_logic_vector(2 downto 0);
		s00_axi_awvalid	: in std_logic;
		s00_axi_awready	: out std_logic;
		s00_axi_wdata	: in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_wstrb	: in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
		s00_axi_wvalid	: in std_logic;
		s00_axi_wready	: out std_logic;
		s00_axi_bresp	: out std_logic_vector(1 downto 0);
		s00_axi_bvalid	: out std_logic;
		s00_axi_bready	: in std_logic;
		s00_axi_araddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_arprot	: in std_logic_vector(2 downto 0);
		s00_axi_arvalid	: in std_logic;
		s00_axi_arready	: out std_logic;
		s00_axi_rdata	: out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_rresp	: out std_logic_vector(1 downto 0);
		s00_axi_rvalid	: out std_logic;
		s00_axi_rready	: in std_logic
	);
end full_radio_v1_0;

architecture arch_imp of full_radio_v1_0 is

	-- component declaration
	component full_radio_v1_0_S00_AXI is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 4
		);
		port (
		fakeADC_reg     : out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
        tuner_reg       : out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
        dds_reset_reg   : out std_logic;
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component full_radio_v1_0_S00_AXI;
	
	component fakeADC_dds_compiler is port(
        aclk : IN STD_LOGIC;
        aresetn : IN STD_LOGIC;
        s_axis_phase_tvalid : IN STD_LOGIC;
        s_axis_phase_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        m_axis_data_tvalid : OUT STD_LOGIC;
        m_axis_data_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
    end component fakeADC_dds_compiler;
    
    component tuner_dds_compiler is port(
        aclk : IN STD_LOGIC;
        aresetn : IN STD_LOGIC;
        s_axis_phase_tvalid : IN STD_LOGIC;
        s_axis_phase_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        m_axis_data_tvalid : OUT STD_LOGIC;
        m_axis_data_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
    end component tuner_dds_compiler;
    
    component fir_chain_1 is port(
        aclk : IN STD_LOGIC;
        s_axis_data_tvalid : IN STD_LOGIC;
        s_axis_data_tready : OUT STD_LOGIC;
        s_axis_data_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        m_axis_data_tvalid : OUT STD_LOGIC;
        m_axis_data_tdata : OUT STD_LOGIC_VECTOR(47 DOWNTO 0));
    end component fir_chain_1;
    
    component fir_chain_2 is port(
        aclk : IN STD_LOGIC;
        s_axis_data_tvalid : IN STD_LOGIC;
        s_axis_data_tready : OUT STD_LOGIC;
        s_axis_data_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        m_axis_data_tvalid : OUT STD_LOGIC;
        m_axis_data_tdata : OUT STD_LOGIC_VECTOR(47 DOWNTO 0));
    end component fir_chain_2;
    
    -------- SIGNALS --------------
    -- fakeADC and tuner DDSs
    signal fakeADC_in_data      : std_logic_vector(31 downto 0);
    signal fakeADC_out_data     : std_logic_vector(15 downto 0);
    signal fakeADC_out_valid    : std_logic;
    signal tuner_in_data        : std_logic_vector(31 downto 0);
    signal tuner_out_data       : std_logic_vector(31 downto 0);
    signal tuner_out_valid      : std_logic;
    signal dds_reset_sig        : std_logic;
    
    -- combined signals
    signal combined_real_data   : std_logic_vector(15 downto 0);
    signal combined_real_valid  : std_logic;
    signal combined_imag_data   : std_logic_vector(15 downto 0);
    signal combined_imag_valid  : std_logic;
    
    -- fir signals
    constant FIR_SCALE_POWER        : natural  := 24;
    constant FIR_OUTPUT_WIDTH       : natural  := 48;
    constant FIR_INPUT_WIDTH        : natural  := 16;
    signal fir1_real_out_data       : std_logic_vector(FIR_OUTPUT_WIDTH-1 downto 0);
    signal fir1_real_out_scaled     : signed(FIR_OUTPUT_WIDTH-1 downto 0);
    signal fir1_real_out_valid      : std_logic;
    signal fir1_imag_out_data       : std_logic_vector(FIR_OUTPUT_WIDTH-1 downto 0);
    signal fir1_imag_out_scaled     : signed(FIR_OUTPUT_WIDTH-1 downto 0);
    signal fir1_imag_out_valid      : std_logic;
    
    signal fir2_real_in_data        : std_logic_vector(FIR_INPUT_WIDTH-1 downto 0);
    signal fir2_real_out_data       : std_logic_vector(FIR_OUTPUT_WIDTH-1 downto 0);
    signal fir2_real_out_scaled     : signed(FIR_OUTPUT_WIDTH-1 downto 0);
    signal fir2_real_out_valid      : std_logic;
    signal fir2_imag_in_data        : std_logic_vector(FIR_INPUT_WIDTH-1 downto 0);
    signal fir2_imag_out_data       : std_logic_vector(FIR_OUTPUT_WIDTH-1 downto 0);
    signal fir2_imag_out_scaled     : signed(FIR_OUTPUT_WIDTH-1 downto 0);
    signal fir2_imag_out_valid      : std_logic;
    
        

begin

-- Instantiation of Axi Bus Interface S00_AXI
full_radio_v1_0_S00_AXI_inst : full_radio_v1_0_S00_AXI
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
	)
	port map (
	    fakeADC_reg     => fakeADC_in_data,
        tuner_reg       => tuner_in_data,
        dds_reset_reg   => dds_reset_sig,
		S_AXI_ACLK	=> s00_axi_aclk,
		S_AXI_ARESETN	=> s00_axi_aresetn,
		S_AXI_AWADDR	=> s00_axi_awaddr,
		S_AXI_AWPROT	=> s00_axi_awprot,
		S_AXI_AWVALID	=> s00_axi_awvalid,
		S_AXI_AWREADY	=> s00_axi_awready,
		S_AXI_WDATA	=> s00_axi_wdata,
		S_AXI_WSTRB	=> s00_axi_wstrb,
		S_AXI_WVALID	=> s00_axi_wvalid,
		S_AXI_WREADY	=> s00_axi_wready,
		S_AXI_BRESP	=> s00_axi_bresp,
		S_AXI_BVALID	=> s00_axi_bvalid,
		S_AXI_BREADY	=> s00_axi_bready,
		S_AXI_ARADDR	=> s00_axi_araddr,
		S_AXI_ARPROT	=> s00_axi_arprot,
		S_AXI_ARVALID	=> s00_axi_arvalid,
		S_AXI_ARREADY	=> s00_axi_arready,
		S_AXI_RDATA	=> s00_axi_rdata,
		S_AXI_RRESP	=> s00_axi_rresp,
		S_AXI_RVALID	=> s00_axi_rvalid,
		S_AXI_RREADY	=> s00_axi_rready
	);

	-- Add user logic here
    fakeADC_inst : fakeADC_dds_compiler port map(
        aclk => s00_axi_aclk,
        aresetn => dds_reset_sig,
        s_axis_phase_tvalid => '1',
        s_axis_phase_tdata => fakeADC_in_data,
        m_axis_data_tvalid => fakeADC_out_valid,
        m_axis_data_tdata => fakeADC_out_data);
        
    tuner_inst : tuner_dds_compiler port map(
        aclk => s00_axi_aclk,
        aresetn => dds_reset_sig,
        s_axis_phase_tvalid => '1',
        s_axis_phase_tdata => tuner_in_data,
        m_axis_data_tvalid => tuner_out_valid,
        m_axis_data_tdata => tuner_out_data);

    dds_combo_inst : entity dds_combiner port map(
        aclk => s00_axi_aclk,
        s_sigGen_tdata => fakeADC_out_data, 
        s_sigGen_tvalid => fakeADC_out_valid,
        s_mixer_tdata => tuner_out_data,
        s_mixer_tvalid => tuner_out_valid,
        m_real_tdata => combined_real_data,
        m_real_tvalid => combined_real_valid,
        m_imag_tdata => combined_imag_data,
        m_imag_tvalid => combined_imag_valid);
        
    fir1_real : fir_chain_1 port map(
        aclk => s00_axi_aclk,
        s_axis_data_tvalid => combined_real_valid,
        --s_axis_data_tready =>
        s_axis_data_tdata => combined_real_data,
        m_axis_data_tvalid => fir1_real_out_valid,
        m_axis_data_tdata => fir1_real_out_data);
        
    fir1_imag : fir_chain_1 port map(
        aclk => s00_axi_aclk,
        s_axis_data_tvalid => combined_imag_valid,
        --s_axis_data_tready =>
        s_axis_data_tdata => combined_imag_data,
        m_axis_data_tvalid => fir1_imag_out_valid,
        m_axis_data_tdata => fir1_imag_out_data);
        
    --fir1 output manipulation
    fir1_real_out_scaled <= shift_right(signed(fir1_real_out_data),FIR_SCALE_POWER);
    fir2_real_in_data <= std_logic_vector(fir1_real_out_scaled(15 downto 0));
    
    fir1_imag_out_scaled <= shift_right(signed(fir1_imag_out_data),FIR_SCALE_POWER);
    fir2_imag_in_data <= std_logic_vector(fir1_imag_out_scaled(15 downto 0));
    
    fir2_real : fir_chain_2 port map(
        aclk => s00_axi_aclk,
        s_axis_data_tvalid => fir1_real_out_valid,
        --s_axis_data_tready =>
        s_axis_data_tdata => fir2_real_in_data,
        m_axis_data_tvalid => fir2_real_out_valid,
        m_axis_data_tdata => fir2_real_out_data);
    
    fir2_imag : fir_chain_2 port map(
        aclk => s00_axi_aclk,
        s_axis_data_tvalid => fir1_imag_out_valid,
        --s_axis_data_tready =>
        s_axis_data_tdata => fir2_imag_in_data,
        m_axis_data_tvalid => fir2_imag_out_valid,
        m_axis_data_tdata => fir2_imag_out_data); 
        
    --fir2 output manipulation
    fir2_real_out_scaled <= shift_right(signed(fir2_real_out_data),FIR_SCALE_POWER);
    fir2_imag_out_scaled <= shift_right(signed(fir2_imag_out_data),FIR_SCALE_POWER);
    
    -- output calcs
    m_axis_tdata <= std_logic_vector(fir2_imag_out_scaled(15 downto 0)) & std_logic_vector(fir2_real_out_scaled(15 downto 0));
    m_axis_tvalid <= fir2_imag_out_valid and fir2_real_out_valid;
    
    
	-- User logic ends






end arch_imp;
