//
//  ELLeftTableController.m
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/18/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import "ELLeftTableController.h"
#import "ELCentralController.h"
#import "ELDuplicateDictionary.h"

@implementation ELLeftTableController

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
//    return [.duplicateDictionary.duplicateFilesArray count];
}


- (id)tableView:(NSTableView *)tableView
viewForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row
{
    NSTextField *result = [tableView makeViewWithIdentifier:@"filesColumn" owner:self];
 //   result.stringValue = [ELCentralController.duplicateFilesArray objectAtIndex:row];
    
    /*
     if (result == nil)
     {
     result = [[[NSTextField alloc] initWithFrame:frame] autorelease];
     result.identifier = @"filesColumn";
     result.stringValue = [self.duplicateFilesArray objectAtIndex:row];
     
     return result;
     }
     */
    return result;
}


@end
