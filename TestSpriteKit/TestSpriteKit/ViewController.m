//
//  ViewController.m
//  TestSpriteKit
//
//  Created by silver6wings on 14-8-19.
//  Copyright (c) 2014年 silver6wings. All rights reserved.
//

#import "ViewController.h"
#import "TestScene.h"
#import "CameraScene.h"

@implementation ViewController

-(void)loadView{
    [super loadView];
    SKView * skView = [[SKView alloc] initWithFrame:self.view.bounds];
    self.view = skView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    skView.showsDrawCount = YES;
    skView.showsPhysics = YES;
    
    if(!skView.scene){
        TestScene * testScene = [[TestScene alloc] initWithSize:skView.bounds.size];
        testScene.scaleMode = SKSceneScaleModeAspectFill;
        
        [skView presentScene:testScene];
    }
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
