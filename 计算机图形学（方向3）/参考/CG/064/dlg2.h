#if !defined(AFX_DLG2_H__ACB9E46A_33FC_4BE6_B484_ED6BECE9D4B9__INCLUDED_)
#define AFX_DLG2_H__ACB9E46A_33FC_4BE6_B484_ED6BECE9D4B9__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// dlg2.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// Cdlg2 dialog

class Cdlg2 : public CDialog
{
// Construction
public:
	Cdlg2(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(Cdlg2)
	enum { IDD = IDD_DIALOG2 };
	int		m_x0;
	int		m_y0;
	int		m_radius;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(Cdlg2)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(Cdlg2)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLG2_H__ACB9E46A_33FC_4BE6_B484_ED6BECE9D4B9__INCLUDED_)
