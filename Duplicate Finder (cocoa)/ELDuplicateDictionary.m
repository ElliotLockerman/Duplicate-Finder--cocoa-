//
//  duplicateDictionary.m
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/16/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import "DuplicateDictionary.h"

@implementation DuplicateDictionary

@synthesize duplicateDictionary;
@synthesize pathOfFolderToSearch;
@synthesize filesToIgnore;

- (IBAction)openExistingDocument:(id)sender {
    NSOpenPanel* panel = [NSOpenPanel openPanel];
    
    //Disable file selection
    [panel setCanChooseFiles: false];
    
    //Enable folder selection
    [panel setCanChooseDirectories: true];
    
    // This method displays the panel and returns immediately.
    // The completion handler is called when the user selects an
    // item or cancels the panel.
    [panel beginWithCompletionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {
            pathOfFolderToSearch = [[panel URLs] objectAtIndex:0];
            NSLog(@"The path was: %@", pathOfFolderToSearch);
        }
        
    }];
    //Print to textfield

}

-(void)generateDictionary
{
    
}

@end
