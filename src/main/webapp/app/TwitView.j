@import <AppKit/CPView.j>
@import <AppKit/CPTextField.j>

@implementation TwitView : CPView
{
}

- (id)initWithFrame:(CGRect)frame forStatus:(JSONObject)obj
{
  self = [super initWithFrame:frame];
  
  [self setBackgroundColor:[CPColor colorWithHexString:"d2d2d2"]];
 
  var imageView = [[CPImageView alloc] initWithFrame:CGRectMake(2, 2, 55, 55)];
  [imageView setHasShadow:YES];
  [imageView setImage:[[CPImage alloc] initByReferencingFile:obj.user.profile_image_url size:CPSizeMake(55, 55)]];
  
  [self addSubview:imageView];
 
  var label = [[CPTextField alloc] initWithFrame:CPRectMake(57, 0, CPRectGetWidth(frame) - 57, CPRectGetHeight(frame))];
  [label setFont:[CPFont systemFontOfSize:12]];
  [label setTextColor:[CPColor blackColor]];
  [label setAutoresizingMask:CPViewWidthSizable];
  [label setLineBreakMode:CPLineBreakByWordWrapping];
    
  [self addSubview:label]; 
  
  [label setStringValue:obj.text];

  return self;
}

@end