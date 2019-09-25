LIB_GPR=model_lib.gpr
TEST_GPR=model_tests.gpr
EXEC=model-tests-run$(EXT)
RUN=${HOME}/tmp/bin/$(EXEC)

CMD=make -f ../common/Makefile LIB_GPR=$(LIB_GPR) TEST_GPR=$(TEST_GPR) RUN=$(RUN) EXEC=$(EXEC)

.PHONY : all compil_lib compil_tests clean run_tests

all compil_lib compil_tests clean run_tests::
	$(CMD) $@
