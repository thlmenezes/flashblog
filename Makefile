%.html : %.md
	$(eval CSS := $(subst .md,.css,$<))
	$(eval TMP := $(addprefix temp,$@))
	pandoc -s $< --css $(CSS) -o $(TMP) --section-divs --quiet
	echo "<style>`cat $(CSS)`</style>`cat $(TMP)`" >> $@
	rm $(TMP)

deploy: index.html
