// 10110408_2.cpp : 定义应用程序的入口点。
#include "stdafx.h"
#include "10110408_2.h"
#define MAX_LOADSTRING 100

// 全局变量:
HINSTANCE hInst;								// 当前实例
TCHAR szTitle[MAX_LOADSTRING];					// 标题栏文本
TCHAR szWindowClass[MAX_LOADSTRING];			// 主窗口类名

// 此代码模块中包含的函数的前向声明:
ATOM				MyRegisterClass(HINSTANCE hInstance);
BOOL				InitInstance(HINSTANCE, int);
LRESULT CALLBACK	WndProc(HWND, UINT, WPARAM, LPARAM);
INT_PTR CALLBACK	About(HWND, UINT, WPARAM, LPARAM);

int APIENTRY _tWinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPTSTR    lpCmdLine,
                     int       nCmdShow)
{
	UNREFERENCED_PARAMETER(hPrevInstance);
	UNREFERENCED_PARAMETER(lpCmdLine);

 	// TODO: 在此放置代码。
	MSG msg;
	HACCEL hAccelTable;

	// 初始化全局字符串
	LoadString(hInstance, IDS_APP_TITLE, szTitle, MAX_LOADSTRING);
	LoadString(hInstance, IDC_MY10110408_2, szWindowClass, MAX_LOADSTRING);
	MyRegisterClass(hInstance);

	// 执行应用程序初始化:
	if (!InitInstance (hInstance, nCmdShow))
	{
		return FALSE;
	}

	hAccelTable = LoadAccelerators(hInstance, MAKEINTRESOURCE(IDC_MY10110408_2));

	// 主消息循环:
	while (GetMessage(&msg, NULL, 0, 0))
	{
		if (!TranslateAccelerator(msg.hwnd, hAccelTable, &msg))
		{
			TranslateMessage(&msg);
			DispatchMessage(&msg);
		}
	}

	return (int) msg.wParam;
}

//  函数: MyRegisterClass()
//
//  目的: 注册窗口类。
//
//  注释:
//
//    仅当希望
//    此代码与添加到 Windows 95 中的“RegisterClassEx”
//    函数之前的 Win32 系统兼容时，才需要此函数及其用法。调用此函数十分重要，
//    这样应用程序就可以获得关联的
//    “格式正确的”小图标。
//
ATOM MyRegisterClass(HINSTANCE hInstance)
{
	WNDCLASSEX wcex;

	wcex.cbSize = sizeof(WNDCLASSEX);

	wcex.style			= CS_HREDRAW | CS_VREDRAW;
	wcex.lpfnWndProc	= WndProc;
	wcex.cbClsExtra		= 0;
	wcex.cbWndExtra		= 0;
	wcex.hInstance		= hInstance;
	wcex.hIcon			= LoadIcon(hInstance, MAKEINTRESOURCE(IDI_MY10110408_2));
	wcex.hCursor		= LoadCursor(NULL, IDC_ARROW);
	wcex.hbrBackground	= (HBRUSH)(COLOR_WINDOW+1);
	wcex.lpszMenuName	= MAKEINTRESOURCE(IDC_MY10110408_2);
	wcex.lpszClassName	= szWindowClass;
	wcex.hIconSm		= LoadIcon(wcex.hInstance, MAKEINTRESOURCE(IDI_SMALL));

	return RegisterClassEx(&wcex);
}

//
//   函数: InitInstance(HINSTANCE, int)
//
//   目的: 保存实例句柄并创建主窗口
//
//   注释:
//
//        在此函数中，我们在全局变量中保存实例句柄并
//        创建和显示主程序窗口。
//
BOOL InitInstance(HINSTANCE hInstance, int nCmdShow)
{
   HWND hWnd;

   hInst = hInstance; // 将实例句柄存储在全局变量中

   hWnd = CreateWindow(szWindowClass, szTitle, WS_OVERLAPPEDWINDOW,
      CW_USEDEFAULT, 0, CW_USEDEFAULT, 0, NULL, NULL, hInstance, NULL);

   if (!hWnd)
   {
      return FALSE;
   }

   ShowWindow(hWnd, nCmdShow);
   UpdateWindow(hWnd);

   return TRUE;
}

//
//  函数: WndProc(HWND, UINT, WPARAM, LPARAM)
//
//  目的: 处理主窗口的消息。
//
//  WM_COMMAND	- 处理应用程序菜单
//  WM_PAINT	- 绘制主窗口
//  WM_DESTROY	- 发送退出消息并返回

typedef struct AET //构造边表数据结构 
{
	double x;
	long ymax;
	double k;   //代替1/k
	struct AET *next;
}AET;

typedef struct Bucket//构造桶结点的数据结构
{
	int BucketL;
	struct Bucket *next;
	AET *p;
}Bucket;

int sides=7;
Bucket *HeadB,*CurrentB;
AET E[7],*HeadE,*CurrentE,*T1,*T2;
POINT spt[7];

void Polygon(HDC hdc)
{
	spt[0].x=150;spt[0].y=50;//定义多边形
	spt[1].x=300;spt[1].y=250;
	spt[2].x=400;spt[2].y=50  ;
	spt[3].x=600;spt[3].y=450;
	spt[4].x=350;spt[4].y=400;
	spt[5].x=150;spt[5].y=600;
	spt[6].x=50;spt[6].y=350;
	::Polygon(hdc,spt,sides);	
}

Bucket* CreatBucket()//初始化桶
{
	int max,min;
	max=min=spt[0].y;
	// 求出最大的y值和最小的y值，即占用的最大扫描线数
	for (int i=1; i< sides; i++)
	{
		if (spt[i].y > max) 
			max = spt[i].y;
		else if (spt[i].y < min) 
			min = spt[i].y;
	}
	for(int i=min;i<=max;i++)//建立桶结点
	{
		if(min==i)//桶头结点
		{
			HeadB=new Bucket;//建立桶的头结点
			CurrentB=HeadB;//CurrentB为Bucket当前结点指针
			CurrentB->BucketL=min;
			CurrentB->p=NULL;//没有连接边链表
			CurrentB->next=NULL;
		}
		else//建立桶的其它结点
		{
			CurrentB->next=new Bucket;//新建一个桶结点
			CurrentB=CurrentB->next;//使CurrentB指向新建的桶结点
			CurrentB->BucketL=i;
			CurrentB->p=NULL;//没有连接边链表
			CurrentB->next=NULL;				
		}
	}
	return HeadB;
}

Bucket *CreatET()//构造边表
{
	for(int i=0;i<sides;i++)//访问每个顶点
	{
		int j=i+1;//边的第二个顶点，spt[i]和spt[j]构成边
		if(j==sides) 
			j=0;//保证多边形的闭合
		CurrentB=HeadB;//从桶链表的头结点开始循环
		if(spt[j].y>spt[i].y)//终点比起点高
		{
			while(CurrentB->BucketL!=spt[i].y)//在桶内寻找该边的ymin
			{
				CurrentB=CurrentB->next;//移到下一个桶结点
			}
			E[i].x=spt[i].x;//计算ET表的值
			E[i].ymax=spt[j].y;
			E[i].k=double((spt[j].x-spt[i].x))/(spt[j].y-spt[i].y);//代表1/k			
			E[i].next=NULL;
			CurrentE=CurrentB->p;//获得桶上链接边表的地址
			if(CurrentB->p==NULL)//当前桶结点上没有链接边结点
			{
				CurrentE=&E[i];//赋边的起始地址
				CurrentB->p=CurrentE;//第一个边结点直接连接到对应的桶中
			}
			else
			{
				while(CurrentE->next!=NULL)//如果当前边已连有边结点
				{
					CurrentE=CurrentE->next;//移动指针到当前边的最后一个边结点					
				}
				CurrentE->next=&E[i];//把当前边接上去
			}
		}
		if(spt[j].y<spt[i].y)//终点比起点低
		{
			while(CurrentB->BucketL!=spt[j].y)
			{
				CurrentB=CurrentB->next;				
			}
			E[i].x=spt[j].x;
			E[i].ymax=spt[i].y;
			E[i].k=double((spt[i].x-spt[j].x))/(spt[i].y-spt[j].y);			
			E[i].next=NULL;
			CurrentE=CurrentB->p;
			if(CurrentE==NULL)//当前桶结点上没有链接边结点
			{
				CurrentE=&E[i];
				CurrentB->p=CurrentE;//第一个边结点直接链接到对应的桶中
			}
			else   //如果当前边已连有边结点
			{
				while(CurrentE->next!=NULL)
				{
					CurrentE=CurrentE->next;				
				}
				CurrentE->next=&E[i];
			}
		}
	}
	CurrentB=NULL;
	CurrentE=NULL;
	return HeadB;
}

void AddEdge(AET *NewEdge)//插入临时边表
{
	T1=HeadE;
	if(T1==NULL)//边表为空,将边表置为TempEdge
	{
		T1=NewEdge;
		HeadE=T1;
	}
	else
	{
		while(T1->next!=NULL)//边表不为空,将TempEdge连在该边之后
		{
			T1=T1->next;
		}
		T1->next=NewEdge;
	}
}

void EdgeOrder()//对边表进行排序
{	
	T1=HeadE;
	if(T1==NULL)
	{
		return;
	}
	if(T1->next==NULL)//如果该边表没有再连边表
	{
		return;//桶结点只有一条边，不需要排序
	}
	else
	{
		if(T1->next->x<T1->x)//边表按x值排序
		{
			T2=T1->next;
			T1->next=T2->next;
			T2->next=T1;
			HeadE=T2;
		}
		T2=HeadE;
		T1=HeadE->next;		
		while(T1->next!=NULL)//继续两两比较相连的边表的x值,进行排序
		{
			if(T1->next->x<T1->x)
			{
				T2->next=T1->next;
				T1->next=T1->next->next;
				T2->next->next=T1;
				T2=T2->next;
			}
			else
			{
				T2=T1;
				T1=T1->next;
			}
		}
	}
}

void PolygonFill(HDC hdc)//多边形填充
{
	HeadE=NULL;
	for(CurrentB=HeadB;CurrentB!=NULL;CurrentB=CurrentB->next)//访问所有桶结点
	{
		//对每条扫描线，将该扫描线上的边结点插入带临时AET表中
		for(CurrentE=CurrentB->p;CurrentE!=NULL;CurrentE=CurrentE->next)//访问桶中排序前的边结点			
		{
			AET *TempEdge=new AET;
			TempEdge->x=CurrentE->x;
			TempEdge->ymax=CurrentE->ymax;
			TempEdge->k=CurrentE->k;
			TempEdge->next=NULL;			
			AddEdge(TempEdge);//将该边插入临时AET表
		}
		EdgeOrder();//使得边表按照x递增的顺序存放		
		T1=HeadE;//根据ymax抛弃扫描完的边结点
		if(T1==NULL)
		{
			return;
		}
		while(CurrentB->BucketL>=T1->ymax)//放弃该结点，AET表指针后移（下闭上开）
		{
			T1=T1->next;
			HeadE=T1;
			if(HeadE==NULL)
			{
				return;
			}
		}
		if(T1->next!=NULL)
		{
			T2=T1;
			T1=T2->next;
		}
		while(T1!=NULL)
		{
			if(CurrentB->BucketL>=T1->ymax)//跳过一个结点
			{
				T2->next=T1->next;
				T1->next=NULL;
				T1=T2->next;
			}
			else
			{
				T2=T1;
				T1=T2->next;
			}
		}
		BOOL In=false;//设置一个BOOL变量In，初始值为假
		double xb,xe;//扫描线的起点和终点
		for(T1=HeadE;T1!=NULL;T1=T1->next)//填充扫描线和多边形相交的区间
		{
			if(In==false)
			{
				xb=T1->x;
				In=true;//每访问一个结点,把In值取反一次
			}
			else//如果In值为真，则填充从当前结点的x值开始到下一结点的x值结束的区间
			{
				xe=T1->x-1;//左闭右开
					 
				for(double x=xb;x<=xe;x++)
					SetPixel(hdc,int(x+0.5),CurrentB->BucketL,RGB(255,0,0));//填充语句
				In=FALSE;
			}
		}
		for(T1=HeadE;T1!=NULL;T1=T1->next)//边连贯性
		{
			T1->x=T1->x+T1->k;//x=x+1/k				 
		}				
	}

	delete HeadB; 
	delete CurrentB;
	delete CurrentE;
	delete HeadE;
}

int flag;
LRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
	int wmId, wmEvent;
	PAINTSTRUCT ps;
	HDC hdc;

	switch (message)
	{
	case WM_COMMAND:
		wmId    = LOWORD(wParam);
		wmEvent = HIWORD(wParam);
		// 分析菜单选择:
		switch (wmId)
		{
		case ID_AET:
			flag=1;hdc = BeginPaint(hWnd, &ps);
			MessageBoxA(hWnd,"you click AET","",MB_OK);
			PolygonFill(hdc);//多边形填充	
			InvalidateRect(hWnd ,NULL,TRUE);//让窗口失效
			UpdateWindow(hWnd);//更新窗口
			break;
		case IDM_ABOUT:
			DialogBox(hInst, MAKEINTRESOURCE(IDD_ABOUTBOX), hWnd, About);
			break;
		case IDM_EXIT:
			DestroyWindow(hWnd);
			break;
		default:
			return DefWindowProc(hWnd, message, wParam, lParam);
		}
		break;
	case WM_PAINT:
		hdc = BeginPaint(hWnd, &ps);
		 //TODO: 在此添加任意绘图代码...
		switch (flag)
		{
		case 1:
			Polygon(hdc);//绘制多边形
			CreatBucket();//初始化桶
			CreatET();//用于建立边表	
			
			break;
		}
		EndPaint(hWnd, &ps);
		break;
	case WM_DESTROY:
		PostQuitMessage(0);
		break;
	default:
		return DefWindowProc(hWnd, message, wParam, lParam);
	}
	return 0;
}

// “关于”框的消息处理程序。
INT_PTR CALLBACK About(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	UNREFERENCED_PARAMETER(lParam);
	switch (message)
	{
	case WM_INITDIALOG:
		return (INT_PTR)TRUE;

	case WM_COMMAND:
		if (LOWORD(wParam) == IDOK || LOWORD(wParam) == IDCANCEL)
		{
			EndDialog(hDlg, LOWORD(wParam));
			return (INT_PTR)TRUE;
		}
		break;
	}
	return (INT_PTR)FALSE;
}
