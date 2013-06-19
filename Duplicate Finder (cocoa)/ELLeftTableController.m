//
//  ELLeftTableController.m
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/18/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import "ELLeftTableController.h"

@implementation ELLeftTableController

NSArray *arrayForLeftTable;


-(id)initWithInput:(NSArray*)input;
{
    self = [super init];
    if (!self) return nil;
    else if (self)
    {
        arrayForLeftTable = [[NSArray alloc] initWithArray:input];

    }
    return self;
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [arrayForLeftTable count];
}


- (id)tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row
{
    

    
    //NSTextField *result = [self.tableView makeViewWithIdentifier:@"leftColumn" owner:self]; //Everyone had this, but i dont seem to need it.

    NSTextField *result/*.stringValue*/ = [arrayForLeftTable objectAtIndex:row];
    
    return result;
}

@end
