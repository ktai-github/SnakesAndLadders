//
//  PlayerManager.h
//  SnakesAndLadder
//
//  Created by KevinT on 2018-02-18.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface PlayerManager : NSObject

@property (nonatomic) NSMutableArray *players;
@property (nonatomic) int currentIndex;

- (void) createPlayers : (int)numPlayers;
- (void) roll: (Player *)player;
- (void) output;
- (int) currentPlayer;

@end
