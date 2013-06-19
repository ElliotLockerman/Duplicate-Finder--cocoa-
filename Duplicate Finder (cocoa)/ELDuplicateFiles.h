//
//  ELDuplicateFiles.m
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/16/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELDuplicateFiles : NSObject

@property (readonly,strong) NSMutableDictionary *dictionaryOfDuplicateFilesAndLocations; // A dictionary. The keys are filenames of files which exist in more than one location. Values are comma-delimited strings of all URLs where the file is found
@property (readonly,strong) NSMutableArray *arrayOfDuplicateFiles; // Array of duplicate filenames.

-(void)generateDuplicatesFromURL:(id)URL ignoringTheFiles:(id)arrayOfFilesToIgnore; // Given a folder URL and a list of files to ignore, searches by filename for duplicates and adds their files names to  arrrayOfDuplicateFiles and their filenames and locations to dictionaryOfDuplicateFilesAndLocations

@end
