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

-(IBAction)test:(id)sender;

-(id)initWithInput:(NSArray*)input;

-(void)outletTest;

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView;

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row;

@end
