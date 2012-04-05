//     gapcolorcodes - a skript for providing nice gap examples
//     Copyright (C) 2012  Sebastian Gutsche
// 
//     This program is free software: you can redistribute it and/or modify
//     it under the terms of the GNU General Public License as published by
//     the Free Software Foundation, either version 3 of the License, or
//     (at your option) any later version.
// 
//     This program is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//     GNU General Public License for more details.
// 
//     You should have received a copy of the GNU General Public License
//     along with this program.  If not, see <http://www.gnu.org/licenses/>.

#include<stdio.h>
#include <iostream>
#include <fstream>
#include <string>
using std::cin;
using std::ifstream;
using std::ofstream;
using std::string;
using std::endl;
using std::ios;
using std::cout;
using std::cerr;

/*
 * Kurzanleitung: Zeilen mit gap> am Anfang werden eingefärbt, andere nicht. Skript entfernt
 * Paketflaggen und setzt Kommentare auf Text um. Sollen ein Befehl und seine Ausgaben ingoriert werden, setze ## ignorethisline ##
 * an das Ende der Zeile. ## gapcolor ## und ## endgapcolor ## markieren Anfang und Ende von fancyvrb.
 */

int main(int argc, char* argv[] )
{
     for( int i = 1; i < argc; i++ ){ 
         ifstream colorfile;
         string name(argv[i]);
         string line;
         int gappos;
         int open_close = 0;
         bool colored = false;
         bool ignore = false;
         colorfile.open(name.c_str(),ios::in);
         if( colorfile.is_open() ){
             name.erase(name.length()-1);
             name.erase(name.length()-1);
             string name2( name );
             name.append(".tex");
             name2.append("_main.tex");
             ofstream newfile(name.c_str());
             ofstream newfile_main(name2.c_str());
             if( newfile.is_open() && newfile_main.is_open() ){
                newfile << "\\documentclass[12pt]{amsart}" << endl
                        << "\\usepackage{graphicx}" << endl
                        << "\\usepackage{a4wide}" << endl
                        << "\\usepackage{amssymb}" << endl
                        << "\\usepackage{xcolor}" << endl
                        << "\\usepackage{fancyvrb}" << endl << endl
                        << "\\title{GAP Code}" << endl
                        << "\\author{}" << endl << endl
                        << "\\begin{document}" << endl
                        << "\\maketitle" << endl << endl;
                while( colorfile.good() ){
                    getline(colorfile,line);
                    if( line.find( "gap> START_TEST" ) == 0 || line.find( "gap> STOP_TEST(" ) == 0 ){
                        continue;
                    }
                    if( ignore ){
                        if( line.find( "gap>" ) == 0 ){
                            ignore = false;
                        }
                        else if( line.find( "#" ) != 0 ){
                            // Dann nehmen sie doch, hier, Raute. Merkt doch keiner.
                            continue;
                        }
                    }
                    if(line.find("## ignorethisline ##") != -1 ){
                        ignore = true;
                        continue;
                    }
                    // Remove flags
                    if(line.find("------") == 0 ){ // THIS WILL CAUSE A BUG!!!
                        do{
                            getline(colorfile,line);
                        }while( line.find( "------" ) !=0 );
                        continue;
                    }
                    // Remove this annoying singular banner with the ==== characters
                    if(line.find("=====") == 0 ){
                        do{
                            getline(colorfile,line);
                        }while( line.find( "=====" ) !=0 );
                        continue;
                    }
                    if(line.find("## gapcolor ##")==0 || line.find("%gapcolor%")==0){
                        newfile << "\\begin{Verbatim}[commandchars=!@\\%,frame=single]" << endl;
                        newfile_main << "\\begin{Verbatim}[commandchars=!@\\%,frame=single]" << endl;
                        open_close++;
                        continue;
                    }
                    if(line.find("## endgapcolor ##")==0 || line.find("%endgapcolor%")==0){
                        newfile << "\\end{Verbatim}"<<endl;
                        newfile_main << "\\end{Verbatim}"<<endl;
                        open_close--;
                        continue;
                    }
                    gappos=line.find("gap>");
                    if(gappos!=0){
                        while(line.find("#")==0)
                            line.erase(line.begin());
                        int index_to_search = 70;
                        while( line.length() > 73 ){ //Change this number if you want to
                            if( index_to_search == 0 ){
                                cerr << "No point to break line found." << endl;
                                break;
                            }
                            int k = line.find( ",", index_to_search );
                            if( k > 73 && index_to_search >= 40 ){ // Also feel free to modify this. Maybe part of the file/input?
                                index_to_search --;
                                continue;
                            }
                            if( k > 73 || k == -1 ){
                                k = 60;
                            }
                            newfile << line.substr(0,k+1) << endl;
                            newfile_main << line.substr(0,k+1) << endl;
                            line.erase(0,k);
                            line.replace(0,1," ");
                            index_to_search = 55;
                        }
                        newfile << line << endl;
                        newfile_main << line << endl;
                        continue;
                    }
                   line.insert(4,"%!color@red%@");
                   line.insert(0,"!color@blue%@");
                   line += "%";
                   newfile << line << endl;
                   newfile_main << line << endl;
               }
            newfile << "\\end{document}" << endl;
            newfile.close();
            newfile_main.close();
           }
           if( open_close != 0 ){
               cerr << "Some of the enviroments were not closed correctly in file " << name << endl;
           }
       }
       else
      {
       cerr << "Wrong path: " << name << endl;
      }
    }
    return 0;
}

