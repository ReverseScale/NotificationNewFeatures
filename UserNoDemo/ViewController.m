//
//  ViewController.m
//  UserNoDemo
//
//  Created by WhatsXie on 2017/5/15.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface ViewController ()<UNUserNotificationCenterDelegate>

@property (nonatomic, strong) UNMutableNotificationContent *notiContent;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.notiContent = [[UNMutableNotificationContent alloc] init];
    [[UNUserNotificationCenter currentNotificationCenter]setDelegate:self];
}
- (IBAction)p1:(id)sender {
    [self regiterLocalNotification:self.notiContent];
}
- (IBAction)p2:(id)sender {
    NSString *imageFile = [[NSBundle mainBundle] pathForResource:@"sport" ofType:@"png"];
    
    UNNotificationAttachment *imageAttachment = [UNNotificationAttachment attachmentWithIdentifier:@"iamgeAttachment" URL:[NSURL fileURLWithPath:imageFile] options:nil error:nil];
    self.notiContent.attachments = @[imageAttachment];
    
    [self regiterLocalNotification:self.notiContent];

}
- (IBAction)p3:(id)sender {
}
- (IBAction)p4:(id)sender {
    UNTextInputNotificationAction *action1 = [UNTextInputNotificationAction actionWithIdentifier:@"replyAction" title:@"文字回复" options:UNNotificationActionOptionNone];
    UNNotificationAction *action2 = [UNNotificationAction actionWithIdentifier:@"enterAction" title:@"进入应用" options:UNNotificationActionOptionForeground];
    
    UNNotificationAction *action3 = [UNNotificationAction actionWithIdentifier:@"cancelAction" title:@"取消" options:UNNotificationActionOptionDestructive];
    
    UNNotificationCategory *categroy = [UNNotificationCategory categoryWithIdentifier:@"Categroy" actions:@[action1,action2,action3] intentIdentifiers:@[] options:UNNotificationCategoryOptionCustomDismissAction];
    [[UNUserNotificationCenter currentNotificationCenter] setNotificationCategories:[NSSet setWithObject:categroy]];
    [[UNUserNotificationCenter currentNotificationCenter] setDelegate:self];
    self.notiContent.categoryIdentifier = @"Categroy";
    
    [self regiterLocalNotification:self.notiContent];
}
- (IBAction)p5:(id)sender {
    [self deleteLocalNotification:@"RequestIdentifier"];
}
- (IBAction)p6:(id)sender {
    UNNotificationCategory *categroy = [UNNotificationCategory categoryWithIdentifier:@"CategroyDIY" actions:nil intentIdentifiers:@[] options:UNNotificationCategoryOptionCustomDismissAction];
    [[UNUserNotificationCenter currentNotificationCenter] setNotificationCategories:[NSSet setWithObject:categroy]];
    [[UNUserNotificationCenter currentNotificationCenter] setDelegate:self];
    self.notiContent.categoryIdentifier = @"CategroyDIY";
    
    [self regiterLocalNotification:self.notiContent];

}
- (void)deleteLocalNotification:(NSString *)identifier{
    [[UNUserNotificationCenter currentNotificationCenter] removePendingNotificationRequestsWithIdentifiers:@[identifier]];
}

- (void)regiterLocalNotification:(UNMutableNotificationContent *)content{
    
    content.title = @"iOS 10 新特性";
    content.subtitle = @"新通知变化";
    content.body = @"之前本地通知和远程推送是两个类，现在合成一个了";
    content.badge = @1;
    UNNotificationSound *sound = [UNNotificationSound soundNamed:@"caodi.m4a"];
    content.sound = sound;
    
    //重复提醒，时间间隔要大于60s
    UNTimeIntervalNotificationTrigger *trigger1 = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];
    NSString *requertIdentifier = @"RequestIdentifier";
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:requertIdentifier content:content trigger:trigger1];
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"Error:%@",error);
    }];
    
}
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler{
    
    NSString *categoryIdentifier = response.notification.request.content.categoryIdentifier;
    NSLog(@"收到通知：%@",response.notification.request.content);
    
    if ([categoryIdentifier isEqualToString:@"Categroy"]) {
        //识别需要被处理的拓展
        if ([response.actionIdentifier isEqualToString:@"replyAction"]){
            //识别用户点击的是哪个 action
            UNTextInputNotificationResponse *textResponse = (UNTextInputNotificationResponse*)response;
            //获取输入内容
            NSString *userText = textResponse.userText;
            //发送 userText 给需要接收的方法
            NSLog(@"要发送的内容是：%@",userText);
            //[ClassName handleUserText: userText];
        }else if([response.actionIdentifier isEqualToString:@"enterAction"]){
            NSLog(@"点击了进入应用按钮");
        }else{
            NSLog(@"点击了取消");
        }
        
    }
    completionHandler();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
