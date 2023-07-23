class GetHelp_Model {
  int? status;
  String? message;
  List<GetHelp_Data> getHelp_DataList =[];

  GetHelp_Model.fromJson({required Map<String,dynamic> json}){
    status = json['status'];
    message = json['message'];
    json['help'].forEach((element){
      GetHelp_Data item = GetHelp_Data.fromJson(json: element);
      getHelp_DataList.add(item);
    });
  }
}
class GetHelp_Data {
  String? question;
  String? answer;



  GetHelp_Data.fromJson({required Map<String,dynamic> json}){
    question = json['question'];
    answer = json['answer'];

  }

}