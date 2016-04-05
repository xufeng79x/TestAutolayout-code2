//
//  MyViewController.m
//  TestAutolayout-code2
//
//  Created by apple on 16/3/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

// 创建view层级
-(void)loadView
{
    // 创建根视图
    UIView *rootView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    rootView.backgroundColor = [UIColor whiteColor];
    self.view = rootView;
    
    // 创建两个视图
    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(20, 30, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    
    // 告诉view不要将自动缩放掩码转换成约束
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:redView];
    
    UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(200, 30, 100, 100)];
    blueView.backgroundColor = [UIColor blueColor];
    
    // 告诉view不要将自动缩放掩码转换成约束
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:blueView];
    
    // 使用VFL描述进行约束设定
    
    // 1.创建名称映射，以便于VFL中的[view名称]能够和正真的view实例像映射
    NSDictionary *nameMap = @{@"redView":redView,@"blueView":blueView};
    
    // 2.1使用VFL描述创建约束-水平约束
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[redView]-80-[blueView]-20-|" options:0 metrics:nil views:nameMap];
    
    // 2.2使用VFL描述创建约束-垂直约束
    NSArray *verticalRedViewConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[redView]" options:0 metrics:nil views:nameMap];
    
    NSArray *verticalBlueViewConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[blueView]" options:0 metrics:nil views:nameMap];
    
    
    

    
    //3. 将两个view增加等宽约束
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint
                  constraintWithItem:redView
                  attribute:NSLayoutAttributeWidth
                  relatedBy:NSLayoutRelationEqual
                  toItem: blueView
                  attribute:NSLayoutAttributeWidth
                  multiplier:1.0f
                  constant:0];
    
    
    
    
    // 4.将两个view增加长宽等比例约束
    NSLayoutConstraint *redRatioConstraint =[NSLayoutConstraint
                                     constraintWithItem:redView
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:redView
                                     attribute:NSLayoutAttributeHeight
                                     multiplier:1.0/1.0 //Aspect ratio: 4*height = 3*width
                                     constant:0.0f];
    
    
    NSLayoutConstraint *blueRatioConstraint =[NSLayoutConstraint
                                             constraintWithItem:blueView
                                             attribute:NSLayoutAttributeWidth
                                             relatedBy:NSLayoutRelationEqual
                                             toItem:blueView
                                             attribute:NSLayoutAttributeHeight
                                             multiplier:1.0/1.0 //Aspect ratio: 4*height = 3*width
                                             constant:0.0f];
    
    
    // 5.设置约束
    //[self.view addConstraints:horizontalConstraints];
    [self.view addConstraints:verticalRedViewConstraints];
    [self.view addConstraints:verticalBlueViewConstraints];
    [self.view addConstraint:widthConstraint];
    [redView addConstraint:redRatioConstraint];
    [blueView addConstraint:blueRatioConstraint];
    
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
