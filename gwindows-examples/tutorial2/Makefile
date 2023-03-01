include ../Makefile.inc

PROJECT_NAME   ?= $(shell basename $(CURDIR))

SOURCE_DIR      = src
TARGET_DIR      = target
TARGET_OBJ_DIR  = $(TARGET_DIR)/obj
TARGET_DOCS_DIR = $(TARGET_DIR)/docs

##############################################################################
## main rules

SOURCES = $(wildcard $(SOURCE_DIR)/*.adb)
TARGET  = $(TARGET_DIR)/$(PROJECT_NAME)$(TARGET_EXT)

QUIET := $(if $(DEBUG) -eq 0,-q,)
## -we : Treat all warnings as errors
GNATMAKE_OPTS=$(QUIET) -gnat2022 -we -aI"$(GNATCOM_DIR)" -aI"$(GWINDOWS_DIR)" -D "$(TARGET_OBJ_DIR)" -o "$(TARGET)"

all: build run

build: $(TARGET)

$(TARGET): $(SOURCES)
	@$(TEST) -d "$(TARGET_OBJ_DIR)" || "$(MKDIR)" -p "$(TARGET_OBJ_DIR)"
	"$(GNATMAKE)" $(GNATMAKE_OPTS) $^

clean:
	"$(RM)" -rf "$(TARGET_DIR)"

run: build
	$(TARGET)

##############################################################################
## doc

TARGET_DOC = $(TARGET_DIR)/index.html

doc: $(TARGET_DOC)

## https://docs.adacore.com/live/wave/gps/html/gnatdoc-doc/gnatdoc.html
GNATDOC_OPTS=--project=$(PROJECT_NAME) --output=html

$(TARGET_DOC): $(SOURCES)
	@$(TEST) -d "$(TARGET_OBJ_DIR)" || "$(MKDIR)" -p "$(TARGET_OBJ_DIR)"
	@$(TEST) -d "$(TARGET_DOCS_DIR)" || "$(MKDIR)" -p "$(TARGET_DOCS_DIR)"
	"$(GNATDOC)" $(GNATDOC_OPTS)

##############################################################################
## phony

.PHONY: all build clean doc run

.SUFFIXES:
.SUFFIXES: .c .o .obj .exe
