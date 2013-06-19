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
NSInteger *currentRow;
NSMutableString *currentSelectedLeftRow;

-(id)initWithInput:(NSArray*)input;
{
    self = [super init];
    if (!self) return nil;
    else if (self)
    {
        arrayForLeftTable = [[NSArray alloc] initWithArray:input];
        
        
        currentRow = 0;
        currentSelectedLeftRow = [[NSMutableString alloc] init];
        [self setCurrentSelectedLeftRow:[arrayForLeftTable objectAtIndex:[leftTableReference selectedRow]]];
        
         
        NSLog(@"-----------------------------------\n");
        NSLog(@"leftTableReference in init: %@", leftTableReference);
        NSLog(@"arrayForLeftTable in init: %@", arrayForLeftTable);
        //NSLog(@"currentSelectedLeftRow in init: %@", currentSelectedLeftRow);

    }
    return self;
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    NSLog(@"-----------------------------------\n");
    NSLog(@"left table tableView in table row query as set by table as argument: %@", tableView);
    NSLog(@"leftTableReference in table row query: %@", leftTableReference);
    NSLog(@"arrayForLeftTable in table row query: %@", arrayForLeftTable);
    
    return [arrayForLeftTable count];
}


- (id)tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row
{
    
    NSLog(@"-----------------------------------\n");
    NSLog(@"arrayForLeftTable in table objectValue query: %@", arrayForLeftTable);
 
    NSLog(@"left table tableView in table object query, as set by table as argument: %@", tableView);

    
    NSLog(@"leftTableReference in table object query: %@", leftTableReference);
    
    
    //NSTextField *result = [self.tableView makeViewWithIdentifier:@"leftColumn" owner:self]; //Everyone had this, but i dont seem to need it. 
    NSTextField *result/*.stringValue*/ = [arrayForLeftTable objectAtIndex:row];
    
    NSLog(@"Object requested by left table: %@", result);
    
    return result;
}


- (void)tableViewSelectionDidChange:(NSNotification *)aNotification
{
    NSLog(@"-----------------------------------\n");
    
    NSLog(@"leftTableReference in selection change: %@", leftTableReference);
    
    //[leftTableReference selectedRow];
    
    currentRow = [leftTableReference selectedRow];
    NSLog(@"currentRow: %ld", currentRow);
    
    [self setCurrentSelectedLeftRow:[arrayForLeftTable objectAtIndex:[leftTableReference selectedRow]]];
    NSLog(@"currentSelectedLeftRow in leftTableController: %@", currentSelectedLeftRow);

}

-(NSInteger *)currentRow
{
    return currentRow;
}

-(void)setCurrentRow:(NSInteger *)newValue;
{
    currentRow = newValue;
}

-(NSMutableString *)currentSelectedLeftRow
{
    return currentSelectedLeftRow;
}

-(void)setCurrentSelectedLeftRow:(NSMutableString *)newValue;
{
    currentSelectedLeftRow = newValue;
}

@end
