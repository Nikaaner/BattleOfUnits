//
// Created by Andriy on 05.11.14.
// Copyright (c) 2014 Andriy. All rights reserved.
//

#import "Unit.h"


@interface Unit ()
@property(assign, nonatomic) NSUInteger maxHp;
@property(assign, nonatomic) NSUInteger currentHp;
@property(assign, nonatomic) NSUInteger strength;
@property(assign, nonatomic) BOOL isCounterattacking;
@end

@implementation Unit {

}

- (instancetype)initWithName:(NSString *)name maxHp:(NSUInteger)maxHp strength:(NSUInteger)strength {
    self = [super init];
    if (self) {
        self.name = name;
        self.maxHp = maxHp;
        self.currentHp = maxHp;
        self.strength = strength;
    }

    return self;
}

+ (instancetype)unitWithName:(NSString *)name maxHp:(NSUInteger)maxHp strength:(NSUInteger)strength {
    return [[self alloc] initWithName:name maxHp:maxHp strength:strength];
}

/*- (void)setCurrentHp:(NSUInteger)currentHp {
    if (currentHp < 0) {
        _currentHp = 0;
    } else {
        _currentHp = currentHp;
    }
}*/


- (void)getDamagedFrom:(Unit *)attacker {

    if (self.isDead) {
        NSLog(@"Attack on %@ was in vain., because it was %@'s corpse.", self.name, self.name);

    } else if (attacker.strength >= self.currentHp) {
        NSLog(@"%@ took %@'s the last %d points of health. %@ died leaving only his corpse",
                attacker.name, self.name, self.currentHp, self.name);
        self.currentHp = 0;
        self.isDead = YES;

    } else {
        self.currentHp -= attacker.strength;
        NSLog(@"%@ inflicted %@ %d points of damage. %@ still has %d points of health.",
                attacker.name, self.name, attacker.strength, self.name, self.currentHp);

        if (!attacker.isCounterattacking) {
            [self counterAttack:attacker];
        }
    }
}


- (void)restoreHp:(NSUInteger)quantity {

    if (self.isDead) {
        NSLog(@"%@ can not be resurrected.", self.name);

    } else if (quantity > (self.maxHp - self.currentHp)) {
        self.currentHp = self.maxHp;
        NSLog(@"%@ completely restored his health. Now he has %d points of health.",
                self.name, self.currentHp);

    } else {
        self.currentHp += quantity;
        NSLog(@"%@ restored %d health points. Now he has %d points of health.",
                self.name, quantity, self.currentHp);
    }
}


- (void)attack:(Unit *)target {

    NSLog(@"%@ attacked %@.", self.name, target.name);
    [target getDamagedFrom:self];
}


- (void)counterAttack:(Unit *)target {

    NSLog(@"%@ counterattacked %@.", self.name, target.name);
    self.isCounterattacking = YES;
    self.strength /= 2;

    [target getDamagedFrom:self];

    self.isCounterattacking = NO;
    self.strength *= 2;
}

@end