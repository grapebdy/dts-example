#
# build dts with macro
#

DTS_SRC=gemini.dts
DTS_TARGET=gemini.dtb
CFLAGS =-E -Wp,-MD,gemini.pre.tmp -nostdinc -I. -undef -D__DTS__ -x assembler-with-cpp

all: build

build: clean
	gcc $(CFLAGS) -o $(DTS_SRC).tmp $(DTS_SRC)
	dtc -I dts -O dts $(DTS_SRC).tmp -o $(DTS_SRC).rd
	dtc -I dts -O dtb -o $(DTS_TARGET) $(DTS_SRC).rd

clean:
	@rm -fr *.dtb *.tmp *.rd
