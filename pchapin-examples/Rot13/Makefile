##
## Copyright (c) 2018-2024 Stéphane Micheloud
##
## Licensed under the MIT License.
##
##############################################################################

include ../Makefile.inc

PROJ_NAME = Rot13

SOURCE_DIR      = src
SOURCE_MAIN_DIR = $(SOURCE_DIR)/main/ada
TARGET_DIR      = target
TARGET_OBJ_DIR  = $(TARGET_DIR)/obj

MAIN_ARGS = $(TARGET_DIR)/input.txt $(TARGET_DIR)/output.txt

##############################################################################
## main rules

SOURCE_MAIN_FILE = $(SOURCE_MAIN_DIR)/rot13.adb

TARGET  = $(TARGET_DIR)/$(PROJ_NAME)$(TARGET_EXT)

all: build run

build: $(TARGET)
	"$(ECHO)" "Program that does ROT13 transformation on a text file." > "$(TARGET_DIR)/input.txt"

$(TARGET): $(SOURCE_MAIN_FILE)
	[[ -d "$(TARGET_OBJ_DIR)" ]] || "$(MKDIR)" -p "$(TARGET_OBJ_DIR)"
	"$(GNATMAKE)" -d -gnat2022 -we -I"$(SOURCE_MAIN_DIR)" -D "$(TARGET_OBJ_DIR)" -o "$(TARGET)" $^

clean:
	"$(RM)" -rf "$(TARGET_DIR)"

run: build
	"$(TARGET)" $(MAIN_ARGS)

help:
	@$(ECHO) "Usage: make all|build|clean|doc|help|lint|run"
	@$(ECHO) ""
	@$(ECHO) "   Subcommands:"
	@$(ECHO) "     all    alias for build"
	@$(ECHO) "     build  compile Ada source files"
	@$(ECHO) "     clean  delete generated files"
	@$(ECHO) "     doc    generate HTML documentation"
	@$(ECHO) "     help   print this help message"
	@$(ECHO) "     lint   analyze Ada source files"
	@$(ECHO) "     run    execute main program \"$(TARGET)\""

##############################################################################
## lint

## adactl expects absolute path arguments
ARU_FILE = $(realpath ../rules.aru)
LOG_FILE = $(realpath $(TARGET_DIR))/adactl_log.txt

lint:
	cd $(TARGET_DIR); \
	"$(ADACTL)" -v -f "$(ARU_FILE)" -o "$(LOG_FILE)" -w "$(realpath $(SOURCE_DIR))/*.adb"

##############################################################################
## doc

PRJ_FILE = build.gpr

doc:
	## Other options: -q=be quiet
	"$(GNATDOC)" --project="$(PRJ_FILE)"

##############################################################################
## phony

.PHONY: all build clean doc help lint run

.SUFFIXES:
.SUFFIXES: .adb .adc .ads .o .obj .exe
