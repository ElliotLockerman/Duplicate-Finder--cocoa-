//
//  ELSearchSheetController.h
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/20/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELSearchSheetController : NSWindowController{

    IBOutlet NSWindow *duplicateFinderReference;
    IBOutlet NSWindow *searchSheetReference;

}


-(void)showSheet;

- (IBAction)closeSearch:(id)sender;

- (void)didEndSheet:(NSWindow *)sheet returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo;
@end
