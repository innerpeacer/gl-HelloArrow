//
//  GraphicsData.h
//  HelloArrow
//
//  Created by innerpeacer on 15/1/3.
//  Copyright (c) 2015年 innerpeacer. All rights reserved.
//

#ifndef HelloArrow_GraphicsData_h
#define HelloArrow_GraphicsData_h

struct Vertex {
    float Position[2];
    float Color[4];
};

const struct Vertex Vertices[] = {
    {{-0.5, -0.866}, {1, 1, 0.5f, 1}},
    {{0.5, -0.866}, {1, 1, 0.5f, 1}},
    {{0, 1}, {1, 1, 0.5f, 1}},
    {{-0.5, -0.866}, {0.5, 0.5, 0.5f}},
    {{0.5, -0.866}, {0.5, 0.5, 0.5f}},
    {{0, -0.4}, {0.5, 0.5, 0.5}},
};

//const struct Vertex Vertices[] = {
//    {{-0.5, -0.866}, {1, 1, 0.5f, 1}},
//    {{2.0, -0.866}, {1, 1, 0.5f, 1}},
//    {{0, 3}, {1, 1, 0.5f, 1}},
//    {{-0.5, -0.866}, {1, 0.5, 0.5f, 1}},
//    {{0.5, -0.866}, {0.6, 1, 0.5f, 0}},
//    {{0, -3}, {0.6, 0.5, 1, 0}},
//};

#endif
