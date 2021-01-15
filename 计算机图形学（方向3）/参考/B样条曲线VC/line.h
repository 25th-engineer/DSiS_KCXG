

#include <vector>
using namespace std;

void B3Line( vector< POINT >& mousePoine, vector< POINT >& linePoint, vector< POINT >& controlPoint );
int IsOnLine( const vector< POINT >& controlPoint, vector< POINT >& mousePoint, const POINT& pt, int& nIndex, bool bInsert = false );
bool EditMousePoint( vector< POINT >& mousePoint, int nIndex, const POINT& movePt );
vector< POINT > FindXY( const vector< POINT >& controlPoint,const vector< POINT >& mousePoint, int nXY, bool bIsX );


vector< POINT > mousePoint;
vector< POINT > linePoint;
vector< POINT > controlPoint;

int nIndex = -1;
bool bPressing = false;