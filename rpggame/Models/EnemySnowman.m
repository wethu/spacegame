//
//  EnemySnowman.m
//  rpggame
//
//  Created by Ellis Gray on 6/01/2015.
//  Copyright (c) 2015 Ellis Gray. All rights reserved.
//

#import "EnemySnowman.h"

#define HIT_POINTS 100
#define ARMOR 5

@interface EnemySnowman()

@property int hp, armor;
@property (nonatomic) SPSprite *world;
@property (nonatomic) SPTween *tween;

@end

@implementation EnemySnowman

- (instancetype)initWithWorld:(SPSprite *)world {
    if (self = [super initWithContentsOfFile:@"snowman.png"]) {
        _world = world;
        _hp = HIT_POINTS;
        _armor = ARMOR;
        [self monitorStats];
    }
    [Sparrow.juggler addObject:self.tween];
    return self;
}

- (void)monitorStats {
    [self.world addEventListener:@selector(healthCheck:) atObject:self forType:SP_EVENT_TYPE_ENTER_FRAME];
}

- (void)healthCheck:(SPEnterFrameEvent *)event {
    NSLog(@"checking health: %i", self.hp);
    if (self.hp <= 0) {
       

         [Sparrow.juggler removeObject:self.tween];
         
    }
}

- (SPTween *)tween {
    if (!_tween) {
        _tween = [SPTween tweenWithTarget:self time:1.0f];
        _tween.repeatCount = INT32_MAX;
        _tween.reverse = @YES;
        [_tween animateProperty:@"x" targetValue:270.f];
    }
    return _tween;
}

- (void)takeDmg:(Bullet *)bullet {
    if (!bullet.spent) {
        self.hp = self.hp - bullet.dmg;
        NSLog(@"HP: %i", self.hp);
    }
}

@end
