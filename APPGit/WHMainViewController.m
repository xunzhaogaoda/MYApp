//
//  WHMainViewController.m
//  APPGit
//  Git远程仓库地址：https://github.com/xunzhaogaoda/MYApp.git
//  Created by 王辉 on 16/8/24.
//  Copyright © 2016年 wanghui. All rights reserved.
//

#import "WHMainViewController.h"
#import "WHMainTabBarButton.h"
#import "WHMainTabBar.h"
#import "WHHomeViewController.h"
#import "WHMeViewController.h"
#import "WHSubscriptionViewController.h"
#import "WHNotificationViewController.h"
#import "WHWriteViewController.h"
#import "WHMainNavigationController.h"

@interface WHMainViewController ()<WHMainTabBarDelegate>
@property(nonatomic, weak)WHMainTabBar *mainTabBar;
@property(nonatomic, strong)WHHomeViewController *homeVc;
@property(nonatomic, strong)WHSubscriptionViewController *subscriptionVc;
@property(nonatomic, strong)WHNotificationViewController *notificationVc;
@property(nonatomic, strong)WHMeViewController *meVc;

@end

@implementation WHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:200.0 green:100.0 blue:255.0 alpha:1.0];
    
    [self SetupMainTabBar];
    [self SetupAllControllers];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

- (void)SetupMainTabBar{
    WHMainTabBar *mainTabBar = [[WHMainTabBar alloc] init];
    mainTabBar.frame = self.tabBar.bounds;
    mainTabBar.delegate = self;
    [self.tabBar addSubview:mainTabBar];
    _mainTabBar = mainTabBar;

}

- (void)SetupAllControllers{
    NSArray *titles = @[@"发现", @"关注", @"消息", @"我的"];
    NSArray *images = @[@"icon_tabbar_home~iphone", @"icon_tabbar_subscription~iphone", @"icon_tabbar_notification~iphone", @"icon_tabbar_me~iphone"];
    NSArray *selectedImages = @[@"icon_tabbar_home_active~iphone", @"icon_tabbar_subscription_active~iphone", @"icon_tabbar_notification_active~iphone", @"icon_tabbar_me_active~iphone"];
    
    WHHomeViewController * homeVc = [[WHHomeViewController alloc] init];
    self.homeVc = homeVc;
    
    WHSubscriptionViewController * subscriptionVc = [[WHSubscriptionViewController alloc] init];
    self.subscriptionVc = subscriptionVc;
    
    WHNotificationViewController * notificationVc = [[WHNotificationViewController alloc] init];
    self.notificationVc = notificationVc;
    
    WHMeViewController * meVc = [[WHMeViewController alloc] init];
    self.meVc = meVc;
    
    NSArray *viewControllers = @[homeVc, subscriptionVc, notificationVc, meVc];
    
    for (int i = 0; i < viewControllers.count; i++) {
        UIViewController *childVc = viewControllers[i];
        [self SetupChildVc:childVc title:titles[i] image:images[i] selectedImage:selectedImages[i]];
    }

}

- (void)SetupChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)imageName selectedImage:(NSString *)selectedImageName{
    WHMainNavigationController *nav = [[WHMainNavigationController alloc] initWithRootViewController:childVc];
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    childVc.tabBarItem.title = title;
    [self.mainTabBar addTabBarButtonWithTabBarItem:childVc.tabBarItem];
    [self addChildViewController:nav];
}



#pragma mark --------------------mainTabBar delegate
- (void)tabBar:(WHMainTabBar *)tabBar didSelectedButtonFrom:(long)fromBtnTag to:(long)toBtnTag{
    self.selectedIndex = toBtnTag;
}

- (void)tabBarClickWriteButton:(WHMainTabBar *)tabBar{
    WHWriteViewController *writeVc = [[WHWriteViewController alloc] init];
    WHMainNavigationController *nav = [[WHMainNavigationController alloc] initWithRootViewController:writeVc];
    
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
