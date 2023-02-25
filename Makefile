.PHONY: all
all: test1 test2

ODIN_DEBUG = Odin/odin-debug
ODIN_RELEASE = Odin/odin-release

ODIN_SOURCE_FILES = $(wildcard Odin/src/*.cpp)

$(ODIN_DEBUG): $(ODIN_SOURCE_FILES)
	cd Odin && ./build_odin.sh debug
	mv Odin/odin $@

$(ODIN_RELEASE): $(ODIN_SOURCE_FILES)
	cd Odin && ./build_odin.sh release
	mv Odin/odin $@

.PHONY: test1
test1: ODIN=../$(ODIN_DEBUG)
test1: $(ODIN_DEBUG)
	$(RUN_TESTS)

.PHONY: test2
test2: ODIN=../$(ODIN_RELEASE)
test2: $(ODIN_RELEASE)
	$(RUN_TESTS)

ALL_TESTS = 642 647 674 705 708 714 718

define RUN_TESTS
@echo "Odin commit: "; cd Odin && git rev-parse HEAD
@for dir in $(ALL_TESTS); do \
	echo ================================================================================ ; \
	echo Running $$dir with $(ODIN) ... ; \
	make -C ./$$dir ODIN=$(ODIN)  ; \
	done
endef
