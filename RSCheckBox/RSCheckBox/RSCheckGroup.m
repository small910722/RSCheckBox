//
//  RSCheckGroup.m
//  RSCheckBox
//
//  Created by founderbn on 16/6/6.
//  Copyright © 2016年 founderbn. All rights reserved.
//

#import "RSCheckGroup.h"
#import "RSCheckBox.h"

@implementation RSCheckGroup

-(id)initWithFrame:(CGRect)frame WithCheckBtns:(NSArray *)checkBtns
{
    self = [super initWithFrame:frame];
    if (self) {
        _selectTextArr=[[NSMutableArray alloc]init];
        _selectValueArr=[[NSMutableArray alloc]init];
        for (id checkBtn in checkBtns) {
            [self addSubview:checkBtn];
        }
        [self commonInit];
    }
    return self;
}
-(void)commonInit
{
    for (UIView *checkBtn in self.subviews) {
        if ([checkBtn isKindOfClass:[RSCheckBox class]]) {
            if (((RSCheckBox*)checkBtn).selectedAll) {
                [(RSCheckBox*)checkBtn addTarget:self action:@selector(selectedAllCheckBox:) forControlEvents:UIControlEventTouchUpInside];
            }else{
                [(RSCheckBox*)checkBtn addTarget:self action:@selector(checkboxBtnChecked:) forControlEvents:UIControlEventTouchUpInside];
            }
        }
    }
}
-(void)checkboxBtnChecked:(RSCheckBox *)sender
{
    if (self.isCheck) {
        sender.selected=!sender.selected;
        if (sender.selected) {
            [_selectTextArr addObject:((RSCheckBox *)sender).text];
            [_selectValueArr addObject:[NSNumber numberWithInteger:((RSCheckBox *)sender).value]];
        }else{
            for (id checkBtn in self.subviews) {
                if ([checkBtn isKindOfClass:[RSCheckBox class]]) {
                    if (((RSCheckBox *)checkBtn).selectedAll) {
                        [(RSCheckBox *)checkBtn setSelected:NO];
                    }
                }
            }
            [_selectTextArr removeObject:((RSCheckBox *)sender).text];
            [_selectValueArr removeObject:[NSNumber numberWithInteger:((RSCheckBox *)sender).value]];
        }
    }else{
        for (id checkBtn in self.subviews) {
            if ([checkBtn isKindOfClass:[RSCheckBox class]]) {
                [(RSCheckBox *)checkBtn setSelected:NO];
            }
        }
        sender.selected=YES;
        self.selectText = ((RSCheckBox *)sender).text;
        self.selectValue = ((RSCheckBox *)sender).value;
    }
}
-(void)selectedAllCheckBox:(RSCheckBox *)sender
{
    sender.selected=!sender.selected;
    [_selectTextArr removeAllObjects];
    [_selectValueArr removeAllObjects];
    for (id checkBtn in self.subviews) {
        if ([checkBtn isKindOfClass:[RSCheckBox class]]) {
            if (!((RSCheckBox *)checkBtn).selectedAll) {
                [(RSCheckBox *)checkBtn setSelected:sender.selected];
                if (((RSCheckBox *)checkBtn).selected) {
                    [_selectTextArr addObject:((RSCheckBox *)checkBtn).text];
                    [_selectValueArr addObject:[NSNumber numberWithInteger:((RSCheckBox *)checkBtn).value]];
                }
            }
        }
    }
}
@end
