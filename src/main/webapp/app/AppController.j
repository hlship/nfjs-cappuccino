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

@implementation AppController : CPObject
{
  CalcController _calcController;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
  var window = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
      contentView = [window contentView];
      
  [contentView addSubview:[self makeButton:@"Calculator" row:0 action:@selector(raiseCalculatorPanel:)]];    
      
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

@end
