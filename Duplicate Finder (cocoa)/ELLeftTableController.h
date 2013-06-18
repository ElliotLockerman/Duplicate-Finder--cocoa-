//
//  ELLeftTableController.h
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/18/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELLeftTableController : NSObject

- (void/*NSInteger*/)numberOfRowsInTableView:(NSTableView *)tabelView;
- (id)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row;

@end
