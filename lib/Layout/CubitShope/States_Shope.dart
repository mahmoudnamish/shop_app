abstract class ShopeStates{}

class InitialState extends ShopeStates{}
class ChangebottomNavigateState extends ShopeStates{}

class ShopHomeLodingState extends ShopeStates{}
class ShopHomeSuccessState extends ShopeStates{}
class ShopHomeErrorState extends ShopeStates{

  final String error ;

  ShopHomeErrorState(this.error);




}
class categoriesSuccessState extends ShopeStates{}
class categoriesErrorState extends ShopeStates{

  final String error ;

  categoriesErrorState(this.error);




}


