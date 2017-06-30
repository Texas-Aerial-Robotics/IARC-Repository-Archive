#include <iostream>
#include <fstream>
#include <vector>
#include <sstream>
#include <string>
using namespace std;




int main() {
	vector < vector <string> > data;
	// double j,k,l,m,n;
	 ifstream infile;
	 infile.open("data.csv");
	



	// 	infile>> j>> k >> l >> m >> n;
	// 	cout<< j<< endl << k << endl<< l<<endl << m<< endl << n<<endl ;

	// infile.close();

  while (infile)
  {
    string s;
    if (!getline( infile, s )) break;

    istringstream ss( s );
    vector <string> record;

    while (ss)
    {
      string s;
      if (!getline( ss, s, ',' )) break;
      record.push_back( s );
      cout<< s<< endl;
    }

    data.push_back( record );
  }


	return 0;
}