//
//  Bullet.m
//  rpggame
//
//  Created by Ellis Gray on 6/01/2015.
//  Copyright (c) 2015 Ellis Gray. All rights reserved.
//

#import "Bullet.h"

#define BULLET_DAMAGE 5
#define BULLET_WIDTH  3.0f
#define BULLET_HEIGHT 10.0f
#define BULLET_COLOR  0x00ff00

@implementation Bullet
@synthesize dmg = _dmg;

- (instancetype)initWithWidth:(float)width height:(float)height color:(uint)color premultipliedAlpha:(BOOL)pma {
    if (self = [super initWithWidth:BULLET_WIDTH height:BULLET_HEIGHT color:BULLET_COLOR premultipliedAlpha:pma]) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    _spent = NO;
    _dmg = BULLET_DAMAGE;
}

- (int)dmg {
    _spent = YES;
    return _dmg;
}

@end
