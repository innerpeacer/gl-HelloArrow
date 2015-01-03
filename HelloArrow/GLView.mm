//
//  GLView.m
//  HelloArrow
//
//  Created by innerpeacer on 15/1/2.
//  Copyright (c) 2015年 innerpeacer. All rights reserved.
//

#import "GLView.h"

#import <OpenGLES/ES2/gl.h>

@implementation GLView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        CAEAGLLayer *eaglLayer = (CAEAGLLayer *)super.layer;
        eaglLayer.opaque = YES;
        
        m_context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];
        if (!m_context || ![EAGLContext setCurrentContext:m_context]) {
            return nil;
        }
        
        
//        GLuint framebuffer;
//        GLuint renderbuffer;
//        
//        glGenFramebuffersOES(1, &framebuffer);
//        glGenRenderbuffersOES(1, &renderbuffer);
//        glBindFramebufferOES(GL_FRAMEBUFFER_OES, framebuffer);
//        glBindRenderbufferOES(GL_RENDERBUFFER_OES, renderbuffer);
//        [m_context renderbufferStorage:GL_RENDERBUFFER_OES fromDrawable:eaglLayer];
//        
//        glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, renderbuffer);
//        
//        glViewport(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
//        
//        [self drawView];
        
        m_renderingEngine = CreateRenderer1();
        [m_context renderbufferStorage:GL_RENDERBUFFER fromDrawable:eaglLayer];
        m_renderingEngine->Initialize(CGRectGetWidth(frame), CGRectGetHeight(frame));
        
        [self drawView:nil];
        
        
        m_timestep = CACurrentMediaTime();
        CADisplayLink *displayLink;
        displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(drawView:)];
        [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        
        [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didRotate:) name:UIDeviceOrientationDidChangeNotification object:nil];
    }
    return self;
}

- (void)drawView:(CADisplayLink *)displayLink
{
    if (displayLink != nil) {
        float elapseSeconds = displayLink.timestamp - m_timestep;
        m_timestep = displayLink.timestamp;
        m_renderingEngine->UpdateAnimation(elapseSeconds);
    }
    
    m_renderingEngine->Render();
    [m_context presentRenderbuffer:GL_RENDERBUFFER];
}

- (void)didRotate:(NSNotification *)notification
{
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    m_renderingEngine->OnRotate((DeviceOrientation) orientation);
    [self drawView:nil];
}

//- (void)drawView
//{
//    glClearColor(0.5f, 0.5f, 0.5f, 1.0f);
//    glClear(GL_COLOR_BUFFER_BIT);
//    
//    [m_context presentRenderbuffer:GL_RENDERBUFFER_OES];
//}


+ (Class)layerClass
{
    return [CAEAGLLayer class];
}

@end
