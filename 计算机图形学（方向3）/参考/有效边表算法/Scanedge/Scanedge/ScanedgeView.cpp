// ScanedgeView.cpp : CScanedgeView 类的实现
//

#include "stdafx.h"
#include "Scanedge.h"

#include "ScanedgeDoc.h"
#include "ScanedgeView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

typedef struct
{ 
	int x; int y; 
}dcPT;//扫描线填充

typedef struct somedc
{ 
	int x; int y; 
}dcPt;//扫描线填充



typedef struct tEdge
{
	int yUpper;
	float xIntersect,dxPerScan;
	struct tEdge *next;
}Edge; //边结构（单链）

struct somedc pts[20];

// CScanedgeView

IMPLEMENT_DYNCREATE(CScanedgeView, CView)

BEGIN_MESSAGE_MAP(CScanedgeView, CView)
	ON_COMMAND(ID_SCANFILL_ACTIVEEDGE, &CScanedgeView::OnScanfillActiveedge)
	ON_WM_LBUTTONDOWN()
	ON_WM_RBUTTONDOWN()
END_MESSAGE_MAP()

// CScanedgeView 构造/析构

CScanedgeView::CScanedgeView()
{
	// TODO: 在此处添加构造代码
	chicktime=0;
}

CScanedgeView::~CScanedgeView()
{
}

BOOL CScanedgeView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: 在此处通过修改
	//  CREATESTRUCT cs 来修改窗口类或样式

	return CView::PreCreateWindow(cs);
}

// CScanedgeView 绘制

void CScanedgeView::OnDraw(CDC* /*pDC*/)
{
	CScanedgeDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	if (!pDoc)
		return;

	// TODO: 在此处为本机数据添加绘制代码
}


// CScanedgeView 诊断

#ifdef _DEBUG
void CScanedgeView::AssertValid() const
{
	CView::AssertValid();
}

void CScanedgeView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CScanedgeDoc* CScanedgeView::GetDocument() const // 非调试版本是内联的
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CScanedgeDoc)));
	return (CScanedgeDoc*)m_pDocument;
}
#endif //_DEBUG


// CScanedgeView 消息处理程序

void CScanedgeView::OnScanfillActiveedge()
{
	// TODO: 在此添加命令处理程序代码
}

void CScanedgeView::OnLButtonDown(UINT nFlags, CPoint point)
{
	// TODO: 在此添加消息处理程序代码和/或调用默认值
	CClientDC dc(this);
	pts[chicktime].x=point.x;
	pts[chicktime].y=point.y;
    chicktime++;
	dc.SetPixel(point.x,point.y,RGB(255,0,0));
	CView::OnLButtonDown(nFlags, point);
}

void CScanedgeView::OnRButtonDown(UINT nFlags, CPoint point)
{
	// TODO: 在此添加消息处理程序代码和/或调用默认值
	CClientDC dc(this);

	pts[chicktime].x=point.x;	pts[chicktime].y=point.y;	
	chicktime++;
    int n;
	n=chicktime;
	dc.MoveTo(pts[0].x,pts[0].y);
    for(int i=1;i<n;i++)
		dc.LineTo(pts[i].x,pts[i].y);
	
	dc.LineTo(pts[0].x,pts[0].y);

	scanFill(chicktime,pts);
	chicktime=0;		
	
	CView::OnRButtonDown(nFlags, point);
}

void CScanedgeView::scanFill(int cnt,dcPt *pts)  //全部过程
{
  Edge *edges[HEIGHT],*active;
  Edge *p;
  int i,scan,min_x,min_y,max_x,max_y;
  for(i=0;i<HEIGHT;i++)
  {
    edges[i]=(Edge *)malloc(sizeof(Edge));
    edges[i]->next=NULL;
  }
  buildEdgelist(cnt,pts,edges);
  


  min_x=max_x=pts[0].x;
  min_y=max_y=pts[0].y;


for(i=1;i<cnt;i++)
  {
		if(min_x>=pts[i].x)
			min_x=pts[i].x;
		if(max_x<=pts[i].x)
			max_x=pts[i].x;
		if(min_y>=pts[i].y)
			min_y=pts[i].y;
		if(max_y<=pts[i].y)
			max_y=pts[i].y;
  }


CClientDC dc(this);




for(i=min_x;i<=max_x;i++)
	{
		dc.SetPixel(i,min_y,RGB(0,0,0));
		dc.SetPixel(i,max_y,RGB(0,0,0));

 
	}
	 for(i=min_y;i<=max_y;i++)
	{
		dc.SetPixel(min_x,i,RGB(15,155,0));
		dc.SetPixel(max_x,i,RGB(15,155,0));

 
	}

 




/**/
  active=(Edge *)malloc(sizeof(Edge));
  active->next=NULL;
 for(scan=min_y;scan<=max_y;scan++)   //对每一条扫描线
  {
    buildActivelist(scan,active,edges); // 建立活性边
    if(active->next!=NULL)
    {
      fillscan(scan,active); // 填充
      updateActivelist(scan,active);//更新
      resortActivelist(active);  //重排序
    }
	Sleep(20);
  }
  p=active;
  while(p!=NULL)
  {
    active=active->next;
    free(p);
    p=active;
  }
  for(i=0;i<HEIGHT;i++)
  {
    p=edges[i];
    while(p!=NULL)
    {
       edges[i]=p->next;
       free(p);
       p=edges[i];
    }
  }
}


void CScanedgeView::buildEdgelist(int cnt,dcPt *pts,Edge *edges[])//建立新边表
{
  Edge *edge;
  dcPt v1,v2;
  int i,yPrev=pts[cnt-2].y;
  v1.x=pts[cnt-1].x;
  v1.y=pts[cnt-1].y;
  for(i=0;i<cnt;i++)
  {
     v2.x=pts[i].x;
     v2.y=pts[i].y;
     if(v1.y!=v2.y)
     {
       edge=(Edge *)malloc(sizeof(Edge));
       if(v1.y<v2.y)   makeEdgeRec(v1,v2,yNext(i,cnt,pts),edge,edges);
       else    makeEdgeRec(v2,v1,yPrev,edge,edges);
     }
     yPrev=v1.y;
     v1=v2;
  }
}


void CScanedgeView::makeEdgeRec(dcPt lower,dcPt upper,int yComp,Edge *edge,Edge *edges[])
//构造边记录
{
  edge->xIntersect=(float)lower.x;
  edge->dxPerScan=(float)(upper.x-lower.x)/(upper.y-lower.y);
  if(upper.y<yComp)
      edge->yUpper=upper.y-1;
  else
      edge->yUpper=upper.y;
  insertEdge(edges[lower.y],edge);
}

void CScanedgeView::insertEdge(Edge *list,Edge *edge)//将边 edge插入边表list
{
   Edge *p,*q=list;

   p=q->next;
   while(p!=NULL)
   {
     if( edge->xIntersect < p->xIntersect )
	 p=NULL;  //
     else
     {
       q=p;
       p=p->next;
     }
   }
   edge->next=q->next;
   q->next=edge;
}


int CScanedgeView::yNext(int k,int cnt,dcPt *pts)//找下一个点的Y值
{
  int j;
  if((k+1)>(cnt-1)) //若当前为最后一个点
    j=0;
  else
    j=k+1;
  while(pts[k].y==pts[j].y)//若当前点与下一点为水平边
    if((j+1)>(cnt-1))
       j=0;
    else
       j++;
  return(pts[j].y);
}

void CScanedgeView::buildActivelist(int scan,Edge *active,Edge *edges[])  
//建立当前扫描线的活性边
{
  Edge *p,*q;
  p=edges[scan]->next;
  while(p)
  {
     q=(Edge *)malloc(sizeof(Edge));
     q->yUpper=p->yUpper;
     q->xIntersect=p->xIntersect;
     q->dxPerScan=p->dxPerScan;
     insertEdge(active,q);
     p=p->next;
  }
}

void CScanedgeView::fillscan(int scan,Edge *active)//对当前扫描线scan填充
{
  CClientDC dc(this);
  Edge *p1,*p2;
  int i;
  p1=active->next;
  while(p1)
  {
    p2=p1->next;
    for(i=(int)p1->xIntersect;i<p2->xIntersect;i++)  
		dc.SetPixel(i,scan,RGB(15,155,0));
    p1=p2->next;
  }
}


void CScanedgeView::updateActivelist(int scan,Edge *active) //更新活性边表
{
  Edge *q=active,*p=active->next;
  while(p)
     if(scan>=p->yUpper) //删除高点为当前扫描线的边
     {
       p=p->next;
       deleteAfter(q);
     }
     else
     {
       p->xIntersect=p->xIntersect + p->dxPerScan; //更新交点值
       q=p;
       p=p->next;
     }
}

void CScanedgeView::resortActivelist(Edge *active)//活性边重排序
{
  Edge *q,*p=active->next;
  active->next=NULL;
  while(p)
  {
    q=p->next;
    insertEdge(active,p);
    p=q;

  }
}

void CScanedgeView::deleteAfter(Edge *q)
{
  Edge *p=q->next;
  q->next=p->next;
  free(p);
}