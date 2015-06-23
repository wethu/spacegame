//
//  EnemySnowman.h
//  rpggame
//
//  Created by Ellis Gray on 6/01/2015.
//  Copyright (c) 2015 Ellis Gray. All rights reserved.
//

#import "Enemy.h"

@interface EnemySnowman : Enemy
- (instancetype)initWithWorld:(SPSprite *)world;
- (void)takeDmg:(Bullet *)bullet;

@end
