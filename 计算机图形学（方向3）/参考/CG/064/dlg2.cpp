// dlg2.cpp : implementation file
//

#include "stdafx.h"
#include "064.h"
#include "dlg2.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// Cdlg2 dialog


Cdlg2::Cdlg2(CWnd* pParent /*=NULL*/)
	: CDialog(Cdlg2::IDD, pParent)
{
	//{{AFX_DATA_INIT(Cdlg2)
	m_x0 = 0;
	m_y0 = 0;
	m_radius = 0;
	//}}AFX_DATA_INIT
}


void Cdlg2::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(Cdlg2)
	DDX_Text(pDX, IDC_EDIT1, m_x0);
	DDX_Text(pDX, IDC_EDIT2, m_y0);
	DDX_Text(pDX, IDC_EDIT3, m_radius);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(Cdlg2, CDialog)
	//{{AFX_MSG_MAP(Cdlg2)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// Cdlg2 message handlers
