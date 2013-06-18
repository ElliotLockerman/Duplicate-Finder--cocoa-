//
//  ELController.h
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/17/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELCentralController : NSObject

@property NSMutableString *selectedURL;
@property NSMutableArray *arrayOfFilesToIgnore;
@property NSMutableDictionary *duplicateDictionary;
@property(strong) NSWindowController *windowController;
@property NSArray *duplicateFilesArray;

- (IBAction)openExistingDocument:(id)sender;
- (IBAction)searchForDuplicates:(id)sender;

-(int)numberOfRowsInTableView:(NSTableView *)tabelView;
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row;


@end
