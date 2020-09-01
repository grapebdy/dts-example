#
# build dts with macro
#

CFLAGS =-E -Wp,-MD,gemini.pre.tmp -nostdinc -I. -undef -D__DTS__ -x assembler-with-cpp

all: build

build:
	gcc $(CFLAGS) -o gemini.dts.tmp gemini.dts
	dtc -I dts -O dts gemini.dts.tmp -o gemini-build.dts
	dtc -I dts -O dtb -o gemini.dtb gemini-build.dts

clean:
	rm -fr *.dtb *.pre.tmp gemini-build.dts *.dts.tmp
