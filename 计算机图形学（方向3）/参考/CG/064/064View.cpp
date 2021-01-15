// 064View.cpp : implementation of the CMy064View class
//

#include "stdafx.h"
#include "064.h"

#include "064Doc.h"
#include "064View.h"
#include "dlg.h"
#include "dlg2.h"
#include "dlg3.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CMy064View

IMPLEMENT_DYNCREATE(CMy064View, CView)

BEGIN_MESSAGE_MAP(CMy064View, CView)
	//{{AFX_MSG_MAP(CMy064View)
	ON_COMMAND(ID_DRAWLINE_DLG1, OnDrawlineDlg1)
	ON_WM_LBUTTONDOWN()
	ON_WM_MOUSEMOVE()
	ON_WM_LBUTTONUP()
	ON_COMMAND(ID_DRAWLINE_MIDP, OnDrawlineMidp)
	ON_COMMAND(ID_DRAWLINE_BRASEN, OnDrawlineBrasen)
	ON_COMMAND(ID_QUXIAN_CIRCLE, OnQuxianCircle)
	ON_COMMAND(ID_QUXIAN_ECLIP, OnQuxianEclip)
	ON_COMMAND(ID_CUT_LIANG, OnCutLiang)
	ON_COMMAND(ID_CUT_MIDPOINT, OnCutMidpoint)
	//}}AFX_MSG_MAP
	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CView::OnFilePrintPreview)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMy064View construction/destruction

CMy064View::CMy064View()
{
	// TODO: add construction code here
	m_HCross = AfxGetApp()->LoadStandardCursor(IDC_CROSS);//初始化成标准十字鼠标
	m_Dragging = 0;
		u1=0;u2=1;
	

}

CMy064View::~CMy064View()
{
}

BOOL CMy064View::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: Modify the Window class or styles here by modifying
	//  the CREATESTRUCT cs

	return CView::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CMy064View drawing

void CMy064View::OnDraw(CDC* pDC)
{
	CMy064Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
 pDC->Rectangle(200,200,600,400);
	

	
	switch (kk)
	{
		case 1:
/**************直线的DDA画法****************/
	  x=0;y=0;	
	  dx = x1 - x0;
	  dy = y1 - y0;
	  pDC->SetPixel(x0,y0,RGB(125,125,158));   
	  if (abs(dx) > abs(dy)) {               
	  m = (double)dy / (double)dx;  
	  y = y0 + 0.5;                  
	  dx = (x1 > x0) ? 1 : -1;              
	  m *= dx;                             
	  while (x0 != x1) {                   
	      x0 += dx;                          
	      y  += m;                            
	  pDC->SetPixel(x0,y,RGB(125,0,0));           
	    }
	  }
    else if (dy != 0) {                     
	  m = (double)dx / (double)dy;   
	  x = x0 + 0.5;                  
	  dy = (y1 > y0) ? 1 : -1;              
	  m *= dy;                              
	  while (y0 != y1) {                   
	      y0 += dy;                           
	      x  += m;                            
	  pDC->SetPixel(x,y0,RGB(125,0,0));                          
	  }
	}

break;
	case 2:
/*****************直线的MIDPOINT画法**********/
        if(abs(x1 - x0) > abs(y1 - y0))          //判断斜率的范围以X步进画线
		{                                        
		     if(x1 > x0)
			 {
			   st = x0;
			   en = x1;
			   x = x0;	
			   y = y0;
			 }
		     else
			 {
                st = x1;
				en = x0;
			    x = x1;	
				y = y1;
			 }                                     //把x0>x1,x1>x0两种情况变为统一的形式
	    	dx = abs(x1 - x0);dy = abs(y1 - y0);
		}
	    else                                       //以Y步进的方式画线
		{	
		    if(y1 > y0)
			{
			  st = y0;
			  en = y1;
			  x = y0;	
			  y = x0;
			}
		    else
			{
			  st = y1;
			  en = y0;
			  x = y1;	
			  y = x1;
			}                                        //把y0>y1,y1>y0两种情况变为统一的形式
		    dx = abs(y1 - y0);dy = abs(x1 - x0);
		}

        d = 2 * dy - dx;	
        Einc = 2 * dy ;
        NEinc = 2 * (dy - dx);
        pDC->SetPixel(x,y,RGB(0,125,0));
        while (st < en) {
		    st = x;
			if (d <= 0){
                 	d = d + Einc;
                 	x++;
			}
			else{
				d = d + NEinc;
			    x++;
				y++;
			}
			if(abs(x1 - x0) > abs(y1 - y0))
			pDC->SetPixel(x,y,RGB(0,125,0));
		    else
			pDC->SetPixel(y,x,RGB(0,125,0));	
		}
	    break;                                           //无法完成斜率小于0的直线绘制

	case 3:
/************直线的Bresenham画法***************/
		dx=abs(xa-xb),dy=abs(ya-yb);
		p=2*dy-dx;
		if(abs(dx) > abs(dy))                         //判断斜率并分情况讨论
		{
			twoDy=2*dy;twoDyDx=2*(dy-dx);
			if (xa < xb)
				{
					x=xa; y=ya; xEnd=xb;
				}
				else
				{
					x=xb; y=yb; xEnd=xa;
				}
		}
		else
		{
			twoDy=2*dx;twoDyDx=2*(dx-dy);
			if (ya < yb)
				{
					x=ya; y=xa; xEnd=yb;
				}
				else
				{
					x=yb; y=xb; xEnd=ya;
				}
		}
		
		pDC->SetPixel(x,y,RGB(0,0,125));
		while(x<xEnd)
		{	
			x++;
            if (p<0)
			{
				p += twoDy;
			}   
            else
			{
              y ++;
			  p += twoDyDx;
			}
			if(abs(dx) > abs(dy))
			{
				pDC->SetPixel(x,y,RGB(0,0,125));
			}
			else
			{
				pDC->SetPixel(y,x,RGB(0,0,125));
			}
            
        }
		break;

	case 4:
/*********************绘制圆****************/
		pDC->SetPixel(x0,y0+radius,RGB(125,125,125));
		p=5/4-radius;                                      //键值的初始值
		x=0;
		y=radius;
          
		while(x<y){
			x++;
			if(p<0){
				
				p=p+2*x+3;
				pDC->SetPixel(x0+x,y0+y,RGB(125,125,125));
				pDC->SetPixel(x0+y,y0+x,RGB(125,125,125));
				pDC->SetPixel(x0+y,y0-x,RGB(125,125,125));
				pDC->SetPixel(x0+x,y0-y,RGB(125,125,125));
				pDC->SetPixel(x0-x,y0-y,RGB(125,125,125));
				pDC->SetPixel(x0-y,y0-x,RGB(125,125,125));
				pDC->SetPixel(x0-y,y0+x,RGB(125,125,125));
				pDC->SetPixel(x0-x,y0+y,RGB(125,125,125));          //以对称的方式完成圆的绘制
			}
			else{
				y--;
				p=p+2*x+3-2*y-2;
				pDC->SetPixel(x0+x,y0+y,RGB(125,125,125));
				pDC->SetPixel(x0+y,y0+x,RGB(125,125,125));
				pDC->SetPixel(x0+y,y0-x,RGB(125,125,125));
				pDC->SetPixel(x0+x,y0-y,RGB(125,125,125));
				pDC->SetPixel(x0-x,y0-y,RGB(125,125,125));
				pDC->SetPixel(x0-y,y0-x,RGB(125,125,125));
				pDC->SetPixel(x0-y,y0+x,RGB(125,125,125));
				pDC->SetPixel(x0-x,y0+y,RGB(125,125,125));             //以对称的方式完成圆的绘制  
			}
		
		}
         break;
	case 5:
/***********************椭圆的绘制*************************/
		pDC->SetPixel(x0,y0+ry,RGB(158,137,23));
		x=0;
		y=ry;
		p=ry*ry-rx*rx*ry+rx*rx/4;
		while(ry*ry*x<rx*rx*y){
			x++;
			if(p<0){
			p=p+2*ry*ry*x+3*ry*ry;
			pDC->SetPixel(x0+x,y0+y,RGB(158,137,23));
			pDC->SetPixel(x0+x,y0-y,RGB(158,137,23));
			pDC->SetPixel(x0-x,y0+y,RGB(158,137,23));
			pDC->SetPixel(x0-x,y0-y,RGB(158,137,23));
			}
			else{
				y--;
			p=p+2*ry*ry*x-2*rx*rx*y+2*rx*rx+3*ry*ry;
            pDC->SetPixel(x0+x,y0+y,RGB(158,137,23));
			pDC->SetPixel(x0+x,y0-y,RGB(158,137,23));
			pDC->SetPixel(x0-x,y0+y,RGB(158,137,23));
			pDC->SetPixel(x0-x,y0-y,RGB(158,137,23));
			}
	
		}
		p=ry*ry*(x+1/2)*(x+1/2)+rx*rx*(y-1)*(y-1)-rx*rx*ry*ry;
			while(y>=0){
			y--;
				if(p>0){
					
				p=p-2*rx*rx*y+3*rx*rx;
				pDC->SetPixel(x0+x,y0+y,RGB(158,137,23));
			    pDC->SetPixel(x0+x,y0-y,RGB(158,137,23));
			    pDC->SetPixel(x0-x,y0+y,RGB(158,137,23));
			    pDC->SetPixel(x0-x,y0-y,RGB(158,137,23));
				}
				else{
					x++;
					p=p+2*ry*ry*x-2*rx*rx*y+2*ry*ry+3*rx*rx;
					pDC->SetPixel(x0+x,y0+y,RGB(158,137,23));
			        pDC->SetPixel(x0+x,y0-y,RGB(158,137,23));
			        pDC->SetPixel(x0-x,y0+y,RGB(158,137,23));
			        pDC->SetPixel(x0-x,y0-y,RGB(158,137,23));
			}
			}
				break;	
 case 6:
	      pDoc->DeleteAll();
		  pDC->MoveTo(point1);
		  pDC->LineTo(point2);
		  u1=0;u2=1;
          kk=0;
		  break;

/*	case 3:
	    //对话框交互画图
		pDC->MoveTo(x0,y0);//画笔定位
		pDC->LineTo(x1,y1);//划线
		break;
		*/


	}
		//重绘模块
	int k=pDoc->GetNumLine();
	while(k--)
	{
		pDoc->GetLine(k)->Draw(pDC);
	}

 
}

/////////////////////////////////////////////////////////////////////////////
// CMy064View printing

BOOL CMy064View::OnPreparePrinting(CPrintInfo* pInfo)
{
	// default preparation
	return DoPreparePrinting(pInfo);
}

void CMy064View::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add extra initialization before printing
}

void CMy064View::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add cleanup after printing
}

/////////////////////////////////////////////////////////////////////////////
// CMy064View diagnostics

#ifdef _DEBUG
void CMy064View::AssertValid() const
{
	CView::AssertValid();
}

void CMy064View::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CMy064Doc* CMy064View::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CMy064Doc)));
	return (CMy064Doc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CMy064View message handlers



void CMy064View::OnLButtonDown(UINT nFlags, CPoint point) 
{   point1=point;//此句（另外保留改点）裁剪用

	::SetCursor(m_HCross);//显示设置的鼠标
	m_Dragging = 1;
 
	m_PointOrigin = point;
	m_PointOld = point;
	/////////////
	SetCapture();//*逮住鼠标*
	RECT Rect;
	GetClientRect(&Rect);//用户矩形区
	ClientToScreen(&Rect);
	::ClipCursor(&Rect);//*限制光标在矩形内*

	
	CView::OnLButtonDown(nFlags, point);
}

void CMy064View::OnMouseMove(UINT nFlags, CPoint point) 
{
if(m_Dragging)
{
	CClientDC  dc(this);
	dc.SetROP2(R2_NOT);//设置绘图模式（异或）
	dc.MoveTo(m_PointOrigin);
	dc.LineTo(m_PointOld);
	dc.MoveTo(m_PointOrigin);
	dc.LineTo(point);
	m_PointOld = point;

}	
	CView::OnMouseMove(nFlags, point);
}

void CMy064View::OnLButtonUp(UINT nFlags, CPoint point) 
{
	point2=point;                              //获取释放点坐标，为截线准备
	bton=true;

if(m_Dragging)
{
	m_Dragging = 0;
	::ReleaseCapture();
	::ClipCursor(NULL);

	CClientDC  dc(this);
	dc.SetROP2(R2_NOT);//绘图模式（异或）
	dc.MoveTo(m_PointOrigin);
	dc.LineTo(m_PointOld);
	dc.MoveTo(m_PointOrigin);
	dc.LineTo(point);
	m_PointOld = point;
	
}
 CMy064Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	//保存该直线
	pDoc->AddLine(m_PointOrigin.x,m_PointOrigin.y,point.x, point.y);	
 
	CView::OnLButtonUp(nFlags, point);
}
//DDA 算法
void CMy064View::OnDrawlineDlg1() 
{   
   	Cdlg  dlg;
	if(dlg.DoModal())//DoMoDal()是对话框显示函数
	{
		x0 = dlg.m_x0;//读取dlg类接收的数据
		y0 = dlg.m_y0;
		x1 = dlg.m_x1;
		y1 = dlg.m_y1;
		kk =1;   //绘图类型
		Invalidate();//触发OnDraw（）
	}
 
}

void CMy064View::OnDrawlineMidp() 
{
	// TODO: Add your command handler code here
		Cdlg  dlg;
	if(dlg.DoModal())//DoMoDal()是对话框显示函数
	{
		x0 = dlg.m_x0;//读取dlg类接收的数据
		y0 = dlg.m_y0;
		x1 = dlg.m_x1;
		y1 = dlg.m_y1;
		kk =2;   //绘图类型
		Invalidate();//触发OnDraw（）
	}
	
}

void CMy064View::OnDrawlineBrasen() 
{
	// TODO: Add your command handler code here
		Cdlg  dlg;
	if(dlg.DoModal())//DoMoDal()是对话框显示函数
	{
		x0 = dlg.m_x0;//读取dlg类接收的数据
		y0 = dlg.m_y0;
		x1 = dlg.m_x1;
		y1 = dlg.m_y1;
		kk =3;   //绘图类型
		Invalidate();//触发OnDraw（）
	}
	
}

void CMy064View::OnQuxianCircle() 
{
	// TODO: Add your command handler code here
	 Cdlg2 dlg2;
		dlg2.DoModal();
		x0=dlg2.m_x0;
		y0=dlg2.m_y0;
		radius=dlg2.m_radius;
kk=4;
Invalidate();	
	
}

void CMy064View::OnQuxianEclip() 
{
	// TODO: Add your command handler code here
	Cdlg3 dlg3;
		dlg3.DoModal();
		x0=dlg3.m_x0;
		y0=dlg3.m_y0;
		rx=dlg3.m_a;
		ry=dlg3.m_b;
kk=5;
Invalidate();		
}

 void CMy064View::ClipTest(double p, double q)
{
	double r;
	if(p != 0)
		r = q / p;
	if(p < 0)
	{
		u1 = max(u1,r);

	}
	if(p > 0)
	{
		u2 = min(u2,r);
	}
	if((p = 0 && q < 0 ) || u1 > u2)
	{
		point1 = NULL;
		point2 = NULL;
	}
}

void CMy064View::Liang_Barsky()
{
	int xmin = 200,xmax = 600,ymin = 200,ymax = 400;
	double p1 = point1.x - point2.x,
		q1 = point1.x - xmin,
		p2 = point2.x - point1.x,
		q2 = xmax - point1.x,

		p3 = point1.y - point2.y,
		q3 = point1.y - ymin,
		p4 = point2.y - point1.y,
		q4 = ymax - point1.y;

	this->ClipTest(p1,q1);
	this->ClipTest(p2,q2);
	this->ClipTest(p3,q3);
	this->ClipTest(p4,q4);
	if(u1 <= u2){
		point2.x = (long)(point1.x + u2 * p2);
		point2.y = (long)(point1.y + u2 * p4);
		point1.x = (long)(point1.x + u1 * p2);
		point1.y = (long)(point1.y + u1 * p4);
	}
	if(p1 ==0 || p2 == 0 || p3 == 0 || p4 == 0)
	{
		point2.x = 0;
		point2.y = 0;
		point1.x = 0;
		point1.y = 0;
	}
}

 

void CMy064View::OnCutLiang() 
{
	kk = 6;
		if(bton){
		this->Liang_Barsky();

		Invalidate();
		bton = false;
		}	
}
int CMy064View::MakeCode(CPoint point)
{

	if(point.x > 200 && point.x < 600 && point.y > 400)
	{
		return 4;//0100;
	}
	if(point.x > 200 && point.x < 600 && point.y > 200 && point.y < 400)
	{
		return 0;//0000;
	}
	if(point.x < 200 && point.y > 200 && point.y < 400)
	{
		return 1;//0001;
	}
	if(point.x > 600 && point.y > 200 && point.y < 400)
	{
		return 2;//0010;
	}
	if(point.x < 200 && point.y > 400)
	{
		return 5;//0101;
	}
	if(point.x > 600 && point.y > 400)
	{
		return 6;//0110;
	}
	if(point.x > 200 && point.x < 600 && point.y < 200)
	{
		return 8;//1000;
	}
	if(point.x < 200 && point.y < 200)
	{
		return 9;//1001;
	}
	if(point.x > 600 && point.y < 200)
	{
		return 10;//1010;
	}
	return false;
}

 

void CMy064View::CutMidpoint()
{
	CPoint point1,point2;
	point1 = this->point1;
	point2 = this->point2;
	int c1 = this->MakeCode(point1);
	int c2 = this->MakeCode(point2);
	if((c1 & c2) == 0)
	{
		CPoint temp;
		while(true)
		{
			c1 = this->MakeCode(point1);
			CPoint pointm;
			pointm.x = (point1.x + point2.x) / 2;
			pointm.y = (point1.y + point2.y) / 2;
			int c = this->MakeCode(pointm);
			if((c & c1) != 0)
			{
				point1 = pointm;
			}
			else
			{
				point2 = pointm;
			}
			if(abs(point1.x - point2.x) <= 2 && abs(point1.y - point2.y) <= 2)
			{
				this->point1 = point2;
				break;
			}
		}
		//if(c1 == 0)//{//temp = point1;//point1 = point2;//point2 = temp;//}
			point1 = this->point2;
			while(true)
			{	
				
				c1 = this->MakeCode(point1);
				CPoint pointm;
				pointm.x = (point1.x + point2.x) / 2;
				pointm.y = (point1.y + point2.y) / 2;
				int c = this->MakeCode(pointm);
				if((c & c1) != 0)
				{
					point1 = pointm;
				}
				else
				{
					point2 = pointm;
				}
				if(abs(point1.x - point2.x) <= 2 && abs(point1.y - point2.y) <= 2)
				{
					this->point2 = point2;
					break;
				}
			}
			
	}
	else
	{
		this->point1 = NULL;
		this->point2 = NULL;
	}
}

 

void CMy064View::OnCutMidpoint() 
{
		if(bton)
	{
		this->CutMidpoint();
		kk = 6;
		Invalidate();
		//bton = false;
	}
}
