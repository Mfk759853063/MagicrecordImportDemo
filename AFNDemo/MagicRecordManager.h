//
//  MagicRecordManager.h
//  AFNDemo
//
//  Created by huayu on 15/5/15.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreData+MagicalRecord.h"

@interface MagicRecordManager : NSObject

@property (strong, nonatomic) NSManagedObjectContext *backgroundContextForSave;

@property (strong, nonatomic) NSManagedObjectContext *backgroundContextForUnsave;

+ (instancetype)shareInstance;

//+ (NSManagedObjectContext *)shareSaveBackgroundContext;
//
//+ (NSManagedObjectContext *)shareUnSaveBackgroundContext;

@end
