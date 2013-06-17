//
//  duplicateDictionary.m
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/16/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import "ELDuplicateDictionary.h"

@implementation ELDuplicateDictionary

@synthesize duplicateDictionary;



-(void)generateDictionaryFromURL:(id)URL ignoringTheFiles:(id)arrayOfFilesToIgnore;
{
    NSLog(@"Generating...");
    
    NSMutableDictionary *duplicateDictionary = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *allFiles = [[NSMutableDictionary alloc] init];

    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSDirectoryEnumerator *directoryEnumerator = [fileManager enumeratorAtURL:URL
                                                   includingPropertiesForKeys:[NSArray arrayWithObjects:NSURLNameKey,
                                                                              NSURLIsDirectoryKey,nil]
                                                                      options:NSDirectoryEnumerationSkipsHiddenFiles
                                                                 errorHandler:nil];
    
    

    
    for (NSURL *currentURL in directoryEnumerator)
    {
        NSLog(@"-----------------------------------");
        
        NSLog(@"currentURL: %@", currentURL);
        
        NSNumber *currentURLIsDirectory;
        [currentURL getResourceValue:&currentURLIsDirectory forKey:NSURLIsDirectoryKey error:NULL];

        
        if ([currentURLIsDirectory boolValue]==NO) // If its a file; we ignore directories
        {
            // Get the filename
            NSMutableString *currentFileBasename;
            [currentURL getResourceValue:&currentFileBasename forKey:NSURLNameKey error:NULL];
            NSLog(@"currentFileBasename: %@", currentFileBasename);
            
            // Get the location
            NSMutableString *directoryOfCurrentFile = [[NSMutableString alloc] init];
            [directoryOfCurrentFile setString:[[currentURL absoluteString] stringByDeletingLastPathComponent]];
            
            NSLog(@"directoryOfCurrentFile: %@", directoryOfCurrentFile);
            
            // Add to dictionary
            if ([allFiles objectForKey:currentFileBasename] == nil) // If its not a duplicate (at this point)
            {
                [allFiles setObject:directoryOfCurrentFile forKey:currentFileBasename];
                NSLog(@"allFiles: %@", allFiles);
            }
            else //If its a duplicate
            {
                if ([duplicateDictionary objectForKey:currentFileBasename] == nil) // If its not already in the duplicate dictionary
                {
                    // Add the key and BOTH paths
                    NSMutableString *bothURLs = [[NSMutableString alloc] init];
                    bothURLs = directoryOfCurrentFile;
                    [bothURLs appendFormat:@",%@", [allFiles objectForKey:currentFileBasename]];
                    
                    [duplicateDictionary setObject:bothURLs forKey:currentFileBasename];
                    NSLog(@"duplicateDictionary: %@", duplicateDictionary);

                }
                else // If its already in the duplciate dictionary
                {
                    //Concatenate current URL to object
                    NSMutableString *newURL = [[NSMutableString alloc] init];
                    newURL = [duplicateDictionary objectForKey:currentFileBasename];
                    [newURL appendFormat:@",%@", directoryOfCurrentFile];
                    
                    [duplicateDictionary setObject:newURL forKey:currentFileBasename];
                    NSLog(@"duplicateDictionary: %@", duplicateDictionary);

                }
                
            }
        }
    
        
        
    }
    
    NSLog(@"------------------------------\n duplicateDictionary: %@", duplicateDictionary);
    
    
}

@end
