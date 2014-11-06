//
// Created by Andriy on 06.11.14.
// Copyright (c) 2014 Andriy. All rights reserved.
//

#import "Vampire.h"


@interface Vampire ()
@property(assign, nonatomic) BOOL isInsatiableHunger;
@property(assign, nonatomic) NSUInteger regenerationInPercent;
@end

@implementation Vampire {

}

#pragma mark - Special Actions

- (void)restoreHp:(NSUInteger)quantity {

    [super restoreHp:quantity];

    if (self.currentHp * 100 > self.maxHp * self.regenerationInPercent) {
        self.isInsatiableHunger = NO;
    }
}


- (void)attack:(Unit *)target {

    if (self.currentHp * 100 <= self.maxHp * self.regenerationInPercent) {
        self.isInsatiableHunger = YES;
    }

    if (self.isInsatiableHunger && target.isDead) {
        NSUInteger toRestore = self.maxHp * self.regenerationInPercent / 100;
        NSLog(@"%@ from the insatiable hunger ate from the corpse and regenerate himself %d points of health.",
                self.name, toRestore);
        [self restoreHp:toRestore];

    } else {
        NSUInteger damage = target.currentHp;
        [super attack:target];
        damage -= target.currentHp;

        NSUInteger toRestore = damage * self.regenerationInPercent / 100;
        if (toRestore > 0) {
            [self restoreHp:toRestore];
        }
    }
}


- (void)counterAttack:(Unit *)target {

    NSUInteger damage = target.currentHp;
    [super counterAttack:target];
    damage -= target.currentHp;

    NSUInteger toRestore = damage * self.regenerationInPercent / 100;
    if (toRestore > 0) {
        [self restoreHp:toRestore];
    }
}


#pragma mark - Initialization

static NSUInteger vampireNumber;

- (instancetype)init {
    self = [super init];
    if (self) {
        vampireNumber++;
        self.name = [NSString stringWithFormat:@"Vampire#%d", vampireNumber];
        self.regenerationInPercent = 25;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name regenerationInPercent:(NSUInteger)regenerationInPercent {
    self = [super init];
    if (self) {
        self.name = name;
        self.regenerationInPercent = regenerationInPercent;
    }
    return self;
}

+ (instancetype)vampireWithName:(NSString *)name regenerationInPercent:(NSUInteger)regenerationInPercent {
    return [[self alloc] initWithName:name regenerationInPercent:regenerationInPercent];
}

- (instancetype)initWithName:(NSString *)name maxHp:(NSUInteger)maxHp currentHp:(NSUInteger)currentHp strength:(NSUInteger)strength regenerationInPercent:(NSUInteger)regenerationInPercent {
    self = [super initWithName:name maxHp:maxHp strength:strength];
    if (self) {
        self.regenerationInPercent = regenerationInPercent;
    }
    return self;
}

+ (instancetype)vampireWithName:(NSString *)name maxHp:(NSUInteger)maxHp currentHp:(NSUInteger)currentHp strength:(NSUInteger)strength regenerationInPercent:(NSUInteger)regenerationInPercent {
    return [[self alloc] initWithName:name maxHp:maxHp currentHp:currentHp strength:strength regenerationInPercent:regenerationInPercent];
}

@end