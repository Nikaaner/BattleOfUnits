//
//  ViewController.m
//  BattleOfUnits
//
//  Created by Andriy on 05.11.14.
//  Copyright (c) 2014 Andriy. All rights reserved.
//


#import "ViewController.h"
#import "Unit.h"
#import "BattleSimulator.h"


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSArray *units = @[
            [Unit unitWithName:@"Unit 1" maxHp:50 strength:10],
            [Unit unitWithName:@"Unit 2" maxHp:50 strength:10],
            [Unit unitWithName:@"Unit 3" maxHp:50 strength:10],
            [Unit unitWithName:@"Unit 4" maxHp:50 strength:10],
            [Unit unitWithName:@"Unit 5" maxHp:50 strength:10],
    ];

    BattleSimulator *battleSimulator = [BattleSimulator new];
    [battleSimulator startBattleOfAllAgainstAllWithUnits:units];

    /*[battleSimulator startBattleBetween:[Unit unitWithName:@"Unit 1" maxHp:50 strength:10]
                                    and:[Unit unitWithName:@"Unit 2" maxHp:50 strength:10]];*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end