//
//  ZYXButton.h
//  KZAlertView
//
//  Created by YuXuan on 16/4/13.
//  Copyright © 2016年 客栈网. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZYXButtonType) {
    
    ZYXButtonTypeWhiteBackGround = 0,
    
    ZYXButtonTypeGreenBackGround
    
};


@interface ZYXButton : UIButton

@property (nonatomic, assign) ZYXButtonType zyxButtonType;


- (void)setButtonType:(ZYXButtonType)type;

@end
