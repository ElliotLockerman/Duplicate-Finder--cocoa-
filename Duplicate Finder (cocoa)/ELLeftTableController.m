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

@synthesize tableview;


-(id)initWithInput:(NSArray*)input;
{
    self = [super init];
    if (!self) return nil;
    else if (self)
    {
        arrayForTable = [[NSArray alloc] initWithArray:input];
        NSLog(@"arrayForTable in init: %@", arrayForTable);

    }
    return self;
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    NSLog(@"arrayForTable in table: %@", arrayForTable);

    
    return [arrayForTable count];
}


- (id)tableView:(NSTableView *)tableView
viewForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row
{
    NSLog(@"arrayForTable in table2: %@", arrayForTable);

    
    NSTextField *result = [tableView makeViewWithIdentifier:@"leftColumn" owner:self];
    result.stringValue = [arrayForTable objectAtIndex:row];
    
    return result;
}


@end
