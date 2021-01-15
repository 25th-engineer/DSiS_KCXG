#include "stdafx.h"
#include <vector>
#include <math.h>
using namespace std;

/*
	mousePoint		Ϊ������ĵ������
	linePoint		Ϊ�������������ϵĵ㣬ֻҪ����Щ�������߾Ϳ��Ի��Ƴ�����
	controlPoint	Ϊ�����õ������ۿ��Ƶ�����
*/

void B3Line( vector< POINT >& mousePoint, vector< POINT >& linePoint, vector< POINT >& controlPoint )
{
	
	const int nPointCount = 20;				//	��ÿһ��������Ҫ��ϳ��ĵ���������Ϊ10	
    const int nMaxmousePtCount = 200;			//	�ܹ������������Ϊ�������ֵ��1
	const int nMaxSiShu = nMaxmousePtCount + 5;

	double d[nMaxSiShu] = { 0 };
	double sishu[nMaxSiShu][nMaxSiShu] = { 0 };	//	�������淽�ͳ�ϵ���Ͷ�Ӧ�е���ֵ

	double x[nMaxSiShu] = { 0 };			//	�������������x����
	double y[nMaxSiShu] = { 0 };			//	�������������y����
	
	double q0x = 0.0, q0y = 0.0,qnx = 0.0, qny = 0.0;

	
	int nCtrlPtCount = mousePoint.size();	    //	ʵ�ʿ��Ƶ���
	if ( nCtrlPtCount == 0 )
	{
		return;
	}
    
	nCtrlPtCount++;

	q0x = mousePoint[0].x;
	q0y = mousePoint[0].y;
	qnx = mousePoint.back().x;
	qny = mousePoint.back().y;

	int nPt = nCtrlPtCount + 2;					//	���ۿ��Ƶ���

	if ( nCtrlPtCount > nMaxmousePtCount ) return;
	if ( nCtrlPtCount < 3 ) return;				//	ֻ�������������������²Ž��м���
	


	POINT pt = mousePoint[0];
	x[0] = pt.x;
	y[0] = pt.y;
	for ( int k = 1; k < nCtrlPtCount; k++ )
	{
		POINT pt = mousePoint[k - 1];
		x[k] = pt.x;
		y[k] = pt.y;

	}




	//	��ʼ������
	sishu[0][0] = -0.5; sishu[0][1] = 0.0;		sishu[0][2]	= 3.0 / 2;
	sishu[1][0] = 0.0;	sishu[1][1] = 4.0 / 6;	sishu[1][2] = 4.0 / 6;

	for ( int i = 2; i <= nPt - 1 - 2; i++ )
	{

		sishu[i][i - 1] = 1.0/ 6;
		sishu[i][i] = 4.0 / 6;
		sishu[i][i+1] = 1.0 / 6;
	}

	sishu[nPt - 2][nPt - 2 -1 ]		= 2.0/ 9;
	sishu[nPt - 2][nPt - 2 ]		= 4.0/ 6;
	sishu[nPt - 2][nPt - 2 + 1 ]	= 0;
	sishu[nPt - 1][nPt - 2 - 1 ]	= -0.5;
	sishu[nPt - 1][nPt -2 ]			= 0.0;
	sishu[nPt - 1][nPt -2 + 1 ]		= 3.0 / 2;

	sishu[0][nPt] = q0x;					sishu[0][nPt+1]= q0y;
	sishu[1][nPt] = x[0] + 1.0/ 3 * q0x;	sishu[1][nPt + 1 ]= y[0] + 1.0/ 3 * q0y;

	for ( i = 2; i<= nPt - 1 - 2; i++ )
	{
		sishu[i][nPt]		= x[ i- 1 ];
		sishu[i][nPt + 1]	= y[ i - 1 ];
	}


	sishu[nPt-2][nPt] =  x[nPt - 3] - 1.0 / 9 * qnx;  sishu[nPt-2][nPt + 1] = y[nPt - 3 ] - 1.0 /9 * qny;
	sishu[nPt-1][nPt] =  qnx;						  sishu[nPt-1][nPt + 1] = qny;
	//	��ɾ���ĳ�ʼ��




	//	���з��������
	for ( i = 0; i< nPt; i++ )
	{
		//	�ҳ�����Ԫ
		int k = i; 
		double max = fabs( sishu[i][k] );
		for ( int j = i; j < nPt; j++ )
		{
			if ( max < fabs( sishu[j][i] ) )
			{
				k = j;
			}
		}

		if ( k != i )
		{
			//	���к���Ԫ�еĽ���, ��k�к͵�i�н���
			for ( int n = 0; n <= nPt + 1; n++ )
			{
				double t = sishu[i][n];
				sishu[i][n] = sishu[k][n];
				sishu[k][n] = t;
			}

		}

		//	����Ԫ��Ϊ1

		double temp = sishu[i][i];

		for ( k = i;k <= nPt+ 1; k++ )
		{
			sishu[i][k] = sishu[i][k] / temp;
		}

		for ( int nn = 0; nn < nPt; nn++ )
		{
			if ( nn != i )
			{
				double tt = -1.0 * sishu[nn][i];
				for ( int mm = 0; mm <= nPt + 1; mm++ )
				{
					sishu[nn][mm] += sishu[i][mm] * tt;
				}
			}
		}
		
	}
	//	��ɷ���������




	//	ȡ����õ�ֵ, ���ۿ��Ƶ�
	controlPoint.clear();
	for ( i = 0; i < nPt ; i++ )
	{
		x[i] = sishu[i][nPt];
		y[i] = sishu[i][nPt+1];
		POINT pt;
		pt.x = x[i];
		pt.y = y[i];
		controlPoint.push_back( pt );
	}
	
	



	//	���ݼ�����������ۿ��Ƶ㣬��������B��������
	linePoint.clear();
	for ( i = 2; i <= nPt - 3 ; i++ )
	{
		for ( int j = 0; j <= nPointCount; j++ )
		{
			double t  = 1.0 * j / nPointCount;
			double t2 = t*t;
			double t3 = t*t*t;

			double xPt = 1.0 / 6 * ( 1 - 3 * t + 3 * t2 - t3 ) * x[i - 1] + 1.0 / 6  * ( 4 - 6 * t2 + 3 * t3 ) *  x[i] + 1.0 / 6 * ( 1 + 3 * t + 3 * t2 - 3 * t3 ) * x[ i + 1] + 1.0 / 6 * t3 * x[i+2];
			double yPt = 1.0 / 6 * ( 1 - 3 * t + 3 * t2 - t3 ) * y[i - 1] + 1.0 / 6  * ( 4 - 6 * t2 + 3 * t3 ) *  y[i] + 1.0 / 6 * ( 1 + 3 * t + 3 * t2 - 3 * t3 ) * y[ i + 1] + 1.0 / 6 * t3 * y[i+2];
			
			POINT pt;
			pt.x = xPt;
			pt.y = yPt;
			linePoint.push_back( pt );
		}

	}

}




/*
	����0	��ʾ����������ĵ㲻��������
	����-1	��ʾ����������ĵ��������ϣ����ǲ������еĿ��Ƶ�
	����1	��ʾ����������ĵ��������ϣ�����ͬʱ����һ�����еĿ��Ƶ㣬����ʾѡ����һ�����еĿ��Ƶ�, �����Ǳ����¼ӵ�
*/
int IsOnLine( const vector< POINT >& controlPoint, vector< POINT >& mousePoint, const POINT& pt, int& nIndex, bool bInsert )
{
	int nPointCount = 100;
	const double Distance = 5.0;
	//	�鿴��������һ������, ����ж�����ܵĶΣ�Ҫ�����������һ�ε��ж�
	const int nMousePointCount = mousePoint.size();
	if ( nMousePointCount < 2 ) return 0;
	vector< int > list;	// �������������ܵĶ�
	
	for ( int m = 0; m < nMousePointCount; m++ )
	{
		POINT pt1 = mousePoint[m];

		double x = pt1.x;
		double y = pt1.y;
		double xx = pt.x;
		double yy = pt.y;

		if ( sqrt( ( x - xx ) * ( x - xx ) + ( y - yy ) * ( y - yy ) ) < Distance )
		{
			nIndex = m;
			return 1;
		}
	}



	for ( int i = 1; i < nMousePointCount; i++ )
	{
		POINT lt = mousePoint[ i-1 ];
		POINT rb = mousePoint[ i ];
		

		RECT rect;
		if ( lt.x < rb.x )
		{	
			rect.left = lt.x;
			rect.top = lt.y;
			rect.bottom = rb.y;
			rect.right = rb.x;
		}
		else
		{
			rect.top = rb.y;
			rect.left = rb.x;
			rect.bottom = lt.y;
			rect.right = lt.x;
		}
	//	����Ӧʹ��һ��rect.normalize()����ĺ�������������API�в�û���ҵ������ĺ���
	//  �����˵���~~~~~�����˭֪���������һ��.
	//	rect = rect.normalize();
	//	if ( rect.contains( pt ) ) list.append( i );
	//	else
//		{
	//		double  w = rect.width();
	//		double  h = rect.height();

	//		 if ( rect.width() < 100.0 || rect.height() < 100.0 )
				 list.push_back( i );
	//	}
	}

	if ( list.size() <= 0 ) return 0;
	
	const int nListCount = list.size();
	for (  i = 0; i < nListCount; i++ )
	{
		
		int nIndex1 = list[i];
		double x[4] = {0.0};
		double y[4] = {0.0};

		for ( int k = nIndex1, j = 0; k < nIndex1 + 4; k++, j++ )
		{
			POINT pt1 = controlPoint[k];
			x[j] = pt1.x;
			y[j] = pt1.y;
		}

		POINT pt1 = mousePoint[i];
		POINT pt2 = mousePoint[i+1];
		double xlong = fabs( pt1.x - pt2.x );
		double ylong = fabs( pt1.y - pt2.y );

		if ( xlong > ylong ) 
			nPointCount = 2 * xlong;
		else 
			nPointCount = 2 * ylong;


		
		for ( j = 0; j <= nPointCount; j++ )
		{
			double t  = 1.0 * j / nPointCount;
			double t2 = t*t;
			double t3 = t*t*t;

			double xPt = 1.0 / 6 * ( 1 - 3 * t + 3 * t2 - t3 ) * x[0] + 1.0 / 6  * ( 4 - 6 * t2 + 3 * t3 ) *  x[1] + 1.0 / 6 * ( 1 + 3 * t + 3 * t2 - 3 * t3 ) * x[2] + 1.0 / 6 * t3 * x[3];
			double yPt = 1.0 / 6 * ( 1 - 3 * t + 3 * t2 - t3 ) * y[0] + 1.0 / 6  * ( 4 - 6 * t2 + 3 * t3 ) *  y[1] + 1.0 / 6 * ( 1 + 3 * t + 3 * t2 - 3 * t3 ) * y[2] + 1.0 / 6 * t3 * y[3];
			
			double xx = pt.x;
			double yy = pt.y;

			double dDistance = sqrt( ( xPt - xx ) * ( xPt - xx ) + ( yPt - yy ) * ( yPt - yy ) );
			if ( dDistance <= Distance )
			{
				//nIndex = nIndex;
				if ( bInsert )
				{
					//	����һ���µĿ��ƵĲ��붯��
					vector< POINT > temp = mousePoint;
					int nCount = temp.size();
					mousePoint.clear();

					for ( int m = 0, n = 0; m < nCount; m++, n++ )
					{
						if ( m == nIndex1 )
						{
							mousePoint.push_back( pt );
							n++;
						}
						
						
						POINT p = temp[m];
						mousePoint.push_back( p );
					
					}

					nIndex = nIndex1;
				    return 1;
				}
				else
				{
					nIndex = -1;
					return -1;
				}
			}
		}

	}


	return 0;
}

/*
	movePtΪnIndex�±�ĵ�Ҫ�ƶ���������
*/
bool EditMousePoint( vector< POINT >& mousePoint, int nIndex, const POINT& movePt )
{
	int n = mousePoint.size();
	if ( nIndex < n )
	{
		mousePoint[ nIndex ] = movePt;
		return true;
	} 

	return false;
}

/*
	ͨ��������x�������һ���Ӧ��y����
	ͨ��������y�������һ���Ӧ��x����
*/

vector< POINT > FindXY( const vector< POINT >& controlPoint, const vector< POINT >& mousePoint, int nXY, bool bIsX )
{
	const double Distance = 1.5;
	const int nPt = controlPoint.size();
    int	nPointCount = 100;

	vector< POINT > result;
	for ( int i = 2; i <= nPt - 3 ; i++ )
	{
		POINT pt1 = mousePoint[i - 2];
		POINT pt2 = mousePoint[i - 1];
		double xlong = fabs( pt1.x - pt2.x );
		double ylong = fabs( pt1.y - pt2.y );

		if ( xlong > ylong ) 
			nPointCount = 2 * xlong;
		else 
			nPointCount = 2 * ylong;

		for ( int j = 0; j <= nPointCount; j++ )
		{
			double t  = 1.0 * j / nPointCount;
			double t2 = t*t;
			double t3 = t*t*t;

			double xPt = 1.0 / 6 * ( 1 - 3 * t + 3 * t2 - t3 ) * controlPoint[i - 1].x + 1.0 / 6  * ( 4 - 6 * t2 + 3 * t3 ) *  controlPoint[i].x + 1.0 / 6 * ( 1 + 3 * t + 3 * t2 - 3 * t3 ) * controlPoint[ i + 1].x + 1.0 / 6 * t3 * controlPoint[i+2].x;
			double yPt = 1.0 / 6 * ( 1 - 3 * t + 3 * t2 - t3 ) * controlPoint[i - 1].y + 1.0 / 6  * ( 4 - 6 * t2 + 3 * t3 ) *  controlPoint[i].y + 1.0 / 6 * ( 1 + 3 * t + 3 * t2 - 3 * t3 ) * controlPoint[ i + 1].y + 1.0 / 6 * t3 * controlPoint[i+2].y;
			
			bool bFind = false;
			if ( bIsX )	//	������֪x  ���Ӧ��yֵ
			{
				if ( fabs( nXY - xPt ) < Distance )
				{
					xPt = nXY;
					bFind = true;
				}
			}
			else
			{
				if ( fabs( nXY - yPt ) < Distance )
				{
					yPt = nXY;
					bFind = true;
				}
			}

			if ( bFind )
			{
				POINT p;
				p.x = xPt;
				p.y = yPt;
				result.push_back( p );
				break;
			}
			
		}

	}

	return result;
}

