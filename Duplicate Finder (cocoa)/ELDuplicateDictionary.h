//
//  duplicateDictionary.h
//  Duplicate Finder (cocoa)
//
//  Created by E L on 6/16/13.
//  Copyright (c) 2013 n/a. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELDuplicateDictionary : NSObject

@property NSMutableDictionary *duplicateDictionary;


-(void)generateDictionaryFromURL:(id)URL ignoringTheFiles:(id)arrayOfFilesToIgnore;

@end
