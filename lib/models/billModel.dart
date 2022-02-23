class BillModel{
  String? TotalAmount;
  String? PaidFor;
  String? BillCreator;

  BillModel({
   this.TotalAmount,
   this.PaidFor,
   this.BillCreator
});

  BillModel.fromJson(Map<String, dynamic> json){
    TotalAmount= json['TotalAmount'];
    PaidFor= json['PaidFor'];
    BillCreator= json['BillCreator'];
  }

  Map<String, dynamic> toMap(){
    return{
      'TotalAmount':TotalAmount,
      'PaidFor':PaidFor,
      'BillCreator':BillCreator,

    };
}
}