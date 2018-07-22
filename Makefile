
fern:
	ocamlc graphics.cma main.ml -o fern

clean: clean_src
	rm -rf fern

clean_src:
	rm -rf *.cmo *.cmi