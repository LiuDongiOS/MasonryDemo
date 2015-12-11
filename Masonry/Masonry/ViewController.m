//
//  ViewController.m
//  Masonry
//
//  Created by 刘栋 on 15/12/8.
//  Copyright © 2015年 刘栋. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "SixthViewController.h"
#import "SeventhViewController.h"
#import "EighthViewController.h"
#import "NinthViewController.h"
#import "TenthViewController.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"Masonry";
    self.navigationController.navigationBarHidden = NO;
    [self createTableView];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = NO;
    [self.tableView reloadData];
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
    [self.tableView reloadData];
    
}
- (void)createTableView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 10;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.backgroundColor = [UIColor colorWithHue:(arc4random() % 256 / 256.0 ) saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                      brightness:( arc4random() % 128 / 256.0 ) + 0.5 alpha:0.4];
    
    NSArray *array = @[@"不堪一击", @"初学乍练", @"初窥门径", @"略有小成", @"驾轻就熟", @"融会贯通", @"炉火纯青", @"出类拔萃", @"出神入化", @"得心应手"];
    NSArray *arrayColor = @[[UIColor whiteColor], [UIColor colorWithRed:1.000 green:0.400 blue:0.400 alpha:1.000], [UIColor colorWithRed:0.502 green:0.000 blue:0.000 alpha:1.000], [UIColor colorWithRed:0.502 green:0.251 blue:0.000 alpha:1.000], [UIColor colorWithRed:0.502 green:0.000 blue:0.251 alpha:1.000], [UIColor colorWithRed:0.800 green:0.400 blue:1.000 alpha:1.000], [UIColor colorWithRed:1.000 green:0.400 blue:1.000 alpha:1.000], [UIColor colorWithRed:1.000 green:0.000 blue:0.502 alpha:1.000], [UIColor redColor], [UIColor magentaColor]];
    cell.textLabel.text = array[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = arrayColor[indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:indexPath.row + 12   ];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return indexPath.row * 5 + 38;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    FirstViewController *first     = [[FirstViewController alloc] init];
    SecondViewController *second   = [[SecondViewController alloc] init];
    ThirdViewController *third     = [[ThirdViewController alloc] init];
    FourthViewController *fourth   = [[FourthViewController alloc] init];
    FifthViewController *fifth     = [[FifthViewController alloc] init];
    SixthViewController *sixth     = [[SixthViewController alloc] init];
    SeventhViewController *seventh = [[SeventhViewController alloc] init];
    EighthViewController *eighth   = [[EighthViewController alloc] init];
    NinthViewController *ninth     = [[NinthViewController alloc] init];
    TenthViewController *tenth     = [[TenthViewController alloc] init];
    
    
    NSArray *array = @[first,second, third, fourth, fifth, sixth, seventh, eighth, ninth, tenth];
    
    
    [self.navigationController pushViewController:array[indexPath.row] animated:YES];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
