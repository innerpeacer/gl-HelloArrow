//
//  ViewController.m
//  HelloArrow
//
//  Created by innerpeacer on 15/1/2.
//  Copyright (c) 2015年 innerpeacer. All rights reserved.
//

#import "ViewController.h"
#import "GLView.h"

@interface ViewController ()
{
    GLView *m_view;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    m_view = [[GLView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:m_view];
}

@end
