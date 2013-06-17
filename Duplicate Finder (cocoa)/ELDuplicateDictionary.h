//
//  duplicateDictionary.h
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/16/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DuplicateDictionary : NSObject

@property NSDictionary *duplicateDictionary;
@property NSString *pathOfFolderToSearch;
@property NSIndexSet *filesToIgnore;

- (IBAction)openExistingDocument:(id)sender;
-(void) generateDictionary;
-(void) displayDictionary;

@end
