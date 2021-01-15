// ScanedgeView.h : CScanedgeView 类的接口
//


#pragma once

#define HEIGHT 480

class CScanedgeView : public CView
{
protected: // 仅从序列化创建
	CScanedgeView();
	DECLARE_DYNCREATE(CScanedgeView)

// 属性
public:
	CScanedgeDoc* GetDocument() const;

// 操作
public:
		int chicktime;

// 重写
public:
	virtual void OnDraw(CDC* pDC);  // 重写以绘制该视图
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
protected:

// 实现
public:
	virtual ~CScanedgeView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

public:
	void scanFill(int cnt,struct somedc *pts);
	void buildEdgelist(int cnt,struct somedc *pts,struct tEdge *edges[]);
	void makeEdgeRec(struct somedc lower,struct somedc upper,int yComp,struct tEdge *edge,struct tEdge *edges[]);
	void insertEdge(struct tEdge *list,struct tEdge *edge);
	void buildActivelist(int scan,struct tEdge *active,struct tEdge *edges[]);
	int yNext(int k,int cnt,struct somedc *pts);
	void fillscan(int scan,struct tEdge *active);
	void updateActivelist(int scan,struct tEdge *active);
	void resortActivelist(struct tEdge *active);
	void deleteAfter(struct tEdge *q);

// 生成的消息映射函数
protected:
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnScanfillActiveedge();
public:
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
public:
	afx_msg void OnRButtonDown(UINT nFlags, CPoint point);
};

#ifndef _DEBUG  // ScanedgeView.cpp 中的调试版本
inline CScanedgeDoc* CScanedgeView::GetDocument() const
   { return reinterpret_cast<CScanedgeDoc*>(m_pDocument); }
#endif

