// 064.h : main header file for the 064 application
//

#if !defined(AFX_064_H__3DD26D95_9D4C_4048_8E98_3CBD384E48CE__INCLUDED_)
#define AFX_064_H__3DD26D95_9D4C_4048_8E98_3CBD384E48CE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CMy064App:
// See 064.cpp for the implementation of this class
//

class CMy064App : public CWinApp
{
public:
	CMy064App();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMy064App)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation
	//{{AFX_MSG(CMy064App)
	afx_msg void OnAppAbout();
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_064_H__3DD26D95_9D4C_4048_8E98_3CBD384E48CE__INCLUDED_)
