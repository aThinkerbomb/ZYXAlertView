//
//  ZYXAlertView.m
//  KZAlertView
//
//  Created by YuXuan on 16/4/15.
//  Copyright © 2016年 客栈网. All rights reserved.
//

#import "ZYXAlertView.h"
#import "ZYXButton.h"


#define kScreenSize [[UIScreen mainScreen] bounds].size
#define kScreenHeight CGRectGetHeight([[UIScreen mainScreen] bounds])
#define kScreenWidth  CGRectGetWidth([[UIScreen mainScreen] bounds])


@interface ZYXAlertView ()
@property (weak, nonatomic) IBOutlet UILabel *firstTitle;
@property (weak, nonatomic) IBOutlet UILabel *secondTitle;
@property (weak, nonatomic) IBOutlet ZYXButton *onlySureButton;
@property (weak, nonatomic) IBOutlet ZYXButton *cancleButton;
@property (weak, nonatomic) IBOutlet ZYXButton *sureButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *distance;


@end

@implementation ZYXAlertView


- (instancetype)initWithTitle:(NSString *)Title
              message:(NSString *)message
      sureButtonTitle:(NSString *)sureTittle
               cancel:(NSString *)cancelTitle
{
    
    self = [super init];
    if (self) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"ZYXAlertView" owner:self options:nil] lastObject];
        
    }
    
    [self creatAlertViewTitle:Title message:message sureTitle:sureTittle cancelTitle:cancelTitle];

    return self;

}


- (void)creatAlertViewTitle:(NSString *)title
                    message:(NSString *)message
                  sureTitle:(NSString *)suretitle
                cancelTitle:(NSString *)canceltitle
{
    
    [self hiddenButton];
    
    [_firstTitle setText:title];
    [_firstTitle sizeToFit];
    [_distance setConstant: title ? 27 : 0];
    [_secondTitle setText:message];
    [_secondTitle sizeToFit];
    
    if (canceltitle) {
        [self showSureAndCancelButton];
        [_cancleButton setTitle:canceltitle forState:UIControlStateNormal];
        [_cancleButton setButtonType:ZYXButtonTypeWhiteBackGround];
        _cancleButton.tag = 0;
        [_sureButton setTitle:suretitle forState:UIControlStateNormal];
        [_sureButton setButtonType:ZYXButtonTypeGreenBackGround];
        _sureButton.tag = 1;
    } else {
        [self showOnlySureButton];
        [_onlySureButton setTitle:suretitle forState:UIControlStateNormal];
        [_onlySureButton setButtonType:ZYXButtonTypeGreenBackGround];
        _onlySureButton.tag = 1;
    }
    
    [self setAlertFrame];
    
}

- (void)setAlertFrame
{
    float titleHeight = _firstTitle.bounds.size.height;
    float message = _secondTitle.bounds.size.height;
    float AlertViewHeight = titleHeight + message + _distance.constant + 25 + 45 + 27 + 25;
    
    [self setFrame:CGRectMake(0, 0, 294, AlertViewHeight)];
    [self setCenter:CGPointMake(kScreenWidth / 2, kScreenHeight / 2)];
}

- (IBAction)alertButtonAction:(UIButton*)sender {
    //block
    self.buttonAction(sender.tag);
    [self dismissAlertView];
    //代理
//    if (self.delegate && [self.delegate respondsToSelector:@selector(ZYXAlertView:clickedButtonIndex:)]) {
//        [self.delegate ZYXAlertView:self clickedButtonIndex:sender.tag];
//        [self dismissAlertView];
//    }
    
}

//block
-(void) showinView:(UIView *)view withAction:(clickedButtonBlock)block {
    [view addSubview:self];
    self.buttonAction = block;
    
}


- (void)dismissAlertView
{
    CGAffineTransform  transform;
    transform = CGAffineTransformScale(self.transform,1.2,1.2);
    [UIView beginAnimations:@"scale" context:nil];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationDelegate:self];
    [self setTransform:transform];
    [UIView commitAnimations];
    [UIView animateWithDuration:0.2 animations:^{
        [self setAlpha:0];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


- (void)hiddenButton
{
    self.onlySureButton.hidden = YES;
    self.cancleButton.hidden = YES;
    self.sureButton.hidden = YES;
}

- (void)showOnlySureButton
{
    self.onlySureButton.hidden = NO;
    self.cancleButton.hidden = YES;
    self.sureButton.hidden = YES;
}

- (void)showSureAndCancelButton
{
    self.onlySureButton.hidden = YES;
    self.cancleButton.hidden = NO;
    self.sureButton.hidden = NO;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
