//
//  RPGMenuButton.m
//  rpggame
//
//  Created by Ellis Gray on 2/01/2015.
//  Copyright (c) 2015 Ellis Gray. All rights reserved.
//

#import "RPGMenuButton.h"

@implementation RPGMenuButton

- (instancetype)init {
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1.f;
    self.layer.cornerRadius = 5.f;
    self.backgroundColor = [UIColor colorWithWhite:.4f alpha:1];
    self.titleLabel.textColor = [UIColor colorWithWhite:.8f alpha:1];
}
@end
