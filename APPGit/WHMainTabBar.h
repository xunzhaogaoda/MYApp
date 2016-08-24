//
//  WHMainTabBar.h
//  APPGit
//
//  Created by 王辉 on 16/8/24.
//  Copyright © 2016年 wanghui. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WHMainTabBar;

@protocol  WHMainTabBarDelegate<NSObject>

@optional
- (void)tabBar:(WHMainTabBar *)tabBar didSelectedButtonFrom:(long)fromBtnTag to:(long)toBtnTag;
- (void)tabBarClickWriteButton:(WHMainTabBar *)tabBar;

@end
@interface WHMainTabBar : UIView
- (void)addTabBarButtonWithTabBarItem:(UITabBarItem *)tabBarItem;
/**
 *
 */
@property(nonatomic,weak)id<WHMainTabBarDelegate>delegate;
@end
