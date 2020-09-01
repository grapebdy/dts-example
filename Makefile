#
# build dts with macro
#

CFLAGS =-E -Wp,-MD,gemini.pre.tmp -nostdinc -I. -undef -D__DTS__ -x assembler-with-cpp

all: build

build:
	gcc $(CFLAGS) -o gemini.dts.tmp gemini.dts
	dtc -I dts -O dts gemini.dts.tmp -o gemini.dts.rd
	dtc -I dts -O dtb -o gemini.dtb gemini.dts.rd

clean:
	rm -fr *.dtb *.pre.tmp *.dts.rd *.dts.tmp
