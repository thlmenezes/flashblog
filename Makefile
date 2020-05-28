SOURCE_DIR := src/
DEPEND_DIR := deps/
STYLES_DIR := style/
sources := $(wildcard $(SOURCE_DIR)*.md)
objects := $(sources:$(SOURCE_DIR)%.md=%.html)
deps    := $(wildcard $(DEPEND_DIR)*.d)
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
	$(patsubst %, $(STYLES_DIR)%.css, $(call __find_css, $(patsubst $(SOURCE_DIR)%.md,$(DEPEND_DIR)%.d, $(1))))
endef

all: $(objects)

%.html : $(SOURCE_DIR)%.md
	pandoc -s $< --css$(call find_style, $<) -o $@ --section-divs --quiet --self-contained

clean :
	rm *.html

-include $(deps)