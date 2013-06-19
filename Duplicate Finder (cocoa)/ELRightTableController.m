//
//  ELRightTableController.m
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/19/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import "ELRightTableController.h"

@implementation ELRightTableController

NSMutableArray *arrayForRightTable;


-(id)initWithInput:(NSArray*)input;
{
    self = [super init];
    if (!self) return nil;
    else if (self)
    {
        arrayForRightTable = [[NSMutableArray alloc] initWithArray:input];
        
        
        NSLog(@"-----------------------------------\n");
        NSLog(@"arrayForRightTable in init: %@", arrayForRightTable);
        
    }
    return self;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    NSLog(@"tableView in rightTable, in number of rows, from argument: %@", tableView);
    NSLog(@"arrayForRightTable in table row query: %@", arrayForRightTable);
    return [arrayForRightTable count];
}

- (id)tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row
{
    NSLog(@"tableView in rightTable, in object request, from argument: %@", tableView);
    NSLog(@"rightTableReference in object request: %@", rightTableReference);

    
    NSLog(@"arrayForRightTable in table objectValue query: %@", arrayForRightTable);

    NSTextField *result/*.stringValue*/ = [arrayForRightTable objectAtIndex:row];

    NSLog(@"Object requested by right table: %@", result);

    
    return result;
}

-(void)setArrayForRightTable:(NSArray *)newValue
{
    [arrayForRightTable removeAllObjects];
    [arrayForRightTable addObjectsFromArray:newValue];
    
    NSLog(@"rightTableReference in setArray: %@", rightTableReference);
    
    [rightTableReference reloadData];
}

-(NSArray *)arrayForRightTable
{
    return arrayForRightTable;
}


@end
