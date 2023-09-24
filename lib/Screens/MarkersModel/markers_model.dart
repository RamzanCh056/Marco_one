class MarkersData {
  String? type;
  List<Features>? features;

  MarkersData({this.type, this.features});

  MarkersData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(new Features.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Features {
  String? type;
  Properties? properties;
  Geometry? geometry;

  Features({this.type, this.properties, this.geometry});

  Features.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.properties != null) {
      data['properties'] = this.properties!.toJson();
    }
    if (this.geometry != null) {
      data['geometry'] = this.geometry!.toJson();
    }
    return data;
  }
}

class Properties {
  String? categoria;
  String? customerID;
  String? ragioneSociale;
  String? partitaIva;
  String? dataRegistrazione;
  String? dataUltimoAcquisto;
  String? customerStatus;
  String? indirizzo;
  String? capCom;
  String? comune;
  String? siglaProvincia;
  String? regGeografica;
  int? cap;
  double? latitudine;
  double? longitudine;
  int? salesMat;
  int? salesMatPy;
  int? deltaSalesMat;
  int? salesFsdMat;
  int? salesFsdMatPy;
  int? deltaSalesMatFsd;

  Properties(
      {this.categoria,
      this.customerID,
      this.ragioneSociale,
      this.partitaIva,
      this.dataRegistrazione,
      this.dataUltimoAcquisto,
      this.customerStatus,
      this.indirizzo,
      this.capCom,
      this.comune,
      this.siglaProvincia,
      this.regGeografica,
      this.cap,
      this.latitudine,
      this.longitudine,
      this.salesMat,
      this.salesMatPy,
      this.deltaSalesMat,
      this.salesFsdMat,
      this.salesFsdMatPy,
      this.deltaSalesMatFsd});

  Properties.fromJson(Map<String, dynamic> json) {
    categoria = json['Categoria'];
    customerID = json['CustomerID'];
    ragioneSociale = json['RagioneSociale'];
    partitaIva = json['PartitaIva'];
    dataRegistrazione = json['DataRegistrazione'];
    dataUltimoAcquisto = json['DataUltimoAcquisto'];
    customerStatus = json['Customer_status'];
    indirizzo = json['Indirizzo'];
    capCom = json['CapCom'];
    comune = json['Comune'];
    siglaProvincia = json['SiglaProvincia'];
    regGeografica = json['RegGeografica'];
    cap = json['Cap'];
    latitudine = json['Latitudine'];
    longitudine = json['Longitudine'];
    salesMat = json['Sales_mat'];
    salesMatPy = json['Sales_mat_py'];
    deltaSalesMat = json['Delta_sales_mat'];
    salesFsdMat = json['Sales_fsd_mat'];
    salesFsdMatPy = json['Sales_fsd_mat_py'];
    deltaSalesMatFsd = json['Delta_sales_mat_fsd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Categoria'] = this.categoria;
    data['CustomerID'] = this.customerID;
    data['RagioneSociale'] = this.ragioneSociale;
    data['PartitaIva'] = this.partitaIva;
    data['DataRegistrazione'] = this.dataRegistrazione;
    data['DataUltimoAcquisto'] = this.dataUltimoAcquisto;
    data['Customer_status'] = this.customerStatus;
    data['Indirizzo'] = this.indirizzo;
    data['CapCom'] = this.capCom;
    data['Comune'] = this.comune;
    data['SiglaProvincia'] = this.siglaProvincia;
    data['RegGeografica'] = this.regGeografica;
    data['Cap'] = this.cap;
    data['Latitudine'] = this.latitudine;
    data['Longitudine'] = this.longitudine;
    data['Sales_mat'] = this.salesMat;
    data['Sales_mat_py'] = this.salesMatPy;
    data['Delta_sales_mat'] = this.deltaSalesMat;
    data['Sales_fsd_mat'] = this.salesFsdMat;
    data['Sales_fsd_mat_py'] = this.salesFsdMatPy;
    data['Delta_sales_mat_fsd'] = this.deltaSalesMatFsd;
    return data;
  }
}

class Geometry {
  String? type;
  List<double>? coordinates;

  Geometry({this.type, this.coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}