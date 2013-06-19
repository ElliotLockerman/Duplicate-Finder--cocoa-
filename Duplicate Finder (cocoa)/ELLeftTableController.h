//
//  ELLeftTableController.h
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/18/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELLeftTableController : NSObject{
   
    IBOutlet NSTableView *leftTableReference;

}


-(id)initWithInput:(NSArray*)input;

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tabelView;

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row;

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification;


-(NSInteger *)currentRow;

-(void)setCurrentRow:(NSInteger *)newValue;


-(NSMutableString *)currentSelectedLeftRow;

-(void)setCurrentSelectedLeftRow:(NSMutableString *)newValue;

@end
