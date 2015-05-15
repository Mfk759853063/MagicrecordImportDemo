//
//  KNHttpManager.h
//  
//
//  Created by huayu on 15/5/15.
//
//

#import "AFHTTPRequestOperationManager.h"
#import "AFNetworking.h"

@interface KNHttpManager : AFHTTPRequestOperationManager

+ (instancetype)shareInstance;

- (void)cleanCooikes;

- (void)cancelAllRequest;

- (void)cancelOperation:(AFHTTPRequestOperation *)operation;

@end
