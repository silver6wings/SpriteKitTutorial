//
//  ViewController.m
//  CrazySnake
//
//  Created by silver6wings on 14-4-11.
//  Copyright (c) 2014年 silver6wings. All rights reserved.
//

#import "RootViewController.h"
#import "SnakeScene.h"

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    SKView * mainView;
    if( [UIScreen mainScreen].bounds.size.height <= 480.0f ){
        mainView = [[SKView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)]; // Retina 3.5
    } else {
        mainView = [[SKView alloc] initWithFrame:CGRectMake(0, 44, 320, 480)]; // Retina 4
    }
    
    
    if(!mainView.scene){
        SKScene * scene = [SnakeScene sceneWithSize:mainView.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        
        [mainView presentScene:scene];
    }
    
    [self.view addSubview:mainView];
}


@end
