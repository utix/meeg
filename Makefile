############################################################################
#  Copyright © 2014, Utix SAS                                              #
#  All rights reserved.                                                    #
#                                                                          #
#  Redistribution and use in source and binary forms, with or without      #
#  modification, are permitted provided that the following conditions are  #
#  met:                                                                    #
#      * Redistributions of source code must retain the above copyright    #
#        notice, this list of conditions and the following disclaimer.     #
#      * Redistributions in binary form must reproduce the above           #
#        copyright notice, this list of conditions and the following       #
#        disclaimer in the documentation and/or other materials provided   #
#        with the distribution.                                            #
#      * Neither the names of Utix employees nor the names of any          #
#        contributors may be used to endorse or promote products derived   #
#        from this software without specific prior written permission.     #
#                                                                          #
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS     #
#  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT       #
#  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   #
#  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL COPYRIGHT OWNER  #
#  OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,         #
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT        #
#  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   #
#  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   #
#  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT     #
#  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   #
#  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    #
############################################################################
CC=gcc
CFLAGS := $(filter-out -O%,$(CFLAGS))
CFLAGS += -O0 -Wno-uninitialized -fno-inline -fno-inline-functions
CFLAGS += -g3 -std=gnu99


.SECONDEXPANSION:
TARGETS = edf

edf_SOURCES = main.c edf.c edf-ncurses.c
edf_LDFLAGS = -lncurses

all: $(TARGETS)

edf: $$($$@_SOURCES)
	$(CC)  -o $@ $(CFLAGS) $($@_LDFLAGS) $^


clean:
	rm -rf $(TARGETS)

ignore:
	echo $(TARGETS) > .gitignore
