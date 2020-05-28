sources := $(wildcard src/*.md)
objects := $(sources:src/%.md=%.html)
deps    := $(wildcard deps/*.d)
READFILE=sh -c '\
	if [[ $$2 != "" ]]; then head -1 $$1; else echo default; fi;\
	' READFILE

ifneq (,$(findstring n,$(MAKEFLAGS)))
READFILE=: READFILE
endif

define __find_css # return css filename
	$(lastword $(shell ${READFILE} $(1) $(findstring $(1), $(deps))))
endef

define find_style # return css path
	$(patsubst %, style/%.css, $(call __find_css, $(patsubst src/%.md,deps/%.d, $(1))))
endef

all: $(objects)

%.html : src/%.md
	pandoc -s $< --css$(call find_style, $<) -o $@ --section-divs --quiet --self-contained

clean :
	rm *.html

-include $(deps)