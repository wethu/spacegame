//
//  Bullet.h
//  rpggame
//
//  Created by Ellis Gray on 6/01/2015.
//  Copyright (c) 2015 Ellis Gray. All rights reserved.
//

#import "SPQuad.h"

@interface Bullet : SPQuad
/// If the bullet has been spent or not
@property (readonly) bool spent;

@property (readonly) int dmg;

@end
