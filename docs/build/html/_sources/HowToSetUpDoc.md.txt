## How to set up a sphinx based documentation site

1. Create a docs, source directories

2. Create *.md files with content to be included in the documentation

3. Create a 'Makefile.sphinx' file with following content:

```    
    # Minimal makefile for Sphinx documentation

    # You can set these variables from the command line, and also
    # from the environment for the first two.
    SPHINXOPTS    ?=
    SPHINXBUILD   ?= sphinx-build
    SOURCEDIR     = .
    BUILDDIR      = _build

    # Put it first so that "make" without argument is like "make help".
    help:
      @$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

    .PHONY: help Makefile

    # Catch-all target: route all unknown targets to Sphinx using the new
    # "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
    %: Makefile
      @$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
```    

4. Create a nginx set up file to display the documentation as a website:

```
Image=tbutzer/sphinx
html:
	docker run\
           -v `pwd`:/home \
           ${Image} sphinx-build source build/html

webServer:
	docker run --name et-web -p 80:80 -v `pwd`/build/html:/usr/share/nginx/html:ro -d nginx


git:
	(cd /opt/et && make)
```
