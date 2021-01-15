// dlg3.cpp : implementation file
//

#include "stdafx.h"
#include "064.h"
#include "dlg3.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// Cdlg3 dialog


Cdlg3::Cdlg3(CWnd* pParent /*=NULL*/)
	: CDialog(Cdlg3::IDD, pParent)
{
	//{{AFX_DATA_INIT(Cdlg3)
	m_x0 = 0;
	m_y0 = 0;
	m_a = 0;
	m_b = 0;
	//}}AFX_DATA_INIT
}


void Cdlg3::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(Cdlg3)
	DDX_Text(pDX, IDC_EDIT1, m_x0);
	DDX_Text(pDX, IDC_EDIT2, m_y0);
	DDX_Text(pDX, IDC_EDIT3, m_a);
	DDX_Text(pDX, IDC_EDIT4, m_b);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(Cdlg3, CDialog)
	//{{AFX_MSG_MAP(Cdlg3)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// Cdlg3 message handlers
