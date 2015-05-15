//
//  Game.h
//  AFNDemo
//
//  Created by huayu on 15/5/15.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Game : NSManagedObject

@property (nonatomic, retain) NSNumber * app_id;
@property (nonatomic, retain) NSNumber * is_play;
@property (nonatomic, retain) NSString * app_icon;
@property (nonatomic, retain) NSString * app_name;
@property (nonatomic, retain) NSNumber * max_score;

@end
