# This is the top-level Joy makefile
# It is just a disguised shell script

all:
	@if [ -f gc.fail ]; then make -f make.nogc; elif [ -f gc.succ ]; then make -f make.gc; elif [ -d gc ]; then (cd gc; make); touch gc.succ; rm -f gc.fail; make -f make.gc; else touch gc.fail; rm -f gc.succ; make -f make.nogc; fi

# Whew!  The readable version looks like this:
# if test -f gc.fail
# then	make -f make.nogc
# elif test -f gc.succ
# then	make -f make.gc
# elif (cd gc; ./configure && make)
# then	touch gc.succ
#	rm -f gc.fail
#	make -f make.gc
# else	touch gc.fail
#	rm -f gc.succ
#	make -f make.nogc
# fi

clean:
	rm -f gc.succ gc.fail *.o

tar:
	tar -cf joy.tar *.c *.h *.joy *.inp *.lsp *.out [Mm]ake* gcd LICENSE regres.mak CMakeLists.txt
	rm -f joy.tar.gz
	gzip joy.tar
