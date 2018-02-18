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
  NSLog(@"You rolled: %d", rolledValue);
  
  self.currentSquare += rolledValue;
  NSNumber *currentSquare = [NSNumber numberWithInteger:self.currentSquare];
//  currentSquare = @4;
  for (NSString *key in _gameLogic) {
    id value = _gameLogic[key];
    
    if ([currentSquare isEqualTo:key]) {
      currentSquare = value;
      self.currentSquare = [currentSquare integerValue];
      
      if (key < value) {
        NSLog(@"You landed on a ladder!");
        
      } else {
        NSLog(@"You landed on a snake!");
      }
      
      NSLog(@"You moved to: %@ from: %@", value, key);
    }
  }

  NSLog ( @"You moved to: %ld.", (long)self.currentSquare) ;
  }

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.currentSquare = 0;
    _gameLogic = @{
      //ladders
//      @"4" : @"14",
//      @"9" : @"31",
//      @"20" : @"38",
//      @"28" : @"84",
//      @"40" : @"59",
//      @"51" : @"67",
//      @"63" : @"81",
      @4 : @14,
      @9 : @31,
      @20 : @38,
      @28 : @84,
      @40 : @59,
      @51 : @67,
      @63 : @81,
      //snakes
//      @"17" : @"7",
//      @"64" : @"60",
//      @"89" : @"26",
//      @"95" : @"75",
//      @"99" : @"78"
      @17 : @7,
      @64 : @60,
      @89 : @26,
      @95 : @75,
      @99 : @78
    };
  }
  return self;
}
@end
