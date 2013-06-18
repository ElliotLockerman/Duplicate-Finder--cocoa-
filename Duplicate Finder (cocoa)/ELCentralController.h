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

@property NSMutableString *selectedURL; //The URL the user has selected or entered in the textfield
@property NSMutableArray *arrayOfFilesToIgnore; // From tokenizer
@property (strong) NSWindowController *windowController; // To open the output window
@property (strong) ELDuplicateFiles *duplicateDictionary; // To create, store, and manage the duplicate file data. 

- (IBAction)openExistingDocument:(id)sender; // For the "Select Folder" button
- (IBAction)searchForDuplicates:(id)sender; // For the "search" button




@end
