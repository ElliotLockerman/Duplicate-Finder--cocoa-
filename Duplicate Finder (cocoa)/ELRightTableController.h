//
//  ELRightTableController.h
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/19/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELRightTableController : NSObject{

    IBOutlet NSTableView *rightTableReference;

}

-(id)initWithInput:(NSArray*)input;

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tabelView;

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row;

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification;


-(NSInteger *)currentRow;

-(void)setCurrentRow:(NSInteger *)newValue;


-(NSArray *)arrayForRightTable;

-(void)setArrayForRightTable:(NSArray *)newValue;

@end
