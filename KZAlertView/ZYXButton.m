//
//  ZYXButton.m
//  KZAlertView
//
//  Created by YuXuan on 16/4/13.
//  Copyright © 2016年 客栈网. All rights reserved.
//

#import "ZYXButton.h"

@implementation ZYXButton


- (void)setButtonType:(ZYXButtonType)type
{
    
    self.layer.cornerRadius = 5.f;
    
    switch (type) {
        case ZYXButtonTypeWhiteBackGround:
            self.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1];
            self.layer.borderColor = [UIColor colorWithRed:75/255.0 green:178/255.0 blue:86/255.0 alpha:1].CGColor;
            self.layer.borderWidth = 2.0f;
            [self setTitleColor:[UIColor colorWithRed:75/255.0 green:178/255.0 blue:86/255.0 alpha:1.0] forState:UIControlStateNormal];
            self.titleLabel.font = [UIFont systemFontOfSize:16.f];
            break;
            
        case ZYXButtonTypeGreenBackGround:
            self.backgroundColor = [UIColor colorWithRed:75/255.0 green:178/255.0 blue:86/255.0 alpha:1.0];
            self.layer.borderColor = [UIColor colorWithRed:75/255.0 green:178/255.0 blue:86/255.0 alpha:1.0].CGColor;
            self.layer.borderWidth = 2.0f;
            [self setTitleColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
            self.titleLabel.font = [UIFont systemFontOfSize:16.f];
            break;
        default:
            break;
    }
    
    [self.layer masksToBounds];

}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
