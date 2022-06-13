class Converter_Model {
  bool? success;
  Query? query;
  Info? info;
  String? date;
  double? result;

  Converter_Model({this.success, this.query, this.info, this.date, this.result});

  Converter_Model.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    query = json['query'] != null ? new Query.fromJson(json['query']) : null;
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    date = json['date'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.query != null) {
      data['query'] = this.query!.toJson();
    }
    data['date'] = this.date;
    data['result'] = this.result;
    return data;
  }
}

class Query {
  String? from;
  String? to;
  int? amount;


  Query.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    data['amount'] = this.amount;
    return data;
  }
}

class Info {
  double? rate;


  Info.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
  }

}
