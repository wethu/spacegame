//
//  Ship.m
//  rpggame
//
//  Created by Ellis Gray on 6/01/2015.
//  Copyright (c) 2015 Ellis Gray. All rights reserved.
//

#import "Ship.h"
#import "Bullet.h"
#import "Enemy.h"
#import "GameHitDetector.h"

@interface Ship()

@property (nonatomic) SPSprite *world;

@end

@implementation Ship

- (instancetype)initWithWorld:(SPSprite *)world {
    
    if (self = [super initWithContentsOfFile:@"ship.png"]) {
        _world = world;
        self.scale = 0.5f;
        [self addEventListener:@selector(shoot:) atObject:self forType:SP_EVENT_TYPE_TOUCH];
        self.x = 0;
        self.y = 100;
        [world addChild:self];
    }
    
    return self;
}

- (void)shoot:(SPEvent *)event {
    Bullet *leftBullet = [Bullet new];
    leftBullet.x = self.x + ((self.width ) * 0.75f);
    leftBullet.y = self.y;
    leftBullet.color = 0x00ff00;
    
    Bullet *rightBullet = [Bullet new];
    rightBullet.x = self.x + ((self.width ) * 0.25f);
    rightBullet.y = self.y;
    rightBullet.color = 0x00ff00;
    
    
    [self.world addChild:leftBullet];
    [self.world addChild:rightBullet];
    
    [self configBulletTween:[SPTween tweenWithTarget:rightBullet time:1.5f]];
    [self configBulletTween:[SPTween tweenWithTarget:leftBullet time:1.5f]];
    
    
}

- (void)configBulletTween:(SPTween *)tween {
    Bullet *bullet = (Bullet *) tween.target;
    
    [tween animateProperty:@"y" targetValue:0];
    [[self hitDetector] registerTween:tween];
    
    tween.onComplete = ^{
        [self.world removeChild:bullet];
    };
    [Sparrow.juggler addObject:tween];
}

- (NSArray *)enemies {
    return [self hitDetector].enemies;
}

- (GameHitDetector *)hitDetector {
    return [GameHitDetector gameHitDetector];
}

@end
