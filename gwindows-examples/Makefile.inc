ifndef GWINDOWS_HOME
$(error Variable GWINDOWS_HOME is not set)
endif

ifeq ($(OS),Windows_NT)
ifndef GNAT_HOME
$(error Variable GNAT_HOME is not set)
endif
ifndef MSYS_HOME
$(error Variable MSYS_HOME is not set)
endif

TARGET_EXT  = .exe
PSEP        = ;
## $(MSYS_HOME)\usr\bin\{cp.exe, make.exe, wget.exe}
CP          = /usr/bin/cp.exe
ECHO        = /usr/bin/echo.exe
FIND        = /usr/bin/find.exe
MKDIR       = /usr/bin/mkdir.exe
RM          = /usr/bin/rm.exe
TEST        = /usr/bin/test.exe
TOUCH       = /usr/bin/touch.exe
WGET        = /usr/bin/wget.exe

GNATDOC      = $(subst \,/,$(GNAT_HOME))/bin/gnatdoc.exe
## Gnatmake from MSYS installation has a newer version
## GNATMAKE     = $(subst \,/,$(GNAT_HOME))/bin/gnatmake.exe
GNATMAKE     = $(subst \,/,$(MSYS_HOME))/mingw64/bin/gnatmake.exe
WINDRES      = $(subst \,/,$(GNAT_HOME))/bin/windres.exe

GNATCOM_DIR  = $(GWINDOWS_HOME)\gnatcom\framework
GWINDOWS_DIR = $(GWINDOWS_HOME)\gwindows\framework
else
TARGET_EXT  =
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
WINDRES      = windres

GNATCOM_DIR  = $(GWINDOWS_HOME)/gnatcom/framework
GWINDOWS_DIR = $(GWINDOWS_HOME)/gwindows/framework
endif
