# All scripts are run with data/ as the working directory and src/ on PYTHONPATH.
CC ?= gcc
CFLAGS ?= -O2
PY ?= python3
RUN = cd data && PYTHONPATH=../src $(PY)

all: bin/delta bin/w2 bin/sa
bin/%: src/%.c
	mkdir -p bin && $(CC) $(CFLAGS) -o $@ $< -lm

# small enumeration test: recompute delta for all posets n<=7 from stored digraph6 strings
test-small: bin/delta
	zcat data/results.csv.gz | awk -F, 'NR>1 && $$1<=7 {print $$2}' | ./bin/delta > /tmp/delta_small.out
	@echo "posets processed: $$(wc -l < /tmp/delta_small.out)"
check60:
	$(RUN) ../src/check60.py
check80:
	$(RUN) ../src/check80.py
pecz:
	$(RUN) ../src/pecz.py
minima:
	mkdir -p data/hasse && $(RUN) ../src/draw.py
# full enumeration needs nauty's genposetg:  genposetg <n> | ./bin/delta > data/raw_<n>.csv ; then make results
results:
	$(RUN) ../src/run.py && $(RUN) ../src/show.py
clean:
	rm -rf bin
.PHONY: all test-small check60 check80 pecz minima results clean
