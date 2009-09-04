/*
 * AppController.j
 * app
 *
 * Created by Howard M. Lewis Ship on September 3, 2009.
 * Copyright 2009, TWD Consulting All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <AppKit/CPTextField.j>


@implementation AppController : CPObject
{
  CPView _contentView;
  CPTextField _display;  
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
  var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask];
      
  _contentView = [theWindow contentView];

  _display = [CPTextField labelWithTitle:"(placeholder)"];
  [_display setFrame:CGRectMake(5, 5, 180, 30)]
  [_display setBezeled:YES];

  [self add:_display];
  
  [self makeButton:7 at:CGRectMake(5, 35, 40, 25)];
  [self makeButton:8 at:CGRectMake(50, 35, 40, 25)];
  [self makeButton:9 at:CGRectMake(95, 35, 40, 25)];
  [self makeButton:"*" at:CGRectMake(140, 35, 40, 25)];

  [self makeButton:4 at:CGRectMake(5, 65, 40, 25)];
  [self makeButton:5 at:CGRectMake(50, 65, 40, 25)];
  [self makeButton:6 at:CGRectMake(95, 65, 40, 25)];
  [self makeButton:"-" at:CGRectMake(140, 65, 40, 25)];

  [self makeButton:1 at:CGRectMake(5, 95, 40, 25)];
  [self makeButton:2 at:CGRectMake(50, 95, 40, 25)];
  [self makeButton:3 at:CGRectMake(95, 95, 40, 25)];
  [self makeButton:"+" at:CGRectMake(140, 95, 40, 25)];

  [self makeButton:0 at:CGRectMake(5, 125, 85, 25)];
  [self makeButton:"." at:CGRectMake(95, 125, 40, 25)];
  [self makeButton:"=" at:CGRectMake(140, 125, 40, 25)];


  [theWindow orderFront:self];
}

- (void)add:(CPView)subview
{
  [_contentView addSubview:subview];
}

- (CPButton)makeButton:value at:(CGRect)frame
{
  var button = [[CPButton alloc] initWithFrame:frame];
    
  [button setTitle:value.toString()];
    
  [self add:button];
  
  return button;
}

@end
