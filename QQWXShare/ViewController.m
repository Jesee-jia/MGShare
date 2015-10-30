//
//  ViewController.m
//  QQWXShare
//
//  Created by jesee on 15/10/14.
//  Copyright (c) 2015年 Jesee. All rights reserved.
//

#import "ViewController.h"
#import "WXApi.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterfaceObject.h>
#import <TencentOpenAPI/QQApiInterface.h>

@interface ViewController ()
{
    TencentOAuth  *_tencentOAuth;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //QQ注册
    _tencentOAuth=[[TencentOAuth alloc]initWithAppId:@"1102300854" andDelegate:nil];
    
    
    
}
- (IBAction)shareWechat {
    
    [self shareWechatLink];
    
//    [self shareWechatText];
    
}

//分享连接到朋友圈
-(void)shareWechatLink
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"专访张小龙：产品之上的世界观";
    message.description = @"微信的平台化发展方向是否真的会让这个原本简洁的产品变得臃肿？在国际化发展方向上，微信面临的问题真的是文化差异壁垒吗？腾讯高级副总裁、微信产品负责人张小龙给出了自己的回复。";
    [message setThumbImage:[UIImage imageNamed:@"Icon.png"]];
    
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = @"http://tech.qq.com/zt2012/tmtdecode/252.htm";
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = WXSceneTimeline;//WXSceneSession为发送给好友
    
    [WXApi sendReq:req];
}


//分享文本到微信好友
-(void)shareWechatText
{
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.text = @"人文的东西并不是体现在你看得到的方面，它更多的体现在你看不到的那些方面，它会影响每一个功能，这才是最本质的。但是，对这点可能很多人没有思考过，以为人文的东西就是我们搞一个很小清新的图片什么的。”综合来看，人文的东西其实是贯穿整个产品的脉络，或者说是它的灵魂所在。";
    req.bText = YES;
    //WXSceneSession  = 0  微信好友,   WXSceneTimeline = 1朋友圈
    req.scene = WXSceneSession;
    [WXApi sendReq:req];
    
    //填写回调连接--info---URL Types  (weixin   wxd930ea5d5a258f4f)
}

- (IBAction)shareQQ {
    
    NSURL *url = [NSURL URLWithString:@"www.baidu.com"];
    NSURL *imageUrl = [NSURL URLWithString:@"http://img0.imgtn.bdimg.com/it/u=3853558770,1177640338&fm=21&gp=0.jpg"];
    NSString *title = @"哈哈";
    
    NSString *description = [NSString stringWithFormat:@"分享自旅拍"];
    
    QQApiObject *newsObj =[QQApiNewsObject objectWithURL:url title:title description:description previewImageURL:imageUrl targetContentType:QQApiURLTargetTypeNews];
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:newsObj];
    
    
        [QQApiInterface sendReq:req];//好友
//    [QQApiInterface SendReqToQZone:req];//空间
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
