//
//  FourthViewController.m
//  Masonry
//
//  Created by 刘栋 on 15/12/8.
//  Copyright © 2015年 刘栋. All rights reserved.
//

#import "FourthViewController.h"
#import "Masonry.h"
#import "MMPlaceHolder.h"
@interface FourthViewController ()

@end

@implementation FourthViewController
#pragma mark -- 请viewDidLoad作答 --
- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatBackButton];
    
    UIView *blackView = [UIView new];
    blackView.backgroundColor = [UIColor blackColor];
    [blackView showPlaceHolder];
    [self.view addSubview:blackView];
    
    UIView *grayView = [UIView new];
    grayView.backgroundColor = [UIColor lightGrayColor];
    [grayView showPlaceHolder];
    [self.view addSubview:grayView];
  
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
    //添加左,上边距的约束
    //mas_equal的支持CGSIZE CGPOINT NSNUMBER UIEDGEINSETS
        make.top.mas_equalTo(80);
        make.left.mas_equalTo(20);
        //添加右边约束
        make.right.mas_equalTo(-20);
   
        
        
    }];
    

    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        //添加右下约束
        make.bottom.right.mas_equalTo(-20);
        //添加高度约束,让高度等于blackview
        make.height.equalTo(blackView);
        //添加上边约束
        make.top.equalTo(blackView.mas_bottom).offset(20);
        //添加左边距
        make.left.equalTo(self.view.mas_centerX).offset(0)
        ;
        
        
        
        
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
    topic.text = @" [初级] 黑,灰俩个view.黑色view的左、右边距为20，上边距为80, 下边距灰色view 20，宽度自适应，高度与灰色view平分整个界面(不包含头部的标题和按钮所占高度).灰色view宽度为黑色view的一半（即左边以中线起始），右、下边距与黑色view相同，高度与黑色view相同)";
    topic.font = [UIFont systemFontOfSize:10.0f];
    topic.numberOfLines = 0;
    topic.layer.cornerRadius = 5;
    topic.layer.masksToBounds = YES;
    topic.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:topic];
    
    [topic mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(back.mas_right).offset(10);
        make.right.equalTo(@-10);
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
