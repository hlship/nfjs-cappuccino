/*
 * AppController.j
 * app
 *
 * Created by Howard M. Lewis Ship on September 3, 2009.
 * Copyright 2009, TWD Consulting All rights reserved.
 */

@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
  
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
  var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
      contentView = [theWindow contentView];


  [theWindow orderFront:self];
}

@end
