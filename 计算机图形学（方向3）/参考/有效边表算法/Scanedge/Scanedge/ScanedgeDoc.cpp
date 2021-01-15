// ScanedgeDoc.cpp : CScanedgeDoc 类的实现
//

#include "stdafx.h"
#include "Scanedge.h"

#include "ScanedgeDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CScanedgeDoc

IMPLEMENT_DYNCREATE(CScanedgeDoc, CDocument)

BEGIN_MESSAGE_MAP(CScanedgeDoc, CDocument)
END_MESSAGE_MAP()


// CScanedgeDoc 构造/析构

CScanedgeDoc::CScanedgeDoc()
{
	// TODO: 在此添加一次性构造代码

}

CScanedgeDoc::~CScanedgeDoc()
{
}

BOOL CScanedgeDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: 在此添加重新初始化代码
	// (SDI 文档将重用该文档)

	return TRUE;
}




// CScanedgeDoc 序列化

void CScanedgeDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: 在此添加存储代码
	}
	else
	{
		// TODO: 在此添加加载代码
	}
}


// CScanedgeDoc 诊断

#ifdef _DEBUG
void CScanedgeDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CScanedgeDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG


// CScanedgeDoc 命令
