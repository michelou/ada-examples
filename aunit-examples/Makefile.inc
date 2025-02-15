ifeq ($(OS),Windows_NT)
ifndef GNAT_HOME
$(error Variable GNAT_HOME is not set)
endif
#
############################## MSYS2 environment #############################
ifeq ($(MSYSTEM),MINGW64)
CP           = cp
DIFF         = diff
ECHO         = echo
FIND         = find
GNATMAKE     = gnatmake
GREP         = egrep
MKDIR        = mkdir
RM           = rm
TAR          = tar
#
############################# Windows environment ############################
else
GPRBUILD     = $(subst \,/,$(GNAT_HOME))/bin/gprbuild.exe
GPRCLEAN     = $(subst \,/,$(GNAT_HOME))/bin/gprclean.exe
## $(MSYS_HOME)\usr\bin\{cp.exe, make.exe, wget.exe}
CP           = /usr/bin/cp.exe
DIFF         = /usr/bin/diff.exe
ECHO         = /usr/bin/echo.exe
FIND         = /usr/bin/find.exe
GNATMAKE     = /mingw64/bin/gnatmake.exe
GREP         = /usr/bin/grep.exe
MKDIR        = /usr/bin/mkdir.exe
RM           = /usr/bin/rm.exe
#
TAR          = /$(subst :,,$(MSYS_PATH))/usr/bin/tar.exe
endif
#
TARGET_EXT   = .exe
#
############################## Unix environment ##############################
else
GPRBUILD     = gprbuild
GPRCLEAN     = gprclean
CP           = cp
DIFF         = diff
ECHO         = echo
FIND         = find
GREP         = egrep
MKDIR        = mkdir
RM           = rm
TAR          = tar
#
TARGET_EXT   =
endif
#
############################### AUnit library ################################

ROOT_DIR     = $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
AUNIT_DIR    = $(ROOT_DIR)/aunit-25.0.0/dist
