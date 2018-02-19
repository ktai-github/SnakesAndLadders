//
//  main.m
//  SnakesAndLadder
//
//  Created by KevinT on 2018-02-18.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerManager.h"

static NSString * getUserInput(NSString *text) {
  char userInput[10];
  NSLog(text);
  fgets(userInput, 10, stdin);
  NSString * userInputString = [NSString stringWithCString:userInput encoding:NSUTF8StringEncoding];
  fpurge(stdin);
  return userInputString;
}

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSLog(@"Welcome to SNAKES AND LADDERS!");
    NSString *userInputNumOfPlayers = getUserInput(@"Please enter number of players.\n>");
    
//    int numberOfPlayers = [userInputNumOfPlayers intValue];
    PlayerManager *playerManager = [[PlayerManager alloc] init];
    playerManager.currentIndex = [userInputNumOfPlayers intValue];
    
    if ([userInputNumOfPlayers intValue] > 1) {
//      NSLog(@"Invalid number of players. Please restart game.");
      [playerManager createPlayers:[userInputNumOfPlayers intValue]];
    }
    
    while (TRUE) {
      int currentPlayer = playerManager.currentPlayer;
      Player *player = [playerManager.players objectAtIndex:(currentPlayer - 1)];
      NSString *promptPlayer = player.name;
//      NSString *promptPlayer = [NSString stringWithFormat:@"Player %d. ", currentPlayer];
      promptPlayer = [promptPlayer stringByAppendingString:@". Enter 'r' or 'roll' to roll dice.\n>"];
      NSString *userInputString = getUserInput(promptPlayer);
      
      if ([userInputString isEqualToString:@"r\n"] | [userInputString isEqualToString:@"roll\n"]) {
        
        [playerManager roll:playerManager.players[currentPlayer - 1]];
      }
    }
  }
  return 0;
}
