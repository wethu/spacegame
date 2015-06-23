//
//  GameHitDetector.h
//  rpggame
//
//  Created by Ellis Gray on 6/01/2015.
//  Copyright (c) 2015 Ellis Gray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bullet.h"

@interface GameHitDetector : NSObject

+ (instancetype)gameHitDetector;
- (void)registerTween:(SPTween *)tween;

@property (nonatomic) SPSprite *world;
@property (nonatomic) NSMutableArray *enemies;
@end
