//
//  Arena.h
//  AFNDemo
//
//  Created by huayu on 15/5/15.
//  Copyright (c) 2015年 huayu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Arena : NSManagedObject

@property (nonatomic, retain) NSString * app_compare_method;
@property (nonatomic, retain) NSString * app_description;
@property (nonatomic, retain) NSString * app_icon;
@property (nonatomic, retain) NSNumber * app_id;
@property (nonatomic, retain) NSString * app_name;
@property (nonatomic, retain) NSString * app_unit;
@property (nonatomic, retain) NSString * app_url;
@property (nonatomic, retain) NSString * avatar;
@property (nonatomic, retain) NSString * nick;
@property (nonatomic, retain) NSNumber * user_id;
@property (nonatomic, retain) NSNumber * start_time;
@property (nonatomic, retain) NSNumber * show_method;
@property (nonatomic, retain) NSNumber * result_id;
@property (nonatomic, retain) NSString * invite_url;
@property (nonatomic, retain) NSString * leizhu_score;

@end
