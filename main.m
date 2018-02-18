//
//  main.m
//  SnakesAndLadder
//
//  Created by KevinT on 2018-02-18.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

static NSString * getUserInput() {
  char userInput[10];
  NSLog(@"Enter 'r' or 'roll' to roll dice.\n>");
  fgets(userInput, 10, stdin);
  NSString * userInputString = [NSString stringWithCString:userInput encoding:NSUTF8StringEncoding];
  fpurge(stdin);
  return userInputString;
}

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSLog(@"Welcome to SNAKES AND LADDERS!");
    Player *player = [[Player alloc] init];

    while (TRUE) {
      NSString * userInputString = getUserInput();
      if ([userInputString isEqualToString:@"r\n"] | [userInputString isEqualToString:@"roll\n"]) {
        player.roll;
      }
    }
  }
  return 0;
}
