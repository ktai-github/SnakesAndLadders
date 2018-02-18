//
//  main.m
//  SnakesAndLadder
//
//  Created by KevinT on 2018-02-18.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSLog(@"Welcome to Snakes And Ladder!");
//    int diceRoll = 0;
    Player *player = [[Player alloc] init];
    while (TRUE) {
      char userInput[10];
      NSLog(@"Enter 'r' or 'roll' to roll dice.\n>");
      fgets(userInput, 10, stdin);
      NSString * userInputString = [NSString stringWithCString:userInput encoding:NSUTF8StringEncoding];
      fpurge(stdin);
      if ([userInputString isEqualToString:@"r\n"] | [userInputString isEqualToString:@"roll\n"]) {
        player.roll;
        
      } else {
        break;
      }
      
    }
  }
  return 0;
}
