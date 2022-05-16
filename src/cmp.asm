# cmp.asm -- simple comparison call
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

	# we'll be working around 0x8000 (right outside .text)
	lnh	0x8
	mva	i

	# we'll store 0xff at 0x8000
	lnh	0xf
	lnl	0xf
	stb	0x0

	# we'll store 0x55 at 0x8001
	lnh	0x5
	lnl	0x5
	stb	0x1

	# clear 'a' to prove we're reading
	and	z
	ldb	0x0
	mva	c
	ldb	0x1
	mva	b

	# prepare our call to 'cmp'
	ldl	cmp
	lda	c
	jpl	al

	# write our output to 0x8002
	mva	b
	and	z
	mva	j
	lnh	0x8
	mva	i
	lda	b
	stb	0x2
	
	# return to the start
	ldl	_start
	jmp	al


cmp:
	# perform the comparison
	sub	b

	# prepare for our return
	mva	b
	and	z
	lnl	0x1
	orr	f
	mva	f

	# return
	lda	b
	mvb	ij, kl
	jpl	al
