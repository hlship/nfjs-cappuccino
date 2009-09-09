@import <Foundation/CPObject.j>
@import <AppKit/CPPanel.j>
@import <AppKit/CPTextField.j>
@import <AppKit/CPColor.j>
@import <AppKit/CPScrollView.j>
@import "TwitView.j"

@implementation TwitterController : CPObject
{
  CPPanel _panel;
  CPTextField _field;
  CPCollectionView _timelineView;
}

- (id)init
{
  self = [super init];
  
  _panel = [[CPPanel alloc] initWithContentRect:CGRectMake(20, 30, 245, 184)
                            styleMask:CPHUDBackgroundWindowMask | CPClosableWindowMask | CPResizableWindowMask];
                          
  [_panel setTitle:@"Twitter"];  
  [_panel setMinSize:CGSizeMake(245, 184)];
  
  var content = [_panel contentView];

  var label = [CPTextField labelWithTitle:"User:"];
  [label setFrame:CGRectMake(3, 7, 50, 24)];
  [label setTextColor:[CPColor whiteColor]];
  
  _field = [CPTextField textFieldWithStringValue:"" placeholder:"Twitter User" width:200];

  [_field setFrame:CGRectMake(40, 0, 200, 28)];
  [_field setTarget:self];
  [_field setAction:@selector(startSearch:)];
  [_field setAutoresizingMask:CPViewWidthSizable];
  
  var scrollView = [[CPScrollView alloc] initWithFrame:CGRectMake(3, 40,
                CGRectGetWidth([content bounds]) - 10, 
                CGRectGetHeight([content bounds]) - 50)];
  
  [scrollView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];    
  [scrollView setAutohidesScrollers:YES];
  [scrollView setBackgroundColor:[CPColor greenColor]]; // TEMP

  var scrollViewBounds = [[scrollView contentView] bounds];

  var itemPrototype = [[CPCollectionViewItem alloc] init]; 
  [itemPrototype setView:[[TwitView alloc] initWithFrame:CGRectMakeZero()]];

  _timelineView = [[CPCollectionView alloc] initWithFrame:CGRectMake(0, 0, 
    CGRectGetWidth(scrollViewBounds), 60)];
  [_timelineView setItemPrototype:itemPrototype];
  [_timelineView setDelegate:self];
  [_timelineView setMaxNumberOfColumns:1];
  
  [_timelineView setBackgroundColor:[CPColor darkGrayColor]]; // TEMP
  
  [_timelineView setMinItemSize:CGSizeMake(100, 60)];
  [_timelineView setMaxItemSize:CGSizeMake(1000, 60)];
  [_timelineView setAutoresizingMask:CPViewWidthSizable];
  
  [scrollView setDocumentView:_timelineView];
  
  [content addSubview:label];
  [content addSubview:_field];
  [content addSubview:scrollView];
    
  return self;
}

- (void)show
{
  [_panel orderFront:self];
  [_field becomeFirstResponder];
}

- (void)startSearch:(id)sender
{
  // Simulate the call to twitter.com, using a cached copy of the response.
  // Because of single-source policy, we'll need to implement a servlet at /twitter
  // than can get the content from the real site and pass it to the browser.
  var url = "twitter/statuses/user_timeline/" + [_field stringValue] + ".json";
  
  var request = [CPURLRequest requestWithURL:url];
  [CPURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(CPURLConnection)connection didReceiveData:(CPString)data
{
  var timeline = JSON.parse(data);
  
  [_timelineView setContent:timeline];
}


- (void)connection:(CPURLConnection)connection didFailWithError:(CPString)error
{
  CPLog.error(error);
}

@end