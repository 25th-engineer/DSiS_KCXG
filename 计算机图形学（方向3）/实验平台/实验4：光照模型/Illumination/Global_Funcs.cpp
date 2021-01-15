#include "StdAfx.h"
#include "math.h"
#include "Global_Funcs.h"


/*********************************************************************
��    �ܣ��ڸ�����DC�ϻ���һ�����ص�
�������壺
          pDC     :Device Context
          x, y    :������꣬
		  clr     :�����ɫ

�� �� ֵ: ��

��    ��: 2009-10-20
��    ��: ����ͯ
**********************************************************************/

void DrawPixel(CDC *pDC, int x, int y, COLORREF clr)
{
	
	// to create the new pen;
	CPen *pNewPen = new CPen;
	pNewPen->CreatePen(PS_SOLID, 1, clr);
	CPen *pOldPen = pDC->SelectObject(pNewPen);
	
	
	// To draw pixel;
	pDC->MoveTo(x-1, y);
	pDC->LineTo(x, y);
	
	//to restore the old pen
	pDC->SelectObject(pOldPen);
	pNewPen->DeleteObject();
	delete pNewPen;
}

/*********************************************************************
��    �ܣ���������֮���ŷ������
�������壺
          P1, P2: �������

�� �� ֵ: ŷ������

��    ��: 2009-10-20
��    ��: ����ͯ
**********************************************************************/

double Distance(int P1[3], int P2[3])
{
	double dist = 0;
	for ( int i = 0; i < 3; i++)
	{
		dist += (P2[i] - P1[i]) * (P2[i] - P1[i]);
	}
	dist = sqrt(dist);
	return dist;
}

/*********************************************************************
��    �ܣ���͹�ı�����ʵ�ֶ������Բ�ֵ
�������壺
          Vertices    : �ı��ε��ĸ����㣬����ʱ��洢��
		  P           :�������
		  uv:���ڷ��ز�ֵϵ����

�� �� ֵ: True-��ֵ�ɹ���Flase-��ֵʧ�ܣ����Pt�����ı����ڲ�����ʧ�ܣ�

��    ��: 2009-10-20
��    ��: ����ͯ
**********************************************************************/
bool BilinearInterpolation(int Vertices[4][3], 
						   int P[3], 
						   double uv[4])
{
	int i;
	for ( i = 0; i < 4; i++)
	{
		uv[i] = 0;
	}

	//�����ж�P�Ƿ���ĳһ��������
	for ( i = 0; i < 4; i++)
	{
		if ( Distance(P, Vertices[i]) < 1.0e-6 )
		{
			uv[i] = 1;
			return true;               //ֱ�ӷ��أ�
		}
	}

	//������ڶ����ϣ��ж��Ƿ�����ĳ������
	for ( i = 0; i < 4; i++)
	{
		double dist1, dist2, dist3;
		dist1 = Distance(P, Vertices[i]);
		dist2 = Distance(P, Vertices[(i+1)%4]);
		dist3 = Distance(Vertices[i], Vertices[(i+1)%4]);

		if ( fabs( dist1 + dist2 - dist3) < 1.0e-6 )
		{
			uv[i]       = dist2 / (dist1 + dist2);
			uv[(i+1)%4] = dist1 / (dist1 + dist2);
			return true;               //ֱ�ӷ��أ�
		}
	}

	//P�Ȳ��ڶ����ϣ�Ҳ�����ڱ���

	int  IntersectionPoints[4][3], VerticesIndex[4][2];
	int  IntersectionPointsNum = 0;

	for ( i = 0; i < 4; i++)
	{
		if( fabs(P[1] - Vertices[i][1]) < 1.0E-6)
		{
			IntersectionPoints[IntersectionPointsNum][0] = 	Vertices[i][0];
			IntersectionPoints[IntersectionPointsNum][1] = 	Vertices[i][1];
			IntersectionPoints[IntersectionPointsNum][2] = 	Vertices[i][2];
			
			VerticesIndex[IntersectionPointsNum][0] = i;
			VerticesIndex[IntersectionPointsNum][1] = (i+1)%4;
			
			IntersectionPointsNum++;			
		}
		else if (  fabs(P[1] - Vertices[(i+1)%4][1]) < 1.0E-6  )
		{
			//do nothing;
		}
		else if ( (P[1] - Vertices[i][1]) * (P[1] - Vertices[(i+1)%4][1]) < 0 ) //���ڽ���
		{
			double t = double(P[1] -Vertices[i][1]) / 
				       double(Vertices[(i+1)%4][1] - Vertices[i][1]);

			IntersectionPoints[IntersectionPointsNum][0] = 
				      Vertices[i][0] + (Vertices[(i+1)%4][0] - Vertices[i][0])*t;

			IntersectionPoints[IntersectionPointsNum][1] = 
				 	  Vertices[i][1] + (Vertices[(i+1)%4][1] - Vertices[i][1])*t;

			IntersectionPoints[IntersectionPointsNum][2] = 
				      Vertices[i][2] + (Vertices[(i+1)%4][2] - Vertices[i][2])*t;

			VerticesIndex[IntersectionPointsNum][0] = i;
			VerticesIndex[IntersectionPointsNum][1] = (i+1)%4;

			IntersectionPointsNum++;
		}
	}
	if ( IntersectionPointsNum != 2)
	{
		return false;
	}
	else
	{
		double dist0, dist1;
		double u;
		//һ�����Բ�ֵ
		dist0 = Distance(P,IntersectionPoints[0]);
		dist1 = Distance(P,IntersectionPoints[1]);

		u = dist0 / (dist0 + dist1);


		//�������Բ�ֵ
		dist0 = Distance(IntersectionPoints[0], Vertices[VerticesIndex[0][0]]); //��һ������
		dist1 = Distance(IntersectionPoints[0], Vertices[VerticesIndex[0][1]]);

		uv[VerticesIndex[0][0]] += (1-u) * dist1 / ( dist0 + dist1);
		uv[VerticesIndex[0][1]] += (1-u) * dist0 / ( dist0 + dist1);

		dist0 = Distance(IntersectionPoints[1], Vertices[VerticesIndex[1][0]]); //�ڶ�������
		dist1 = Distance(IntersectionPoints[1], Vertices[VerticesIndex[1][1]]);
		
		uv[VerticesIndex[1][0]] += u * dist1 / ( dist0 + dist1);
		uv[VerticesIndex[1][1]] += u * dist0 / ( dist0 + dist1);

		return true;
	}
}