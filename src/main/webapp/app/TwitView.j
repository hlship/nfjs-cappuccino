@import <AppKit/CPView.j>
@import <AppKit/CPTextField.j>

@implementation TwitView : CPView
{
  CPTextField _label;
}

- (void) setRepresentedObject:(JSONObject)obj
{
  CPLog.debug("Adding status: " + obj.text);
  
  if (!_label)
  {
    _label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
    [_label setFont:[CPFont systemFontOfSize:12]];
    [_label setTextColor:[CPColor whiteColor]];
    [self addSubview:_label];
  }
  
  [_label setStringValue:obj.text];

  [_label setFrameSize:CGSizeMake(600, 60)];
  [_label setFrameOrigin:CGPointMake(10, 0)];
  
  [_label setLineBreakMode:CPLineBreakByWordWrapping];
}

- (void)setSelected:(BOOL)isSelected
{
  var color = isSelected ? [CPColor blueColor] : nil;
  
  [self setBackgroundColor:color];
}

@end