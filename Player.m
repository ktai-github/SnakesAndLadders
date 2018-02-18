//
//  Player.m
//  SnakesAndLadder
//
//  Created by KevinT on 2018-02-18.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import "Player.h"

@implementation Player

static void rollDiceMovePlayer(Player *object) {
  int rolledValue = arc4random_uniform(6) + 1;
  NSLog(@"You rolled: %d", rolledValue);
  //  self.currentSquare = 98;
  object.currentSquare += rolledValue;
}

- (void) roll {
  rollDiceMovePlayer(self);
  
  if (self.currentSquare > 99) {
    self.gameOver = TRUE;
    NSLog(@"You are at square 100! Game has ended.");
    exit(0);
  }
  
  NSLog ( @"You moved to: %ld", (long)self.currentSquare) ;
  
  NSNumber *currentSquare = [NSNumber numberWithInteger:self.currentSquare];

  //check list of squares of snakes and ladders
  for (NSString *key in _gameLogic) {
    
    //get destination square of each snake or ladder
    id value = _gameLogic[key];
    
    //if current square is a snake or ladder
    if ([currentSquare isEqualTo:key]) {
      
      //move to destination square
      currentSquare = value;
      self.currentSquare = [currentSquare integerValue];
      
      //let user know they landed on a snake or ladder
      if (key < value) {
        NSLog(@"You landed on a ladder!");
        
      } else {
        NSLog(@"You landed on a snake!");
      }
      
      NSLog(@"You moved from: %@ to: %@", key, value);
    }
  }


  }

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.gameOver = 0;
    self.currentSquare = 0;
    
    //dictionary of squares that has a snake or ladder its destination
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
