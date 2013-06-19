//
//  ELLeftTableController.m
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/18/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import "ELLeftTableController.h"

@implementation ELLeftTableController

NSArray *arrayForTable;


-(id)initWithInput:(NSArray*)input;
{
    self = [super init];
    if (!self) return nil;
    else if (self)
    {
        arrayForTable = [[NSArray alloc] initWithArray:input];
        NSLog(@"-----------------------------------\n");
        NSLog(@"leftTableReference in init: %@", leftTableReference);
        NSLog(@"arrayForTable in init: %@", arrayForTable);

    }
    return self;
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    NSLog(@"-----------------------------------\n");
    NSLog(@"tableView in table row query as set by table as argument: %@", tableView);
    NSLog(@"leftTableReference in table row query: %@", leftTableReference);
    NSLog(@"arrayForTable in table row query: %@", arrayForTable);
    
    return [arrayForTable count];
}


- (id)tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row
{
    NSLog(@"-----------------------------------\n");
    NSLog(@"arrayForTable in table objectValue query: %@", arrayForTable);
 
    NSLog(@"tableView in table object query, as set by table as argument: %@", tableView);

    
    NSLog(@"leftTableReference in table object query: %@", leftTableReference);
    
    
    //NSTextField *result = [self.tableView makeViewWithIdentifier:@"leftColumn" owner:self];
    NSTextField *result/*.stringValue*/ = [arrayForTable objectAtIndex:row];
    
    NSLog(@"Object requested by table: %@", result);
    
    return result;
}


- (void)tableViewSelectionDidChange:(NSNotification *)aNotification
{
    NSLog(@"-----------------------------------\n");
    
    NSLog(@"leftTableReference in selection change: %@", leftTableReference);
    
    //[leftTableReference selectedRow];
    
    NSInteger currentRow = [leftTableReference selectedRow];
    NSLog(@"currentRow: %ld", currentRow);
    
    NSString *rowValue = [arrayForTable objectAtIndex:[leftTableReference selectedRow]];
    NSLog(@"rowValue: %@", rowValue);
    
}



@end
