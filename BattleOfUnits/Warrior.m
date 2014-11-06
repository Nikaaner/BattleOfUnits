//
// Created by Andriy on 06.11.14.
// Copyright (c) 2014 Andriy. All rights reserved.
//

#import "Warrior.h"


@interface Warrior ()
@property(assign, nonatomic) NSUInteger armour;
@property(assign, nonatomic) NSUInteger critChanceInPercent;
@end

@implementation Warrior {

}

#pragma mark - Special Actions

- (void)getDamagedFrom:(Unit *)attacker withDamage:(NSUInteger)damage {

    [super getDamagedFrom:attacker withDamage:damage - self.armour];

}


- (void)attack:(Unit *)target {

    if (arc4random() % 100 + 1 <= self.critChanceInPercent) {
        NSLog(@"%@ attacked %@ and does a critical hit.", self.name, target.name);
        [target getDamagedFrom:self withDamage:self.strength * 2];

    } else {
        [super attack:target];
    }
}

#pragma mark - Initialization

static NSUInteger warriorNumber;

- (instancetype)init {
    self = [super init];
    if (self) {
        warriorNumber++;
        self.name = [NSString stringWithFormat:@"Warrior#%d", warriorNumber];
        self.armour = 3;
        self.critChanceInPercent = 15;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name armour:(NSUInteger)armour critChanceInPercent:(NSUInteger)critChanceInPercent {
    self = [super init];
    if (self) {
        self.name = name;
        self.armour = armour;
        self.critChanceInPercent = critChanceInPercent;
    }
    return self;
}

+ (instancetype)warriorWithName:(NSString *)name armour:(NSUInteger)armour critChanceInPercent:(NSUInteger)critChanceInPercent {
    return [[self alloc] initWithName:name armour:armour critChanceInPercent:critChanceInPercent];
}

- (instancetype)initWithName:(NSString *)name maxHp:(NSUInteger)maxHp currentHp:(NSUInteger)currentHp strength:(NSUInteger)strength armour:(NSUInteger)armour critChanceInPercent:(NSUInteger)critChanceInPercent {
    self = [super initWithName:name maxHp:maxHp strength:strength];
    if (self) {
        self.armour = armour;
        self.critChanceInPercent = critChanceInPercent;
    }
    return self;
}

+ (instancetype)warriorWithName:(NSString *)name maxHp:(NSUInteger)maxHp currentHp:(NSUInteger)currentHp strength:(NSUInteger)strength armour:(NSUInteger)armour critChanceInPercent:(NSUInteger)critChanceInPercent {
    return [[self alloc] initWithName:name maxHp:maxHp currentHp:currentHp strength:strength armour:armour critChanceInPercent:critChanceInPercent];
}

@end