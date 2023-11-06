ifeq ($(OS),Windows_NT)
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
ifndef GNAT_HOME
    $(error Variable GNAT_HOME is not set)
endif
#
CP           = /usr/bin/cp.exe
DIFF         = /usr/bin/diff.exe
ECHO         = /usr/bin/echo.exe
FIND         = /usr/bin/find.exe
GNATMAKE     = $(subst \,/,$(GNAT_HOME))/bin/gnatmake.exe
GREP         = /usr/bin/grep.exe
MKDIR        = /usr/bin/mkdir.exe
RM           = /usr/bin/rm.exe
#
ifndef ADACTL_HOME
    $(error Variable ADACTL_HOME is not set)
endif
#
ADACTL       = $(subst \,/,$(ADACTL_HOME))/adactl.exe
#
TAR          = /usr/bin/tar.exe
endif
#
TARGET_EXT   = .exe
#
############################## Unix environment ##############################
else
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
AUNIT_DIR    = $(ROOT_DIR)/aunit-22.0.0
