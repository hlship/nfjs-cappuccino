@import <AppKit/CPView.j>
@import <AppKit/CPTextField.j>

var silver = [CPColor colorWithHexString:"d2d2d2"];

@implementation TwitView : CPView
{
  CPImageView _imageView;
  CPTextField _label;
}

- (void)setRepresentedObject:(JSONObject)obj
{
  if (!_label)
  {
    // Not sure why it doesn't work when I set the bg color inside init, but it works
    // here.
    [self setBackgroundColor:silver];  

    var bounds = [self bounds];
    
    _imageView = [[CPImageView alloc] initWithFrame:CGRectMake(2, 2, 55, 55)];
    [_imageView setHasShadow:YES];
  
    [self addSubview:_imageView];
    
    var labelBounds = CPRectMake(57, 0, CPRectGetWidth(bounds) - 57, 60);
    
    _label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
    [_label setFont:[CPFont systemFontOfSize:12]];
    [_label setTextColor:[CPColor blackColor]];
    [_label setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
    [_label setFrame:labelBounds];
    [_label setLineBreakMode:CPLineBreakByWordWrapping];

    [self addSubview:_label];
  }
  
  [_imageView setImage:[[CPImage alloc] initByReferencingFile:obj.user.profile_image_url size:CPSizeMake(55, 55)]];
  [_label setStringValue:obj.text];
}

- (void)setSelected:(BOOL)selected
{
  var color = selected ? [CPColor whiteColor] : silver;
  
  [self setBackgroundColor:color];
}

@end