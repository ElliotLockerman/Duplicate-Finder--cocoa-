//
//  duplicateDictionary.m
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/16/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import "ELDuplicateDictionary.h"

@implementation ELDuplicateDictionary

NSMutableDictionary *dictionaryOfDuplicates;
NSMutableArray *duplicateFilesArray;
NSFileManager *fileManager;
NSDirectoryEnumerator *directoryEnumerator;
NSMutableDictionary *allFiles;

@synthesize duplicateDictionary;
@synthesize duplicateFilesArray;

-(id)init
{
    self = [super init];
    if (!self) return nil;
    else if (self)
    {
        dictionaryOfDuplicates = [[NSMutableDictionary alloc] init];
        allFiles = [[NSMutableDictionary alloc] init];
        duplicateFilesArray = [[NSArray alloc] init];
        fileManager = [[NSFileManager alloc] init];

    }
    return self;

}


-(void)generateDictionaryFromURL:(id)URL ignoringTheFiles:(id)arrayOfFilesToIgnore;
{
    NSLog(@"Generating...");
    
    
    
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
            if([arrayOfFilesToIgnore containsObject:currentFileBasename])
            {
                //Do nothing
            }
            else if([allFiles objectForKey:currentFileBasename] == nil) // If its not a duplicate (at this point)
            {
                [allFiles setObject:directoryOfCurrentFile forKey:currentFileBasename];
                NSLog(@"allFiles: %@", allFiles);
            }
            else //If its a duplicate
            {
                if ([dictionaryOfDuplicates objectForKey:currentFileBasename] == nil) // If its not already in the duplicate dictionary
                {
                    // Add the key and BOTH paths
                    NSMutableString *bothURLs = [[NSMutableString alloc] init];
                    bothURLs = directoryOfCurrentFile;
                    [bothURLs appendFormat:@",%@", [allFiles objectForKey:currentFileBasename]];
                    
                    [dictionaryOfDuplicates setObject:bothURLs forKey:currentFileBasename];
                    NSLog(@"duplicateDictionary: %@", dictionaryOfDuplicates);
                    
                }
                else // If its already in the duplciate dictionary
                {
                    //Concatenate current URL to object
                    NSMutableString *newURL = [[NSMutableString alloc] init];
                    newURL = [dictionaryOfDuplicates objectForKey:currentFileBasename];
                    [newURL appendFormat:@",%@", directoryOfCurrentFile];
                    
                    [dictionaryOfDuplicates setObject:newURL forKey:currentFileBasename];
                    NSLog(@"duplicateDictionary: %@", dictionaryOfDuplicates);
                    
                }
                
            }
        }
        duplicateFilesArray = [dictionaryOfDuplicates allKeys];
        
        
        
    }
    
    NSLog(@"------------------------------\n duplicateDictionary: %@", dictionaryOfDuplicates);
    
    
}

@end
