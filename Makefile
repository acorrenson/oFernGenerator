
fern.exe:
	ocamlc graphics.cma main.ml -o fern.exe

clean: clean_src
	rm -rf *.exe

clean_src:
	rm -rf *.cmo *.cmi