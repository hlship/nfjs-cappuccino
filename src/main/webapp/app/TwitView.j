@import <AppKit/CPView.j>
@import <AppKit/CPTextField.j>

@implementation TwitView : CPView
{
  CPImageView _imageView;
  CPTextField _label;
}

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  
  [self setBackgroundColor:[CPColor colorWithHexString:"d2d2d2"]];
 
  _imageView = [[CPImageView alloc] initWithFrame:CGRectMake(2, 2, 55, 55)];
  [_imageView setHasShadow:YES];
  
  [self addSubview:_imageView];
 
  _label = [[CPTextField alloc] initWithFrame:CPRectMake(57, 0, CPRectGetWidth(frame) - 57, CPRectGetHeight(frame))];
  [_label setFont:[CPFont systemFontOfSize:12]];
  [_label setTextColor:[CPColor blackColor]];
  [_label setAutoresizingMask:CPViewWidthSizable];
  [_label setLineBreakMode:CPLineBreakByWordWrapping];
    
  [self addSubview:_label]; 
  

  return self;
}

- (void)setRepresentedObject:(JSONObject)obj
{
  [_imageView setImage:[[CPImage alloc] initByReferencingFile:obj.user.profile_image_url size:CPSizeMake(55, 55)]];
  [_label setStringValue:obj.text];
}

@end