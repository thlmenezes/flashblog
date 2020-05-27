sources := $(wildcard src/*.md)
objects := $(sources:src/%.md=%.html)
deps    := $(wildcard deps/*.d)
READFILE=sh -c '\
	if [[ $$2 == *$$1* ]]; then head -1 $$1; else echo default; fi;\
	' READFILE

ifneq (,$(findstring n,$(MAKEFLAGS)))
READFILE=: READFILE
endif

include $(deps)

%.html : src/%.md
	# TODO: Test variation
	pandoc \
	-s $< \
	--css $(patsubst %, style/%.css, $(lastword $(shell ${READFILE} $(patsubst src/%.md,deps/%.d, $<) $(deps)))) \
	-o $@ --section-divs --quiet --self-contained

deploy: $(objects)
