//
//  ViewController.m
//  POPAnimationDemo
//
//  Created by Dee on 16/1/2.
//  Copyright © 2016年 Dee. All rights reserved.
//

#import "ViewController.h"
#import <pop/POP.h>
#import "SprinAnimationViewController.h"
typedef NS_ENUM(NSInteger,TYPENUMEBR)
{
    kSprinAnimation = 0
};
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

//@property(nonatomic, strong) UITableView  *tabelView;
//
//@property(nonatomic, strong) NSMutableArray  *titleArray;

@property(nonatomic, strong) UIView  *sprinLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //初始化
    self.sprinLayer = [[UIView alloc] init];
    self.sprinLayer.backgroundColor = [UIColor orangeColor];
    self.sprinLayer.frame = CGRectMake(100, 300, 100, 100);
    [self.view addSubview:self.sprinLayer];
    
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"spring" forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 20, 100, 30);
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor grayColor];
    [btn addTarget:self action:@selector(sprinAction) forControlEvents:UIControlEventTouchUpInside];

    UIButton *colorBtn = [[UIButton alloc] init];
    [colorBtn setTitle:@"color" forState:UIControlStateNormal];
    colorBtn.frame = CGRectMake(210, 20, 100, 30);
    [self.view addSubview:colorBtn];
    colorBtn.backgroundColor = [UIColor grayColor];
    [colorBtn addTarget:self action:@selector(colorAnimation) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *basicBtn = [[UIButton alloc] init];
    [basicBtn setTitle:@"Basic" forState:UIControlStateNormal];
    basicBtn.frame = CGRectMake(100, 60, 100, 30);
    [self.view addSubview:basicBtn];
    basicBtn.backgroundColor = [UIColor grayColor];
    [basicBtn addTarget:self action:@selector(basicAnimation) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *decayBtn = [[UIButton alloc] init];
    [decayBtn setTitle:@"decay" forState:UIControlStateNormal];
    decayBtn.frame = CGRectMake(100, 100, 100, 30);
    [self.view addSubview:decayBtn];
    decayBtn.backgroundColor = [UIColor grayColor];
    [decayBtn addTarget:self action:@selector(decayAnimation) forControlEvents:UIControlEventTouchUpInside];

}

- (void)sprinAction
{
    POPSpringAnimation *animtion = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    animtion.fromValue = [NSValue valueWithCGRect:CGRectMake(300, 400, 100, 100)];
    animtion.toValue = [NSValue valueWithCGRect:CGRectMake(300, 400, 200, 200)];
    animtion.springBounciness= 10;
    animtion.repeatCount = 1;
    [self.sprinLayer pop_addAnimation:animtion forKey:@"size"];
}

- (void)colorAnimation
{
    POPSpringAnimation *animation = [POPSpringAnimation animation];
    animation.property = [POPAnimatableProperty propertyWithName:kPOPViewBackgroundColor];
    animation.repeatCount = 1;
    animation.toValue = [UIColor redColor];
    [self.sprinLayer pop_addAnimation:animation forKey:@"color"];
}

- (void)basicAnimation
{
    POPBasicAnimation *basic = [POPBasicAnimation animation];
    basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    basic.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
    basic.toValue = [NSValue valueWithCGRect:CGRectMake(140, 340, 130, 130)];
    [self.sprinLayer pop_addAnimation:basic forKey:@"frame"];
}

- (void)decayAnimation
{
    POPDecayAnimation *decay = [POPDecayAnimation animation];
    decay.velocity = @(1);
    decay.property = [POPAnimatableProperty propertyWithName:kPOPViewScaleY];
    [self.sprinLayer pop_addAnimation:decay forKey:@"positioin"];
}



/*
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:tableview];
    self.tabelView = tableview;
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;


    [self.view addSubview:self.tabelView];
}

#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString * ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row)
    {
        case kSprinAnimation:
        {
            SprinAnimationViewController *vc = [[SprinAnimationViewController alloc] init];
            [self presentViewController:vc animated:YES completion:^{
                
            }];
        }
            break;
            
        default:
            break;
    }
}


#pragma mark - setter
- (NSMutableArray *)titleArray
{
    if (!_titleArray)
    {
        _titleArray = [NSMutableArray arrayWithObjects:@"移动", nil];
    }
    return _titleArray;
}
*/
@end
