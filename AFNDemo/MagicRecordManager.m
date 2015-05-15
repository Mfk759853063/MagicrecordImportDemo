//
//  MagicRecordManager.m
//  AFNDemo
//
//  Created by huayu on 15/5/15.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import "MagicRecordManager.h"

@implementation MagicRecordManager


+ (instancetype)shareInstance
{
    static MagicRecordManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[MagicRecordManager alloc] init];
    });
    
    return manager;
}

- (NSManagedObjectContext *)backgroundContextForSave
{
    if (!_backgroundContextForSave) {
        _backgroundContextForSave = [NSManagedObjectContext MR_context];
    }
    return _backgroundContextForSave;
}

- (NSManagedObjectContext *)backgroundContextForUnsave
{
    if (!_backgroundContextForUnsave) {
        _backgroundContextForUnsave = [NSManagedObjectContext MR_context];
    }
    return _backgroundContextForUnsave;
}

+ (NSManagedObjectContext *)shareSaveBackgroundContext
{
    static NSManagedObjectContext *context = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        context = [NSManagedObjectContext MR_context];
    });
    
    return context;
}

+ (NSManagedObjectContext *)shareUnSaveBackgroundContext
{
    static NSManagedObjectContext *context = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        context = [NSManagedObjectContext MR_context];
    });
    
    return context;
}
@end
