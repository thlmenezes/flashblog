sources := $(wildcard src/*.md)
objects := $(sources:src/%.md=%.html)

%.html : src/%.md
	$(eval CSS := $(subst src/,style/,$(subst .md,.css,$<)))
	pandoc -s $< --css $(CSS) -o $@ --section-divs --quiet --self-contained

deploy: $(objects)
