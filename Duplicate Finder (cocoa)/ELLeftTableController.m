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
NSInteger *currentRow;
NSMutableString *currentSelectedLeftRow;

-(id)initWithInput:(NSArray*)input;
{
    self = [super init];
    if (!self) return nil;
    else if (self)
    {
        arrayForTable = [[NSArray alloc] initWithArray:input];
        
        
        currentRow = 0;
        currentSelectedLeftRow = [[NSMutableString alloc] init];
        [self setCurrentSelectedLeftRow:[arrayForTable objectAtIndex:[leftTableReference selectedRow]]];
        
         
        NSLog(@"-----------------------------------\n");
        NSLog(@"leftTableReference in init: %@", leftTableReference);
        NSLog(@"arrayForTable in init: %@", arrayForTable);
        //NSLog(@"currentSelectedLeftRow in init: %@", currentSelectedLeftRow);

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
    
    
    //NSTextField *result = [self.tableView makeViewWithIdentifier:@"leftColumn" owner:self]; //Everyone had this, but i dont seem to need it. 
    NSTextField *result/*.stringValue*/ = [arrayForTable objectAtIndex:row];
    
    //NSLog(@"Object requested by table: %@", result);
    
    return result;
}


- (void)tableViewSelectionDidChange:(NSNotification *)aNotification
{
    NSLog(@"-----------------------------------\n");
    
    NSLog(@"leftTableReference in selection change: %@", leftTableReference);
    
    //[leftTableReference selectedRow];
    
    currentRow = [leftTableReference selectedRow];
    NSLog(@"currentRow: %ld", currentRow);
    
    [self setCurrentSelectedLeftRow:[arrayForTable objectAtIndex:[leftTableReference selectedRow]]];
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
