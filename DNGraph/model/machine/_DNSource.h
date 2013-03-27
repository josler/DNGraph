// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DNSource.h instead.

#import <CoreData/CoreData.h>


extern const struct DNSourceAttributes {
	__unsafe_unretained NSString *facebookId;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *ranking;
} DNSourceAttributes;

extern const struct DNSourceRelationships {
} DNSourceRelationships;

extern const struct DNSourceFetchedProperties {
} DNSourceFetchedProperties;






@interface DNSourceID : NSManagedObjectID {}
@end

@interface _DNSource : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DNSourceID*)objectID;





@property (nonatomic, strong) NSString* facebookId;



//- (BOOL)validateFacebookId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* ranking;



@property float rankingValue;
- (float)rankingValue;
- (void)setRankingValue:(float)value_;

//- (BOOL)validateRanking:(id*)value_ error:(NSError**)error_;






@end

@interface _DNSource (CoreDataGeneratedAccessors)

@end

@interface _DNSource (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveFacebookId;
- (void)setPrimitiveFacebookId:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitiveRanking;
- (void)setPrimitiveRanking:(NSNumber*)value;

- (float)primitiveRankingValue;
- (void)setPrimitiveRankingValue:(float)value_;




@end
