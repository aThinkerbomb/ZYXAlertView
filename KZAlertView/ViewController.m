//
//  ViewController.m
//  KZAlertView
//
//  Created by YuXuan on 16/4/13.
//  Copyright © 2016年 客栈网. All rights reserved.
//

#import "ViewController.h"
#import "ZYXButton.h"
#import "ZYXAlertView.h"
@interface ViewController ()  //<ZYXAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor purpleColor];
//    ZYXButton *but = [ZYXButton buttonWithType:UIButtonTypeCustom];
//    [but setButtonType:ZYXButtonTypeWhiteBackGround];
//    [but setFrame:CGRectMake(20, 100, 300, 50)];
//    [but setTitle:@"取消" forState:UIControlStateNormal];
//    [but addTarget:self action:@selector(aaaa) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:but];
    
    
    ZYXAlertView *alert = [[ZYXAlertView alloc] initWithTitle:@"提交成功！" message:@"ok" sureButtonTitle:@"确定" cancel:@"取消"];
    //协议代理
//    alert.delegate = self;
//    [self.view addSubview:alert];
    
    //block
    [alert showinView:self.view withAction:^(NSInteger index) {
        if (index == 0) {
            NSLog(@"000");
        } else if (index == 1) {
            NSLog(@"111");
        }
    }];
    
}

//  代理
//-(void)ZYXAlertView:(ZYXAlertView *)AlertView clickedButtonIndex:(NSInteger)index
//{
//    if (index == 0) {
//        NSLog(@"取消");
//    } else {
//        NSLog(@"确定");
//    }
//}


- (void)aaaa {
    NSLog(@"11");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
