/*
 * AppController.j
 * app
 *
 * Created by Howard M. Lewis Ship on September 3, 2009.
 * Copyright 2009, TWD Consulting All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <AppKit/CPTextField.j>
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
      
  var button = [CPButton buttonWithTitle:@"Calculator"];
  
  [button setFrameOrigin:CGPointMake(60, 40)];
  
  [contentView addSubview:button];
  
  [button setTarget:self];
  [button setAction:@selector(raiseCalculatorPanel:)];
      
  [window orderFront:self];
  
}

- (void)raiseCalculatorPanel:(id)sender
{
  if (_calcController == nil)
    _calcController = [[CalcController alloc] init];
    
  [_calcController show];
}

@end
