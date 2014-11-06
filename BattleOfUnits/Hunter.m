//
// Created by Andriy on 06.11.14.
// Copyright (c) 2014 Andriy. All rights reserved.
//

#import "Hunter.h"


@interface Hunter ()
@property(assign, nonatomic) HunteExperience experience;
@property(assign, nonatomic) NSUInteger dodgeChanceInPercent;
@end

@implementation Hunter {

}

#pragma mark - Special Actions

- (void)getDamagedFrom:(Unit *)attacker withDamage:(NSUInteger)damage {

    if (arc4random() % 100 + 1 <= self.dodgeChanceInPercent) {
        NSLog(@"%@ dodged from the attack.", self.name);

        if (!attacker.isCounterattacking) {
            [super counterAttack:attacker];
        }

    } else {
        [super getDamagedFrom:attacker withDamage:damage];
    }
}


- (void)attack:(Unit *)target {

    if (!target.isDead) {
        [super attack:target];

        if (target.isDead) {
            NSLog(@"%@ killing %@ has improved their skills. Now his strength increased by %d and is equal to %d points.",
                    self.name, target.name, self.experience * 1, self.strength + self.experience * 1);

            self.strength += self.experience * 1;
        }

    } else {
        [super attack:target];
    }
}

#pragma mark - Initialization

static NSUInteger hunterNumber;

- (instancetype)init {
    self = [super init];
    if (self) {
        hunterNumber++;
        self.name = [NSString stringWithFormat:@"Hunter#%d", hunterNumber];
        self.experience = HunteExperienceMiddle;
        self.dodgeChanceInPercent = 25;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name experience:(HunteExperience)experience dodgeChanceInPercent:(NSUInteger)dodgeChanceInPercent {
    self = [super init];
    if (self) {
        self.name = name;
        self.experience = experience;
        self.dodgeChanceInPercent = dodgeChanceInPercent;
    }
    return self;
}

+ (instancetype)hunterWithName:(NSString *)name experience:(HunteExperience)experience dodgeChanceInPercent:(NSUInteger)dodgeChanceInPercent {
    return [[self alloc] initWithName:name experience:experience dodgeChanceInPercent:dodgeChanceInPercent];
}

- (instancetype)initWithName:(NSString *)name maxHp:(NSUInteger)maxHp currentHp:(NSUInteger)currentHp strength:(NSUInteger)strength experience:(HunteExperience)experience dodgeChanceInPercent:(NSUInteger)dodgeChanceInPercent {
    self = [super initWithName:name maxHp:maxHp strength:strength];
    if (self) {
        self.experience = experience;
        self.dodgeChanceInPercent = dodgeChanceInPercent;
    }
    return self;
}

+ (instancetype)hunterWithName:(NSString *)name maxHp:(NSUInteger)maxHp currentHp:(NSUInteger)currentHp strength:(NSUInteger)strength experience:(HunteExperience)experience dodgeChanceInPercent:(NSUInteger)dodgeChanceInPercent {
    return [[self alloc] initWithName:name maxHp:maxHp currentHp:currentHp strength:strength experience:experience dodgeChanceInPercent:dodgeChanceInPercent];
}

@end