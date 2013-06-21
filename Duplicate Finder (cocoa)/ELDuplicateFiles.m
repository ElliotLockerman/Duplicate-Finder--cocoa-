//
//  ELDuplicateFiles.m
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/16/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import "ELDuplicateFiles.h"

@implementation ELDuplicateFiles

NSMutableDictionary *dictionaryOfDuplicateFilesAndLocations;
NSMutableArray *arrayOfDuplicateFiles;
NSFileManager *fileManager;
NSDirectoryEnumerator *directoryEnumerator;
NSMutableDictionary *allFiles;

NSMutableDictionary *dictionaryOfDuplicateFilesAndLocations;// A dictionary. The keys are filenames of files which exist in more than one location. Values are comma-delimited strings of all URLs where the file is found

-(id)init
{
    self = [super init];
    if (!self) return nil;
    else if (self)
    {
        dictionaryOfDuplicateFilesAndLocations = [[NSMutableDictionary alloc] init];
        allFiles = [[NSMutableDictionary alloc] init];
        arrayOfDuplicateFiles = [[NSMutableArray alloc] init];
        fileManager = [[NSFileManager alloc] init];

    }
    return self;

}

-(NSMutableDictionary *)dictionaryOfDuplicateFilesAndLocations
{
    return dictionaryOfDuplicateFilesAndLocations;
}

-(NSMutableArray *)arrayOfDuplicateFiles
{
    return arrayOfDuplicateFiles;
}

-(int)generateDuplicatesFromURL:(id)URL ignoringTheFiles:(id)arrayOfFilesToIgnore;
{
    NSLog(@"Generating...");

    // Check that directory actually exists. If not, open alert and break.
    BOOL isDirectory;
    BOOL exists = [fileManager fileExistsAtPath:[URL path] isDirectory:&isDirectory];
    if (!exists || !isDirectory)
        {
            NSAlert* msgBox = [[NSAlert alloc] init];
            [msgBox setMessageText: @"The folder your specified does not exist. Please try again."];
            [msgBox addButtonWithTitle: @"OK"];
            [msgBox runModal];
            return 0; //Failure
        }
    
    NSLog(@"%@", URL);
    
    NSDirectoryEnumerator *directoryEnumerator = [fileManager enumeratorAtURL:URL
                                                   includingPropertiesForKeys:[NSArray arrayWithObjects:NSURLNameKey,
                                                                               NSURLIsDirectoryKey,nil]
                                                                      options:NSDirectoryEnumerationSkipsHiddenFiles
                                                                 errorHandler:nil];
    
    
    
    for (NSURL *currentURL in directoryEnumerator)
    {

        
        NSNumber *currentURLIsDirectory;
        [currentURL getResourceValue:&currentURLIsDirectory forKey:NSURLIsDirectoryKey error:NULL];
        
        
        if ([currentURLIsDirectory boolValue]==NO) // If its a file; we ignore directories
        {
            // Get the filename
            NSMutableString *currentFileBasename;
            [currentURL getResourceValue:&currentFileBasename forKey:NSURLNameKey error:NULL];
            
            // Get the location
            NSMutableString *directoryOfCurrentFile = [[NSMutableString alloc] init];
            [directoryOfCurrentFile setString:[currentURL absoluteString]];

            
            // Add to dictionary
            if([arrayOfFilesToIgnore containsObject:currentFileBasename])
            {
                //Do nothing
            }
            else if([allFiles objectForKey:currentFileBasename] == nil) // If its not a duplicate (at this point)
            {
                [allFiles setObject:directoryOfCurrentFile forKey:currentFileBasename];
            }
            else //If its a duplicate
            {
                if ([dictionaryOfDuplicateFilesAndLocations objectForKey:currentFileBasename] == nil) // If its not already in the duplicate dictionary
                {
                    // Add the key and BOTH paths
                    NSMutableString *bothURLs = [[NSMutableString alloc] init];
                    bothURLs = directoryOfCurrentFile;
                    [bothURLs appendFormat:@",%@", [allFiles objectForKey:currentFileBasename]];
                    
                    [dictionaryOfDuplicateFilesAndLocations setObject:bothURLs forKey:currentFileBasename];
                    
                }
                else // If its already in the duplciate dictionary
                {
                    //Concatenate current URL to object
                    NSMutableString *newURL = [[NSMutableString alloc] init];
                    newURL = [dictionaryOfDuplicateFilesAndLocations objectForKey:currentFileBasename];
                    [newURL appendFormat:@",%@", directoryOfCurrentFile];
                    
                    [dictionaryOfDuplicateFilesAndLocations setObject:newURL forKey:currentFileBasename];
                    
                }
                
            }
        }
        
        
        
    }
    [arrayOfDuplicateFiles addObjectsFromArray:[dictionaryOfDuplicateFilesAndLocations allKeys]];

    return 1; //Success
}

@end
