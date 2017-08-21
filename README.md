# NotificationNewFeatures
iOS 10 通知新特性 Demo
![](https://img.shields.io/badge/platform-iOS-red.svg) 
![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/download-791K-brightgreen.svg)
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

iOS 10 新特性一出，各家纷纷出动研究新特性能给场景智能化所带来的好处，从widget到推送通知的拓展。

| 名称 |1.列表页 |2.展示页 |3.常用通知 |4.可交互通知 |5.自定义通知 |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| 截图 | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-21/78592292.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-21/17824141.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-21/30125510.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-21/95872825.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-21/73695978.jpg) |
| 描述 | 通过 storyboard 搭建基本框架 | 不同状态的通知特性 | 常用的图文通知 | 带有交互按键的通知 | 自定义样式的通知 |



## Requirements 要求
* iOS 10+
* Xcode 8+


## About 关于
关于通知，无论与远程Push还是本地通知，以往的iOS系统暴漏给开发者的接口都是十分有限的，开发者只能对标题和内容进行简单的定义，至于UI展示和用户交互行为相关的部分，开发者开发起来都十分困难。至于本地通知，iOS10之前采用的是UILocationNotification类，远程通知有苹果服务器进行转发，本地通知和远程通知其回调的处理都是通过AppDelegate中的几个回调方法来完成。iOS10系统中，通知功能的增强是一大优化之处，iOS10中将通知功能整合成了一个框架UserNotification，其结构十分类似于iOS8中的UIWebView向WebKit框架整合的思路。并且UserNotification相比之前的通知功能更加强大，主要表现在如下几点：

1.通知处理代码可以从AppDelegate中剥离。
2.通知的注册，设置，处理更加结构化，更易于模块化开发。
3.UserNotification支持自定义通知音效和启动图。
4.UserNotification支持向通知内容中添加媒体附件，例如音频，视频。
5.UserNotification支持开发者定义多套通知模板。
6.UserNotification支持完全自定义的通知界面。
7.UserNotification支持自定义通知中的用户交互按钮。
8.通知的触发更加容易管理。

## License 许可证
NotificationNewFeatures 使用 MIT 许可证，详情见 LICENSE 文件。


## Contact 联系方式:
* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io
