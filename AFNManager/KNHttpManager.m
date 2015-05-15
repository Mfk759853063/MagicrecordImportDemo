//
//  KNHttpManager.m
//  
//
//  Created by huayu on 15/5/15.
//
//
#define API_URL_SITE_NAME @"zhaopian.com"
#define API_URL_DOMAIN @"app.game.zhaopian.com"
#define API_URL_PREFIX @"http://app.game.zhaopian.com"

#import "KNHttpManager.h"

@implementation KNHttpManager

+ (instancetype)shareInstance;

{
    static KNHttpManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[KNHttpManager alloc] initWithBaseURL:[NSUrl urlWithString:API_URL_PREFIX]];
    });
    return manager;
}

@end
