// tx4Dlg.cpp : implementation file
//

#include "stdafx.h"
#include "tx4.h"
#include "tx4Dlg.h"
#include <math.h>
#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTx4Dlg dialog

CTx4Dlg::CTx4Dlg(CWnd* pParent /*=NULL*/)
	: CDialog(CTx4Dlg::IDD, pParent)
{
	
	//{{AFX_DATA_INIT(CTx4Dlg)
	m_N = 4.0f;
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CTx4Dlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CTx4Dlg)
	DDX_Control(pDX, IDC_Z, m_Z);
	DDX_Control(pDX, IDC_Y, m_Y);
	DDX_Control(pDX, IDC_X, m_X);
	DDX_Control(pDX, IDC_R, m_R);
	DDX_Control(pDX, IDC_G, m_G);
	DDX_Control(pDX, IDC_B, m_B);
	DDX_Control(pDX, IDC_EDIT1, m_edit);
	DDX_Text(pDX, IDC_aaa, m_N);
	DDV_MinMaxFloat(pDX, m_N, 0.f, 6.f);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CTx4Dlg, CDialog)
	//{{AFX_MSG_MAP(CTx4Dlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_NOTIFY(NM_RELEASEDCAPTURE, IDC_B, OnReleasedcaptureB)
	ON_NOTIFY(NM_RELEASEDCAPTURE, IDC_G, OnReleasedcaptureG)
	ON_NOTIFY(NM_RELEASEDCAPTURE, IDC_R, OnReleasedcaptureR)
	ON_NOTIFY(NM_RELEASEDCAPTURE, IDC_X, OnReleasedcaptureX)
	ON_NOTIFY(NM_RELEASEDCAPTURE, IDC_Y, OnReleasedcaptureY)
	ON_NOTIFY(NM_RELEASEDCAPTURE, IDC_Z, OnReleasedcaptureZ)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTx4Dlg message handlers

 BOOL CTx4Dlg::OnInitDialog()
 {
 	CDialog::OnInitDialog();
 
 	// Add "About..." menu item to system menu.
 
 	// IDM_ABOUTBOX must be in the system command range.
 	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
 	ASSERT(IDM_ABOUTBOX < 0xF000);
 
 	CMenu* pSysMenu = GetSystemMenu(FALSE);
 	if (pSysMenu != NULL)
 	{
 		CString strAboutMenu;
 		strAboutMenu.LoadString(IDS_ABOUTBOX);
 		if (!strAboutMenu.IsEmpty())
 		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
 			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
 		}
 	}
 
 	// Set the icon for this dialog.  The framework does this automatically
 	//  when the application's main window is not a dialog
 	SetIcon(m_hIcon, TRUE);			// Set big icon
 	SetIcon(m_hIcon, FALSE);		// Set small icon
 	
 	// TODO: Add extra initialization here
 	m_R.SetRange(0,255);
 	m_G.SetRange(0,255);
 	m_B.SetRange(0,255);
 	m_X.SetRange(0,20);
 	m_Y.SetRange(-40,40);
 	m_Z.SetRange(-40,40);
	m_X.SetPos(10);
	m_Y.SetPos(20);
	m_Z.SetPos(20);
	/**/
 	return TRUE;  // return TRUE  unless you set the focus to a control
 }

void CTx4Dlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CTx4Dlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CTx4Dlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CTx4Dlg::draw()
{
	CDC* p=m_edit.GetDC();
	CRect rc;
	GetClientRect(rc);
	p->SetMapMode(MM_ANISOTROPIC);
	p->SetWindowOrg(-rc.Width()/2+80,rc.Height()/2-20);
	p->SetWindowExt(rc.Width(),-rc.Height());
	p->SetViewportOrg(0,0);
	p->SetViewportExt(rc.Width(),rc.Height());
	float xx,yy,zz;
	for(float i=0;i<=3.14;i+=float(3.14/190))
	{	
		for(float j=0;j<=6.28;j+=float(3.14/190))
		{
			xx=float(60*sin(i)*cos(j));
			yy=float(60*sin(i)*sin(j));
			zz=float(60*cos(i));
			if(xiaoyin(xx,yy,zz))
			{
int rr,gg,bb;
float t;
t=float(sqrt(xx*xx+yy*yy+zz*zz));
rr=*(rgb(m_X.GetPos(),m_Y.GetPos(),m_Z.GetPos(),xx/t,yy/t,zz/t,m_R.GetPos(),m_G.GetPos(),m_B.GetPos(),m_N));
gg=*(rgb(m_X.GetPos(),m_Y.GetPos(),m_Z.GetPos(),xx/t,yy/t,zz/t,m_R.GetPos(),m_G.GetPos(),m_B.GetPos(),m_N)+1);
bb=*(rgb(m_X.GetPos(),m_Y.GetPos(),m_Z.GetPos(),xx/t,yy/t,zz/t,m_R.GetPos(),m_G.GetPos(),m_B.GetPos(),m_N)+2);
p->SetPixel(change(xx,yy,zz,1,0,0),RGB(rr,gg,bb));
			}
		}
	}
	return;
}

BOOL CTx4Dlg::xiaoyin(float x, float y, float z)
{
	if(x>=0)
		return true;
	else
		return false;
}

CPoint CTx4Dlg::change(float x, float y, float z, float a, float b, float c)
{
	double u,v;
	 u=sqrt(a*a+b*b+c*c);
	 v=sqrt(a*a+b*b);
	 float T[4][4]={{-b/v,-(a*c)/(u*v),0,a/u*u},{a/v ,-(b*c)/(u*v),0,b/(u*u)},{0,v/u,0,c/(u*u)},{0,0,0,1}};
	 CPoint P(T[0][0]*x+T[1][0]*y,x*T[0][1]+T[1][1]*y+z*T[2][1]);
	 return P;
}


 int * CTx4Dlg::rgb(float a, float b,  float c,float x,float y,float z,float r,float g,float B,float n)
 {
 	int R[3];
	float xx,yy,zz;
	xx=float(a/sqrt(a*a+b*b+c*c));
	yy=float(b/sqrt(a*a+b*b+c*c));
	zz=float(c/sqrt(a*a+b*b+c*c));
 	if(60+r*0.28*(xx*x+yy*y+zz*z)+r*0.08*pow(((xx+1)*x+yy*y+zz*z),n)<=255)
		R[0]=int(60+r*0.28*(xx*x+yy*y+zz*z)+r*0.08*pow(((xx+1)*x+yy*y+zz*z),n));
	else
		R[0]=255;
	if(60+g*0.28*(xx*x+yy*y+zz*z)+g*0.08*pow(((xx+1)*x+yy*y+zz*z),n)<=255)
		R[1]=int(60+g*0.28*(xx*x+yy*y+zz*z)+g*0.08*pow(((xx+1)*x+yy*y+zz*z),n));
	else
		R[1]=255;
	if(60+B*0.2*(xx*x+yy*y+zz*z)+B*0.08*pow(((xx+1)*x+yy*y+zz*z),n)<=255)
		R[2]=int(60+B*0.2*(xx*x+yy*y+zz*z)+B*0.08*pow(((xx+1)*x+yy*y+zz*z),n));
	else
		R[2]=255;
 	return R;
 }





void CTx4Dlg::OnReleasedcaptureB(NMHDR* pNMHDR, LRESULT* pResult) 
{
	// TODO: Add your control notification handler code here
	UpdateData();
	draw();
	*pResult = 0;
}

void CTx4Dlg::OnReleasedcaptureG(NMHDR* pNMHDR, LRESULT* pResult) 
{
	// TODO: Add your control notification handler code here
	UpdateData();
	draw();
	*pResult = 0;
}

void CTx4Dlg::OnReleasedcaptureR(NMHDR* pNMHDR, LRESULT* pResult) 
{
	// TODO: Add your control notification handler code here
	UpdateData();
	draw();
	*pResult = 0;
}

void CTx4Dlg::OnReleasedcaptureX(NMHDR* pNMHDR, LRESULT* pResult) 
{
	// TODO: Add your control notification handler code here
	UpdateData();
	draw();
	*pResult = 0;
}

void CTx4Dlg::OnReleasedcaptureY(NMHDR* pNMHDR, LRESULT* pResult) 
{
	// TODO: Add your control notification handler code here
	UpdateData();
	draw();
	*pResult = 0;
}

void CTx4Dlg::OnReleasedcaptureZ(NMHDR* pNMHDR, LRESULT* pResult) 
{
	// TODO: Add your control notification handler code here
	UpdateData();
	draw();
	*pResult = 0;
}
