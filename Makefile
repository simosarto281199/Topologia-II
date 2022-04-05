pdf: init
	latexmk

clean:
	latexmk -c

clean-all:
	latexmk -C
	rm -rf build/

## Stuff to set up repository after cloning

init: .init-submodule-cert .init-git-hooks-cert

.init-submodule-cert:
	@echo "[Make] Initialising git submodule for packages"
	git submodule update --init --rebase
	@touch .init-submodule-cert

# Sets up git hooks for gitinfo2 package
.init-git-hooks-cert:
	@echo "[Make] Setting up git hooks for package gitinfo2"
	@mkdir -p .git/hooks
	@cp .ci/git-info-2.sh .git/hooks/post-merge
	@cp .ci/git-info-2.sh .git/hooks/post-checkout
	@cp .ci/git-info-2.sh .git/hooks/post-commit
	@.ci/git-info-2.sh
	@touch .init-git-hooks-cert


.PHONY: pdf, clean, clean-all
