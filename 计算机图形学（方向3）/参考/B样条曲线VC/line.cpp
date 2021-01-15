#include "stdafx.h"
#include <vector>
#include <math.h>
using namespace std;

/*
	mousePoint		为鼠标点击的点的数组
	linePoint		为计算后拟合曲线上的点，只要以这些点来画线就可以绘制出曲线
	controlPoint	为计算后得到的理论控制点数组
*/

void B3Line( vector< POINT >& mousePoint, vector< POINT >& linePoint, vector< POINT >& controlPoint )
{
	
	const int nPointCount = 20;				//	在每一段曲线上要拟合出的点数，可以为10	
    const int nMaxmousePtCount = 200;			//	能够处理的鼠标点数为这个变理值减1
	const int nMaxSiShu = nMaxmousePtCount + 5;

	double d[nMaxSiShu] = { 0 };
	double sishu[nMaxSiShu][nMaxSiShu] = { 0 };	//	用来保存方和程系数和对应行的右值

	double x[nMaxSiShu] = { 0 };			//	用来保存鼠标点的x坐标
	double y[nMaxSiShu] = { 0 };			//	用来保存鼠标点的y坐标
	
	double q0x = 0.0, q0y = 0.0,qnx = 0.0, qny = 0.0;

	
	int nCtrlPtCount = mousePoint.size();	    //	实际控制点数
	if ( nCtrlPtCount == 0 )
	{
		return;
	}
    
	nCtrlPtCount++;

	q0x = mousePoint[0].x;
	q0y = mousePoint[0].y;
	qnx = mousePoint.back().x;
	qny = mousePoint.back().y;

	int nPt = nCtrlPtCount + 2;					//	理论控制点数

	if ( nCtrlPtCount > nMaxmousePtCount ) return;
	if ( nCtrlPtCount < 3 ) return;				//	只在已有两个鼠标点的情况下才进行计算
	


	POINT pt = mousePoint[0];
	x[0] = pt.x;
	y[0] = pt.y;
	for ( int k = 1; k < nCtrlPtCount; k++ )
	{
		POINT pt = mousePoint[k - 1];
		x[k] = pt.x;
		y[k] = pt.y;

	}




	//	初始化矩阵
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
	//	完成矩阵的初始化




	//	进行方程组求解
	for ( i = 0; i< nPt; i++ )
	{
		//	找出列主元
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
			//	进行含主元行的交换, 第k行和第i行交换
			for ( int n = 0; n <= nPt + 1; n++ )
			{
				double t = sishu[i][n];
				sishu[i][n] = sishu[k][n];
				sishu[k][n] = t;
			}

		}

		//	将主元化为1

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
	//	完成方程组的求解




	//	取出解得的值, 理论控制点
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
	
	



	//	跟据计算出来的理论控制点，进行三次B样条计算
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
	返回0	表示这个传过来的点不在曲线上
	返回-1	表示这个传过来的点在曲线上，但是不是已有的控制点
	返回1	表示这个传过来的点在曲线上，但是同时它是一个已有的控制点，即表示选中了一个已有的控制点, 可能是本次新加的
*/
int IsOnLine( const vector< POINT >& controlPoint, vector< POINT >& mousePoint, const POINT& pt, int& nIndex, bool bInsert )
{
	int nPointCount = 100;
	const double Distance = 5.0;
	//	查看可能在哪一个段上, 这会有多个可能的段，要在下面进行再一次的判断
	const int nMousePointCount = mousePoint.size();
	if ( nMousePointCount < 2 ) return 0;
	vector< int > list;	// 用来保存多个可能的段
	
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
	//	这里应使用一个rect.normalize()这个的函数，但是我在API中并没有找到这样的函数
	//  就愉了点懒~~~~~，如果谁知道请告诉我一声.
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
					//	进行一个新的控制的插入动作
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
	movePt为nIndex下标的点要移动到的坐标
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
	通过给出的x坐标求出一组对应的y坐标
	通过给出的y坐标求出一组对应的x坐标
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
			if ( bIsX )	//	本次已知x  求对应的y值
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

