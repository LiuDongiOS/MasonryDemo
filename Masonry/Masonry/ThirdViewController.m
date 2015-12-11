//
//  ThirdViewController.m
//  Masonry
//
//  Created by 刘栋 on 15/12/8.
//  Copyright © 2015年 刘栋. All rights reserved.
//

#import "ThirdViewController.h"
#import "Masonry.h"
#import "MMPlaceHolder.h"
@interface ThirdViewController ()

@end

@implementation ThirdViewController
#pragma mark -- 请viewDidLoad作答 --
- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatBackButton];
    UIView *sv = [UIView new];
    sv.backgroundColor = [UIColor blackColor];
    [sv showPlaceHolder];
    [self.view addSubview:sv];
    
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(@0);
        make.height.equalTo(@200);
        make.center.equalTo(self.view);
        
    }];
    NSLog(@"测试");
    int padding1 = 10;
    UIView *sv2 = [UIView new];
    sv2.backgroundColor = [UIColor colorWithRed:0.000 green:1.000 blue:0.502 alpha:1.000];
    [sv2 showPlaceHolder];
    [self.view addSubview:sv2];
    
    NSLog(@"通过测试");
    UIView *sv3 = [UIView new];
    sv3.backgroundColor = [UIColor colorWithRed:0.000 green:1.000 blue:0.502 alpha:1.000];
    [sv3 showPlaceHolder];
    [self.view addSubview:sv3];
    
    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(150);
        make.centerY.mas_equalTo(sv.mas_centerY);
        make.width.equalTo(sv3);
        make.left.equalTo(sv).with.offset(padding1);
        
        make.right.equalTo(sv3.mas_left).with.offset(-padding1);
        
        
        
        
        
    }];
    

    [sv3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@150);
         make.centerY.mas_equalTo(sv.mas_centerY);
        make.width.equalTo(sv2);
        make.left.equalTo(sv2.mas_right).with.offset(padding1);
        make.right.equalTo(sv.mas_right).with.offset(-padding1);
        
        
        
        
        
    }];
    
    
    
    // Do any additional setup after loading the view.
}
- (void)handleBack:(UIButton *)button{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
- (void)creatBackButton{
    self.navigationController.navigationBarHidden = YES;
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.backgroundColor = [UIColor colorWithHue:(arc4random() % 256 / 256.0 ) saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                      brightness:( arc4random() % 128 / 256.0 ) + 0.5 alpha:0.2];
    back.layer.cornerRadius = 32;
    back.layer.masksToBounds = YES;
    [back setImage:[UIImage imageNamed:@"airport"] forState:UIControlStateNormal];
    [self.view addSubview:back];
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(64, 64));
        make.top.left.equalTo(@15);
        
    }];
    self.view.backgroundColor = [UIColor whiteColor];
    [back addTarget:self action:@selector(handleBack:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *topic = [[UILabel alloc] init];
    topic.backgroundColor = [UIColor colorWithRed:0.000 green:1.000 blue:0.502 alpha:1.000];
    topic.text = @" [初级] 让两个高度为150的view(sv的子view)水平居中且等宽且等间隔排列 间隔为10(自动计算其宽度)";
    topic.font = [UIFont systemFontOfSize:13.0f];
    topic.numberOfLines = 0;
    topic.layer.cornerRadius = 5;
    topic.layer.masksToBounds = YES;
    topic.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:topic];
    
    [topic mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(back.mas_right).offset(20);
        make.right.equalTo(@-10);
        make.top.equalTo(back).offset(5);
        make.bottom.equalTo(back.mas_bottom).offset(-5);
        
    }];
    
    
    
    
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
