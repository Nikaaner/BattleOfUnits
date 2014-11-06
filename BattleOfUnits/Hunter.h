//
// Created by Andriy on 06.11.14.
// Copyright (c) 2014 Andriy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Unit.h"


typedef enum {
    HunteExperienceLow = 1,
    HunteExperienceMiddle = 2,
    HunteExperienceHigh = 3
} HunteExperience;

@interface Hunter : Unit

- (instancetype)initWithName:(NSString *)name experience:(HunteExperience)experience dodgeChanceInPercent:(NSUInteger)dodgeChanceInPercent;
+ (instancetype)hunterWithName:(NSString *)name experience:(HunteExperience)experience dodgeChanceInPercent:(NSUInteger)dodgeChanceInPercent;

- (instancetype)initWithName:(NSString *)name maxHp:(NSUInteger)maxHp currentHp:(NSUInteger)currentHp strength:(NSUInteger)strength experience:(HunteExperience)experience dodgeChanceInPercent:(NSUInteger)dodgeChanceInPercent;
+ (instancetype)hunterWithName:(NSString *)name maxHp:(NSUInteger)maxHp currentHp:(NSUInteger)currentHp strength:(NSUInteger)strength experience:(HunteExperience)experience dodgeChanceInPercent:(NSUInteger)dodgeChanceInPercent;

@end