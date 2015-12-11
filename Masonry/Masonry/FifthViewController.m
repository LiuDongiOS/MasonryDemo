//
//  FifthViewController.m
//  Masonry
//
//  Created by 刘栋 on 15/12/8.
//  Copyright © 2015年 刘栋. All rights reserved.
//

#import "FifthViewController.h"
#import "Masonry.h"
#import "MMPlaceHolder.h"
@interface FifthViewController ()

@end
#pragma mark -- 请viewDidLoad作答 --
@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatBackButton];
    
    //第一步:
    UIView *greenView = [UIView new];
    greenView.backgroundColor = [UIColor greenColor];
    [greenView showPlaceHolder];
    [self.view addSubview:greenView];
    
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    [redView showPlaceHolder];
    [self.view addSubview:redView];
    
    UIView *blueView = [UIView new];
    blueView.backgroundColor = [UIColor blueColor];
    [blueView showPlaceHolder];
    [self.view addSubview:blueView];
    //第二步
    
    
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        
       
        make.top.mas_equalTo(80);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(self.view.mas_centerX).offset(-10);
        
        
        
        
    }];
    
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(80);
        make.right.mas_equalTo(-20);
        make.left.mas_equalTo(greenView.mas_right).offset(20);
       
        
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(redView.mas_bottom).offset(20);
        make.left.mas_equalTo(20);
        make.bottom.right.equalTo(@-20);

        make.height.mas_equalTo(redView);
        make.height.mas_equalTo(greenView);
        
        
        
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
    
    topic.text = @" [初级] 绿,红,蓝三个view.绿色view的上边距为80、左边距为20,右边距self.view的X中线为10. 红色view的上边距80、右边距为 20,左边距绿色view 20. 绿、红宽度自适应. 蓝色view的上边距绿、红view为 20, 左、右、下边距为20，高度与绿, 红view相同";
    topic.font = [UIFont systemFontOfSize:10.6f];
    topic.numberOfLines = 0;
    topic.layer.cornerRadius = 5;
    topic.layer.masksToBounds = YES;
    topic.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:topic];
    
    [topic mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(back.mas_right).offset(0);
        make.right.equalTo(@0);
        make.top.equalTo(back).offset(0);
        make.bottom.equalTo(back.mas_bottom).offset(0);
        
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
