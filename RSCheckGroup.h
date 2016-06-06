//
//  RSCheckGroup.h
//  RSCheckBox
//
//  Created by founderbn on 16/6/6.
//  Copyright © 2016年 founderbn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSCheckGroup : UIView
@property (nonatomic, strong) NSString *selectText;
@property (nonatomic) NSInteger selectValue;
@property (nonatomic, strong) NSMutableArray *selectTextArr;
@property (nonatomic, strong) NSMutableArray *selectValueArr;
@property (nonatomic,assign) BOOL isCheck;//是否复选
- (id)initWithFrame:(CGRect)frame WithCheckBtns:(NSArray*)checkBtns;
@end
