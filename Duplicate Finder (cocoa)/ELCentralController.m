//
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/17/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//
// TODO: Disable button if there is no specified path. 
// TODO: Show progress bar window while processing.
// TODO: Make binding for folder URL box two-way
//  SUBTODO: Check type to use can enter URL or Path, relative or absolute.
// TODO: Make ignore list regex

#import "ELCentralController.h"
#import "ELDuplicateFiles.h"
#import "ELLeftTableController.h"
#import "ELRightTableController.h"

@implementation ELCentralController

ELDuplicateFiles *duplicateFiles;
ELLeftTableController *leftTableController;
ELRightTableController *rightTableController;
NSMutableArray *arrayOfLocationsForSelected;

@synthesize selectedURL;
@synthesize arrayOfFilesToIgnore;
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
    int status = [duplicateFiles generateDuplicatesFromURL:(id)self.selectedURL
                                  ignoringTheFiles:(id)self.arrayOfFilesToIgnore];

    // Check result status: if failure, return
    if (status == 0) return;
    
    // Calls to display output window
    outputWindowController = [[NSWindowController alloc] initWithWindowNibName: @"outputWindow"]; // Create window controller, loaded with xib name. 
    

    leftTableController = [[ELLeftTableController alloc] initWithInput:[duplicateFiles arrayOfDuplicateFiles]]; // Create left table controller, and pass it the array of filenames.
    
    // Draw right table with as if left default (index 0) was selected
    arrayOfLocationsForSelected = [[NSMutableArray alloc] init];
    [arrayOfLocationsForSelected addObjectsFromArray:[[[duplicateFiles dictionaryOfDuplicateFilesAndLocations] valueForKey:[[duplicateFiles arrayOfDuplicateFiles] objectAtIndex:0]] componentsSeparatedByString:@","]]; // Add objects from array produced by: Get the dictionary from duplicatefiles. Get the object for the first key (the defaut). Split the values by a comma, producing an array.
    rightTableController = [[ELRightTableController alloc] initWithInput:arrayOfLocationsForSelected]; // Create the right table controller give it default input 
    
    
    
    [outputWindowController showWindow:self]; //Show the output window.


}

// For clicking on the left column
- (IBAction)updateRightColumnWhenLeftIsChanged:(id)sender
{
    
    [arrayOfLocationsForSelected removeAllObjects];
    [arrayOfLocationsForSelected addObjectsFromArray:[[[duplicateFiles dictionaryOfDuplicateFilesAndLocations] valueForKey:[[duplicateFiles arrayOfDuplicateFiles] objectAtIndex:[leftTableCentralReference selectedRow]]] componentsSeparatedByString:@","]]; // Create an array of locations were the currently selected file is. Do ths by: Get the dictionary from duplicatefiles. Get the object stored at they key of the curren selection, found by getting the object in array of duplicafiles at the index of the current row.
    
    
    [rightTableController setArrayForRightTable:arrayOfLocationsForSelected]; //Feed the array of locations to the right column. 
    [rightTableCentralReference reloadData]; // Redraw the right column 
}


- (IBAction)showInFinderWhenRightColumnIsClicked:(id)sender
{
    if ([rightTableCentralReference selectedRow] <= [arrayOfLocationsForSelected count])
    {
        NSURL *currentURL = [[NSURL alloc] initWithString:[arrayOfLocationsForSelected objectAtIndex:[rightTableCentralReference selectedRow]]];
        NSArray *currentURLInArray = [[NSArray alloc] initWithObjects:currentURL,nil];
        [[NSWorkspace sharedWorkspace] activateFileViewerSelectingURLs:currentURLInArray];
    }
}
@end
