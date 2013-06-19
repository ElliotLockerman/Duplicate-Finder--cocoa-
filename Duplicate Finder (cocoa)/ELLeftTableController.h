//
//  ELLeftTableController.h
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/18/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELLeftTableController : NSObject

@property (strong) NSArray *arrayForTable;
@property (weak) IBOutlet NSTableView *tableview;


-(id)initWithInput:(NSArray*)input;

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tabelView;

- (id)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row;

-(void)printArray;

-(void)refresh;

@end
