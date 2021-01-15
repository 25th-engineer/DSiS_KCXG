// 064Doc.cpp : implementation of the CMy064Doc class
//

#include "stdafx.h"
#include "064.h"

#include "064Doc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CMy064Doc

IMPLEMENT_DYNCREATE(CMy064Doc, CDocument)

BEGIN_MESSAGE_MAP(CMy064Doc, CDocument)
	//{{AFX_MSG_MAP(CMy064Doc)
	ON_COMMAND(ID_EDIT_UNDO, OnEditUndo)
	ON_COMMAND(ID_EDIT_RESET, OnEditReset)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMy064Doc construction/destruction

CMy064Doc::CMy064Doc()
{
	// TODO: add one-time construction code here

}

CMy064Doc::~CMy064Doc()
{
}

BOOL CMy064Doc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}
int CMy064Doc::GetNumLine(){return m_LineArray.GetSize();}
CLine* CMy064Doc::GetLine(int Index)
{
	if(Index<0 || Index>m_LineArray.GetUpperBound())
		return 0;
	else
		return m_LineArray.GetAt(Index);
}



/////////////////////////////////////////////////////////////////////////////
// CMy064Doc serialization

void CMy064Doc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: add storing code here
	}
	else
	{
		// TODO: add loading code here
	}
}

/////////////////////////////////////////////////////////////////////////////
// CMy064Doc diagnostics

#ifdef _DEBUG
void CMy064Doc::AssertValid() const
{
	CDocument::AssertValid();
}

void CMy064Doc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CMy064Doc commands
//画出该线段
void CLine::Draw(CDC* pDC)
{
	pDC->MoveTo(m_X1,m_Y1);
	pDC->LineTo(m_X2,m_Y2);

}

void CMy064Doc::OnEditUndo() 
{
	// TODO: Add your command handler code here
		int k=m_LineArray.GetUpperBound ();
	if(k>-1){
	delete m_LineArray.GetAt (k);
	m_LineArray.RemoveAt (k);}
	UpdateAllViews(0);
}
void CMy064Doc::DeleteContents() 
{
	// TODO: Add your specialized code here and/or call the base class
	
	int k=m_LineArray.GetSize ();
	while(k--)
	
    delete m_LineArray.GetAt (k);
	m_LineArray.RemoveAll ();
	
	CDocument::DeleteContents();
}

void CMy064Doc::OnEditReset() ///刷新画布
{
	 DeleteContents();
	 	UpdateAllViews(0);
 
}
void CMy064Doc::DeleteAll() /// 
{
	 DeleteContents();
	 //	UpdateAllViews(0);
 
}
