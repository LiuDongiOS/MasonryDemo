//
//  FirstViewController.m
//  Masonry
//
//  Created by 刘栋 on 15/12/8.
//  Copyright © 2015年 刘栋. All rights reserved.
//

#import "FirstViewController.h"
#import "Masonry.h"
#import "MMPlaceHolder.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

#pragma mark -- 请viewDidLoad作答 --

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatBackButton];
    UIView *sv = [UIView new];
    [sv showPlaceHolder];
    sv.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:sv];
   [sv mas_makeConstraints:^(MASConstraintMaker *make) {
      //and with 没有什么用 基本可以不写 单纯为了更优雅
       //这两句没有任何区别
       make.left.right.equalTo(@0);
       make.height.equalTo(@200);
       make.center.equalTo(self.view);
       
       
       
       
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
    topic.text = @"[基础] 居中显示一个view";
    topic.layer.cornerRadius = 5;
    topic.layer.masksToBounds = YES;
    topic.textAlignment = NSTextAlignmentCenter;
    topic.font = [UIFont systemFontOfSize:13.0f];
    topic.numberOfLines = 0;
    [self.view addSubview:topic];
    
    [topic mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(back.mas_right).offset(20);
        make.right.equalTo(@-10);
        make.top.equalTo(back).offset(15);
        make.bottom.equalTo(back.mas_bottom).offset(-15);
        
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
