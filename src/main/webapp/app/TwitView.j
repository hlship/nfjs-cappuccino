@import <AppKit/CPView.j>
@import <AppKit/CPTextField.j>

@implementation TwitView : CPView
{
  CPTextField _label;
}

- (id)initWithFrame:(CGRect)frame forStatus:(JSONObject)obj
{
  self = [super initWithFrame:frame];
 
   _label = [[CPTextField alloc] initWithFrame:frame];
  [_label setFont:[CPFont systemFontOfSize:12]];
  [_label setTextColor:[CPColor whiteColor]];
  [_label setAutoresizingMask:CPViewWidthSizable];
  [_label setLineBreakMode:CPLineBreakByWordWrapping];
  [_label setBackgroundColor:[CPColor blueColor]];
  
  [self addSubview:_label]; 
  
  [_label setStringValue:obj.text];

  return self;
}

@end