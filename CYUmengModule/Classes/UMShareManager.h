//
//  Test.h
//  Alamofire
//
//  Created by 李亮 on 2018/5/25.
//

#import <Foundation/Foundation.h>

typedef enum : NSInteger {
    Wechat = 1,
    QQ = 2,
    Weibo = 3,
    None = 4,
} ThirdLoginPlatform;

typedef void (^UMShareManagerCompletionHandler)(id result,NSError *error);
typedef void (^Handler)();

@interface UMShareManager : NSObject


@end
