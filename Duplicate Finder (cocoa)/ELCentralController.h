//
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/17/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ELDuplicateFiles.h"
#import "ELLeftTableController.h"

@interface ELCentralController : NSObject {
    
    IBOutlet NSWindow *duplicateFinderReference;
    
    IBOutlet NSTableView *rightTableCentralReference;
    IBOutlet NSTableView *leftTableCentralReference;
    

}

@property NSMutableString *selectedURL; //The URL the user has selected or entered in the textfield
@property NSMutableArray *arrayOfFilesToIgnore; // From tokenizer
@property (strong) NSWindowController *outputWindowController;




-(void)newSearch;

- (void)alertDidEnd:(NSAlert *)alert returnCode:(NSInteger)returnCode
        contextInfo:(void *)contextInfo;




- (IBAction)openExistingDocument:(id)sender; // For the "Select Folder" button

- (IBAction)searchForDuplicatesAndDisplayResults:(id)sender; // For the "search" button. In addition to starting the search, opens a new window to display the output.


- (IBAction)updateRightColumnWhenLeftIsChanged:(id)sender;

- (IBAction)showInFinderWhenRightColumnIsClicked:(id)sender;

@end
