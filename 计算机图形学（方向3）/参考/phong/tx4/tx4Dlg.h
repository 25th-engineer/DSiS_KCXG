// tx4Dlg.h : header file
//

#if !defined(AFX_TX4DLG_H__D5F5605C_551B_4E17_94A4_2EDE6351822A__INCLUDED_)
#define AFX_TX4DLG_H__D5F5605C_551B_4E17_94A4_2EDE6351822A__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CTx4Dlg dialog

class CTx4Dlg : public CDialog
{
// Construction
public:
	 BOOL CTx4Dlg::OnInitDialog();
	CPoint change(float x,float y,float z,float a,float b,float c);
	BOOL xiaoyin(float x,float y,float z);
	void draw();
	CTx4Dlg(CWnd* pParent = NULL);	// standard constructor
	int * CTx4Dlg::rgb(float a, float b, float c,float x,float y,float z,float r,float g,float B,float n);
// Dialog Data
	//{{AFX_DATA(CTx4Dlg)
	enum { IDD = IDD_TX4_DIALOG };
	CSliderCtrl	m_Z;
	CSliderCtrl	m_Y;
	CSliderCtrl	m_X;
	CSliderCtrl	m_R;
	CSliderCtrl	m_G;
	CSliderCtrl	m_B;
	CEdit	m_edit;
	float	m_N;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTx4Dlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CTx4Dlg)
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnReleasedcaptureB(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnReleasedcaptureG(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnReleasedcaptureR(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnReleasedcaptureX(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnReleasedcaptureY(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnReleasedcaptureZ(NMHDR* pNMHDR, LRESULT* pResult);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TX4DLG_H__D5F5605C_551B_4E17_94A4_2EDE6351822A__INCLUDED_)
