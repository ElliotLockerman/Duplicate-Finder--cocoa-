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
        
    }
    return self;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{

    return [arrayForRightTable count];
}

- (id)tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row
{

    NSTextField *result/*.stringValue*/ = [arrayForRightTable objectAtIndex:row];


    
    return result;
}

-(void)setArrayForRightTable:(NSArray *)newValue
{
    [arrayForRightTable removeAllObjects];
    [arrayForRightTable addObjectsFromArray:newValue];
    
    
    [rightTableReference reloadData];
}

-(NSArray *)arrayForRightTable
{
    return arrayForRightTable;
}


@end
