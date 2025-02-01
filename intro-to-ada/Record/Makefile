##
## Copyright (c) 2018-2023 Stéphane Micheloud
##
## Licensed under the MIT License.
##
##############################################################################

TOOLSET ?= msvc
CXXSTD ?= c++17

include ../Makefile.inc

PROJECT_NAME   ?= $(shell basename $(CURDIR))
PROJECT_CONFIG ?= Release

SOURCE_DIR = src
TARGET_DIR = build
TARGET_EXE_DIR = $(TARGET_DIR)

ifeq ($(OS),Windows_NT)
CPPCHECK_PLATFORM = win64
else
CPPCHECK_PLATFORM = native
endif
CPPCHECK_OPTS = --platform=$(CPPCHECK_PLATFORM) --std=$(CXXSTD)

ifeq ($(TOOLSET),bcc)
CXX = $(BCC)
## see https://docwiki.embarcadero.com/RADStudio/Sydney/en/C%2B%2B_Compiler
CXXFLAGS = -I "$(SOURCE_DIR)" -q -w
## suppress linker identification banner
CXXLINK = -lq
else ifeq ($(TOOLSET),clang)
CXX = $(CLANG)
CXXFLAGS = --std=$(CXXSTD) -O2 -Wall -Wno-unused-variable
CXXLINK =
else ifeq ($(TOOLSET),gcc)
CXX = $(CC)
CXXFLAGS = --std=$(CXXSTD) -O2 -Wall -Wno-unused-variable
CXXLINK =
CPPCHECK_OPTS = --platform=$(CPPCHECK_PLATFORM) --template=gcc --std=$(CXXSTD)
else ifeq ($(TOOLSET),icx)
CXX = $(ICX)
CXXFLAGS = -nologo -Qstd=$(CXXSTD) -O2 -Wall -Wno-unused-variable -Fe"$(TARGET)"
CXXLINK = -link -libpath:"$(ONEAPI_LIBPATH)/intel64"
else ifeq ($(TOOLSET),msvc)
TARGET_EXE_DIR = $(TARGET_DIR)/$(PROJECT_CONFIG)
CXX = $(CL)
## see https://learn.microsoft.com/en-us/cpp/build/reference/compiler-options-listed-alphabeticall
CXXFLAGS = -nologo -std:$(CXXSTD) -EHsc -I"$(MSVC_INCPATH)" -I"$(WINSDK_INCPATH)ucrt" -I"$(WINSDK_INCPATH)um" -Fo"$(TARGET_DIR)/"
CXXLINK = -link -libpath:"$(MSVC_LIBPATH)" -libpath:"$(WINSDK_LIBPATH)ucrt/$(ARCH)" -libpath:"$(WINSDK_LIBPATH)um/$(ARCH)"
CPPCHECK_OPTS = --platform=$(CPPCHECK_PLATFORM) --template=vs --std=$(CXXSTD)
else
$(error Variable TOOLSET is invalid)
endif

CXXDEBUG =
CXXVARS =

##############################################################################
## main rules

SOURCES = $(wildcard $(SOURCE_DIR)/main/cpp/*.cpp)
TARGET  = $(TARGET_EXE_DIR)/$(PROJECT_NAME)$(TARGET_EXT)

all: build run

build: $(TARGET)

$(TARGET): $(SOURCES)
	@$(TEST) -d "$(TARGET_EXE_DIR)" || "$(MKDIR)" -p "$(TARGET_EXE_DIR)"
ifeq ($(TOOLSET),msvc)
	@## https://docs.microsoft.com/en-us/cpp/build/reference/output-file-f-options
	"$(CXX)" $(CXXDEBUG) $(CXXFLAGS) $(CXXVARS) -Fe"$@" $^ $(CXXLINK)
else
	"$(CXX)" $(CXXDEBUG) $(CXXFLAGS) $(CXXVARS) -o $@ $^ $(CXXLINK)
endif

clean:
	"$(RM)" -rf "$(TARGET_DIR)"

run: build
	$(TARGET)

help:
	@$(ECHO) "Usage: make all|build|clean|help|lint|run"
	@$(ECHO) ""
	@$(ECHO) "   Subcommands:"
	@$(ECHO) "     all    alias for build"
	@$(ECHO) "     build  compile C++ source files"
	@$(ECHO) "     clean  delete generated files"
	@$(ECHO) "     help   display this help message"
	@$(ECHO) "     lint   analyze C++ source files with CppCheck"
	@$(ECHO) "     run    execute main program \"$(TARGET)\""

##############################################################################
## lint rules

lint:
	"$(CPPCHECK)" $(CPPCHECK_OPTS) "$(SOURCE_DIR)"

##############################################################################
## phony

.PHONY: all build clean help lint run

.SUFFIXES:
.SUFFIXES: .c .cpp .o .obj .exe
