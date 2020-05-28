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
	$(eval LCYAN := \033[1;36m)
	$(eval GREEN := \033[0;32m)
	$(eval RESET := \033[0m)
	$(eval BOLD  := $(shell tput bold))
	$(eval REGU  := $(shell tput sgr0))
	$(eval TITLE := $(GREEN)$(BOLD))
	$(eval RET   := $(RESET)$(REG))
	@echo -e \
	"$(TITLE)NAME$(RET)\n\t\
	FlashBlog - slides automation project\n\n\
	$(TITLE)SYNOPSIS$(RET)\n\t\
	$(TITLE)make$(RET) [$(LCYAN)build$(RESET)]\n\n\
	$(TITLE)DESCRIPTION$(RET)\n\t\
	Compile Markdown to HTML pages a.k.a slides\n\
	\n\t\
	$(TITLE)build$(RET)     compile files from SOURCE_DIR to html\n\
	\n\t\
	$(TITLE)dependencies$(RET)\n\
	\t          generate dependency files to all sources that $(BOLD)don't$(REGU) already have\n\
	\n\t\
	$(TITLE)clean$(RET)     removes all compiled files (*.html DEPEND_DIR/default.d)\n\n\
	$(TITLE)VARIABLES$(RET)\n\t\
	SOURCE_DIR := $(SOURCE_DIR)\n\t\
	DEPEND_DIR := $(DEPEND_DIR)\n\t\
	STYLES_DIR := $(STYLES_DIR)\n\n\
	$(TITLE)AUTHOR$(RET)\n\t\
	Written by Thales Menezes (@thaleslim)\
	"

# foreach dir in $2 { $1.contains dir ? '' : dir }
not-containing = $(foreach dir,$2,$(if $(findstring $(dir),$1),,$(dir)))

$(DEPEND_DIR)/default.d: $(sources)
	$(eval FILES := $(patsubst $(DEPEND_DIR)/%.d, %, $(call not-containing, $(deps), $(sources:$(SOURCE_DIR)/%.md=$(DEPEND_DIR)/%.d))))
	$(if $(FILES), $(foreach file, $(FILES),$(file >> $(DEPEND_DIR)/default.d,$(subst $(file),$(file).html : $(SOURCE_DIR)/$(file).md $(STYLES_DIR)/default.css,$(file)))))

dependencies:
	$(eval FILES := $(patsubst $(DEPEND_DIR)/%.d, %, $(call not-containing, $(deps), $(sources:$(SOURCE_DIR)/%.md=$(DEPEND_DIR)/%.d))))
	@echo "touching files..."
	$(if $(FILES), $(foreach file, $(FILES),$(file > $(DEPEND_DIR)/$(file).d,$(subst $(file),$(file).html : $(SOURCE_DIR)/$(file).md $(STYLES_DIR)/default.css,$(file)))))

-include $(deps)
# '-' => won't generate an error if the include file doesn't exist.