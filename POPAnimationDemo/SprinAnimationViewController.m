//
//  SprinAnimationViewController.m
//  POPAnimationDemo
//
//  Created by Dee on 16/1/2.
//  Copyright © 2016年 Dee. All rights reserved.
//

#import "SprinAnimationViewController.h"
#import <pop/POP.h>
@interface SprinAnimationViewController ()
@property(nonatomic, strong) UIView  *sprinLayer;
@end

@implementation SprinAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //初始化
    self.sprinLayer = [[UIView alloc] init];
    self.sprinLayer.backgroundColor = [UIColor orangeColor];
    self.sprinLayer.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:self.sprinLayer];
    

    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"开始动画" forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 20, 100, 30);
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor grayColor];
    [btn addTarget:self action:@selector(popAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)popAction
{
    POPSpringAnimation *animtion = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    animtion.fromValue = [NSValue valueWithCGRect:CGRectMake(300, 300, 100, 100)];
    animtion.toValue = [NSValue valueWithCGRect:CGRectMake(300, 300, 200, 200)];
    animtion.springBounciness= 10;
    [self.sprinLayer pop_addAnimation:animtion forKey:@"size"];
}


@end
