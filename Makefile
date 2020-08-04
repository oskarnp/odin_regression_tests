.PHONY: all
all: test1 test2 test3

ODIN_DEBUG = Odin/odin-debug
ODIN_RELFAST = Odin/odin-relfast
ODIN_RELSAFE = Odin/odin-relsafe
 
ODIN_BUILD_FLAGS = -Wno-switch -Wno-pointer-sign -Wno-tautological-constant-out-of-range-compare -Wno-tautological-compare -Wno-macro-redefined \
				   -pthread -ldl -lm -lstdc++ -std=c++11 -liconv

ODIN_SOURCE_FILE = Odin/src/main.cpp

$(ODIN_DEBUG): $(ODIN_SOURCE_FILE)
	clang -O0 -g $(ODIN_BUILD_FLAGS) $(ODIN_SOURCE_FILE) -o $@
$(ODIN_RELFAST): $(ODIN_SOURCE_FILE)
	clang -O3 -DNDEBUG -march=native $(ODIN_BUILD_FLAGS) $(ODIN_SOURCE_FILE) -o $@
$(ODIN_RELSAFE): $(ODIN_SOURCE_FILE)
	clang -O2 -fsanitize=address,undefined $(ODIN_BUILD_FLAGS) $(ODIN_SOURCE_FILE) -o $@

.PHONY: test1
test1: ODIN=../$(ODIN_DEBUG)
test1: $(ODIN_DEBUG)
	$(RUN_TESTS)

.PHONY: test2
test2: ODIN=../$(ODIN_RELFAST)
test2: $(ODIN_RELFAST)
	$(RUN_TESTS)

.PHONY: test3
test3: ODIN=../$(ODIN_RELSAFE)
test3: $(ODIN_RELSAFE)
	$(RUN_TESTS)

.PHONY: 708
708: ODIN=../$(ODIN_DEBUG)
708: ALL_TESTS = 708
708: $(ODIN_DEBUG)
	$(RUN_TESTS)

ALL_TESTS = 642 647 674 705 706 708

define RUN_TESTS
@echo "Odin commit: "; cd Odin && git rev-parse HEAD
@for dir in $(ALL_TESTS); do \
	echo ================================================================================ ; \
	echo Running $$dir with $(ODIN) ... ; \
	make -C ./$$dir ODIN=$(ODIN)  ; \
	done
endef
