@import <Foundation/CPObject.j>
@import <AppKit/CPPanel.j>
@import <AppKit/CPTextField.j>
@import <AppKit/CPColor.j>

@implementation TwitterController : CPObject
{
  CPPanel _panel;
  CPTextField _field;
}

- (id)init
{
  self = [super init];
  
  if (self)
  {
    _panel = [[CPPanel alloc] initWithContentRect:CGRectMake(20, 30, 245, 184)
                              styleMask:CPHUDBackgroundWindowMask | CPClosableWindowMask | CPResizableWindowMask];
                            
    [_panel setTitle:@"Twitter"];  
    
    
    var label = [CPTextField labelWithTitle:"User:"];
    [[label setFrame:CGRectMake(3, 7, 50, 24)] sizeToFit];
    [label setTextColor:[CPColor whiteColor]];
    
    _field = [CPTextField textFieldWithStringValue:"" placeholder:"Twitter User" width:200];

    [_field setFrame:CGRectMake(40, 0, 200, 28)];
    [_field setTarget:self];
    [_field setAction:@selector(startSearch:)];
    
    var content = [_panel contentView];
    [content addSubview:label];
    [content addSubview:_field];
  }
  
  return self;
}

- (void)show
{
  [_panel orderFront:self];
  [_field becomeFirstResponder];
}

- (void)startSearch:(id)sender
{
  window.alert("startSearch:");
}

@end