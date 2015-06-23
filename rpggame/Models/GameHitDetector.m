//
//  GameHitDetector.m
//  rpggame
//
//  Created by Ellis Gray on 6/01/2015.
//  Copyright (c) 2015 Ellis Gray. All rights reserved.
//

#import "GameHitDetector.h"
#import "Enemy.h"


@interface GameHitDetector()

@property (nonatomic) Bullet *bullet;
@property (nonatomic) SPTween *tween;

@end

@implementation GameHitDetector

+ (instancetype)gameHitDetector {
    static GameHitDetector *hitDetector = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hitDetector = [[self alloc] init];
    });
    return hitDetector;
}

- (NSMutableArray *)enemies {
    if (!_enemies) {
        _enemies = [NSMutableArray new];
    }
    return _enemies;
}

- (void)registerTween:(SPTween *)tween {
    
    Bullet *bullet = (Bullet *) tween.target;
    tween.onUpdate = ^{
        
        for (Enemy *enemy in [self enemies]) {
            SPRectangle *enemyBounds = [enemy boundsInSpace:self.world];
            SPRectangle *bulletBounds = bullet.bounds;
            if ([bulletBounds intersectsRectangle:enemyBounds]) {
                NSLog(@"STRUCK! %@", bullet);
                [enemy takeDmg:bullet];
                [self.world removeChild:bullet];
            }
            
        }

    };
}

@end
