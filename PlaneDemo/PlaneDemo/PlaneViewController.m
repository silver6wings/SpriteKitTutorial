//
//  ViewController.m
//  SpriteKitSimpleGame
//
//  Created by silver6wings on 14-2-25.
//  Copyright (c) 2014年 silver6wings. All rights reserved.
//

#import "PlaneViewController.h"
#import "PlaneScene.h"

@implementation PlaneViewController

-(id)init{
    if (self = [super init]) {
    }
    return self;
}

-(void)loadView{
    [super loadView];
    
    SKView * skView = [[SKView alloc] initWithFrame:self.view.bounds];
    self.view = skView;
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    SKView * skView = (SKView *)self.view;
    //如果skView没有scene
    if(!skView.scene){
        SKScene * scene = [PlaneScene sceneWithSize:skView.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        
        [skView presentScene:scene];
        
        skView.showsFPS = YES;          // 展示帧速率
        skView.showsNodeCount = YES;    // 展示Node数量
        skView.showsDrawCount = YES;    // 展示绘图操作的数量
        skView.showsPhysics = NO;       // 展示物理模型
    }
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end