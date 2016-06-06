//
//  RSCheckBox.h
//  RSCheckBox
//
//  Created by founderbn on 16/6/6.
//  Copyright © 2016年 founderbn. All rights reserved.
//

#import <UIKit/UIKit.h>
#define Q_CHECK_ICON_WH                    (15.0)
#define Q_ICON_TITLE_MARGIN                (5.0)
@interface RSCheckBox : UIButton

@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, strong) NSString *selectedImgName;
@property (nonatomic, strong) NSString *unSelectedImgName;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, assign) NSInteger value;
@property (nonatomic, assign) BOOL selectedAll;

@end
