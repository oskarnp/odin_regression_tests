include ../common.mk
all: 
	@$(ODIN) build . -out:$(TEMPDIR)/test $(ODIN_ARGS)
	@/bin/sh ../runner.sh 1 $(TEMPDIR)/test
	@echo OK
