//
//  MenuViewController.m
//  PixieCatcha
//
//  Created by silver6wings on 14-11-19.
//  Copyright (c) 2014年 silver6wings. All rights reserved.
//

#import "MenuViewController.h"
#import "GameViewController.h"

@interface MenuViewController ()
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * btStart = [UIButton buttonWithType:UIButtonTypeCustom];
    btStart.backgroundColor = [UIColor yellowColor];
    btStart.frame = CGRectMake(0, 0, 100, 100);
    [btStart setTitle:@"Start" forState:UIControlStateNormal];
    [btStart setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btStart addTarget:self action:@selector(clickStart:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btStart];
}

- (void)clickStart:(id)sender {
    GameViewController * levelVC = [[GameViewController alloc] init];
    [self.navigationController pushViewController:levelVC animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
