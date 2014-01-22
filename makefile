CXX = g++

gapcolor: gapcolorcodes.cpp
	$(CXX) -o gapcolor gapcolorcodes.cpp

gapcolorforgapdoc:  gapcolorcodesforgapdoc.cpp
	$(CXX) -o gapcolorforgapdoc gapcolorcodesforgapdoc.cpp

AutoDocExampleColorCodes: AutoDocExampleColorCodes.cpp
	$(CXX) -o autodoccolorcodes AutoDocExampleColorCodes.cpp

test:
	gap testexamples.g

tex: gapcolor
	./gapcolor example/testex.g
	pdflatex example/testex.tex
