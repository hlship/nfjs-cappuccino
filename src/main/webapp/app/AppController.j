/*
 * AppController.j
 * app
 *
 * Created by Howard M. Lewis Ship on September 3, 2009.
 * Copyright 2009, Howard M. Lewis Ship All rights reserved.
 */

@import <Foundation/CPObject.j>
@import "CalcWindow.j"


@implementation AppController : CPObject
{
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CalcWindow alloc] init],
      contentView = [theWindow contentView];

    var label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];

    [label setStringValue:"Hello World using CalcWindow!"];
    [label setFont:[CPFont boldSystemFontOfSize:18.0]];

    [label sizeToFit];

    [label setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [label setCenter:[contentView center]];

    [contentView addSubview:label];

    [theWindow orderFront:self];

    // Uncomment the following line to turn on the standard menu bar.
    //[CPMenu setMenuBarVisible:YES];
}

@end
