//
//  BNRItem.m
//  RandomItems
//
//  Created by Juan Obando on 9/27/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+ (instancetype)randomItem
{
  // Create an inmutable array of three adjectives
  NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];

  // Create an inmutable array of three nouns
  NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];

  // Get the index of a random adjective/noun from the list
  // NSInteger is not an object, but a type definition for long
  NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
  NSInteger nounIndex = arc4random() % [randomNounList count];

  NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                          randomAdjectiveList[adjectiveIndex],
                          randomNounList[nounIndex]];

  int randomValue = arc4random() % 100;

  NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                  '0' + arc4random() % 10,
                                  'A' + arc4random() % 26,
                                  '0' + arc4random() % 10,
                                  'A' + arc4random() % 26,
                                  '0' + arc4random() % 10];

  BNRItem *newItem = [[self alloc] initWithItemName:randomName
                                     valueInDollars:randomValue
                                       serialNumber:randomSerialNumber];

  return newItem;
}

- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber
{
  // Call the superclass's designated initializer
  self = [super init];

  // Did the superclass's designated initializer succeed?
  if (self) {
    // Give the instance variables initial values
    _itemName = name;
    _serialNumber = sNumber;
    _valueInDollars = value;

    // Set _dateCreated to the current date and time
    _dateCreated = [[NSDate alloc] init];
  }

  // Return the address of the newly initialized object
  return self;
}

- (instancetype)initWithItemName:(NSString *)name
{
  return [self initWithItemName:name
                 valueInDollars:0
                   serialNumber:@""];
}

- (instancetype)init
{
  return [self initWithItemName:@"Item"];
}

- (NSString *)description
{
  NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                                self.itemName,
                                self.serialNumber,
                                self.valueInDollars,
                                self.dateCreated];

  return descriptionString;
}

- (void)dealloc
{
  NSLog(@"Destroyed: %@", self);
}

@end
