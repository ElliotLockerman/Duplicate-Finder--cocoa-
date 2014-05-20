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
// TODO: Complete Menu


#import "ELCentralController.h"
#import "ELDuplicateFiles.h"
#import "ELLeftTableController.h"
#import "ELRightTableController.h"
#import "ELSearchSheetController.h"

@implementation ELCentralController

ELDuplicateFiles *duplicateFiles;
ELLeftTableController *leftTableController;
ELRightTableController *rightTableController;
NSMutableArray *arrayOfLocationsForSelected;

NSTableView *_leftTableCentralReference;
NSTableView *_rightTableCentralReference;

@synthesize selectedURL;
@synthesize arrayOfFilesToIgnore;
@synthesize outputWindowController;



-(IBAction)newSearch:(id)sender
{
    // For some reason, the value of the outlets is null when called by certain fuctions, (including init) 
    _leftTableCentralReference = leftTableCentralReference;
    _rightTableCentralReference = rightTableCentralReference;

    
    
    searchSheetController = [[ELSearchSheetController alloc] initWithWindowNibName:@"SearchSheet"];

    
    //[NSBundle loadNibNamed:@"SearchSheet" owner:self];
    
    assert ([searchSheetController window]);
    assert (duplicateFinderReference);
    
    [NSApp beginSheet:[searchSheetController window]
       modalForWindow:duplicateFinderReference
        modalDelegate:self
       didEndSelector:@selector(didEndSheet:returnCode:contextInfo:)
          contextInfo:nil];

    
}

- (IBAction)closeSearchSheet:(id)sender
{

    assert(searchSheetReference);
    [NSApp endSheet:searchSheetReference];
}


- (void)didEndSheet:(NSWindow *)sheet returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo
{

    [sheet orderOut:self];
}




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
    [self closeSearchSheet:nil];
    
    NSLog(@"%@", selectedURL);

    
    // Make and call the dictionary object
    duplicateFiles = [[ELDuplicateFiles alloc] init];
    int status = [duplicateFiles generateDuplicatesFromURL:(id)self.selectedURL
                                          ignoringTheFiles:(id)self.arrayOfFilesToIgnore];
    
    
    // Check result status: if failure, return
    if (status == 0) return;

    leftTableController = [[ELLeftTableController alloc] initWithInput:[duplicateFiles arrayOfDuplicateFiles]]; // Create left table controller, and pass it the array of filenames.
    
    // Draw right table with as if left default (index 0) was selected
    arrayOfLocationsForSelected = [[NSMutableArray alloc] init];
    [arrayOfLocationsForSelected addObjectsFromArray:[[[duplicateFiles dictionaryOfDuplicateFilesAndLocations] valueForKey:[[duplicateFiles arrayOfDuplicateFiles] objectAtIndex:0]] componentsSeparatedByString:@","]]; // Add objects from array produced by: Get the dictionary from duplicatefiles. Get the object for the first key (the defaut). Split the values by a comma, producing an array.
    rightTableController = [[ELRightTableController alloc] initWithInput:arrayOfLocationsForSelected]; // Create the right table controller give it default input 
    
    
    [_leftTableCentralReference reloadData]; // Redraw the right column
    [_rightTableCentralReference reloadData]; // Redraw the right column
    


}

// For clicking on the left column
- (IBAction)updateRightColumnWhenLeftIsChanged:(id)sender
{
    if ([_leftTableCentralReference selectedRow] <= [[duplicateFiles arrayOfDuplicateFiles] count])
    {
    [arrayOfLocationsForSelected removeAllObjects];
    [arrayOfLocationsForSelected addObjectsFromArray:[[[duplicateFiles dictionaryOfDuplicateFilesAndLocations] valueForKey:[[duplicateFiles arrayOfDuplicateFiles] objectAtIndex:[_leftTableCentralReference selectedRow]]] componentsSeparatedByString:@","]]; // Create an array of locations were the currently selected file is. Do ths by: Get the dictionary from duplicatefiles. Get the object stored at they key of the curren selection, found by getting the object in array of duplicafiles at the index of the current row.
    
    
    [rightTableController setArrayForRightTable:arrayOfLocationsForSelected]; //Feed the array of locations to the right column. 
    [_rightTableCentralReference reloadData]; // Redraw the right column
    }
}


- (IBAction)showInFinderWhenRightColumnIsClicked:(id)sender
{
    if ([_rightTableCentralReference selectedRow] <= [arrayOfLocationsForSelected count] && arrayOfLocationsForSelected != NULL)
    {
        NSURL *currentURL = [[NSURL alloc] initWithString:[arrayOfLocationsForSelected objectAtIndex:[_rightTableCentralReference selectedRow]]];
        NSArray *currentURLInArray = [[NSArray alloc] initWithObjects:currentURL,nil];
        [[NSWorkspace sharedWorkspace] activateFileViewerSelectingURLs:currentURLInArray];
    }
}



@end
