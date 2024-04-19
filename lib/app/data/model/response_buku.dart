class ResponseBuku {
  ResponseBuku({
    this.status,
    this.message,
    this.data,
  });

  num? status;
  String? message;
  List<DataBuku>? data;

  ResponseBuku.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataBuku.fromJson(v));
      });
    }
  }

  ResponseBuku copyWith({
    num? status,
    String? message,
    List<DataBuku>? data,
  }) =>
      ResponseBuku(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class DataBuku {
  DataBuku({
    this.id,
    this.kategoriId,
    this.judul,
    this.image,
    this.penulis,
    this.penerbit,
    this.tahunTerbit,
    this.deskripsi,
    this.biografi,
    this.ebook,
    this.createdAt,
    this.updatedAt,
    this.kategori,
  });

  num? id;
  num? kategoriId;
  String? judul;
  String? image;
  String? penulis;
  String? penerbit;
  num? tahunTerbit;
  String? deskripsi;
  String? biografi;
  String? ebook;
  String? createdAt;
  String? updatedAt;
  Kategori? kategori;

  DataBuku.fromJson(dynamic json) {
    id = json['id'];
    kategoriId = json['kategori_id'];
    judul = json['judul'];
    image = json['image'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    tahunTerbit = json['tahun_terbit'];
    deskripsi = json['deskripsi'];
    biografi = json['biografi'];
    ebook = json['ebook'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    kategori = json['kategori'] != null ? Kategori.fromJson(json['kategori']) : null;
  }

  DataBuku copyWith({
    num? id,
    num? kategoriId,
    String? judul,
    String? image,
    String? penulis,
    String? penerbit,
    num? tahunTerbit,
    String? deskripsi,
    String? biografi,
    String? ebook,
    String? createdAt,
    String? updatedAt,
    Kategori? kategori,
  }) =>
      DataBuku(
        id: id ?? this.id,
        kategoriId: kategoriId ?? this.kategoriId,
        judul: judul ?? this.judul,
        image: image ?? this.image,
        penulis: penulis ?? this.penulis,
        penerbit: penerbit ?? this.penerbit,
        tahunTerbit: tahunTerbit ?? this.tahunTerbit,
        deskripsi: deskripsi ?? this.deskripsi,
        biografi: biografi ?? this.biografi,
        ebook: ebook ?? this.ebook,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        kategori: kategori ?? this.kategori,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['kategori_id'] = kategoriId;
    map['judul'] = judul;
    map['image'] = image;
    map['penulis'] = penulis;
    map['penerbit'] = penerbit;
    map['tahun_terbit'] = tahunTerbit;
    map['deskripsi'] = deskripsi;
    map['biografi'] = biografi;
    map['ebook'] = ebook;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (kategori != null) {
      map['kategori'] = kategori?.toJson();
    }
    return map;
  }
}

class Kategori {
  Kategori({
    this.id,
    this.nama,
  });

  num? id;
  String? nama;

  Kategori.fromJson(dynamic json) {
    id = json['id'];
    nama = json['nama'];
  }

  Kategori copyWith({
    num? id,
    String? nama,
  }) =>
      Kategori(
        id: id ?? this.id,
        nama: nama ?? this.nama,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nama'] = nama;
    return map;
  }
}