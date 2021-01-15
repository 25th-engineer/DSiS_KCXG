#if !defined(AFX_DLG3_H__DC70270B_9DBD_49F8_BF4F_EEDCDC762726__INCLUDED_)
#define AFX_DLG3_H__DC70270B_9DBD_49F8_BF4F_EEDCDC762726__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// dlg3.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// Cdlg3 dialog

class Cdlg3 : public CDialog
{
// Construction
public:
	Cdlg3(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(Cdlg3)
	enum { IDD = IDD_DIALOG3 };
	int		m_x0;
	int		m_y0;
	int		m_a;
	int		m_b;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(Cdlg3)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(Cdlg3)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLG3_H__DC70270B_9DBD_49F8_BF4F_EEDCDC762726__INCLUDED_)
