#if !defined(AFX_DLG_H__C2320747_9D69_4CC8_9E7C_290ED4AAB02F__INCLUDED_)
#define AFX_DLG_H__C2320747_9D69_4CC8_9E7C_290ED4AAB02F__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// dlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// Cdlg dialog

class Cdlg : public CDialog
{
// Construction
public:
	Cdlg(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(Cdlg)
	enum { IDD = IDD_DIALOG1 };
	int		m_x0;
	int		m_x1;
	int		m_y0;
	int		m_y1;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(Cdlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(Cdlg)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLG_H__C2320747_9D69_4CC8_9E7C_290ED4AAB02F__INCLUDED_)
