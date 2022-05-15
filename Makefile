# Copyright (C) 2022  Jacob Koziej <jacobkoziej@gmail.com>
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

BUILD ?= build
SRC    = src


AS = javk-as


ALU_TEST_SRC = $(SRC)/alu-test.asm


.PHONY: all
all: alu-test


.PHONY: clean
clean:
	@rm -rvf $(BUILD)


.PHONY: alu-test
alu-test: $(BUILD)/alu-test


$(BUILD)/alu-test: $(ALU_TEST_SRC) $(BUILD)
	$(AS) $(ALU_TEST_SRC)
	@mv a.out $(BUILD)/alu-test


$(BUILD):
	mkdir $(BUILD)
