//
//  StarBackground.m
//  rpggame
//
//  Created by Ellis Gray on 6/01/2015.
//  Copyright (c) 2015 Ellis Gray. All rights reserved.
//

#import "StarBackground.h"

@interface StarBackground ()

@property (nonatomic) SPSprite *world;

@end

@implementation StarBackground

- (instancetype)initWithWorld:(SPSprite *)world {
    if (self = [super init]) {
        _world = world;
    }
    return self;
}

- (void)loadBackground {
    [self loadStarTimer];
}

- (void)loadStarTimer {
    [NSTimer scheduledTimerWithTimeInterval:0.07f target:self selector:@selector(addStar) userInfo:nil repeats:YES];
}

- (void)addStar {
    if(arc4random() % 2 == 1) {
        int colors[] = { 0xc6c6c6, 0xf1f1f1 };
        float starSize = ((double)arc4random() / ARC4RANDOM_MAX * 1.5f) + 1.0f;
        int starColor = (int) floorf(((double)arc4random() / ARC4RANDOM_MAX) * 2.f);
        SPQuad *star = [SPQuad quadWithWidth:starSize height:starSize];
        double val = floorf(((double)arc4random() / ARC4RANDOM_MAX) * 320.0f);
        star.x = val;
        star.y = 0;
        star.color = colors[starColor];
        [self.world addChild:star atIndex:0];
        [self tweenStar:star];
    }
}

- (void)tweenStar:(SPQuad *)star {
    SPTween *tween = [SPTween tweenWithTarget:star time:5.0f];
    [tween animateProperty:@"y" targetValue:600];
    tween.onComplete = ^{
        [self.world removeChild:star];
    };
    [Sparrow.juggler addObject:tween];
}

@end
