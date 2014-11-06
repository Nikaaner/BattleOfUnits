//
//  ViewController.m
//  BattleOfUnits
//
//  Created by Andriy on 05.11.14.
//  Copyright (c) 2014 Andriy. All rights reserved.
//


#import "ViewController.h"
#import "BattleSimulator.h"
#import "Warrior.h"
#import "Hunter.h"
#import "Vampire.h"


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSArray *units = @[
            [Warrior new],
            [Warrior new],
            [Hunter new],
            [Hunter new],
            [Vampire new],
            [Vampire new]
    ];

    BattleSimulator *battleSimulator = [BattleSimulator new];
    [battleSimulator startBattleOfAllAgainstAllWithUnits:units];
    /*[battleSimulator startBattleBetween:[Warrior warriorWithName:@"Warrior" armour:3 critChanceInPercent:15]
                                    and:[Hunter hunterWithName:@"Hunter" experience:HunteExperienceMiddle dodgeChanceInPercent:25]];*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end