#include "QINAppStoreMainWindow.h"
#include "ui_QINAppStoreMainWindow.h"

#include "INAppStoreWindow/INAppStoreWindow/INWindowButton.h"
#include "INAppStoreWindow/INAppStoreWindow/INAppStoreWindow.h"

#include <QMacNativeWidget>
#include <QDesktopWidget>
#include <QResizeEvent>
#include <QDebug>
#include <QVBoxLayout>
#include <QAbstractEventDispatcher>
#include <Carbon/Carbon.h>
#include <QAction>
#include <QToolBar>
#include <QtMac>

@interface ButtonAction : NSObject
{
                              }
  @property (nonatomic) QAction *action;
- (void) triggered: (NSButton*)button;
@end

@implementation ButtonAction
@synthesize action;
- (void) triggered: (NSButton*)button {
    (void)button;
    action->trigger();
}
@end

QINAppStoreMainWindow::QINAppStoreMainWindow(QWidget *parent) :
    QMainWindow(parent)
{
    setAttribute(Qt::WA_LayoutUsesWidgetRect); // Don't use the layout rect calculated from QMacStyle.
    setWindowFlags(Qt::Widget);

    NSView *myView = reinterpret_cast<NSView *>(winId());
    [myView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];

    setAutoFillBackground(true);

    nativeWidget = new QMacNativeWidget();
    nativeWidget->move(0, 0);
    nativeWidget->setPalette(palette());
    nativeWidget->setAutoFillBackground(true);
    QVBoxLayout *layout = new QVBoxLayout();
    layout->setContentsMargins(0,0,0,0);
    layout->addWidget(this);
    nativeWidget->setLayout(layout);

    // Create INAppStoreWindow
    NSUInteger styleMask = NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask;
    NSRect frame = NSMakeRect(200, QApplication::desktop()->height() - 200, 239, 200);
    NSRect rect = [NSWindow contentRectForFrameRect:frame styleMask:styleMask];

    INAppStoreWindow *window  = [[INAppStoreWindow alloc]
            initWithContentRect:rect
                                styleMask:styleMask
                                backing: NSBackingStoreBuffered
                                defer:false];
    m_windowHandle = window;

    window.trafficLightButtonsLeftMargin = 7.0;
    window.fullScreenButtonRightMargin = 7.0;
    window.centerFullScreenButton = YES;
    window.titleBarHeight = 40.0;

    NSView *nativeWidgetView = reinterpret_cast<NSView *>(nativeWidget->winId());
    NSView *contentView = [window contentView];
    [contentView setAutoresizesSubviews:YES];
    [nativeWidgetView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [nativeWidgetView setAutoresizesSubviews:YES];
    [contentView addSubview:nativeWidgetView positioned:NSWindowAbove relativeTo:nil];
    [nativeWidgetView setFrame:[contentView frame]];

    [window setCenterFullScreenButton:YES];
    [window setFullScreenButtonRightMargin:8.0f];

    QSize size = minimumSizeHint();
    [window setMinSize:NSMakeSize(size.width(), size.height() + 40)];
}

QINAppStoreMainWindow::~QINAppStoreMainWindow()
{
}

void QINAppStoreMainWindow::addTitleBarAction(QAction *action, int x, int y)
{
    INAppStoreWindow *window = reinterpret_cast<INAppStoreWindow *>(m_windowHandle);

    NSView *titleView = window.titleBarView;
    CGFloat currentX = x;
    CGFloat buttonY = y;

    NSButton *button = [[NSButton alloc] initWithFrame:CGRectMake(currentX, buttonY, 23, 23)];
    [button setButtonType:NSMomentaryChangeButton];
    [button setBordered:NO];
    [button setHidden:FALSE];
    [button setAutoresizingMask:NSViewMaxXMargin];
    [button sizeToFit];
    [button setToolTip:[NSString stringWithUTF8String:action->toolTip().toUtf8()]];

    QIcon icon = action->icon();
    if(!icon.isNull()) {
        NSImage *image = QtMac::toNSImage(icon.pixmap(64,QIcon::Active));
        NSImage *image2 = QtMac::toNSImage(icon.pixmap(64,QIcon::Normal));
        [button setImage:image2];
        [button setAlternateImage:image];
    }
    ButtonAction *a = [[ButtonAction alloc] init];
    a.action = action;

    [button setTarget:a];
    [button setAction:@selector(triggered:)];

    [titleView addSubview:button];
}

void QINAppStoreMainWindow::setVisible(bool visible)
{
    QMainWindow::setVisible(visible);
    nativeWidget->setVisible(visible);

    NSWindow *window = reinterpret_cast<NSWindow *>(m_windowHandle);
    QSize size = minimumSizeHint();
    [window setMinSize:NSMakeSize(size.width(), size.height() + 60)];

    if(visible)
        [window makeKeyAndOrderFront:window];
}
