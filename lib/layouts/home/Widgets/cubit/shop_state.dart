abstract class ShopStates {}

class ShopInitial extends ShopStates {}
//----------Bottom Nav -----------------
class ChangeBottomNavState extends ShopStates {}
//---------------Home-------------------
class LoadingHomeDataState extends ShopStates {}

class SuccessHomeDataState extends ShopStates {}

class ErrorHomeDataState extends ShopStates {}

//--------------Categories------------------

class SuccessCategoriesState extends ShopStates {}

class ErrorCategoriesState extends ShopStates {}