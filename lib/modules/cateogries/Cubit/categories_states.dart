abstract class categoriesState {}

class Initialestate extends categoriesState{}
class  loadingstate extends categoriesState{}
class  successtate extends categoriesState{}
class  errorstate extends categoriesState{
  final String error;

  errorstate(this.error);

}
