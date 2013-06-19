//
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/17/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//
// TODO: Disable button if there is no specified path. 
// TODO: Check if path is valid; show alert and end if not.
// TODO: Show progress bar window while processing. 


#import "ELCentralController.h"
#import "ELDuplicateFiles.h"
#import "ELLeftTableController.h"

@implementation ELCentralController

ELLeftTableController *leftTableController;


@synthesize selectedURL;
@synthesize arrayOfFilesToIgnore;
@synthesize duplicateFiles;
@synthesize outputWindowController;

// For the "Select Folder" button. 
- (IBAction)openExistingDocument:(id)sender
{
        
    NSOpenPanel* panel = [NSOpenPanel openPanel];
    
    //Disable file selection
    [panel setCanChooseFiles: false];
    
    //Enable folder selection
    [panel setCanChooseDirectories: true];
    
    // This method displays the panel and returns immediately.
    // The completion handler is called when the user selects an
    // item or cancels the panel.
    [panel beginWithCompletionHandler:^(NSInteger result)
    {
        if (result == NSFileHandlingPanelOKButton)
        {
            self.selectedURL = [[panel URLs] objectAtIndex:0];
            NSLog(@"The path is: %@", self.selectedURL);
        }
        
    }];
    
}


// For clicking the "Search" button. Generates the duplicate dictionary and displays the results. 
-(IBAction)searchForDuplicatesAndDisplayResults:(id)sender
{
    // Make and call the dictionary object
    duplicateFiles = [[ELDuplicateFiles alloc] init];
    [duplicateFiles generateDuplicatesFromURL:(id)self.selectedURL
                                  ignoringTheFiles:(id)self.arrayOfFilesToIgnore];

    // Call to display output window
    

    outputWindowController = [[NSWindowController alloc] initWithWindowNibName: @"outputWindow"];
    
    
    leftTableController = [[ELLeftTableController alloc] initWithInput:[duplicateFiles arrayOfDuplicateFiles]];
    

    [outputWindowController showWindow:self];


}

- (IBAction)updateRightColumn:(id)sender
{

    NSLog(@"-----------------------------------\n");
    NSLog(@"Selected object in central controller is: %@",[leftTableController currentSelectedLeftRow]);
}

@end
