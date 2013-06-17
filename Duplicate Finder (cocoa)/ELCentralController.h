//
//  ELController.h
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/17/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELCentralController : NSObject

@property NSMutableString *path;
@property NSMutableArray *arrayOfFilesToIgnore;

- (IBAction)openExistingDocument:(id)sender;




@end
