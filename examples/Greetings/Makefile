##
## Copyright (c) 2018-2023 Stéphane Micheloud
##
## Licensed under the MIT License.
##
##############################################################################

include ../Makefile.inc

PROJ_NAME      = Greetings

SOURCE_DIR     = src
TARGET_DIR     = target
TARGET_OBJ_DIR = $(TARGET_DIR)/obj

##############################################################################
## main rules

SOURCES = $(wildcard $(SOURCE_DIR)/*main*.adb)
TARGET  = $(TARGET_DIR)/$(PROJ_NAME)$(TARGET_EXT)

all: build run

build: $(TARGET)

$(TARGET): $(SOURCES)
	[[ -d "$(TARGET_OBJ_DIR)" ]] || "$(MKDIR)" -p "$(TARGET_OBJ_DIR)"
	"$(GNATMAKE)" -d -gnat2022 -we -D "$(TARGET_OBJ_DIR)" -o "$(TARGET)" $^

clean:
	"$(RM)" -rf "$(TARGET_DIR)"

run: build
	"$(TARGET)"
  
help:
	@$(ECHO) "Usage: make all|build|clean|help|lint|run"
	@$(ECHO) ""
	@$(ECHO) "   Subcommands:"
	@$(ECHO) "     all    alias for build"
	@$(ECHO) "     build  compile Ada source files"
	@$(ECHO) "     clean  delete generated files"
	@$(ECHO) "     help   display this help message"
	@$(ECHO) "     lint   analyze Ada source files"
	@$(ECHO) "     run    execute main program \"$(TARGET)\""

##############################################################################
## phony

.PHONY: all build clean help run

.SUFFIXES:
.SUFFIXES: .adb .ads .o .obj .exe
