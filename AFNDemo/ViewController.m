//
//  ViewController.m
//  AFNDemo
//
//  Created by huayu on 15/5/15.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import "ViewController.h"

#import "KNHttpManager.h"
#import "CoreData+MagicalRecord.h"
#import "Arena.h"
#import "ArenaDetail.h"
#import "Leizhu.h"
#import "Game.h"
#import "Player.h"
#import "MagicRecordManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self getArenas];
    
    [self getArenaDetail];
    
}

/// 异步解析数据,不保存，返回数据
- (void)getArenaDetail
{
    [[KNHttpManager shareInstance] GET:@"http://app.game.zhaopian.com/wydlz_game/one_leitai/213550.json" parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        dispatch_async(dispatch_get_global_queue(0,0), ^{
                ArenaDetail *detail = [ArenaDetail MR_importFromObject:responseObject inContext:[MagicRecordManager shareInstance].backgroundContextForUnsave];
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSLog(@"--arenaDetail---%@",detail.arena.result_id);
                });
        });
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

/// 异步保存数据 ，返回数据

- (void)getArenas
{
    __block NSArray *areas = nil;
    areas = [Arena MR_findAll];
    NSLog(@"%ld",(long)areas.count);
    [[KNHttpManager shareInstance] GET:@"http://app.game.zhaopian.com/wydlz_game/bailei_filter.json?app_id=61" parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        dispatch_async(dispatch_get_global_queue(0,0), ^{
                areas = [Arena MR_importFromArray:[responseObject valueForKeyPath:@"response.rings"] inContext:[MagicRecordManager shareInstance].backgroundContextForSave];
                [areas enumerateObjectsUsingBlock:^(Arena *obj, NSUInteger idx, BOOL *stop) {
                    NSArray *finds = [Arena MR_findByAttribute:@"start_time" withValue:obj.start_time];
                    if (finds) {
                        [finds enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                            [obj MR_deleteEntityInContext:[MagicRecordManager shareInstance].backgroundContextForSave];
                        }];
                    };
                }];
                
                [[MagicRecordManager shareInstance].backgroundContextForSave MR_saveToPersistentStoreWithCompletion:^(BOOL contextDidSave, NSError *error) {
                    if (contextDidSave) {
                        NSLog(@"保存成功");
                    }
                    else{
                        NSLog(@"保存失败");
                    }
                    areas = [Arena MR_findAll];
                    NSLog(@"保存后还有%ld",(long)areas.count);
                    [areas enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                        NSLog(@"%@",[obj result_id]);
                    }];
                }];
        });
        /*
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
            [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
                areas = [Arena MR_importFromArray:[responseObject valueForKeyPath:@"response.rings"] inContext:localContext];
                [areas enumerateObjectsUsingBlock:^(Arena *obj, NSUInteger idx, BOOL *stop) {
                    NSArray *finds = [Arena MR_findByAttribute:@"start_time" withValue:obj.start_time];
                    if (finds) {
                        NSLog(@"找到，删除，插入  -- %@",obj.start_time);
                        [finds enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                            [obj MR_deleteEntityInContext:localContext];
                        }];
                    };
                }];
            } completion:^(BOOL contextDidSave, NSError *error) {
                if (contextDidSave) {
                    NSLog(@"保存成功");
                }
                else{
                    NSLog(@"保存失败");
                }
                areas = [Arena MR_findAll];
                 NSLog(@"%ld",(long)areas.count);
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    [areas enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//                        NSLog(@"%@",[obj app_name]);
//                    }];
//                });
            }];
            
            
        
            
        });
        
        */
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
