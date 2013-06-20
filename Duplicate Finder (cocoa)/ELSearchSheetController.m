//
//  ELSearchSheetController.m
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/20/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import "ELSearchSheetController.h"

@implementation ELSearchSheetController



- (id)initWithWindow:(NSWindow *)awindow
{
    self = [super initWithWindow:awindow];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(void)showSheet
{
    [NSBundle loadNibNamed:@"SearchSheet" owner:self];

    NSLog(@"%@", searchSheetReference);

    [NSApp beginSheet:searchSheetReference
       modalForWindow:duplicateFinderReference
        modalDelegate:self
       didEndSelector:@selector(didEndSheet:returnCode:contextInfo:)
          contextInfo:nil];

}


- (IBAction)closeSearch:(id)sender
{
    [NSApp endSheet:searchSheetReference];
}

- (void)didEndSheet:(NSWindow *)sheet returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo
{
    [sheet orderOut:self];
}

@end
