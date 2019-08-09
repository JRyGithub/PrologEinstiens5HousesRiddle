:- use_module(library(lists)).
%Clue1 = No owners have same pet, drink or cigarbrand
%5 owners in total
%all houses are different colours

%Layout of Owner Data Item N = nationality HP + House Postion 1, 2, 3 , 4 , 5
owner(owner(N,HouseColour, Pets, Drink, CigarBrand, HP), N, HouseColour, Pets, Drink, CigarBrand, HP).

%Getters and Setters

owner_N(owner(N, _HouseColour, _Pets, _Drink, _CigarBrand, _HP), N).
owner_HouseColour(owner(_N, HouseColour, _Pets, _Drink, _CigarBrand, _HP), HouseColour). 
owner_Pets(owner(_N, _HouseColour, Pets, _Drink, _CigarBrand, _HP), Pets). 
owner_Drink(owner(_N, _HouseColour, _Pets, Drink, _CigarBrand, _HP), Drink). 
owner_CigarBrand(owner(_N, _HouseColour, _Pets, _Drink, CigarBrand, _HP), CigarBrand).
owner_HP(owner(_N, _HouseColour, _Pets, _Drink, _CigarBrand, HP), HP).

%Possible Values

n([brit, swede, dane, norwegian, german]).
houseColour([red, green, yellow, blue, white]).
pets([dogs, birds, fish, cats, horses]).
drink([tea, coffee, milk, water, beer]).
cigarBrand([blend, blueMaster, dunhill, pallMall, prince]).
hP([1, 2, 3, 4, 5]).

solution(Persons) :-
	
	Persons = [Brit, Swede, Dane, Norwegian, German],
	
	owner(Brit, brit, BritHouseColour, BritPets, BritDrink, BritCigarBrand, BritHP),
	owner(Swede, swede, SwedeHouseColour, SwedePets, SwedeDrink, SwedeCigarBrand, SwedeHP),
	owner(Dane, dane, DaneHouseColour, DanePets, DaneDrink, DaneCigarBrand, DaneHP),
	owner(Norwegian, norwegian, NorwegianHouseColour, NorwegianPets, NorwegianDrink, NorwegianCigarBrand, NorwegianHP),
	owner(German, german, GermanHouseColour, GermanPets, GermanDrink, GermanCigarBrand, GermanHP),
	houseColour(HouseColour),
	pets(Pets),
	drink(Drink),
	cigarBrand(CigarBrand),
	hP(HP),
	
	owner_HouseColour(Brit, red),
	owner_Pets(Swede, dogs),

	owner_HouseColour(Green, green),
	member(Green, Persons),
	owner_Drink(Green, coffee),
	
	%% clue 3 greenhouse  left 1 before whitehouse.
    	owner_HouseColour(White, white),
	member(White, Persons),
    	owner_HP(White, WhiteHousePosition),
    	member(WhiteHousePosition, HP),
    	owner_HP(Green, GreenHousePosition), 
    	GreenHousePosition is WhiteHousePosition-1,
    	member(GreenHousePosition, HP),
	
	owner_Drink(Dane, tea),
	
	owner_CigarBrand(PallMall, pallMall),
	member(PallMall, Persons),
	owner_Pets(PallMall, birds),
	
	owner_HouseColour(Yellow, yellow),
	member(Yellow, Persons),
	owner_CigarBrand(Yellow, dunhill),
	
	owner_HP(3, 3),
	member(3, Persons),
	owner_Drink(3, milk),
	
	owner_HP(Norwegian, 1),
	
	%%smoker of blends lives next to keeper of cats (+/- 1) 
	owner_CigarBrand(Blends, blends),
	member(Blends, Persons),
	owner_Pets(Cats, cats),
	member(Cats, Persons),
	owner_HP(Cats, CatsHP),
	member(Cats, HP),
	owner_HP(Blends, BlendsHP),
	BlendsHP is CatsHP-1;
	BlendsHP is CatsHP+1, 
	member(BlendsHP, HP),
	
	%keeper of horse leaves next to dunhill smoker
	owner_Pets(Horses, horses),
	member(Horses, Persons),
	owner_CigarBlend(Dunhill, dunhill),
	member(Dunhill, Persons),
	owner_HP(Dunhill, DunhillHP),
	member(DunhillHP, HP),
	owner_HP(Horses, HorsesHP),
	HorsesHP is DunhillHP-1;
	HorsesHP is DunhillHP+1,
	member(HorsesHP, HP),
		

	owner_CigarBrand(BlueMaster, blueMaster),
	member(BlueMaster, Persons),
	owner_Drink(BlueMaster, beer),

	owner_CigarBrand(German, prince),

	%Norweigen lives next to blue house --> blue must be number 2
	owner_HouseColour(Blue,blue),
	member(Blue, Persons),
	owner_HP(Blue, 2),
	
	%man who smokes blends lives next to drinker of water
	owner_Drink(Water, water),
	member(Water, Drink),
	owner_HP(Water, WaterHP),
	member(WaterHP, HP),
	BlendsHP is WaterHP-1;
	BlendsHP is Water+1, 
	member(BlendsHP, HP),
	%%%instantiate owner_HP(owner(_N, _HouseColour, _Pets, _Drink, _CigarBrand, HP), HP).
	permutation(HouseColour,[ BritHouseColour, SwedeHouseColour, DaneHouseColour,
	 NorwegianHouseColour, GermanHouseColour]),
	permutation(Pets,[ BritPets, SwedePets, DanePets, NorwegianPets, GermanPets]),
	permutation(Drink,[ BritDrink, SwedeDrink, DaneDrink, NorwegianDrink, GermanDrink]),
	permutation(CigarBrand,[ BritCigarBrand, SwedeCigarBrand, DaneCigarBrand, NorwegianCigarBrand,
	 GermanCigarBrand]),
	permutation(HP,[ BritHP, SwedeHP, DaneHP, NorwegianHP, GermanHP]).
	
	%Negatives
	
	

	