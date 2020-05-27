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
	${READFILE} $(patsubst src/%.md,deps/%.d, $<) $(deps)
	$(eval CSS := $(subst src/,style/,$(subst .md,.css,$<)))
	pandoc -s $< --css $(CSS) -o $@ --section-divs --quiet --self-contained

deploy: $(objects)
