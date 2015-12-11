//
//  TableViewCell.m
//  MasonryButton
//
//  Created by 刘栋 on 15/12/7.
//  Copyright © 2015年 刘栋. All rights reserved.
//

#import "TableViewCell.h"
#import "Masonry.h"
#import "Model.h"
@interface TableViewCell ()

@property (nonatomic, strong) UILabel *lableContent;
@property (nonatomic, strong) UILabel *lableDown;
@property (nonatomic, strong) UILabel *lableUp;
@property (nonatomic, strong) UIButton *buttonDown;
@property (nonatomic, strong) UIButton *buttonUp;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) UIImageView *buttonAndLabelImg;
@property (nonatomic, strong) UIImageView *img;


@end

@implementation TableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.view = [[UIView alloc] init];
        self.view.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.view];
        
        self.lableContent = [[UILabel alloc] init];
        [self.contentView addSubview:self.lableContent];
        self.lableContent.font = [UIFont systemFontOfSize:15];
        
        self.buttonAndLabelImg = [[UIImageView alloc] init];
        [self.contentView addSubview:self.buttonAndLabelImg];
        
        self.buttonDown = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.buttonAndLabelImg addSubview:self.buttonDown];
        
        self.buttonUp = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.buttonAndLabelImg addSubview:self.buttonUp];
        
        self.lableDown = [[UILabel alloc] init];
        [self.buttonAndLabelImg addSubview:self.lableDown];
        
        self.lableUp =[[UILabel alloc] init];
        [self.buttonAndLabelImg addSubview:self.lableUp];
        
        
        
    }
    return self;
    
    
}
- (void)layoutSubviews{
    
    [super layoutSubviews];


   //添加约束
   [self.lableContent mas_makeConstraints:^(MASConstraintMaker *make) {
      
       make.edges.equalTo(self.contentView);
       
   }];
    
    
    


    
    
}
- (void)setModel:(Model *)model{
  
    _model = model;
    
    self.lableContent.text = model.digest;
    self.lableContent.text = [self filterHTML:model.digest];
    self.lableContent.numberOfLines = 0;

    
    self.lableUp.text = model.upTimes.description;
    self.lableUp.textAlignment = NSTextAlignmentLeft;
    
    self.lableDown.text = model.downTimes.description;
    self.lableDown.textAlignment = NSTextAlignmentLeft;
    
    self.lableUp.font = [UIFont systemFontOfSize:12];
    self.lableUp.textColor = [UIColor colorWithWhite:0.502 alpha:1.000];
    
    self.lableDown.font = [UIFont systemFontOfSize:12];
    self.lableDown.textColor = [UIColor colorWithWhite:0.502 alpha:1.000];
    
}
- (CGFloat)cellHeightText:(NSString *)text {
    
    CGRect rect = [text  boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16.0]} context:nil];

    return rect.size.height + 5 + 2;
}


-(NSString *)filterHTML:(NSString *)html
{
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text     = nil;
    while([scanner isAtEnd]==NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    //    NSString * regEx = @"<([^>]*)>";
    //    html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    return html;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
