/*
 * Copyright (C) 2022 Intel Corporation
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License, as published
 * by the Free Software Foundation; either version 3 of the License,
 * or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, see <http://www.gnu.org/licenses/>.
 *
 *
 * SPDX-License-Identifier: LGPL-3.0-or-later
 */
 
`include "globals.svh"


module Lzd #(
		parameter WIDTH
		)
		(
		input logic [WIDTH-1:0] in, 
		output logic [$clog2(WIDTH)-1:0] lz
		);
	
	localparam bias = -1;
	
	generate
		if(WIDTH == 53) begin // double precision
			always_comb begin
				casez (in)
					53'b1????????????????????????????????????????????????????: lz = 1 + bias;
					53'b01???????????????????????????????????????????????????: lz = 2 + bias;
					53'b001??????????????????????????????????????????????????: lz = 3 + bias;
					53'b0001?????????????????????????????????????????????????: lz = 4 + bias;
					53'b00001????????????????????????????????????????????????: lz = 5 + bias;
					53'b000001???????????????????????????????????????????????: lz = 6 + bias;
					53'b0000001??????????????????????????????????????????????: lz = 7 + bias;
					53'b00000001?????????????????????????????????????????????: lz = 8 + bias;
					53'b000000001????????????????????????????????????????????: lz = 9 + bias;
					53'b0000000001???????????????????????????????????????????: lz = 10 + bias;
					53'b00000000001??????????????????????????????????????????: lz = 11 + bias;
					53'b000000000001?????????????????????????????????????????: lz = 12 + bias;
					53'b0000000000001????????????????????????????????????????: lz = 13 + bias;
					53'b00000000000001???????????????????????????????????????: lz = 14 + bias;
					53'b000000000000001??????????????????????????????????????: lz = 15 + bias;
					53'b0000000000000001?????????????????????????????????????: lz = 16 + bias;
					53'b00000000000000001????????????????????????????????????: lz = 17 + bias;
					53'b000000000000000001???????????????????????????????????: lz = 18 + bias;
					53'b0000000000000000001??????????????????????????????????: lz = 19 + bias;
					53'b00000000000000000001?????????????????????????????????: lz = 20 + bias;
					53'b000000000000000000001????????????????????????????????: lz = 21 + bias;
					53'b0000000000000000000001???????????????????????????????: lz = 22 + bias;
					53'b00000000000000000000001??????????????????????????????: lz = 23 + bias;
					53'b000000000000000000000001?????????????????????????????: lz = 24 + bias;
					53'b0000000000000000000000001????????????????????????????: lz = 25 + bias;
					53'b00000000000000000000000001???????????????????????????: lz = 26 + bias;
					53'b000000000000000000000000001??????????????????????????: lz = 27 + bias;
					53'b0000000000000000000000000001?????????????????????????: lz = 28 + bias;
					53'b00000000000000000000000000001????????????????????????: lz = 29 + bias;
					53'b000000000000000000000000000001???????????????????????: lz = 30 + bias;
					53'b0000000000000000000000000000001??????????????????????: lz = 31 + bias;
					53'b00000000000000000000000000000001?????????????????????: lz = 32 + bias;
					53'b000000000000000000000000000000001????????????????????: lz = 33 + bias;
					53'b0000000000000000000000000000000001???????????????????: lz = 34 + bias;
					53'b00000000000000000000000000000000001??????????????????: lz = 35 + bias;
					53'b000000000000000000000000000000000001?????????????????: lz = 36 + bias;
					53'b0000000000000000000000000000000000001????????????????: lz = 37 + bias;
					53'b00000000000000000000000000000000000001???????????????: lz = 38 + bias;
					53'b000000000000000000000000000000000000001??????????????: lz = 39 + bias;
					53'b0000000000000000000000000000000000000001?????????????: lz = 40 + bias;
					53'b00000000000000000000000000000000000000001????????????: lz = 41 + bias;
					53'b000000000000000000000000000000000000000001???????????: lz = 42 + bias;
					53'b0000000000000000000000000000000000000000001??????????: lz = 43 + bias;
					53'b00000000000000000000000000000000000000000001?????????: lz = 44 + bias;
					53'b000000000000000000000000000000000000000000001????????: lz = 45 + bias;
					53'b0000000000000000000000000000000000000000000001???????: lz = 46 + bias;
					53'b00000000000000000000000000000000000000000000001??????: lz = 47 + bias;
					53'b000000000000000000000000000000000000000000000001?????: lz = 48 + bias;
					53'b0000000000000000000000000000000000000000000000001????: lz = 49 + bias;
					53'b00000000000000000000000000000000000000000000000001???: lz = 50 + bias;
					53'b000000000000000000000000000000000000000000000000001??: lz = 51 + bias;
					53'b0000000000000000000000000000000000000000000000000001?: lz = 52 + bias;
					53'b00000000000000000000000000000000000000000000000000001: lz = 53 + bias;
					53'b00000000000000000000000000000000000000000000000000000: lz = 54 + bias;
					default                                                  : lz = 'x;
				endcase
			end
		end
		else if(WIDTH == 24) begin // hfloat + bfloat
			always_comb begin
				casez (in)
					24'b1???????????????????????: lz = 0;
					24'b01??????????????????????: lz = 1;
					24'b001?????????????????????: lz = 2;
					24'b0001????????????????????: lz = 3;
					24'b00001???????????????????: lz = 4;
					24'b000001??????????????????: lz = 5;
					24'b0000001?????????????????: lz = 6;
					24'b00000001????????????????: lz = 7;
					24'b000000001???????????????: lz = 8;
					24'b0000000001??????????????: lz = 9;
					24'b00000000001?????????????: lz = 10;
					24'b000000000001????????????: lz = 11;
					24'b0000000000001???????????: lz = 12;
					24'b00000000000001??????????: lz = 13;
					24'b000000000000001?????????: lz = 14;
					24'b0000000000000001????????: lz = 15;
					24'b00000000000000001???????: lz = 16;
					24'b000000000000000001??????: lz = 17;
					24'b0000000000000000001?????: lz = 18;
					24'b00000000000000000001????: lz = 19;
					24'b000000000000000000001???: lz = 20;
					24'b0000000000000000000001??: lz = 21;
					24'b00000000000000000000001?: lz = 22;
					24'b000000000000000000000001: lz = 23;
					24'b000000000000000000000000: lz = 24;
					default                     : lz = 'x;
				endcase
			end
		end
		else always_comb $error("Unexpected input WIDTH %d", WIDTH);
	endgenerate
		
endmodule

