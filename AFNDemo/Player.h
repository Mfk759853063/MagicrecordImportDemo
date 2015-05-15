//
//  Player.h
//  AFNDemo
//
//  Created by huayu on 15/5/15.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Player : NSManagedObject

@property (nonatomic, retain) NSNumber * uid;
@property (nonatomic, retain) NSString * nick;
@property (nonatomic, retain) NSNumber * challenge_pm;
@property (nonatomic, retain) NSNumber * challenge_state;

@end
