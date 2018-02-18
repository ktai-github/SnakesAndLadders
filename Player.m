//
//  Player.m
//  SnakesAndLadder
//
//  Created by KevinT on 2018-02-18.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import "Player.h"

@implementation Player

- (void) roll {
  int rolledValue = arc4random_uniform(6) + 1;
  
  self.currentSquare += rolledValue;
  NSLog ( @"Rolled: %d. You moved to: %ld.", rolledValue, (long)self.currentSquare) ;
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.currentSquare = 0;
    _gameLogic = @{
      //ladders
      @"4" : @"14",
      @"9" : @"31",
      @"20" : @"38",
      @"28" : @"84",
      @"40" : @"59",
      @"51" : @"67",
      @"63" : @"81",
      //snakes
      @"17" : @"7",
      @"64" : @"60",
      @"89" : @"26",
      @"95" : @"75",
      @"99" : @"78"
    };
  }
  return self;
}
@end
