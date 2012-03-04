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

int main(int argc, char* argv[] )
{
     for( int i = 1; i < argc; i++ ){ 
         ifstream colorfile;
         string name(argv[i]);
         string line;
         int gappos;
         bool colored = false;
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
                newfile << "\\documentclass[12pt,a4paper]{amsart}" << endl
                        << "\\usepackage{graphicx}" << endl
                        << "\\usepackage{amssymb}" << endl
                        << "\\usepackage{xcolor}" << endl
                        << "\\usepackage{fancyvrb}" << endl << endl
                        << "\\title{GAP Code}" << endl
                        << "\\author{}" << endl << endl
                        << "\\begin{document}" << endl
                        << "\\maketitle" << endl << endl;
                while( colorfile.good() ){
                    getline(colorfile,line);
                    if(line.find("## gapcolor ##")==0 || line.find("%gapcolor%")==0){
                        newfile << "\\begin{Verbatim}[commandchars=!@\\%,frame=single]" << endl;
                        newfile_main << "\\begin{Verbatim}[commandchars=!@\\%,frame=single]" << endl;
                        continue;
                    }
                    if(line.find("## endgapcolor ##")==0 || line.find("%endgapcolor%")==0){
                        newfile << "\\end{Verbatim}"<<endl;
                        newfile_main << "\\end{Verbatim}"<<endl;
                        continue;
                    }
                    gappos=line.find("gap>");
                    if(gappos!=0){
                        while(line.find("#")==0)
                            line.erase(line.begin());
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
       }
       else
      {
       cerr << "Wrong path: " << name << endl;
      }
    }
    return 0;
}

