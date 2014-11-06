//
// Created by Andriy on 06.11.14.
// Copyright (c) 2014 Andriy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Unit;

@interface BattleSimulator : NSObject

- (void)startBattleOfAllAgainstAllWithUnits:(NSArray *)units;
- (void)startBattleBetween:(Unit *)unit1 and:(Unit *)unit2;

@end