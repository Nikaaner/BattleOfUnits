//
// Created by Andriy on 06.11.14.
// Copyright (c) 2014 Andriy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Unit.h"


@interface Warrior : Unit

- (instancetype)initWithName:(NSString *)name armour:(NSUInteger)armour critChanceInPercent:(NSUInteger)critChanceInPercent;
+ (instancetype)warriorWithName:(NSString *)name armour:(NSUInteger)armour critChanceInPercent:(NSUInteger)critChanceInPercent;

- (instancetype)initWithName:(NSString *)name maxHp:(NSUInteger)maxHp currentHp:(NSUInteger)currentHp strength:(NSUInteger)strength armour:(NSUInteger)armour critChanceInPercent:(NSUInteger)critChanceInPercent;
+ (instancetype)warriorWithName:(NSString *)name maxHp:(NSUInteger)maxHp currentHp:(NSUInteger)currentHp strength:(NSUInteger)strength armour:(NSUInteger)armour critChanceInPercent:(NSUInteger)critChanceInPercent;

@end