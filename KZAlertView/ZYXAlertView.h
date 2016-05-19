//
//  ZYXAlertView.h
//  KZAlertView
//
//  Created by YuXuan on 16/4/15.
//  Copyright © 2016年 客栈网. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol ZYXAlertViewDelegate;

typedef void(^clickedButtonBlock) (NSInteger index);

@interface ZYXAlertView : UIView


//@property (nonatomic, assign) id<ZYXAlertViewDelegate>delegate;

@property (nonatomic, copy) clickedButtonBlock buttonAction;

- (instancetype)initWithTitle:(NSString *)Title
              message:(NSString *)message
      sureButtonTitle:(NSString *)sureTittle
               cancel:(NSString *)cancelTitle;


-(void) showinView:(UIView *)view withAction:(clickedButtonBlock)block;

@end

//@protocol ZYXAlertViewDelegate <NSObject>
//
//- (void)ZYXAlertView:(ZYXAlertView *)AlertView clickedButtonIndex:(NSInteger)index;
//
//@end