
validInput(String val ,int min ,int max){

  if(val.isEmpty){
    return "Value can't be empity";
  }
  if(val.length <min){
    return "Value can't be less than $min";
  }
  if(val.length > max){
    return "Value can't be biger than $max";
  }
}