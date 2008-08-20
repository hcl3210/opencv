OPT :=

ifdef CXXFLAGS
	OPT := $(OPT) "CXXFLAGS_EXTRA=$(CXXFLAGS)"
endif

ifndef DEBUG
    DEBUG := 0
endif

OPT := $(OPT) DEBUG=$(DEBUG)

ifneq ($(DEBUG),0)
    DBG := d
    OPT := $(OPT) DBG=d
    DR := _Dbg
else
    DBG :=
    DR := _Rls
endif

ifndef MAKE
    MAKE := mingw32-make
endif

all:
	@-mkdir ..\_temp\cxcore$(DR) 2> nul
	@$(MAKE) $(OPT) --directory=../_temp/cxcore$(DR) --makefile=../../cxcore/src/makefile.gnu
	@-mkdir ..\_temp\cv$(DR) 2> nul
	@$(MAKE) $(OPT) --directory=../_temp/cv$(DR) --makefile=../../cv/src/makefile.gnu
	@-mkdir ..\_temp\cvaux$(DR) 2> nul
	@$(MAKE) $(OPT) --directory=../_temp/cvaux$(DR) --makefile=../../cvaux/src/makefile.gnu
	@-mkdir ..\_temp\ml$(DR) 2> nul
	@$(MAKE) $(OPT) --directory=../_temp/ml$(DR) --makefile=../../ml/src/makefile.gnu
	@-mkdir ..\_temp\highgui$(DR) 2> nul
	@$(MAKE) $(OPT) --directory=../_temp/highgui$(DR) --makefile=../../otherlibs/highgui/makefile.gnu
	@-mkdir ..\_temp\cxts$(DR) 2> nul
	@$(MAKE) $(OPT) --directory=../_temp/cxts$(DR) --makefile=../../tests/cxts/makefile.gnu
	@-mkdir ..\_temp\cxcoretest$(DR) 2> nul
	@$(MAKE) $(OPT) --directory=../_temp/cxcoretest$(DR) --makefile=../../tests/cxcore/src/makefile.gnu
	@-mkdir ..\_temp\cvtest$(DR) 2> nul
	@$(MAKE) $(OPT) --directory=../_temp/cvtest$(DR) --makefile=../../tests/cv/src/makefile.gnu

clean:
	@-rmdir /s /q ..\_temp\cxcore$(DR) 2> nul
	@-del ..\bin\cxcore???$(DBG).dll 2> nul
	@-del ..\lib\cxcore$(DBG).lib 2> nul
	@-rmdir /s /q ..\_temp\cv$(DR) 2> nul
	@-del ..\bin\cv???$(DBG).dll 2> nul
	@-del ..\lib\cv$(DBG).lib 2> nul
	@-rmdir /s /q ..\_temp\cvaux$(DR) 2> nul
	@-del ..\bin\cvaux???$(DBG).dll 2> nul
	@-del ..\lib\cvaux$(DBG).lib 2> nul
	@-rmdir /s /q ..\_temp\ml$(DR) 2> nul
	@-del ..\bin\ml???$(DBG).dll 2> nul
	@-del ..\lib\ml$(DBG).lib 2> nul
	@-rmdir /s /q ..\_temp\highgui$(DR) 2> nul
	@-del ..\bin\highgui???$(DBG).dll 2> nul
	@-del ..\lib\highgui$(DBG).lib 2> nul
	@-rmdir /s /q ..\_temp\cxts$(DR) 2> nul
	@-del ..\bin\cxts???$(DBG).dll 2> nul
	@-del ..\lib\cxts$(DBG).lib 2> nul
	@-rmdir /s /q ..\_temp\cxcoretest$(DR) 2> nul
	@-del ..\bin\cxcoretest$(DBG).exe 2> nul
	@-rmdir /s /q ..\_temp\cvtest$(DR) 2> nul
	@-del ..\bin\cvtest$(DBG).exe 2> nul
