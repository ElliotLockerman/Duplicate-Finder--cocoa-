//
//  ELController.m
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/17/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//
// TODO: Disable button if there is no specified path. 
// TODO: Check if path is valid; show alert and end if not.
// TODO: Show progress bar window while processing. 


#import "ELCentralController.h"
#import "ELDuplicateDictionary.h"

@implementation ELCentralController


@synthesize selectedURL;
@synthesize arrayOfFilesToIgnore;
@synthesize duplicateDictionary;
@synthesize windowController;
@synthesize duplicateFilesArray;

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
    //Print to textfield
    
}


// For clicking the "Search" button. Generates the duplicate dictionary and displays the results. 
-(IBAction)searchForDuplicates:(id)sender
{
    // Make and call the dictionary object
    ELDuplicateDictionary *currentDuplicates = [[ELDuplicateDictionary alloc] init];
    [currentDuplicates generateDictionaryFromURL:(id)self.selectedURL
                                ignoringTheFiles:(id)self.arrayOfFilesToIgnore];
    
    //Get the results
    NSMutableDictionary *duplicateDictionary = [[NSMutableDictionary alloc] init];
    self.duplicateDictionary = currentDuplicates.duplicateDictionary;
    
    NSArray *duplicateFilesArray = [[NSArray alloc] init];
    duplicateFilesArray = [currentDuplicates duplicateFilesArray];
    
    // Open the output window
     self.windowController = [[NSWindowController alloc] init];
    [self.windowController initWithWindowNibName: @"duplicatesWindow"];
    [self.windowController showWindow:self];

    
    // Populate the source list
}

- (int)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [self.duplicateFilesArray count];
}

- (NSView *)tableView:(NSTableView *)tableView
viewForTableColumn:(NSTableColumn *)tableColumn
            row:(int)row
{
    NSTextField *result = [tableView makeViewWithIdentifier:@"filesColumn" owner:self];
    result.stringValue = [self.duplicateFilesArray objectAtIndex:row];

    /*
    if (result == nil)
    {
        result = [[[NSTextField alloc] initWithFrame:frame] autorelease];
        result.identifier = @"filesColumn";
        result.stringValue = [self.duplicateFilesArray objectAtIndex:row];
        
        return result;
    }
     */
    return result;
}
@end
