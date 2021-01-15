// tx4.h : main header file for the TX4 application
//

#if !defined(AFX_TX4_H__FE9E16B4_24CA_4EBD_9951_97977010203C__INCLUDED_)
#define AFX_TX4_H__FE9E16B4_24CA_4EBD_9951_97977010203C__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CTx4App:
// See tx4.cpp for the implementation of this class
//

class CTx4App : public CWinApp
{
public:
	CTx4App();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTx4App)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CTx4App)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TX4_H__FE9E16B4_24CA_4EBD_9951_97977010203C__INCLUDED_)
