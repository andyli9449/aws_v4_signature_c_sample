LDFLAG=
CFLAGS=
INC_DIR=
LIB_DIR=
LIBS=

PLATFORM?=X86_64
export INSTALL_PATH=$(PWD)

INC_DIR=$(PWD)
LIB_DIR=$(PWD)/lib

ifeq ("$(PLATFORM)","X86")
	CFLAGS+=-m32
	LDFLAGS+=-m32
endif
CC:=$(CROSS_COMPILE)gcc
CPP:=$(CROSS_COMPILE)g++
AR:=$(CROSS_COMPILE)ar


LDFLAG+=-O2 -ldl -pthread 
STRIP = $(CROSS_COMPILE)strip

CFLAGS+=-L$(LIB_DIR) 
LIBS+=-L$(LIB_DIR) -lcurl -lssl -lcrypto 

CFLAGS+=-I$(INC_DIR)/include 
CFLAGS+=-I$(INC_DIR)/lib/aws_sigv4

RELEASE_OUTPUT = ./__out_bin
APP_SRC += ./lib/aws_sigv4/aws_sigv4_common.c
APP_SRC += ./lib/aws_sigv4/aws_sigv4.c
APP_SRC += ./test_main.c

default: #$(TSTOOLLIB)
	$(CC) $(CFLAGS) $(APP_SRC) $(LIBS_RELEASE) $(LIBS) $(LDFLAG) -o sample_$(PLATFORM)
	@echo === Target Platform [$(PLATFORM)] test Sample Done ===
	


