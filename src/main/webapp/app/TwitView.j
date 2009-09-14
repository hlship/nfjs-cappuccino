@import <AppKit/CPView.j>
@import <AppKit/CPTextField.j>

@implementation TwitView : CPView
{
  CPTextField _label;
}

- (void) setRepresentedObject:(JSONObject)obj
{
  if (!_label)
  {
    _label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
    [_label setFont:[CPFont systemFontOfSize:12]];
    [_label setTextColor:[CPColor whiteColor]];
    [_label setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
    [_label setFrame:[self bounds]];
    [_label setLineBreakMode:CPLineBreakByWordWrapping];

    [self addSubview:_label];
  }
  
  [_label setStringValue:obj.text];
}

- (void)setSelected:(BOOL)isSelected
{
  var color = isSelected ? [CPColor blueColor] :nil;

  [self setBackgroundColor:color];
}

@end