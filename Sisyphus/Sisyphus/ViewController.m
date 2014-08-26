//
//  ViewController.m
//  Sisyphus
//
//  Created by silver6wings on 14-8-23.
//  Copyright (c) 2014年 silver6wings. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"

@implementation ViewController

-(void)loadView{
    [super loadView];
    SKView * skView = [[SKView alloc] initWithFrame:self.view.bounds];
    self.view = skView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    skView.showsDrawCount = YES;
    skView.showsPhysics = YES;
    
    SKScene * scene = [MyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    [skView presentScene:scene];
}

@end
