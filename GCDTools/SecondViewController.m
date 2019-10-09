//
//  SecondViewController.m
//  GCDTools
//
//  Created by 张奥 on 2019/10/9.
//  Copyright © 2019 张奥. All rights reserved.
//

#import "SecondViewController.h"
#import "GCDTimer.h"
#import "GCDQueue.h"
@interface SecondViewController ()
@property (nonatomic,strong)GCDTimer *time;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _time = [[GCDTimer alloc] initInQueue:[GCDQueue mainQueue]];
    [_time event:^{
        NSLog(@"123");
    } timeIntervalWithSecs:2.5];
    [_time start];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 80, 80);
    [button setTitle:@"停止" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.titleLabel.font = [UIFont systemFontOfSize:13.f];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 8.f;
    button.layer.masksToBounds = YES;
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)clickButton{
//    [_time destroy];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)dealloc{
    NSLog(@"dealloc");
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
