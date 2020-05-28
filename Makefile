SOURCE_DIR := src
DEPEND_DIR := deps
STYLES_DIR := style
sources := $(wildcard $(SOURCE_DIR)/*.md)
objects := $(sources:$(SOURCE_DIR)/%.md=%.html)
deps    := $(wildcard $(DEPEND_DIR)/*.d)
READFILE=sh -c '\
	if [[ $$2 != "" ]]; then head -1 $$1; else echo $(STYLES_DIR)/default.css; fi;\
	' READFILE

ifneq (,$(findstring n,$(MAKEFLAGS)))
READFILE=: READFILE
endif

define __find_css # return css path from file || default style
	$(lastword $(shell ${READFILE} $(1) $(findstring $(1), $(deps))))
endef

define find_style # search dependency files for css path
	$(call __find_css, $(patsubst $(SOURCE_DIR)/%.md,$(DEPEND_DIR)/%.d, $(1)))
endef

all: $(objects)

%.html : $(SOURCE_DIR)/%.md
	pandoc -s $< --css$(call find_style, $<) -o $@ --section-divs --quiet --self-contained

clean :
	rm *.html

help :
	#TODO: "write something here"

#TODO: method to generate default dependency files
#TODO: generate .d including all the .md that DON'T already have one 

-include $(deps)
# '-' => won't generate an error if the include file doesn't exist.