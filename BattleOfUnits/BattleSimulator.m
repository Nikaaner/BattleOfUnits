//
// Created by Andriy on 06.11.14.
// Copyright (c) 2014 Andriy. All rights reserved.
//

#import "BattleSimulator.h"
#import "Unit.h"


@interface BattleSimulator ()
@property(assign, nonatomic) NSUInteger aliveUnits;
@end

@implementation BattleSimulator {

}

- (void)startBattleOfAllAgainstAllWithUnits:(NSArray *)units {

    [self addObserversIsDeadFor:units];
    self.aliveUnits = units.count;

    while (self.aliveUnits > 1) {

        Unit *attacker;
        do {
            attacker = units[arc4random() % units.count];
        } while (attacker.isDead);

        Unit *target;
        do {
            target = units[arc4random() % units.count];
        } while ([units indexOfObject:target] == [units indexOfObject:attacker]); // || target.isDead

        [attacker attack:target];

        if (arc4random() % 5 == 0) {
            Unit *recoveringUnit = units[arc4random() % units.count];
            NSLog(@"- Healing wind blew on %@ and ...", recoveringUnit.name);
            [recoveringUnit restoreHp:arc4random() % 6 + 5];
        }

        NSLog(@"--- NEXT MOVE ---");
        sleep(1);
    }

    [self determineWinnerOfUnits:units];

    [self removeObserversIsDeadFor:units];
}


- (void)startBattleBetween:(Unit *)unitA and:(Unit *)unitB {

    NSArray *units = @[unitA, unitB];
    [self addObserversIsDeadFor:units];
    self.aliveUnits = units.count;

    // Set sequence of moves, where 0 is the first, and the second is 1.
    NSUInteger unit1 = 0, unit2 = 1;

    while (self.aliveUnits > 1) {

        // Change the sequence of moves?
        if (arc4random() % 2) {
            unit1 = 1;
            unit2 = 0;
        }

        [units[unit1] attack:units[unit2]];
        NSLog(@"\n");
        Unit *unit = units[unit2];
        if (!unit.isDead) {
            [units[unit2] attack:units[unit1]];
        }

        if (arc4random() % 5 == 0) {
            Unit *recoveringUnit = units[arc4random() % units.count];
            NSLog(@"- Healing wind blew on %@ and ...", recoveringUnit.name);
            [recoveringUnit restoreHp:arc4random() % 6 + 5];
        }

        NSLog(@"--- NEXT MOVE ---");
        sleep(1);
    }

    [self determineWinnerOfUnits:units];

    [self removeObserversIsDeadFor:units];
}


- (void)determineWinnerOfUnits:(NSArray *)units {

    if (self.aliveUnits == 0) {
        NSLog(@"The battle was so fierce that no one is left alive.");

    } else {
        for (Unit *unit in units) {
            if (!unit.isDead) {
                NSLog(@"%@ is the last alive. He won the battle.", unit.name);
            }
        }
    }
}


- (void)addObserversIsDeadFor:(NSArray *)units {
    for (id unit in units) {
        [unit addObserver:self forKeyPath:@"isDead" options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)removeObserversIsDeadFor:(NSArray *)units {
    for (id unit in units) {
        [unit removeObserver:self forKeyPath:@"isDead"];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    self.aliveUnits--;
}

@end