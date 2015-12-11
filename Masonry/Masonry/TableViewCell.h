//
//  TableViewCell.h
//  MasonryButton
//
//  Created by 刘栋 on 15/12/7.
//  Copyright © 2015年 刘栋. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Model;
@interface TableViewCell : UITableViewCell

@property (nonatomic, strong)Model *model;
- (CGFloat)cellHeightText:(NSString *)text;
@end
