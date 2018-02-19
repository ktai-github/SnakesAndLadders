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
    while (TRUE) {
    
      NSLog(@"Welcome to SNAKES AND LADDERS!\nEnter 'q' anytime to quit.");
      NSString *userInputNumOfPlayers = getUserInput(@"Please enter number of players.\n>");
      
      if ([userInputNumOfPlayers isEqualToString:@"q\n"]) {
        break;
      }
      
  //    current index starts with number of players
      PlayerManager *playerManager = [[PlayerManager alloc] init];
      playerManager.currentIndex = [userInputNumOfPlayers intValue];
      
      
  //    create the number of players entered with player1 automatically created
      if ([userInputNumOfPlayers intValue] > 1) {
  //      NSLog(@"Invalid number of players. Please restart game.");
        [playerManager createPlayers:[userInputNumOfPlayers intValue]];
      }
      
      while (TRUE) {
        int currentPlayer = playerManager.currentPlayer;
        
        //current player object in array is player - 1
        Player *player = [playerManager.players objectAtIndex:(currentPlayer - 1)];
        
        NSString *promptPlayer = player.name;
        promptPlayer = [promptPlayer stringByAppendingString:@". Enter 'r' or 'roll' to roll dice.\n>"];
        NSString *userInputString = getUserInput(promptPlayer);
        
        if ([userInputString isEqualToString:@"r\n"] | [userInputString isEqualToString:@"roll\n"]) {
          
  //        current player object in the array roll
          [playerManager roll:playerManager.players[currentPlayer - 1]];
        } else if ([userInputString isEqualToString:@"q\n"]) {
          exit(0);
        }
        
        if (player.currentSquare > 99) {
          player.gameOver = TRUE;
          NSLog(@"Game is finished. %@ has won!", player.name);
          break;
          
          //    PlayerManager.players
          //    for (i = PlayerManager.players.Count; i > 0; i--) {
          //      PlayerManager.players.removeobjectatindex;
          //    }
          //    exit(0);
        }
      }
    }
  }
  return 0;
}
