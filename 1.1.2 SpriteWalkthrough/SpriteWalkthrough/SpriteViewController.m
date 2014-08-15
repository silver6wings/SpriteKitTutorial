//
//  SpriteViewController.m
//  SpriteWalkthrough
//
//  Created by silver6wings on 14-8-4.
//  Copyright (c) 2014年 silver6wings. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SpriteViewController.h"

@interface SpriteViewController ()

@end

@implementation SpriteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view = [[SKView alloc] initWithFrame:self.view.bounds];
        self.view.backgroundColor = [UIColor blueColor];
        
    }
    return self;
}

- (void)viewDidLoad
{
    /*
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SKView * spriteView = (SKView *)self.view;
    spriteView.showsDrawCount = YES;
    spriteView.showsNodeCount = YES;
    spriteView.showsFPS = YES;
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
