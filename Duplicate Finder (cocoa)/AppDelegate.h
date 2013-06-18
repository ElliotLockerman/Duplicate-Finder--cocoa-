//
//  AppDelegate.h
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/16/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ELCentralController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

//@property (assign) IBOutlet NSWindow *window;
@property ELCentralController *centralController;

@end
