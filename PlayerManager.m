//
//  PlayerManager.m
//  SnakesAndLadder
//
//  Created by KevinT on 2018-02-18.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import "PlayerManager.h"

@implementation PlayerManager

- (instancetype)init
{
  self = [super init];
  if (self) {
    Player *player = [[Player alloc] init];
    player.name = @"player1";
    NSLog(@"Created %@", player.name);
    self.players = [[NSMutableArray alloc] initWithObjects:player, nil];
  }
  return self;
}

-(void) createPlayers : (int)numPlayers {
  if (numPlayers > 1) {

  //  since first player is created in init method, this is only creating additional players beyond first player
    for (int i = 0; i < (numPlayers - 1); i++) {
    
      Player *player = [[Player alloc] init];
      
  //    player name is "playerX" where X >= 2 since player1 was created
      NSString *playerNumber = [NSString stringWithFormat:@"%i", i+2];
      player.name = @"player";
      player.name = [player.name stringByAppendingString:playerNumber];
      NSLog(@"Created %@", player.name);
      [self.players addObject:player];
    
    }
  }
}

- (int) currentPlayer{
  //need to return player1 rather than player0
  return (self.currentIndex % self.players.count) + 1;
}

- (void) roll:(Player *)player {
  player.roll;
  for (int i = 0; i < (self.players.count); i++) {
    
    Player *player = [self.players objectAtIndex:i];
    NSLog(@"%@ is at square: %ld", player.name, (long)player.currentSquare);
    
  }
  

  
  self.currentIndex++;
}

- (void) output {

}

@end
