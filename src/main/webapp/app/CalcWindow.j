@import <AppKit/CPWindow.j>

@implementation CalcWindow : CPWindow
{
}

- (id) init
{
  [super initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask];
  
  return self;
}

@end
