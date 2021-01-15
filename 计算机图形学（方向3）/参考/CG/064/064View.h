// 064View.h : interface of the CMy064View class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_064VIEW_H__F667D2B3_8D62_4F84_AFE9_8D66C6EA8ED4__INCLUDED_)
#define AFX_064VIEW_H__F667D2B3_8D62_4F84_AFE9_8D66C6EA8ED4__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CMy064View : public CView
{
protected: // create from serialization only
	CMy064View();
	DECLARE_DYNCREATE(CMy064View)

// Attributes
public:
	CMy064Doc* GetDocument();


// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMy064View)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	//}}AFX_VIRTUAL

// Implementation
public:
		
	void CutMidpoint();
	 
	int MakeCode(CPoint point);
	void Liang_Barsky();
	void ClipTest(double p,double q);
	void ClipTest();
	virtual ~CMy064View();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:
	int x0,y0,x1,y1,d,Einc,NEinc,st,en,xa,xb,ya,yb,twoDy,twoDyDx,xEnd;
	int	radius,p,p0,rx,ry;
	int p1,p2,p3,p4,q1,q2,q3,q4;
	CPoint point1,point2;
    double m,dx,dy,x,y;
	double u1,u2;
	bool bton;

	int kk;
	CPoint m_PointOld;
	CPoint m_PointOrigin;
	HCURSOR m_HCross;//鼠标设备
	int  m_Dragging;//是否拖动

// Generated message map functions
protected:
	//{{AFX_MSG(CMy064View)
	afx_msg void OnDrawlineDlg1();
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	afx_msg void OnMouseMove(UINT nFlags, CPoint point);
	afx_msg void OnLButtonUp(UINT nFlags, CPoint point);
	afx_msg void OnDrawlineMidp();
	afx_msg void OnDrawlineBrasen();
	afx_msg void OnQuxianCircle();
	afx_msg void OnQuxianEclip();
	afx_msg void OnCutLiang();
	afx_msg void OnCutMidpoint();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in 064View.cpp
inline CMy064Doc* CMy064View::GetDocument()
   { return (CMy064Doc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_064VIEW_H__F667D2B3_8D62_4F84_AFE9_8D66C6EA8ED4__INCLUDED_)
