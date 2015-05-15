//
//  ArenaDetail.h
//  AFNDemo
//
//  Created by huayu on 15/5/15.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Arena, Game;

@interface ArenaDetail : NSManagedObject

@property (nonatomic, retain) Arena *arena;
@property (nonatomic, retain) Game *game;
@property (nonatomic, retain) NSSet *player_result;
@end

@interface ArenaDetail (CoreDataGeneratedAccessors)

- (void)addPlayer_resultObject:(NSManagedObject *)value;
- (void)removePlayer_resultObject:(NSManagedObject *)value;
- (void)addPlayer_result:(NSSet *)values;
- (void)removePlayer_result:(NSSet *)values;

@end
