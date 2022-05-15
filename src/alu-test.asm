# alu-test.asm -- test alu operations
# Copyright (C) 2022  Jacob Koziej <jacobkoziej@gmail.com>
# Copyright (C) 2022  Ani Vardanyan <ani.var.2003@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

_start:
	# clear necessary registers
	and	z
	mva	i
	mva	j

	# we'll write our results to 0x8000 (right outside .text)
	lnh	0x8
	mva	i

	# we'll use 0x55 as our right operand
	lnh	0x5
	lnl	0x5
	mva	b

	# 0xff + 0x55
	lnh	0xf
	lnl	0xf
	add	b
	stb	0x0

	# 0xff - 0x55
	lnh	0xf
	lnl	0xf
	sub	b
	stb	0x0

	# ~0x55
	neg	b
	stb	0x0

	# 0xff & 0x55
	lnh	0xf
	lnl	0xf
	and	b
	stb	0x0

	# now we'll swap to using 0xff as our right operand
	lnh	0xf
	lnl	0xf
	mva	b

	# 0x55 | 0xff
	lnh	0x5
	lnl	0x5
	orr	b
	stb	0x0

	# 0x55 ^ 0xff
	lnh	0x5
	lnl	0x5
	eor	b
	stb	0x0

	# 0x55 << 4
	lnh	0x5
	lnl	0x5
	lsl	0x4
	stb	0x0

	# 0x55 >> 4
	lnh	0x5
	lnl	0x5
	lsr	0x4
	stb	0x0

	# return to the start
	ldl	_start
	jmp	al
