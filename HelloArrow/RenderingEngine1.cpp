//
//  RenderingEngine1.cpp
//  HelloArrow
//
//  Created by innerpeacer on 15/1/3.
//  Copyright (c) 2015年 innerpeacer. All rights reserved.
//

#include "IRenderingEngine.hpp"

#include <OpenGLES/ES1/gl.h>
#include <OpenGLES/ES1/glext.h>

class RenderingEngine1 : public IRenderingEngine
{
public:
    RenderingEngine1();
    
    void Initialize(int width, int heith);
    void Render() const;
    void UpdateAnimation(float timeStep) {}
    void OnRotate(DeviceOrientation newOrientation) {}
    ~RenderingEngine1() {}
    
private:
    GLuint m_framebuffer;
    GLuint m_renderbuffer;
};


IRenderingEngine *CreateRenderer1()
{
    return new RenderingEngine1();
}

RenderingEngine1::RenderingEngine1()
{
    glGenRenderbuffersOES(1, &m_renderbuffer);
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, m_renderbuffer);
}

void RenderingEngine1::Initialize(int width, int heith)
{
    glGenFramebuffersOES(1, &m_framebuffer);
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, m_framebuffer);
    glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, m_renderbuffer);
    
    glViewport(0, 0, width, heith);
    
    const float maxX = 2;
    const float maxY = 3;
    
    glOrthof(-maxX, +maxX, -maxY, maxY, -1, 1);
    glMatrixMode(GL_MODELVIEW);
}

void RenderingEngine1::Render() const
{
    glClearColor(0.5f, 0.5f, 0.5f, 1);
    glClear(GL_COLOR_BUFFER_BIT);
    
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_COLOR_ARRAY);
    
    glVertexPointer(2, GL_FLOAT, sizeof(Vertex), &Vertices[0].Position[0]);
    glColorPointer(4, GL_FLOAT, sizeof(Vertex), &Vertices[0].Color[0]);
    
    GLsizei vertexCount = sizeof(Vertices)/sizeof(Vertex);
    glDrawArrays(GL_TRIANGLES, 0, vertexCount);
    
    glDisableClientState(GL_VERTEX_ARRAY);
    glDisableClientState(GL_COLOR_ARRAY);
    
}