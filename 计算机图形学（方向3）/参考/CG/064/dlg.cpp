// dlg.cpp : implementation file
//

#include "stdafx.h"
#include "064.h"
#include "dlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// Cdlg dialog


Cdlg::Cdlg(CWnd* pParent /*=NULL*/)
	: CDialog(Cdlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(Cdlg)
	m_x0 = 0;
	m_x1 = 0;
	m_y0 = 0;
	m_y1 = 0;
	//}}AFX_DATA_INIT
}


void Cdlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(Cdlg)
	DDX_Text(pDX, IDC_EDIT1, m_x0);
	DDX_Text(pDX, IDC_EDIT3, m_x1);
	DDX_Text(pDX, IDC_EDIT2, m_y0);
	DDX_Text(pDX, IDC_EDIT4, m_y1);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(Cdlg, CDialog)
	//{{AFX_MSG_MAP(Cdlg)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// Cdlg message handlers
