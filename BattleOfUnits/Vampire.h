//
// Created by Andriy on 06.11.14.
// Copyright (c) 2014 Andriy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Unit.h"


@interface Vampire : Unit

- (instancetype)initWithName:(NSString *)name regenerationInPercent:(NSUInteger)regenerationInPercent;
+ (instancetype)vampireWithName:(NSString *)name regenerationInPercent:(NSUInteger)regenerationInPercent;

- (instancetype)initWithName:(NSString *)name maxHp:(NSUInteger)maxHp currentHp:(NSUInteger)currentHp strength:(NSUInteger)strength regenerationInPercent:(NSUInteger)regenerationInPercent;
+ (instancetype)vampireWithName:(NSString *)name maxHp:(NSUInteger)maxHp currentHp:(NSUInteger)currentHp strength:(NSUInteger)strength regenerationInPercent:(NSUInteger)regenerationInPercent;

@end