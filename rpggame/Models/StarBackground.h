//
//  StarBackground.h
//  rpggame
//
//  Created by Ellis Gray on 6/01/2015.
//  Copyright (c) 2015 Ellis Gray. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StarBackground : NSObject

/// Perferred Initializer!
- (instancetype)initWithWorld:(SPSprite *)world;
/// Start producing stars from the top to the bottom, randomly
- (void)loadBackground;

@end
