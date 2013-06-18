//
//  ELController.h
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/17/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ELDuplicateFiles.h"

@interface ELCentralController : NSObject

@property NSMutableString *selectedURL;
@property NSMutableArray *arrayOfFilesToIgnore;
@property (strong) NSWindowController *windowController;
@property (strong) ELDuplicateFiles *duplicateDictionary;

- (IBAction)openExistingDocument:(id)sender;
- (IBAction)searchForDuplicates:(id)sender;




@end
