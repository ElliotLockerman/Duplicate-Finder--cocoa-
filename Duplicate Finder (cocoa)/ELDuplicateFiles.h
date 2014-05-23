//
//  ELDuplicateFiles.m
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/16/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELDuplicateFiles : NSObject


-(NSMutableDictionary *)dictionaryOfDuplicateFilesAndLocations;

-(NSMutableArray *)arrayOfDuplicateFiles;

-(int)generateDuplicatesFromURL:(id)URL
               ignoringTheFiles:(id)arrayOfFilesToIgnore; // Given a folder URL and a list of files to ignore, searches by filename for duplicates and adds their files names to  arrrayOfDuplicateFiles and their filenames and locations to dictionaryOfDuplicateFilesAndLocations

@end
