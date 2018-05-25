//
//  Test.m
//  Alamofire
//
//  Created by 李亮 on 2018/5/25.
//

#import "UMShareManager.h"
#import <UMSocialCore/UMSocialCore.h>
@import MGJRouter;

@implementation UMShareManager
+ (void)load{
    
    [MGJRouter registerURLPattern:@"umeng://thirdlogin/:plat" toObjectHandler:^id(NSDictionary *routerParameters) {
        __block id mResult;
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        [[UMSocialManager defaultManager] getUserInfoWithPlatform:[self tranfs:[(NSString *)(routerParameters[@"plat"]) integerValue]] currentViewController:nil completion:^(id result, NSError *error) {
            mResult = result;
            dispatch_semaphore_signal(semaphore);
        }];
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        return mResult;
    }];
}
+ (UMSocialPlatformType)tranfs:(NSInteger)plat{
    switch ((ThirdLoginPlatform)plat){
        case Wechat:
            return UMSocialPlatformType_WechatSession;
        case QQ:
            return UMSocialPlatformType_QQ;
        case Weibo:
            return UMSocialPlatformType_Sina;
        default:
            break;
    }
    return UMSocialPlatformType_UnKnown;
}

@end
