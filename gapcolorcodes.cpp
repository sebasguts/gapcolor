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
 char* name;
 string line;
 int gappos;
 cin >> name;
 colorfile.open(name,ios::in);
 if( colorfile.is_open() ){
  ofstream newfile("new_code");
  if( newfile.is_open() ){
   newfile << "\begin{Verbatim}[commandchars=!@\%,frame=single]" << endl;
   while( colorfile.good() ){
    getline(colorfile,line);
    gappos=line.find("gap>");
    if(gappos!=0){
     newfile << line<<endl;
     continue;
    }
    line.insert(3,"% !color@red%@");
    line.insert(0,"!color@blue%@");
    //line += "%";
    newfile << line << endl;
   }
  }
  newfile << "\end{Verbatim}" << endl;
  newfile.close();
 }
 return 0;
}
