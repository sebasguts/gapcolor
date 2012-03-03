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

int main()
{
 
 cout << "Enter filename: ";
 ifstream colorfile;
 string name;
 string line;
 int gappos;
 cin >> name;
 bool colored = false;
 colorfile.open(name.c_str(),ios::in);
 if( colorfile.is_open() ){
  name.insert(0,"new_");
  ofstream newfile(name.c_str());
  if( newfile.is_open() ){
   while( colorfile.good() ){
    getline(colorfile,line);
    if(line.find("%gapcolor%")==0){
     newfile << "\\begin{Verbatim}[commandchars=!@\\%,frame=single]" << endl;
     continue;
    }
    if(line.find("%endgapcolor")==0){
     newfile << "\\end{Verbatim}"<<endl;
     continue;
    }
    gappos=line.find("gap>");
    if(gappos!=0){
     newfile << line <<endl;
     continue;
    }
    line.insert(3,"% !color@red%@");
    line.insert(0,"!color@blue%@");
    line += "%";
    newfile << line << endl;
   }
  }
  newfile.close();
 }
 return 0;
}
