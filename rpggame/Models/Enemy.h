//
//  Enemy.h
//  rpggame
//
//  Created by Ellis Gray on 6/01/2015.
//  Copyright (c) 2015 Ellis Gray. All rights reserved.
//

#import "SPImage.h"
#import "Bullet.h"
@interface Enemy : SPImage
- (void)takeDmg:(Bullet *)bullet;
@end
