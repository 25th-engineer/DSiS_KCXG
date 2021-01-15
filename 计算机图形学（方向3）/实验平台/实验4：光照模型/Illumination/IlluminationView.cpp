// IlluminationView.cpp : implementation of the CIlluminationView class
//

#include "stdafx.h"
#include "Illumination.h"
#include "math.h"

#include "IlluminationDoc.h"
#include "IlluminationView.h"

#include "Global_Funcs.h"
#include "SettingDialog.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CIlluminationView

IMPLEMENT_DYNCREATE(CIlluminationView, CView)

BEGIN_MESSAGE_MAP(CIlluminationView, CView)
	//{{AFX_MSG_MAP(CIlluminationView)
	ON_WM_SIZE()
	ON_COMMAND(ID_FUNCTION_SETTING, OnFunctionSetting)
	ON_WM_ERASEBKGND()
	//}}AFX_MSG_MAP
	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CView::OnFilePrintPreview)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CIlluminationView construction/destruction

CIlluminationView::CIlluminationView()
{
	//����ģ�Ͳ���
	m_nLongitude_Grids   = 24;
	m_nLatitude_Grids    = 5;
	m_Ka                 = 0.4;      // Ambient Reflection Coefficient
	m_Kd                 = 0.8;      // Diffuse Reflection Coefficient

	//�����߲���
	m_nGridLineThickness = 1;
	m_GridLineColor      = RGB(255,255,255);
	
	//���������
	m_Ia = 0.8;            // Ambient Light Intensity;
	m_AmbientLightColor = RGB(0,0,255);
	
	//����������
	m_nShadingMode       = 2;
	m_Id                 = 1.0; //Diffuse light Intensity;
	m_DiffuseLightColor  = RGB(0,255,0);;  //Diffuse Light Color
	m_fLen     = 7.5;
	m_fAngleToXOY        = PI/180*75;  //75 degree     
	m_fAngleOnXOYProjectionToX = PI/3; //60 degree

	//��ʾ���Ʋ���
	m_bShowGridLine      = FALSE;
	m_bAmbientLight     = TRUE;
	m_bDiffuseLight      = TRUE;
}

CIlluminationView::~CIlluminationView()
{
}

BOOL CIlluminationView::PreCreateWindow(CREATESTRUCT& cs)
{
	return CView::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CIlluminationView drawing

void CIlluminationView::OnDraw(CDC* pDC)
{
	CIlluminationDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	// TODO: add draw code for native data here
	this->Rendering(pDC);
	this->DrawEdges(pDC);
}

/////////////////////////////////////////////////////////////////////////////
// CIlluminationView printing

BOOL CIlluminationView::OnPreparePrinting(CPrintInfo* pInfo)
{
	// default preparation
	return DoPreparePrinting(pInfo);
}

void CIlluminationView::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add extra initialization before printing
}

void CIlluminationView::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add cleanup after printing
}

/////////////////////////////////////////////////////////////////////////////
// CIlluminationView diagnostics

#ifdef _DEBUG
void CIlluminationView::AssertValid() const
{
	CView::AssertValid();
}

void CIlluminationView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CIlluminationDoc* CIlluminationView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CIlluminationDoc)));
	return (CIlluminationDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CIlluminationView message handlers


void CIlluminationView::OnFunctionSetting() 
{
	CSettingDialog Dlg;

	//��ʼ������
	//================����ģ�Ͳ���========================
	Dlg.m_nLongitude_Grids   = m_nLongitude_Grids;
	Dlg.m_nLatitude_Grids    = m_nLatitude_Grids;
	Dlg.m_Ka                 = m_Ka;
	Dlg.m_Kd=m_Kd;
	
	//�����߲���
	Dlg.m_nGridLineThickness = m_nGridLineThickness;
	Dlg.m_GridLineColor      = m_GridLineColor;
	
	//���������
	Dlg.m_Ia                 = m_Ia;
	Dlg.m_Id                 = m_Id;
	Dlg.m_AmbientLightColor = m_AmbientLightColor;
	
	//����������
	Dlg.m_nShadingMode       = m_nShadingMode;
	Dlg.m_fLen               = m_fLen;
	Dlg.m_fAngleToXOY        = m_fAngleToXOY;
	Dlg.m_fAngleOnXOYProjectionToX= m_fAngleOnXOYProjectionToX;
	Dlg.m_DiffuseLightColor  = m_DiffuseLightColor;
	
	
	//��ʾ���Ʋ���;
	Dlg.m_bShowGridLine      = m_bShowGridLine;
	Dlg.m_bAmbientLight     = m_bAmbientLight;
	Dlg.m_bDiffuseLight      = m_bDiffuseLight; 
	//}}AFX_DATA

	if ( Dlg.DoModal() == IDOK)
	{
		//================����ģ�Ͳ���========================
		m_nLongitude_Grids   = Dlg.m_nLongitude_Grids;
		m_nLatitude_Grids    = Dlg.m_nLatitude_Grids;
		m_Ka                 = Dlg.m_Ka;
		m_Kd                 = Dlg.m_Kd;
		
		//�����߲���
		m_nGridLineThickness = Dlg.m_nGridLineThickness;
		m_GridLineColor      = Dlg.m_GridLineColor;
		
		//���������
		m_Ia                 = Dlg.m_Ia;
		m_Id                 = Dlg.m_Id;
		m_AmbientLightColor = Dlg.m_AmbientLightColor;
		
		//����������
		m_nShadingMode       = Dlg.m_nShadingMode;
		m_fLen               = Dlg.m_fLen;
		TRACE("before: %f, %f\n", m_fAngleToXOY, m_fAngleOnXOYProjectionToX);

		m_fAngleToXOY        = Dlg.m_fAngleToXOY;
		m_fAngleOnXOYProjectionToX= Dlg.m_fAngleOnXOYProjectionToX;
		m_DiffuseLightColor  = Dlg.m_DiffuseLightColor;
		TRACE("After: %f, %f\n", m_fAngleToXOY, m_fAngleOnXOYProjectionToX );
		
		
		//��ʾ���Ʋ���;
		m_bShowGridLine      = Dlg.m_bShowGridLine;
		m_bAmbientLight     = Dlg.m_bAmbientLight;
		m_bDiffuseLight      = Dlg.m_bDiffuseLight; 

		this->CreateMesh();
		this->Invalidate();
	}
	
}

BOOL CIlluminationView::OnEraseBkgnd(CDC* pDC) 
{
	CView::OnEraseBkgnd(pDC);   
	CRect   rect;   
	GetClientRect(rect);   
	pDC->FillSolidRect(&rect,   RGB(0,0,0));   
    
	return   TRUE;   
	
//	return CView::OnEraseBkgnd(pDC);
}

void CIlluminationView::CreateMesh()
{
	//
	int  origin[3];
	int  radius;

	CRect ClientRect;
	this->GetClientRect(&ClientRect);

	origin[0] = (ClientRect.left + ClientRect.right) / 2;
	origin[1] = (ClientRect.top + ClientRect.bottom) / 2;
	origin[2] = 0; 

	if ( ClientRect.Width() < ClientRect.Height() )
	{
		radius = ClientRect.Width() * 0.5 * 0.8;
	}
	else 
	{
		radius = ClientRect.Height() * 0.5 * 0.8;
	}

	double alfa, belta;
	for ( int i = 0; i < m_nLongitude_Grids; i ++ )
	{
		alfa = (2*PI / m_nLongitude_Grids) * i;
		for ( int j = 0; j < m_nLatitude_Grids; j++)
		{
			//belta = (PI / 3 / (N-1)) * j;
			belta = acos( 1.0 - (0.98 / (m_nLatitude_Grids-1) *j) );

			this->m_Vectices[i][j][0] = 
				origin[0] + ROUND(radius * cos(belta)*cos(alfa));//x coordinate;
			this->m_Vectices[i][j][1] = 
				origin[1] + ROUND(radius * cos(belta)*sin(alfa));//y coordinate;
			this->m_Vectices[i][j][2] = ROUND(radius*sin(belta)); 


			this->m_Normals[i][j][0] = 1.0 * cos(belta) * cos(alfa);  
			this->m_Normals[i][j][1] = 1.0 * cos(belta) * sin(alfa);
			this->m_Normals[i][j][2] = 1.0 * sin(belta);
		}
	}

	//Calculat Light Position
	this->m_Light_Pos[0] = origin[0] + 
		                   radius*m_fLen*(-m_light_direction[0]);  
	this->m_Light_Pos[1] = origin[1] + 
		                   radius*m_fLen*(-m_light_direction[1]);  
	this->m_Light_Pos[2] = origin[2] + 
		                   radius*m_fLen*(-m_light_direction[2]);

	m_light_direction[0] = -cos(m_fAngleToXOY)*cos(m_fAngleOnXOYProjectionToX);
	m_light_direction[1] = -cos(m_fAngleToXOY)*sin(m_fAngleOnXOYProjectionToX);
	m_light_direction[2] = -sin(m_fAngleToXOY);	
}


void CIlluminationView::DrawEdges(CDC * pDC)
{
	if ( !this->m_bShowGridLine)
	{
		return;
	}

	int i, j;
	CPen *pNewPen = new CPen;
	pNewPen->CreatePen(PS_SOLID, this->m_nGridLineThickness, this->m_GridLineColor);
	CPen *pOldPen = pDC->SelectObject(pNewPen);

	//����γ��
	for ( j = 0; j < m_nLatitude_Grids; j++)
	{
		for ( i = 0; i < m_nLongitude_Grids; i++ )
		{
			pDC->MoveTo(this->m_Vectices[i][j][0], 
				        this->m_Vectices[i][j][1]);

			pDC->LineTo(this->m_Vectices[(i+1)%m_nLongitude_Grids][j][0], 
				        this->m_Vectices[(i+1)%m_nLongitude_Grids][j][1]);

		}
	}

	//���ƾ���

	for ( i = 0; i < m_nLongitude_Grids; i++)
	{
		for ( j =0; j < m_nLatitude_Grids-1; j++)
		{
			pDC->MoveTo(this->m_Vectices[i][j][0],
				        this->m_Vectices[i][j][1]);
			pDC->LineTo(this->m_Vectices[i][j+1][0],
				        this->m_Vectices[i][j+1][1]);
		}
	}

	pDC->SelectObject(pOldPen);

	pNewPen->DeleteObject();
	delete pNewPen;
	
	return;
}


void CIlluminationView::Rendering( CDC *pDC)
{
	int    i, j;
	int    vectices[4][3];
	double normals[4][3];
	for ( i = 0; i < m_nLongitude_Grids; i++ )
	{
		for ( j = 0; j < m_nLatitude_Grids-1; j++ )
		{
			//left bottom
			vectices[0][0] = this->m_Vectices[i][j][0]; 
			vectices[0][1] = this->m_Vectices[i][j][1];
			vectices[0][2] = this->m_Vectices[i][j][2];

			normals[0][0] = this->m_Normals[i][j][0]; 
			normals[0][1] = this->m_Normals[i][j][1];
			normals[0][2] = this->m_Normals[i][j][2];

			//right bottom
			vectices[1][0] = this->m_Vectices[(i+1)%m_nLongitude_Grids][j][0];
			vectices[1][1] = this->m_Vectices[(i+1)%m_nLongitude_Grids][j][1];
			vectices[1][2] = this->m_Vectices[(i+1)%m_nLongitude_Grids][j][2];

			normals[1][0] = this->m_Normals[(i+1)%m_nLongitude_Grids][j][0]; 
			normals[1][1] = this->m_Normals[(i+1)%m_nLongitude_Grids][j][1];
			normals[1][2] = this->m_Normals[(i+1)%m_nLongitude_Grids][j][2];


			//right top
			vectices[2][0] = this->m_Vectices[(i+1)%m_nLongitude_Grids][j+1][0];
			vectices[2][1] = this->m_Vectices[(i+1)%m_nLongitude_Grids][j+1][1];
			vectices[2][2] = this->m_Vectices[(i+1)%m_nLongitude_Grids][j+1][2];

			normals[2][0] = this->m_Normals[(i+1)%m_nLongitude_Grids][j+1][0]; 
			normals[2][1] = this->m_Normals[(i+1)%m_nLongitude_Grids][j+1][1];
			normals[2][2] = this->m_Normals[(i+1)%m_nLongitude_Grids][j+1][2];

			//left top
			vectices[3][0] = this->m_Vectices[i][j+1][0];
			vectices[3][1] = this->m_Vectices[i][j+1][1];
			vectices[3][2] = this->m_Vectices[i][j+1][2];

			normals[3][0] = this->m_Normals[i][j+1][0]; 
			normals[3][1] = this->m_Normals[i][j+1][1];
			normals[3][2] = this->m_Normals[i][j+1][2];


			//--------------------------
			FillQuad(pDC, vectices,normals);
		}
	}
	return;
}



void CIlluminationView::FillQuad(CDC *pDC,
								int Vertices[4][3], 
								double Normals[4][3])
{

	int VertexNum = 4;

	//��һ������ȡy�����ֵ����Сֵ��
	int i, j;
	int yMin, yMax;
	int x, y, z;
	yMin = yMax = Vertices[0][1];

	for ( i = 1; i < VertexNum; i++ )
	{
		if ( Vertices[i][1] > yMax ) yMax =  Vertices[i][1];
		if ( Vertices[i][1] < yMin ) yMin =  Vertices[i][1];
	}

	//��ʼ�����Ymin��Ymax��ÿһ��ɨ����
	for ( y = yMin; y <= yMax; y++)
	{
		//��һ�����󽻵�
		int IntersectionPoints[2][3];   //�������������
		int InersectionPointsNum = 0;
		for ( i = 0; i < VertexNum; i++)
		{
			//����Vertices[i] ��Vertices[(i+1)%VertexNum]����ֱ�ߣ�
			
			if ( y == Vertices[i][1] ) 
			{
				IntersectionPoints[InersectionPointsNum][0] = Vertices[i][0];
				IntersectionPoints[InersectionPointsNum][1] = Vertices[i][1];
				IntersectionPoints[InersectionPointsNum][2] = Vertices[i][2];

				InersectionPointsNum++;

				if ( (Vertices[i][1] - Vertices[(i-1 + VertexNum ) % VertexNum][1]) *
					 (Vertices[i][1] - Vertices[(i+1 ) % VertexNum][1]) > 0 )   //ͬһ��
				{
					InersectionPointsNum--; //��������㣻
				}

			}
			else if ( y == Vertices[(i+1)%VertexNum][1] )
			{
				continue;

			}
			else if ( (y - Vertices[(i+1)%VertexNum][1] ) * ( y - Vertices[i][1]) < 0 )
			{
				float u = float (y - Vertices[i][1]) / 
					      float (Vertices[(i+1)%VertexNum][1] - Vertices[i][1]);


				IntersectionPoints[InersectionPointsNum][0] = Vertices[i][0]               * (1-u) + 
					                                          Vertices[(i+1)%VertexNum][0] * u;
				IntersectionPoints[InersectionPointsNum][1] = Vertices[i][1]               * (1-u) + 
					                                          Vertices[(i+1)%VertexNum][1] * u;
				IntersectionPoints[InersectionPointsNum][2] = Vertices[i][2]               * (1-u) + 
					                                          Vertices[(i+1)%VertexNum][2] * u;

				InersectionPointsNum++;

			}
			else  // û�н���
			{
			}
		} 


		if ( InersectionPointsNum %2 != 0 )
		{
			continue;
			//-------------------
		}
		//�ڶ������������� bubble sort;

		for ( i = 0; i < InersectionPointsNum -1; i++)
		{
			for ( j = InersectionPointsNum -1; j>i; j--)
			{
				if ( IntersectionPoints[j][0] < IntersectionPoints[j-1][0] ) // swap;
				{
					int tempx, tempy, tempz;
					tempx = IntersectionPoints[j][0];
					tempy = IntersectionPoints[j][1];
					tempz = IntersectionPoints[j][2];

					IntersectionPoints[j][0] = IntersectionPoints[j-1][0];
					IntersectionPoints[j][1] = IntersectionPoints[j-1][1];
					IntersectionPoints[j][2] = IntersectionPoints[j-1][2];

					IntersectionPoints[j-1][0] = tempx;
					IntersectionPoints[j-1][1] = tempy;
					IntersectionPoints[j-1][2] = tempz;
				}
			}
		}
		//�����������

		for ( i = 0; i < InersectionPointsNum; i+=2)
		{

			for ( x = IntersectionPoints[i][0]; x <= IntersectionPoints[i+1][0]; x++)
			{
				float u = float ( x - IntersectionPoints[i][0]) /
					      float (IntersectionPoints[i+1][0] - IntersectionPoints[i][0]);

				z = IntersectionPoints[i][2] * (1 - u) + 
					IntersectionPoints[i+1][2] * u; 

				int Pt[3];
				Pt[0] = x; Pt[1] = y; Pt[2] = z;
				COLORREF PtColor = this->Calculate_Color(Pt,Vertices, Normals);

				DrawPixel(pDC, x, y, PtColor);
			}
		}
	}


	return;
}


void CIlluminationView::OnInitialUpdate() 
{
	CView::OnInitialUpdate();
	
	this->CreateMesh();
	
}


void CIlluminationView::OnSize(UINT nType, int cx, int cy) 
{
	CView::OnSize(nType, cx, cy);
	
	CreateMesh();
	
}

/*********************************************************************
��    �ܣ�������������ɫ
�������壺
          Pt[3]   : ������꣬
		  Vertices: �ı��εĶ���
		  Normals :�ı��ζ���ķ�����
		  
�� �� ֵ: ��Pt���������ǿ��

��    ��: 2009-10-20
��    ��: ����ͯ
**********************************************************************/		 
COLORREF CIlluminationView::Calculate_Color(int    Pt[3],
											int    Vertices[4][3],
											double Normals[4][3])
{
	double Ie, Id;

	//Ambient Color;
	int R = 0, G = 0, B = 0;
	if ( this->m_bAmbientLight )
	{
		Ie = this->m_Ia * this->m_Ka;                   //Ambient Light Intensity
		R += Ie * GetRValue(this->m_AmbientLightColor);
		G += Ie * GetGValue(this->m_AmbientLightColor);
		B += Ie * GetBValue(this->m_AmbientLightColor);
	}

	if ( this->m_bDiffuseLight)
	{
		Id = DiffuseLightIntensity(Pt, Vertices,Normals);//Diffuse Light Intensity
		//Diffulse Color
		R += Id * GetRValue(this->m_DiffuseLightColor);
		G += Id * GetGValue(this->m_DiffuseLightColor);
		B += Id * GetBValue(this->m_DiffuseLightColor);
	}

	//To Force R, G, B in rang [0, 255];
	R = ( R <= 255) ? R : 255;
	G = ( G <= 255) ? G : 255;
	B = ( B <= 255) ? B : 255;

	return RGB(R, G, B);
}



/***********************************************************
��    �ܣ����������Ĺ�ǿ
�������壺
         Pt      : �������
		 Vertices: �ı��εĶ���
		 Normals :�ı��ζ���ķ�����

˵����������Ŀ�겻���Ǿ�������


Date    : 2008-10-20
Author  : Yuetong Luo
************************************************************/
double CIlluminationView::DiffuseLightIntensity(int    Pt[3],
										int    Vertices[4][3],
										double Normals[4][3])
{
	double Id = 0;

	//������������ǿ�ȣ�
	switch( this->m_nShadingMode)
	{
	case 0://Const Intensity;
		{
			Id = ConstIntensity(Vertices, 
				               this->m_Light_Pos, 
							   this->m_Id, 
							   this->m_Kd);
			break;
		}
	case 1://Gourand
		{
			Id = Gouraud(Pt, 
				         Vertices, 
						 Normals, 
						 this->m_Light_Pos, 
						 this->m_Id, 
						 this->m_Kd);
			break;
		}
	case 2: //Phong
		{
			Id = Phong(Pt,
				       Vertices, 
					   Normals, 
					   this->m_Light_Pos, 
					   this->m_Id, 
					   this->m_Kd);
			break;
		}
	default:
		{
			break;
		}
	}
	// 

	return Id;
}


/*********************************************************************
��    �ܣ������������������ǿ��
�������壺
          Pt[3]   : ������꣬
		  N       : ��ķ�����
		  lightPos: ��Դ��λ��
		  Ip      : �������Դ��ǿ��
		  Kd      : ������ϵ��

�� �� ֵ: ��Pt���������ǿ��

��    ��: 2009-10-20
��    ��: ����ͯ
**********************************************************************/
double CIlluminationView::DensityOnPoint( int    Pt[3],
		                                  double N[3],
						                  int    lightPos[3],
						                  double Ip,
						                  double Kd)
{

	double L[3];
	L[0] = lightPos[0] - Pt[0];
	L[1] = lightPos[1] - Pt[1];
	L[2] = lightPos[2] - Pt[2];

	double len = sqrt(L[0]*L[0] + L[1]*L[1] +L[2]*L[2] );
	L[0] /= len;
	L[1] /= len;
	L[2] /= len;


	double dist = (L[0]-N[0])*(L[0]-N[0]) + 
		          (L[1]-N[1])*(L[1]-N[1]) + 
				  (L[2]-N[2])*(L[2]-N[2]);

	dist = sqrt(dist);

	double theta = 2.0 * asin(dist/2.0);

	double Id = Ip * Kd * cos(theta);

	Id = (Id < 0) ? 0 : Id;
	return Id;

	return Id;
}




/*********************************************************************
��    �ܣ�ʵ��Gouraud����ģ�ͣ����������������ǿ��
�������壺
		  Vertices:��Pt���ڵ��ı��ε��ĸ��������꣬���㰴��ʱ��˳����
		  lightPos:��Դ��λ��
		  Ip      :�������Դ��ǿ��
		  Kd      :������ϵ��
�� �� ֵ: ��Pt���������ǿ��

��    ��: 2009-10-20
��    ��: ����ͯ
**********************************************************************/
double CIlluminationView::ConstIntensity( int      Vertices[4][3], 
						                 int      lightPos[3],
						                 double   Ip,
						                 double   Kd)
{
	//������Ƭ�ķ�����
	double v1[3], v2[3], N[3];
	v1[0] = Vertices[1][0] -  Vertices[0][0]; 
	v1[1] = Vertices[1][1] -  Vertices[0][1]; 
	v1[2] = Vertices[1][2] -  Vertices[0][2]; 

	v2[0] = Vertices[2][0] -  Vertices[1][0]; 
	v2[1] = Vertices[2][1] -  Vertices[1][1]; 
	v2[2] = Vertices[2][2] -  Vertices[1][2]; 

	N[0] = v1[1]*v2[2] - v1[2]*v2[1];
	N[1] = v1[2]*v2[0] - v1[0]*v2[2];
	N[2] = v1[0]*v2[1] - v1[1]*v2[0];

	//normalize;
	double len = sqrt(N[0]*N[0] + 
		              N[1]*N[1] + 
					  N[2]*N[2]); 

	N[0] /= len;
	N[1] /= len;
	N[2] /= len;
	if ( N[2]  < 0 )
	{
		N[0] = -N[0];
		N[1] = -N[1];
		N[2] = -N[2];
	}

	//�����ǿ��
	int    Pt[3];
	Pt[0] = (Vertices[0][0] + Vertices[1][0] + Vertices[2][0] +Vertices[3][0]) /4;
	Pt[1] = (Vertices[0][1] + Vertices[1][1] + Vertices[2][1] +Vertices[3][1]) /4;
	Pt[2] = (Vertices[0][2] + Vertices[1][2] + Vertices[2][2] +Vertices[3][2]) /4;

	double Id = DensityOnPoint(Pt, N, lightPos, Ip, Kd);

	return Id;
}


/*********************************************************************
��    �ܣ�ʵ��Gouraud����ģ�ͣ����������������ǿ��
�������壺
          Pt[3]   : ������꣬
		  Vertices:��Pt���ڵ��ı��ε��ĸ��������꣬���㰴��ʱ��˳����
		  Normals :�ĸ�����ķ���������Vertices��ͬ����˳���ţ�
		  lightPos:��Դ��λ��
		  Ip      :�������Դ��ǿ��
		  Kd      :������ϵ��
�� �� ֵ: ��Pt���������ǿ��

�ɵ��ú�����
     ===========================================================================
     bool   BilinearInterpolation(int Vertices[4][3], int P[3], double uv[4]);
	 ��    �ܣ���͹�ı�����ʵ�ֶ������Բ�ֵ

     �������壺
          Vertices    : �ı��ε��ĸ����㣬����ʱ��洢��
		  P           : �������
		  uv          : ���ڷ��ز�ֵϵ����

     �� �� ֵ: True-��ֵ�ɹ���Flase-��ֵʧ�ܣ����Pt�����ı����ڲ�����ʧ�ܣ�
	 ===========================================================================

��    ��: 2009-10-20
��    ��: ����ͯ
**********************************************************************/
double CIlluminationView::Gouraud (int    Pt[3],
		                           int    Vertices[4][3],
		                           double Normals[4][3],
					               int    lightPos[3],
				 	               double Ip,
					               double Kd)
{
	double I = 0;   //itensity;
	//ѧ����Ӵ���
	return I;

}

/*********************************************************************
��    �ܣ�ʵ��Phong����ģ�ͣ����������������ǿ��
�������壺
          Pt[3]   : ������꣬
		  Vertices:��Pt���ڵ��ı��ε��ĸ��������꣬���㰴��ʱ��˳����
		  Normals :�ĸ�����ķ���������Vertices��ͬ����˳���ţ�
		  lightPos:��Դ��λ��
		  Ip      :�������Դ��ǿ��
		  Kd      :������ϵ��
�� �� ֵ: ��Pt���������ǿ��

�ɵ��ú�����
     ===========================================================================
     bool   BilinearInterpolation(int Vertices[4][3], int P[3], double uv[4]);
	 ��    �ܣ���͹�ı�����ʵ�ֶ������Բ�ֵ

     �������壺
          Vertices    : �ı��ε��ĸ����㣬����ʱ��洢��
		  P           : �������
		  uv          : ���ڷ��ز�ֵϵ����

     �� �� ֵ: True-��ֵ�ɹ���Flase-��ֵʧ�ܣ����Pt�����ı����ڲ�����ʧ�ܣ�
	 ===========================================================================


��    ��: 2009-10-20
��    ��: ����ͯ
**********************************************************************/
double CIlluminationView::Phong(int    Pt[3],
								int    Vertices[4][3],
								double Normals[4][3],
								int    lightPos[3],
								double Ip,
								double Kd)
{
	double I = 0;   //itensity;

	//ѧ����Ӵ���
	return I;

}


