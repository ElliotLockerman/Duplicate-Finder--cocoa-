//
//  AppDelegate.m
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/16/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import "AppDelegate.h"
#import "ELCentralController.h"

@implementation AppDelegate

@synthesize centralController;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    centralController = [[ELCentralController alloc] init];
    
    
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication
{
    return YES;
}


@end
