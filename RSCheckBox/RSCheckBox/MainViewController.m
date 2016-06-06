//
//  MainViewController.m
//  RSCheckBox
//
//  Created by founderbn on 16/6/6.
//  Copyright © 2016年 founderbn. All rights reserved.
//

#import "MainViewController.h"
#import "RSCheckBox.h"
#import "RSCheckGroup.h"

@interface MainViewController ()
{
    RSCheckGroup *checkGroup;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    RSCheckBox *checkBox0=[[RSCheckBox alloc]initWithFrame:CGRectMake(0, 10, 200, 30)];
    checkBox0.text=@"全选";
    checkBox0.selectedAll=YES;//设置是否有全选按钮
    
    RSCheckBox *checkBox1=[[RSCheckBox alloc]initWithFrame:CGRectMake(0, 50, 200, 30)];
    checkBox1.text=@"测试1";
    checkBox1.value=1;
    checkBox1.textColor=[UIColor greenColor];
    
    RSCheckBox *checkBox2=[[RSCheckBox alloc]initWithFrame:CGRectMake(0, 90, 200, 30)];
    checkBox2.text=@"测试2";
    checkBox2.value=2;
    RSCheckBox *checkBox3=[[RSCheckBox alloc]initWithFrame:CGRectMake(0, 130, 200, 30)];
    checkBox3.text=@"测试3";
    checkBox3.value=3;
    NSArray *arr=[NSArray arrayWithObjects:checkBox0,checkBox1,checkBox2,checkBox3, nil];
    checkGroup=[[RSCheckGroup alloc]initWithFrame:CGRectMake(20, 100, 150, 200) WithCheckBtns:arr];
    checkGroup.isCheck=YES;
    checkGroup.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:checkGroup];
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(20, 320, 100, 30)];
    btn.backgroundColor=[UIColor redColor];
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)btnAction
{
    if (checkGroup.isCheck) {
        for (int i=0; i<checkGroup.selectTextArr.count; i++) {
            NSLog(@"%@,%@",checkGroup.selectTextArr[i],checkGroup.selectValueArr[i]);
        }
    }else{
        NSLog(@"%ld%@",(long)checkGroup.selectValue,checkGroup.selectText);
    }
    
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
