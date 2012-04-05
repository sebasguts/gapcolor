CXX = g++

gapcolor: gapcolorcodes.cpp
	$(CXX) -o gapcolor gapcolorcodes.cpp

test:
	gap testexamples.g

tex:
	./gapcolor testex.g
	pdflatex testex.tex
