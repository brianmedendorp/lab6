
//------------------------------------------------------------------------------
// (c) Copyright 2014 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//------------------------------------------------------------------------------ 
//
// C Model configuration for the "fir_chain_1" instance.
//
//------------------------------------------------------------------------------
//
// coefficients: -754,-386,-482,-590,-712,-847,-997,-1160,-1338,-1529,-1734,-1951,-2180,-2419,-2667,-2921,-3180,-3441,-3700,-3954,-4199,-4431,-4646,-4837,-4999,-5127,-5214,-5252,-5235,-5155,-5005,-4774,-4457,-4042,-3522,-2887,-2128,-1235,-199,988,2337,3856,5555,7440,9521,11805,14298,17008,19940,23099,26488,30113,33973,38072,42409,46984,51794,56836,62106,67599,73307,79223,85336,91637,98114,104753,111540,118460,125496,132631,139845,147119,154434,161767,169096,176401,183656,190841,197929,204899,211727,218388,224859,231119,237143,242910,248398,253588,258460,262995,267176,270987,274413,277440,280058,282256,284024,285356,286248,286694,286694,286248,285356,284024,282256,280058,277440,274413,270987,267176,262995,258460,253588,248398,242910,237143,231119,224859,218388,211727,204899,197929,190841,183656,176401,169096,161767,154434,147119,139845,132631,125496,118460,111540,104753,98114,91637,85336,79223,73307,67599,62106,56836,51794,46984,42409,38072,33973,30113,26488,23099,19940,17008,14298,11805,9521,7440,5555,3856,2337,988,-199,-1235,-2128,-2887,-3522,-4042,-4457,-4774,-5005,-5155,-5235,-5252,-5214,-5127,-4999,-4837,-4646,-4431,-4199,-3954,-3700,-3441,-3180,-2921,-2667,-2419,-2180,-1951,-1734,-1529,-1338,-1160,-997,-847,-712,-590,-482,-386,-754
// chanpats: 173
// name: fir_chain_1
// filter_type: 2
// rate_change: 0
// interp_rate: 1
// decim_rate: 40
// zero_pack_factor: 1
// coeff_padding: 20
// num_coeffs: 200
// coeff_sets: 1
// reloadable: 0
// is_halfband: 0
// quantization: 0
// coeff_width: 20
// coeff_fract_width: 0
// chan_seq: 0
// num_channels: 1
// num_paths: 1
// data_width: 16
// data_fract_width: 0
// output_rounding_mode: 0
// output_width: 41
// output_fract_width: 0
// config_method: 0

const double fir_chain_1_coefficients[200] = {-754,-386,-482,-590,-712,-847,-997,-1160,-1338,-1529,-1734,-1951,-2180,-2419,-2667,-2921,-3180,-3441,-3700,-3954,-4199,-4431,-4646,-4837,-4999,-5127,-5214,-5252,-5235,-5155,-5005,-4774,-4457,-4042,-3522,-2887,-2128,-1235,-199,988,2337,3856,5555,7440,9521,11805,14298,17008,19940,23099,26488,30113,33973,38072,42409,46984,51794,56836,62106,67599,73307,79223,85336,91637,98114,104753,111540,118460,125496,132631,139845,147119,154434,161767,169096,176401,183656,190841,197929,204899,211727,218388,224859,231119,237143,242910,248398,253588,258460,262995,267176,270987,274413,277440,280058,282256,284024,285356,286248,286694,286694,286248,285356,284024,282256,280058,277440,274413,270987,267176,262995,258460,253588,248398,242910,237143,231119,224859,218388,211727,204899,197929,190841,183656,176401,169096,161767,154434,147119,139845,132631,125496,118460,111540,104753,98114,91637,85336,79223,73307,67599,62106,56836,51794,46984,42409,38072,33973,30113,26488,23099,19940,17008,14298,11805,9521,7440,5555,3856,2337,988,-199,-1235,-2128,-2887,-3522,-4042,-4457,-4774,-5005,-5155,-5235,-5252,-5214,-5127,-4999,-4837,-4646,-4431,-4199,-3954,-3700,-3441,-3180,-2921,-2667,-2419,-2180,-1951,-1734,-1529,-1338,-1160,-997,-847,-712,-590,-482,-386,-754};

const xip_fir_v7_2_pattern fir_chain_1_chanpats[1] = {P_BASIC};

static xip_fir_v7_2_config gen_fir_chain_1_config() {
  xip_fir_v7_2_config config;
  config.name                = "fir_chain_1";
  config.filter_type         = 2;
  config.rate_change         = XIP_FIR_INTEGER_RATE;
  config.interp_rate         = 1;
  config.decim_rate          = 40;
  config.zero_pack_factor    = 1;
  config.coeff               = &fir_chain_1_coefficients[0];
  config.coeff_padding       = 20;
  config.num_coeffs          = 200;
  config.coeff_sets          = 1;
  config.reloadable          = 0;
  config.is_halfband         = 0;
  config.quantization        = XIP_FIR_INTEGER_COEFF;
  config.coeff_width         = 20;
  config.coeff_fract_width   = 0;
  config.chan_seq            = XIP_FIR_BASIC_CHAN_SEQ;
  config.num_channels        = 1;
  config.init_pattern        = fir_chain_1_chanpats[0];
  config.num_paths           = 1;
  config.data_width          = 16;
  config.data_fract_width    = 0;
  config.output_rounding_mode= XIP_FIR_FULL_PRECISION;
  config.output_width        = 41;
  config.output_fract_width  = 0,
  config.config_method       = XIP_FIR_CONFIG_SINGLE;
  return config;
}

const xip_fir_v7_2_config fir_chain_1_config = gen_fir_chain_1_config();

