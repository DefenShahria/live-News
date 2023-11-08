class NetworkResponse{
  final bool isSucess;
  final int statuscode;
  final Map<String,dynamic>? body;

  NetworkResponse(this.isSucess, this.statuscode, this.body);
}