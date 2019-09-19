ifdef OS
	EXT=.exe
else
	EXT=
endif

BUILD=gprbuild$(EXT)
CLEAN=gprclean$(EXT)

EXEC=model-tests-run$(EXT)

all:  run_tests

compil_lib::
	$(BUILD) -j4 -g -gnatef model_lib.gpr

compil_tests::
	$(BUILD) -j4 -g -gnatef model_tests.gpr

clean::
	$(CLEAN) model_lib.gpr
	$(CLEAN) model_tests.gpr

run_tests: compil_tests
	${HOME}/tmp/bin/$(EXEC)

gnattest: compil_lib
	gnattest$(EXT) -Pmodel_lib.gpr src_lib/model-element-dummy.ads

xref::
	gnatxref -a -aIsrc_lib -aIsrc_tests -aOout_lib -aOout_obj src_test/model-tests-run.adb
