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
	# clear all registers
	and	z
	mva	b
	mva	c
	mva	d
	mva	e
	mva	g
	mva	h
	mva	i
	mva	j
	mva	k
	mva	l
	mva	m
	mva	n
	mva	o
