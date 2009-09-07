@import <Foundation/CPObject.j>
@import <AppKit/CPPanel.j>

@implementation TwitterController : CPObject
{
  CPPanel _panel;
}

- (id)init
{
  self = [super init];
  
  if (self)
  {
    _panel = [[CPPanel alloc] initWithContentRect:CGRectMake(20, 30, 184, 184)
                              styleMask:CPHUDBackgroundWindowMask | CPClosableWindowMask | CPResizableWindowMask];
                            
    [_panel setTitle:@"Twitter"];                            
  }
  
  return self;
}

- (void)show
{
  [_panel orderFront:self];
}

@end