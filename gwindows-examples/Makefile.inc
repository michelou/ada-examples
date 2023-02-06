ifndef GWINDOWS_HOME
$(error Variable GWINDOWS_HOME i
endif

ifeq ($(OS),Windows_NT)
ifndef GNAT_HOME
$(error Variable GNAT_HOME i
endif
ifndef MSYS_HOME
$(error Variable MSYS_HOME is not set)
endif

EXE_EXT     = .exe
PSEP        = ;
CP          = $(subst \,/,$(MSYS_HOME))/usr/bin/cp.exe
ECHO        = $(subst \,/,$(MSYS_HOME))/usr/bin/echo.exe
FIND        = $(subst \,/,$(MSYS_HOME))/usr/bin/find.exe
MKDIR       = $(subst \,/,$(MSYS_HOME))/usr/bin/mkdir.exe
RM          = $(subst \,/,$(MSYS_HOME))/usr/bin/rm.exe
TEST        = $(subst \,/,$(MSYS_HOME))/usr/bin/test.exe
TOUCH       = $(subst \,/,$(MSYS_HOME))/usr/bin/touch.exe

GNATDOC      = $(subst \,/,$(GNAT_HOME))/bin/gnatdoc.exe
GNATMAKE     = $(subst \,/,$(GNAT_HOME))/bin/gnatmake.exe

GNATCOM_DIR  = $(GWINDOWS_HOME)\gnatcom\framework
GWINDOWS_DIR = $(GWINDOWS_HOME)\gwindows\framework
else
EXE_EXT     =
PSEP        = :
CP          = cp
ECHO        = echo
FIND        = find
MKDIR       = mkdir
RM          = rm
TEST        = test
TOUCH       = touch

GNATDOC      = gnatdoc
GNATMAKE     = gnatmake

GNATCOM_DIR  = $(GWINDOWS_HOME)/gnatcom/framework
GWINDOWS_DIR = $(GWINDOWS_HOME)/gwindows/framework
endif
