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

build: $(objects) $(DEPEND_DIR)/default.d

%.html : $(SOURCE_DIR)/%.md
	pandoc -s $< --css$(call find_style, $<) -o $@ --section-divs --quiet --self-contained

clean:
	@rm *.html $(DEPEND_DIR)/default.d

help:
	#TODO: "write something here"

# foreach dir in $2 { $1.contains dir ? '' : dir }
not-containing = $(foreach dir,$2,$(if $(findstring $(dir),$1),,$(dir)))

$(DEPEND_DIR)/default.d: $(sources)
	$(eval FILES := $(patsubst $(DEPEND_DIR)/%.d, %, $(call not-containing, $(deps), $(sources:$(SOURCE_DIR)/%.md=$(DEPEND_DIR)/%.d))))
	$(if $(FILES), $(foreach file, $(FILES),$(file >> $(DEPEND_DIR)/default.d,$(subst $(file),$(file).html : $(SOURCE_DIR)/$(file).md $(STYLES_DIR)/default.css,$(file)))))

# generates dependency files to
# all sources that DON'T have
dependencies:
	$(eval FILES := $(patsubst $(DEPEND_DIR)/%.d, %, $(call not-containing, $(deps), $(sources:$(SOURCE_DIR)/%.md=$(DEPEND_DIR)/%.d))))
	@echo "touching files..."
	$(if $(FILES), $(foreach file, $(FILES),$(file > $(DEPEND_DIR)/$(file).d,$(subst $(file),$(file).html : $(SOURCE_DIR)/$(file).md $(STYLES_DIR)/default.css,$(file)))))

-include $(deps)
# '-' => won't generate an error if the include file doesn't exist.