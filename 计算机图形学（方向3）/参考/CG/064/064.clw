; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CMy064View
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "064.h"
LastPage=0

ClassCount=8
Class1=CMy064App
Class2=CMy064Doc
Class3=CMy064View
Class4=CMainFrame

ResourceCount=11
Resource1=IDD_ABOUTBOX
Resource2=IDD_DIALOG1
Class5=CAboutDlg
Class6=Cdlg
Resource3=IDD_DIALOG4
Class7=Cdlg2
Resource4=IDR_MAINFRAME
Class8=Cdlg3
Resource5=IDD_DIALOG2
Resource6=IDD_DIALOG3
Resource7=IDD_ABOUTBOX (Chinese (P.R.C.))
Resource8=IDD_DIALOG1 (Chinese (P.R.C.))
Resource9=IDD_DIALOG2 (Chinese (P.R.C.))
Resource10=IDR_MAINFRAME (Chinese (P.R.C.))
Resource11=IDD_DIALOG3 (Chinese (P.R.C.))

[CLS:CMy064App]
Type=0
HeaderFile=064.h
ImplementationFile=064.cpp
Filter=N

[CLS:CMy064Doc]
Type=0
HeaderFile=064Doc.h
ImplementationFile=064Doc.cpp
Filter=N
LastObject=CMy064Doc
BaseClass=CDocument
VirtualFilter=DC

[CLS:CMy064View]
Type=0
HeaderFile=064View.h
ImplementationFile=064View.cpp
Filter=C
BaseClass=CView
VirtualFilter=VWC
LastObject=CMy064View


[CLS:CMainFrame]
Type=0
HeaderFile=MainFrm.h
ImplementationFile=MainFrm.cpp
Filter=T
LastObject=ID_CUT_MIDPOINT




[CLS:CAboutDlg]
Type=0
HeaderFile=064.cpp
ImplementationFile=064.cpp
Filter=D
LastObject=CAboutDlg

[DLG:IDD_ABOUTBOX]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[MNU:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_FILE_SAVE_AS
Command5=ID_FILE_PRINT
Command6=ID_FILE_PRINT_PREVIEW
Command7=ID_FILE_PRINT_SETUP
Command8=ID_FILE_MRU_FILE1
Command9=ID_APP_EXIT
Command10=ID_EDIT_UNDO
Command11=ID_EDIT_RESET
Command12=ID_EDIT_CUT
Command13=ID_EDIT_COPY
Command14=ID_EDIT_PASTE
Command15=ID_VIEW_TOOLBAR
Command16=ID_VIEW_STATUS_BAR
Command17=ID_DRAWLINE_DLG1
Command18=ID_DRAWLINE_MIDP
Command19=ID_DRAWLINE_BRASEN
Command20=ID_QUXIAN_CIRCLE
Command21=ID_QUXIAN_ECLIP
Command22=ID_CUT_LIANG
Command23=ID_CUT_MIDPOINT
Command24=ID_APP_ABOUT
CommandCount=24

[ACL:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_FILE_PRINT
Command5=ID_EDIT_UNDO
Command6=ID_EDIT_CUT
Command7=ID_EDIT_COPY
Command8=ID_EDIT_PASTE
Command9=ID_EDIT_UNDO
Command10=ID_EDIT_CUT
Command11=ID_EDIT_COPY
Command12=ID_EDIT_PASTE
Command13=ID_NEXT_PANE
Command14=ID_PREV_PANE
CommandCount=14

[TB:IDR_MAINFRAME]
Type=1
Class=?
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_EDIT_CUT
Command5=ID_EDIT_COPY
Command6=ID_EDIT_PASTE
Command7=ID_FILE_PRINT
Command8=ID_APP_ABOUT
CommandCount=8

[DLG:IDD_DIALOG1]
Type=1
Class=Cdlg
ControlCount=9
Control1=IDOK,button,1342242817
Control2=IDC_EDIT1,edit,1350631552
Control3=IDC_EDIT2,edit,1350631552
Control4=IDC_EDIT3,edit,1350631552
Control5=IDC_EDIT4,edit,1350631552
Control6=IDC_STATIC,static,1342308352
Control7=IDC_STATIC,static,1342308352
Control8=IDC_STATIC,static,1342308352
Control9=IDC_STATIC,static,1342308352

[CLS:Cdlg]
Type=0
HeaderFile=dlg.h
ImplementationFile=dlg.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC
LastObject=IDC_EDIT1

[DLG:IDD_DIALOG2]
Type=1
Class=Cdlg2
ControlCount=7
Control1=IDOK,button,1342242817
Control2=IDC_X0,static,1342308352
Control3=IDC_Y0,static,1342308352
Control4=IDC_RADIUS,static,1342308352
Control5=IDC_EDIT1,edit,1350631552
Control6=IDC_EDIT2,edit,1350631552
Control7=IDC_EDIT3,edit,1350631552

[CLS:Cdlg2]
Type=0
HeaderFile=dlg2.h
ImplementationFile=dlg2.cpp
BaseClass=CDialog
Filter=D
LastObject=IDC_EDIT3
VirtualFilter=dWC

[DLG:IDD_DIALOG3]
Type=1
Class=Cdlg3
ControlCount=9
Control1=IDOK,button,1342242817
Control2=IDC_ELLIPSE_X0,static,1342308865
Control3=IDC_ELLIPSE_Y0,static,1342308865
Control4=IDC_ELLIPSE_A,static,1342308865
Control5=IDC_ELLIPSE_B,static,1342308865
Control6=IDC_EDIT1,edit,1350631552
Control7=IDC_EDIT2,edit,1350631552
Control8=IDC_EDIT3,edit,1350631552
Control9=IDC_EDIT4,edit,1350631552

[CLS:Cdlg3]
Type=0
HeaderFile=dlg3.h
ImplementationFile=dlg3.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC

[DLG:IDD_DIALOG4]
Type=1
Class=?
ControlCount=2
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816

[TB:IDR_MAINFRAME (Chinese (P.R.C.))]
Type=1
Class=?
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_EDIT_CUT
Command5=ID_EDIT_COPY
Command6=ID_EDIT_PASTE
Command7=ID_FILE_PRINT
Command8=ID_APP_ABOUT
CommandCount=8

[MNU:IDR_MAINFRAME (Chinese (P.R.C.))]
Type=1
Class=?
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_FILE_SAVE_AS
Command5=ID_FILE_PRINT
Command6=ID_FILE_PRINT_PREVIEW
Command7=ID_FILE_PRINT_SETUP
Command8=ID_FILE_MRU_FILE1
Command9=ID_APP_EXIT
Command10=ID_EDIT_UNDO
Command11=ID_EDIT_RESET
Command12=ID_EDIT_CUT
Command13=ID_EDIT_COPY
Command14=ID_EDIT_PASTE
Command15=ID_VIEW_TOOLBAR
Command16=ID_VIEW_STATUS_BAR
Command17=ID_DRAWLINE_DLG1
Command18=ID_DRAWLINE_MIDP
Command19=ID_DRAWLINE_BRASEN
Command20=ID_QUXIAN_CIRCLE
Command21=ID_QUXIAN_ECLIP
Command22=ID_CUT_LIANG
Command23=ID_CUT_MIDPOINT
Command24=ID_APP_ABOUT
CommandCount=24

[ACL:IDR_MAINFRAME (Chinese (P.R.C.))]
Type=1
Class=?
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_FILE_PRINT
Command5=ID_EDIT_UNDO
Command6=ID_EDIT_CUT
Command7=ID_EDIT_COPY
Command8=ID_EDIT_PASTE
Command9=ID_EDIT_UNDO
Command10=ID_EDIT_CUT
Command11=ID_EDIT_COPY
Command12=ID_EDIT_PASTE
Command13=ID_NEXT_PANE
Command14=ID_PREV_PANE
CommandCount=14

[DLG:IDD_ABOUTBOX (Chinese (P.R.C.))]
Type=1
Class=?
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[DLG:IDD_DIALOG1 (Chinese (P.R.C.))]
Type=1
Class=?
ControlCount=9
Control1=IDOK,button,1342242817
Control2=IDC_EDIT1,edit,1350631552
Control3=IDC_EDIT2,edit,1350631552
Control4=IDC_EDIT3,edit,1350631552
Control5=IDC_EDIT4,edit,1350631552
Control6=IDC_STATIC,static,1342308352
Control7=IDC_STATIC,static,1342308352
Control8=IDC_STATIC,static,1342308352
Control9=IDC_STATIC,static,1342308352

[DLG:IDD_DIALOG2 (Chinese (P.R.C.))]
Type=1
Class=?
ControlCount=7
Control1=IDOK,button,1342242817
Control2=IDC_X0,static,1342308352
Control3=IDC_Y0,static,1342308352
Control4=IDC_RADIUS,static,1342308352
Control5=IDC_EDIT1,edit,1350631552
Control6=IDC_EDIT2,edit,1350631552
Control7=IDC_EDIT3,edit,1350631552

[DLG:IDD_DIALOG3 (Chinese (P.R.C.))]
Type=1
Class=?
ControlCount=9
Control1=IDOK,button,1342242817
Control2=IDC_ELLIPSE_X0,static,1342308865
Control3=IDC_ELLIPSE_Y0,static,1342308865
Control4=IDC_ELLIPSE_A,static,1342308865
Control5=IDC_ELLIPSE_B,static,1342308865
Control6=IDC_EDIT1,edit,1350631552
Control7=IDC_EDIT2,edit,1350631552
Control8=IDC_EDIT3,edit,1350631552
Control9=IDC_EDIT4,edit,1350631552

