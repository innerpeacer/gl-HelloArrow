//
//  GLView.h
//  HelloArrow
//
//  Created by innerpeacer on 15/1/2.
//  Copyright (c) 2015年 innerpeacer. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <OpenGLES/EAGL.h>
#import <QuartzCore/QuartzCore.h>

//#import <OpenGLES/ES1/gl.h>
//#import <OpenGLES/ES1/glext.h>

#import "IRenderingEngine.hpp"

@interface GLView : UIView
{
    EAGLContext *m_context;
    
    IRenderingEngine *m_renderingEngine;
    float m_timestep;
}

//- (void)drawView;
- (void)drawView:(CADisplayLink *)displayLink;
- (void)didRotate:(NSNotification *)notification;

@end
