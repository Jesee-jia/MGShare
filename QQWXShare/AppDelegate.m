//
//  AppDelegate.m
//  QQWXShare
//
//  Created by jesee on 15/10/14.
//  Copyright (c) 2015年 Jesee. All rights reserved.
//

#import "AppDelegate.h"
#import "WXApi.h"

//近期苹果公司iOS 9系统策略更新，限制了http协议的访问，此外应用需要在“Info.plist”中将要使用的URL Schemes列为白名单，才可正常检查其他应用是否安装。

//受此影响，当你的应用在iOS 9中需要使用微信SDK的相关能力（分享、收藏、支付、登录等）时，需要在“Info.plist”里增加如下代码：
//qq 微信分享到网页版 是因为 9.0系统无法识别到已经安装了软件造成的 需要将下列添加到白名单
//下面整理一些常用的白名单

//<key>LSApplicationQueriesSchemes</key>
//<array>
//<string>mqqOpensdkSSoLogin</string>
//<string>mqzone</string>
//<string>sinaweibo</string>
//<string>alipayauth</string>
//<string>alipay</string>
//<string>safepay</string>
//<string>mqq</string>
//<string>mqqapi</string>
//<string>mqqopensdkapiV3</string>
//<string>mqqopensdkapiV2</string>
//<string>mqqapiwallet</string>
//<string>mqqwpa</string>
//<string>mqqbrowser</string>
//<string>wtloginmqq2</string>
//<string>weixin</string>
//<string>wechat</string>
//</array>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //向微信注册
    [WXApi registerApp:@"wx7089dff9ebc0e845"];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
