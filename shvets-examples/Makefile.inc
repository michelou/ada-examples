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
ifndef MSYS_HOME
    $(error Variable MSYS_HOME is not set)
endif
#
MSYS_PATH    = $(subst \,/,$(MSYS_HOME))
CP           = $(MSYS_PATH)/usr/bin/cp.exe
DIFF         = $(MSYS_PATH)/usr/bin/diff.exe
ECHO         = $(MSYS_PATH)/usr/bin/echo.exe
FIND         = $(MSYS_PATH)/usr/bin/find.exe
GNATMAKE     = $(MSYS_PATH)/mingw64/bin/gnatmake.exe
GREP         = $(MSYS_PATH)/usr/bin/grep.exe
MKDIR        = $(MSYS_PATH)/usr/bin/mkdir.exe
RM           = $(MSYS_PATH)/usr/bin/rm.exe
#
TAR          = /$(subst :,,$(MSYS_PATH))/usr/bin/tar.exe
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
