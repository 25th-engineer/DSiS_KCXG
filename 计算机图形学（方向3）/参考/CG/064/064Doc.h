
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_064DOC_H__DD9F69FA_112D_4B4B_8DF7_F8BC86B80F4B__INCLUDED_)
#define AFX_064DOC_H__DD9F69FA_112D_4B4B_8DF7_F8BC86B80F4B__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

  #include <afxtempl.h>
////*线段类*
class CLine: public CObject
{
protected:
	int m_X1,m_Y1,m_X2,m_Y2;
public:
	CLine(int X1,int Y1,int X2,int Y2)
	{
	m_X1 = X1;
	m_Y1 = Y1;
	m_X2 = X2;
	m_Y2 = Y2;
		}
	void Draw (CDC* pDC);

};
// 064Doc.h : interface of the CMy064Doc class
//
class CMy064Doc : public CDocument
{
protected: // create from serialization only
	CMy064Doc();
	DECLARE_DYNCREATE(CMy064Doc)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMy064Doc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:
	void DeleteAll();
	virtual ~CMy064Doc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:
 	CTypedPtrArray<CObArray,CLine*> m_LineArray;  //定义CLine类型的数组类
	void DeleteContents() ;
public:
	//往m_LineArray中添加线段
	void AddLine(int X1,int Y1, int X2,int Y2)
	{
	 	CLine* pLine  = new CLine(X1,Y1,X2,Y2);//创建直线
	 	m_LineArray.Add(pLine);//添加
	}

//得到直线个数
	int GetNumLine();
//得到直线
 	CLine* GetLine(int Index);
	


// Generated message map functions
protected:
	//{{AFX_MSG(CMy064Doc)
	afx_msg void OnEditUndo();

	afx_msg void OnEditReset();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};



/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_064DOC_H__DD9F69FA_112D_4B4B_8DF7_F8BC86B80F4B__INCLUDED_)
