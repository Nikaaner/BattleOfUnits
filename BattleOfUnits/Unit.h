//
// Created by Andriy on 05.11.14.
// Copyright (c) 2014 Andriy. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Unit : NSObject

@property(strong, nonatomic) NSString *name;
@property(assign, nonatomic) NSUInteger maxHp;
@property(assign, nonatomic) NSUInteger currentHp;
@property(assign, nonatomic) NSUInteger strength;
@property(assign, nonatomic) BOOL isCounterattacking;
@property(assign, nonatomic) BOOL isDead;

- (instancetype)initWithName:(NSString *)name maxHp:(NSUInteger)maxHp strength:(NSUInteger)strength;
+ (instancetype)unitWithName:(NSString *)name maxHp:(NSUInteger)maxHp strength:(NSUInteger)strength;

- (void)getDamagedFrom:(Unit *)attacker withDamage:(NSUInteger)damage;
- (void)restoreHp:(NSUInteger)quantity;
- (void)attack:(Unit *)target;
- (void)counterAttack:(Unit *)target;

@end