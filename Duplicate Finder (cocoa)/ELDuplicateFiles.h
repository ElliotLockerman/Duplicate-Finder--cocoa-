//
//  ELDuplicateFiles.m
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/16/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELDuplicateFiles : NSObject

@property (readonly,strong) NSMutableDictionary *dictionaryOfDuplicateFilesAndLocations;
@property (readonly,strong) NSArray *arrrayOfDuplicateFiles;

-(void)generateDictionaryFromURL:(id)URL ignoringTheFiles:(id)arrayOfFilesToIgnore;

@end
