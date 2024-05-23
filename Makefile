# $< is the first dependency
# $@ is the target

# C
quine2.c: quine.c
	@gcc $< -o c.quine
	@./c.quine > $@
	@rm -f c.quine

cdiff: quine2.c
	@git --no-pager diff --no-index --word-diff=plain --word-diff-regex=. quine.c $<

ccheck: quine2.c
	@diff -q quine.c $<
	@echo C quine is good!

# Python
quine2.py: quine.py
	@python $< > $@

pydiff: quine2.py
	@git --no-pager diff --no-index --word-diff=plain --word-diff-regex=. quine.py $<

pycheck: quine2.py
	@diff -q quine.py $<
	@echo Python quine is good!

# Haskell
quine2.hs: quine.hs
	@runghc $< > $@

hdiff: quine2.hs
	@git --no-pager diff --no-index --word-diff=plain --word-diff-regex=. quine.hs $<

hcheck: quine2.hs
	@diff -q quine.hs $<
	@echo Haskell quine is good!

clean:
	@rm -f quine2.c quine2.py quine2.hs

.PHONY: cdiff ccheck pycheck clean pydiff hdiff
