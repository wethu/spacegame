//
//  RPGGame.m
//  rpggame
//
//  Created by Ellis Gray on 3/01/2015.
//  Copyright (c) 2015 Ellis Gray. All rights reserved.
//



#define ARC4RANDOM_MAX 0x100000000

#import "RPGGame.h"
#import "Bullet.h"
#import "Ship.h"
#import "StarBackground.h"
#import "EnemySnowman.h"
#import "GameHitDetector.h"

@interface RPGGame ()

//@property (strong, nonatomic) SPImage *snowman;
@property (strong, nonatomic) Ship *ship;
@property (strong, nonatomic) SPTween *enemyCarousel;
@property (strong, nonatomic) SPQuad *left;
@property (strong, nonatomic) SPQuad *right;
@property (strong, nonatomic) EnemySnowman *snowman;
@property (strong, nonatomic) GameHitDetector *hitDetector;

@end

@implementation RPGGame {
    
    float shipStartYPosition;
    float shipStartXPosition;
    
    float enemySpawnYPosition;
    float enemySpawnXPosition;
    
    unsigned int snowmanHP;
}

- (id)init {
    if ((self = [super init])) {
        shipStartXPosition = 100;
        shipStartYPosition = 400;
        
        enemySpawnXPosition = 0;
        enemySpawnYPosition = 10;
        NSLog(@"%@",[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject]);
        snowmanHP = 100;
        [self loadEntities];
//        [self createEvents];
        
    }
    return self;
}

- (void)loadEntities {
    self.hitDetector.world = self;
    [self addChild:self.snowman];
    [self addChild:self.ship];
    
    StarBackground *background = [[StarBackground alloc] initWithWorld:self];
    [background loadBackground];
    
    [self addChild:self.left];
    [self addChild:self.right];
}


- (void)shoot:(SPEvent *)event {
    
    Bullet *leftBullet = [Bullet new];
    leftBullet.x = self.ship.x + ((self.ship.width ) * 0.75f);
    leftBullet.y = self.ship.y;
    leftBullet.color = 0x00ff00;

    Bullet *rightBullet = [Bullet new];
    rightBullet.x = self.ship.x + ((self.ship.width ) * 0.25f);
    rightBullet.y = self.ship.y;
    rightBullet.color = 0x00ff00;
    
    [self addChild:leftBullet];
    [self addChild:rightBullet];
    
    [self configBulletTween:[SPTween tweenWithTarget:rightBullet time:1.5f]];
    [self configBulletTween:[SPTween tweenWithTarget:leftBullet time:1.5f]];
}

- (void)configBulletTween:(SPTween *)tween {
    Bullet *bullet = (Bullet *) tween.target;

    [tween animateProperty:@"y" targetValue:0];
    tween.onUpdate = ^{
        if ([self containsChild:self.snowman]) {
            
            SPRectangle *bounds = [self.snowman boundsInSpace:self];
            SPRectangle *bulletBounds = bullet.bounds;
            
            if ([bounds intersectsRectangle:bulletBounds]) {
                if (!bullet.spent) {
                    snowmanHP -= bullet.dmg;
                    [self removeChild:bullet];
                    if (snowmanHP <= 0) {
                        [self killEnemy:self.snowman];
                    }
                }
            }
        }
    };
    tween.onComplete = ^{
        [self removeChild:bullet];
    };
    [Sparrow.juggler addObject:tween];
}

- (void)killEnemy:(SPImage *)enemy {
    [Sparrow.juggler removeObject:self.enemyCarousel];
    [self removeChild:enemy];
}

- (Ship *)ship {
    if (!_ship) {
        _ship = [[Ship alloc] initWithWorld:self];
        _ship.x = shipStartXPosition;
        _ship.y = shipStartYPosition;

    }
    return _ship;
}
- (SPImage *)snowman {
    if (!_snowman) {
        _snowman = [[EnemySnowman alloc] initWithWorld:self];
        _snowman.y = enemySpawnYPosition;
        _snowman.x = enemySpawnXPosition;
        [self.hitDetector.enemies addObject:_snowman];
    }
    return _snowman;
}

- (SPQuad *)left {
    if (!_left) {
        _left = [SPQuad quadWithWidth:50.f height:50.f];
        _left.x = 0;
        _left.y = 500;
        _left.color = 0xffffff;
    }
    return _left;
}
- (SPQuad *)right {
    if (!_right) {
        _right = [SPQuad quadWithWidth:50.f height:50.f];
        _right.x = 270;
        _right.y = 500;
        _right.color = 0xffffff;
    }
    return _right;
}

- (GameHitDetector *)hitDetector {
    if (!_hitDetector) {
        _hitDetector = [GameHitDetector gameHitDetector];
    }
    return _hitDetector;
}
@end

