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
        manager = [[KNHttpManager alloc] initWithBaseURL:[NSURL URLWithString:API_URL_PREFIX]];
        
    });
    return manager;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        [self.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            NSLog(@"网络发生变化 :%ld",(long)status);
        }];
    }
    return self;
}

- (void)cleanCooikes
{
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies])
    {
        if ([cookie.domain rangeOfString:API_URL_DOMAIN].length != 0 || [cookie.domain rangeOfString:API_URL_SITE_NAME].length != 0)
        {
            [storage deleteCookie:cookie];
        }
    }
}

- (void)cancelAllRequest
{
    [self.operationQueue cancelAllOperations];
}

- (void)cancelOperation:(AFHTTPRequestOperation *)operation
{
    __block AFHTTPRequestOperation *find = nil;
    [self.operationQueue.operations enumerateObjectsUsingBlock:^(AFHTTPRequestOperation *obj, NSUInteger idx, BOOL *stop) {
        if (obj == operation) {
            find = operation;
            *stop = YES;
        }
    }];
    if (find) {
        [find cancel];
    }
    else{
        [operation cancel];
    }
    
}

@end
