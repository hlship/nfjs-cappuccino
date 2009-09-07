/*
 * AppController.j
 * app
 *
 * Created by Howard M. Lewis Ship on September 3, 2009.
 * Copyright 2009, TWD Consulting All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <AppKit/CPButton.j>
@import "CalcController.j"
@import "TwitterController.j"

@implementation AppController : CPObject
{
  CalcController _calcController;
  TwitterController _twitController;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
  var window = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
      contentView = [window contentView];
      
  [contentView addSubview:[self makeButton:@"Calculator" row:0 action:@selector(raiseCalculatorPanel:)]];    
  [contentView addSubview:[self makeButton:@"Twitter" row:1 action:@selector(raiseTwitterPanel:)]];    
      
  [window orderFront:self];
}

- (CPView)makeButton:(CPString)title row:(int)row action:(SEL)action
{
  var button = [CPButton buttonWithTitle:title];
  
  [button setTarget:self];
  [button setAction:action];
  
  [button setFrameOrigin:CGPointMake(60, 30 * row + 40)];
  
  return button;
}

- (void)raiseCalculatorPanel:(id)sender
{
  if (_calcController == nil)
    _calcController = [[CalcController alloc] init];
    
  [_calcController show];
}

-(void)raiseTwitterPanel:(id)sender
{
  if (_twitController == nil)
    _twitController = [[TwitterController alloc] init];
    
  [_twitController show];
}

@end
