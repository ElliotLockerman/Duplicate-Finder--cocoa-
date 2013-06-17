//
//  ELController.m
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/17/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import "ELCentralController.h"
#import "ELDuplicateDictionary.h"

@implementation ELCentralController


@synthesize selectedURL;
@synthesize arrayOfFilesToIgnore;


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


// For clicking the "Search" button.
-(IBAction)searchForDuplicates:(id)sender
{
    
    ELDuplicateDictionary *currentDuplicates = [[ELDuplicateDictionary alloc] init];
    [currentDuplicates generateDictionaryFromURL:(id)self.selectedURL
                                ignoringTheFiles:(id)self.arrayOfFilesToIgnore];
}

@end
