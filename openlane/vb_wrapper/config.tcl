# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

set ::env(PDK) "gf180mcuC"
set ::env(STD_CELL_LIBRARY) "gf180mcu_fd_sc_mcu7t5v0"

set ::env(DESIGN_NAME) vb_wrapper

set ::env(VERILOG_FILES) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/vb_wrapper.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/alu.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/boy.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/brom.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/chip.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/common.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/control.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/cpu.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/dma.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/edgedet.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/lfsr_prbs_gen.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/lfsr.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/ppu.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/regfile.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/sdm1b.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/serial.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/singlereg.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/sound_channel_mix.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/sound_length_ctr.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/sound_noise.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/sound_square.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/sound_vol_env.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/sound_wave.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/sound.v \
	$::env(DESIGN_DIR)/../../verilog/rtl/timer.v"

set ::env(DESIGN_IS_CORE) 0

# Needs to be at least 250ns
set ::env(CLOCK_PORT) "io_in\[5\]"
set ::env(CLOCK_PERIOD) "100.0"

set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 1500 1500"

set ::env(FP_PIN_ORDER_CFG) $::env(DESIGN_DIR)/pin_order.cfg

set ::env(PL_BASIC_PLACEMENT) 0
set ::env(PL_TARGET_DENSITY) 0.45

set ::env(FP_CORE_UTIL) 40

set ::env(SYNTH_MAX_FANOUT) 4

# Maximum layer used for routing is metal 4.
# This is because this macro will be inserted in a top level (user_project_wrapper) 
# where the PDN is planned on metal 5. So, to avoid having shorts between routes
# in this macro and the top level metal 5 stripes, we have to restrict routes to metal4.  
# 
set ::env(RT_MAX_LAYER) {Metal4}

# You can draw more power domains if you need to 
set ::env(VDD_NETS) [list {vdd}]
set ::env(GND_NETS) [list {vss}]

set ::env(DIODE_INSERTION_STRATEGY) 4 
# If you're going to use multiple power domains, then disable cvc run.
set ::env(RUN_CVC) 1
