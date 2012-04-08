## gapcolor ##
gap> START_TEST("arbitrary identifier string");
gap> LoadPackage( "ToricVarieties" );
----------------------------------------------------------------
Loading  MatricesForHomalg 2012.03.01
by Mohamed Barakat (http://www.mathematik.uni-kl.de/~barakat/)
   Markus Lange-Hegermann (http://wwwb.math.rwth-aachen.de/~markus/)
Type:
  ?MatricesForHomalg:        ## for the contents of the manual
  ?MatricesForHomalg:x       ## for chapter/section/topic x
----------------------------------------------------------------
----------------------------------------------------------------
Loading  PolymakeInterface 2012.04.03
by Thomas Bächler (http://wwwb.math.rwth-aachen.de/~thomas/)
   Sebastian Gutsche (http://wwwb.math.rwth-aachen.de/~gutsche/)
----------------------------------------------------------------
---------polymake Header:---------------------------------------
Welcome to polymake version 2.11, released on Dezember 22, 2011
Copyright (c) 1997-2011
Ewgenij Gawrilow, Michael Joswig (TU Darmstadt)
http://www.polymake.org
----------------------------------------------------------------
----------------------------------------------------------------
Loading  ToricIdeals 2012.01.06
by Thomas Bächler (http://wwwb.math.rwth-aachen.de/~thomas/)
Type:
  ?ToricIdeals:                   ## for the contents of the manual
  ?ToricIdeals:x                  ## for chapter/section/topic x
----------------------------------------------------------------
----------------------------------------------------------------
Loading  homalg 2012.03.29
by Mohamed Barakat (http://www.mathematik.uni-kl.de/~barakat/)
   Sebastian Gutsche (http://wwwb.math.rwth-aachen.de/~gutsche/)
   Markus Lange-Hegermann (http://wwwb.math.rwth-aachen.de/~markus/)
Type:
  ?homalg:                   ## for the contents of the manual
  ?homalg:x                  ## for chapter/section/topic x
  ExamplesForHomalg();       ## for a guide to create a ring
----------------------------------------------------------------
----------------------------------------------------------------
Loading  HomalgToCAS 2012.02.29
by Mohamed Barakat (http://www.mathematik.uni-kl.de/~barakat/)
   Thomas Breuer (http://www.math.rwth-aachen.de/~Thomas.Breuer/)
   Simon Görtzen (http://wwwb.math.rwth-aachen.de/~simon/)
   Frank Lübeck (http://www.math.rwth-aachen.de/~Frank.Luebeck/)
For help, type: ?HomalgToCAS package 
----------------------------------------------------------------
----------------------------------------------------------------
Loading  Modules 2012.03.29
by Thomas Bächler (http://wwwb.math.rwth-aachen.de/~thomas/)
   Mohamed Barakat (http://www.mathematik.uni-kl.de/~barakat/)
   Florian Diebold ()
   Sebastian Gutsche (http://wwwb.math.rwth-aachen.de/~gutsche/)
   Markus Lange-Hegermann (http://wwwb.math.rwth-aachen.de/~markus/)
Type:
  ?Modules:                  ## for the contents of the manual
  ?Modules:x                 ## for chapter/section/topic x
  ExamplesForHomalg();       ## for a guide to create a ring
----------------------------------------------------------------
----------------------------------------------------------------
Loading  RingsForHomalg 2012.02.29
by Mohamed Barakat (http://www.mathematik.uni-kl.de/~barakat/)
   Simon Goertzen (http://wwwb.math.rwth-aachen.de/goertzen/)
   Markus Kirschmer (http://www.math.rwth-aachen.de/~Markus.Kirschmer/)
   Markus Lange-Hegermann (http://wwwb.math.rwth-aachen.de/~markus/)
   Oleksandr Motsak (http://www.mathematik.uni-kl.de/~motsak/)
   Max Neunhöffer (http://www-groups.mcs.st-and.ac.uk/~neunhoef/)
   Daniel Robertz (http://wwwb.math.rwth-aachen.de/~daniel/)
   Hans Schönemann (http://www.mathematik.uni-kl.de/~hannes/)
   Andreas Steenpaß ()
For help, type: ?RingsForHomalg package 
----------------------------------------------------------------
----------------------------------------------------------------
Loading  Convex 2012.04.03
by Sebastian Gutsche
----------------------------------------------------------------
----------------------------------------------------------------
Loading  GradedRingForHomalg 2012.04.03
by Mohamed Barakat (http://www.mathematik.uni-kl.de/~barakat/)
   Sebastian Gutsche (http://wwwb.math.rwth-aachen.de/~gutsche/)
   Markus Kirschmer (http://www.math.rwth-aachen.de/~Markus.Kirschmer/)
   Sebastian Jambor (http://wwwb.math.rwth-aachen.de/~sebastian/)
   Markus Lange-Hegermann (http://wwwb.math.rwth-aachen.de/~markus/)
   Daniel Robertz (http://wwwb.math.rwth-aachen.de/~daniel/)
Type:
  ?GradedRingForHomalg:      ## for the contents of the manual
  ?GradedRingForHomalg:x     ## for chapter/section/topic x
----------------------------------------------------------------
----------------------------------------------------------------
Loading  GradedModules 2012.03.09
by Mohamed Barakat (http://www.mathematik.uni-kl.de/~barakat/)
   Sebastian Jambor (http://wwwb.math.rwth-aachen.de/~sebastian/)
   Markus Lange-Hegermann (http://wwwb.math.rwth-aachen.de/~markus/)
   Arne Lorenz (http://wwwb.math.rwth-aachen.de/~arne/)
   Oleksandr Motsak (http://www.mathematik.uni-kl.de/~motsak/)
Type:
  ?GradedModules:            ## for the contents of the manual
  ?GradedModules:x           ## for chapter/section/topic x
----------------------------------------------------------------
----------------------------------------------------------------
Loading  ToricVarieties 2012.04.03
by Sebastan Gutsche
----------------------------------------------------------------
true
gap> H2 := Fan( [[0,1],[1,0],[0,-1],[-1,2]],[[1,2],[2,3],[3,4],[4,1]] );
<A fan in |R^2>
gap> H3 := Fan( [[0,1],[1,0],[0,-1],[-1,3]],[[1,2],[2,3],[3,4],[4,1]] ); ## ignorethisline ##
<A fan in |R^2>
gap> H4 := Fan( [[0,1],[1,0],[0,-1],[-1,4]],[[1,2],[2,3],[3,4],[4,1]] ); ## ignorethisline ##
<A fan in |R^2>
gap> H2 := ToricVariety( H2 );
<A toric variety of dimension 2>
gap> H3 := ToricVariety( H3 );
<A toric variety of dimension 2>
gap> H4 := ToricVariety( H4 ); ## ignorethisline ##
<A toric variety of dimension 2>
gap> ClassGroup( H2 );
<A non-torsion left module presented by 2 relations for 4 generators>
gap> ClassGroup( H3 );
<A non-torsion left module presented by 2 relations for 4 generators>
gap> ClassGroup( H4 );
<A non-torsion left module presented by 2 relations for 4 generators>
gap> CoordinateRingOfTorus( H2, [ "x", "y" ] );
----------------------------------------------------------------
Loading  IO_ForHomalg 2011.07.25
by Thomas Bächler (http://wwwb.math.rwth-aachen.de/~thomas/)
   Mohamed Barakat (http://www.mathematik.uni-kl.de/~barakat/)
   Max Neunhöffer (http://www-groups.mcs.st-and.ac.uk/~neunhoef/)
   Daniel Robertz (http://wwwb.math.rwth-aachen.de/~daniel/)
For help, type: ?IO_ForHomalg package 
----------------------------------------------------------------
================================================================
                     SINGULAR                                 /
 A Computer Algebra System for Polynomial Computations       /   version 3-1-3
                                                           0<
 by: W. Decker, G.-M. Greuel, G. Pfister, H. Schoenemann     \   March 2011
FB Mathematik der Universitaet, D-67653 Kaiserslautern        \
================================================================
Q[x,x_,y,y_]/( y*y_-1, x*x_-1 )
## endgapcolor ##
# Now we hace successfully created a ring
## gapcolor ##
gap> CoordinateRingOfTorus( H3, [ "x", "y" ] );
Q[x,x_,y,y_]/( y*y_-1, x*x_-1 )
gap> CoordinateRingOfTorus( H4, [ "x", "y" ] );
Q[x,x_,y,y_]/( y*y_-1, x*x_-1 )
gap> PP := TorusInvariantPrimeDivisors( H3 );
[ <A prime divisor of a toric variety with coordinates [ 1, 0, 0, 0 ]>, <A prime divisor of a toric variety with coordinates [ 0, 1, 0, 0 ]>, 
  <A prime divisor of a toric variety with coordinates [ 0, 0, 1, 0 ]>, <A prime divisor of a toric variety with coordinates [ 0, 0, 0, 1 ]> ]
gap> D := [ 1 .. 4 ];
[ 1 .. 4 ]
gap> D[1] := 2*PP[1] + 4*PP[4];
<A divisor of a toric variety with coordinates [ 2, 0, 0, 4 ]>
gap> D[2] := DivisorOfCharacter( [ 1, 2 ], H3 );
<A principal divisor of a toric variety with coordinates [ 2, 1, -2, 5 ]>
gap> D[3] := Divisor( [ 1, 2, -2, -10 ], H3 );
<A divisor of a toric variety with coordinates [ 1, 2, -2, -10 ]>
gap> D[4] := D[3] + D[2];
<A divisor of a toric variety with coordinates [ 3, 3, -4, -5 ]>
gap> List( D, IsCartier );
[ true, true, true, true ]
gap> List( D, IsBasepointFree );
[ false, true, false, false ]
gap> List( D, IsAmple );
[ false, false, false, false ]
## endgapcolor ##
gap> STOP_TEST( "testex.g", 10000 );
