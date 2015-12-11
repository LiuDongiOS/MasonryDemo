//
//  NinthViewController.m
//  Masonry
//
//  Created by 刘栋 on 15/12/8.
//  Copyright © 2015年 刘栋. All rights reserved.
//

#import "NinthViewController.h"
#import "Masonry.h"
#import "MMPlaceHolder.h"
#import "LDAFNetWorkTool.h"
#import "Model.h"
#import "TableViewCell.h"
#define kTableViewCell @"cell"
#define kTableViewCellSecond @"reuse"
@interface NinthViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)UIButton *buttonMake;
@property (nonatomic, strong)UIButton *buttonUp;
@property (nonatomic, strong)UIButton *buttonRemark;
@property (nonatomic, strong)UIView *viewButton;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *bigArray;

@end

@implementation NinthViewController
#pragma mark -- 请在button点击事件作答 --
- (void)viewDidLoad {
    [super viewDidLoad];
    self.bigArray = [NSMutableArray array];
    [self creatBackButton];
    [self createTableView];
    [self handleData];
    // Do any additional setup after loading the view.
}
- (void)handleBack:(UIButton *)button{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
- (void)handleData{
    
    NSString *urlStr = @"http://c.3g.163.com/recommend/getChanRecomNews?channel=duanzi&size=20";
    
    [LDAFNetWorkTool getUrl:urlStr boby:nil resoponse:LDJSON requestHeadFile:nil success:^(NSURLSessionDataTask *task, id resposeOnject) {
        
        if (![resposeOnject isKindOfClass:[NSNull class]]) {
            
            NSArray *arr = [resposeOnject objectForKey:@"段子"];
            
            for (NSDictionary *dic in arr) {
                Model *model =[Model modelWithDic:dic];
                
                [self.bigArray addObject:model];
            }
            NSLog(@"%ld",self.bigArray.count);
            
            [self.tableView reloadData];
            
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
    
    
}
- (void)createTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height - 80) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCell];
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:kTableViewCellSecond];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.bigArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellSecond];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor colorWithHue:(arc4random() % 256 / 256.0 ) saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                      brightness:( arc4random() % 128 / 256.0 ) + 0.5 alpha:0.2];
    cell.model = self.bigArray[indexPath.row];
    
    return cell;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str = [[self.bigArray objectAtIndex:indexPath.row] digest];
    TableViewCell *cell = [[TableViewCell alloc] init];
    return [cell cellHeightText:str];
    
    
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
    
    topic.text = @" [中级] 解析数据, 实现约束和高度自适应";
    topic.font = [UIFont systemFontOfSize:10.6f];
    topic.numberOfLines = 0;
    topic.layer.cornerRadius = 5;
    topic.layer.masksToBounds = YES;
    topic.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:topic];
    
    [topic mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(back.mas_right).offset(10);
        make.width.equalTo(@120);
        make.top.equalTo(back).offset(10);
        make.bottom.equalTo(back.mas_bottom).offset(-10);
        
    }];
    self.viewButton = [[UIView alloc] init];
    self.viewButton.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.viewButton];
    [self.viewButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@15);
        make.height.mas_equalTo(64);
        make.left.equalTo(topic.mas_right).offset(5);
        make.right.equalTo(@-5);
        
    }];
    self.buttonMake = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonMake setTitle:@"添加" forState:UIControlStateNormal];
    self.buttonMake.backgroundColor = [UIColor colorWithRed:0.000 green:0.502 blue:0.251 alpha:1.000];
    [self.viewButton addSubview:self.buttonMake];
    
    self.buttonUp = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonUp setTitle:@"更新" forState:UIControlStateNormal];
    self.buttonUp.backgroundColor = [UIColor orangeColor];
    [self.viewButton addSubview:self.buttonUp];
    
    self.buttonRemark = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonRemark setTitle:@"重制" forState:UIControlStateNormal];
    self.buttonRemark.backgroundColor = [UIColor colorWithRed:1.000 green:0.435 blue:0.812 alpha:1.000];
    [self.viewButton addSubview:self.buttonRemark];
    self.buttonMake.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    self.buttonUp.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    self.buttonRemark.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    [self.buttonMake mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.left.equalTo(@0);
        make.right.equalTo(self.buttonUp.mas_left).offset(-20);
        make.top.bottom.equalTo(self.buttonUp);
        
    }];
    
    [self.buttonUp mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(self.buttonMake);
        make.left.equalTo(self.buttonMake.mas_right).offset(20);
        make.right.equalTo(self.buttonRemark.mas_left).offset(-20);
        make.center.equalTo(self.viewButton);
        
    }];
    
    
    [self.buttonRemark mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(self.buttonUp);
        make.left.equalTo(self.buttonUp.mas_right).offset(20);
        make.top.bottom.equalTo(self.buttonUp);
        
        
    }];
    
    self.buttonMake.layer.cornerRadius = 10;
    self.buttonMake.layer.masksToBounds = YES;
    [self.buttonMake addTarget:self action:@selector(handleMake:) forControlEvents:UIControlEventTouchUpInside];
    
    self.buttonUp.layer.cornerRadius = 10;
    self.buttonUp.layer.masksToBounds = YES;
    [self.buttonUp addTarget:self action:@selector(handleUp:) forControlEvents:UIControlEventTouchUpInside];
    
    self.buttonRemark.layer.cornerRadius = 10;
    self.buttonRemark.layer.masksToBounds = YES;
    [self.buttonRemark addTarget:self action:@selector(handleRemark:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}
#pragma mark -- button点击事件 --
- (void)handleMake:(UIButton *)button{
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(80);
        make.left.mas_equalTo(self.view.mas_left);
        make.bottom.right.mas_equalTo(0);
        
      
        
        
        
    }];
    
    
}

- (void)handleUp:(UIButton *)button{
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        
        
        
        
    }];
    
    
    
}

- (void)handleRemark:(UIButton *)button{
    
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        
        
        
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
