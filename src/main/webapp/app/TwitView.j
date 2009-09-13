@import <AppKit/CPView.j>
@import <AppKit/CPTextField.j>

@implementation TwitView : CPView
{
  CPTextField _label;
}

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
 
   _label = [[CPTextField alloc] initWithFrame:frame];
  [_label setFont:[CPFont systemFontOfSize:12]];
  [_label setTextColor:[CPColor whiteColor]];
  [_label setAutoresizingMask:CPViewWidthSizable];
  [_label setLineBreakMode:CPLineBreakByWordWrapping];
  
  [self addSubview:_label]; 
  
  return self;
}

- (void)setRepresentedObject:(JSONObject)obj
{
  CPLog.debug(obj.text);
  
  [_label setStringValue:obj.text];
}

@end