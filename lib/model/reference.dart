class Reference {
  String? referenceId;
  String? referenceTitle;
  String? referenceDescription;

  Reference({
    this.referenceId,
    this.referenceTitle,
    this.referenceDescription,
  });

  Reference.fromJson(Map<String, dynamic> json) {
    referenceId = json['reference_id'];
    referenceTitle = json['reference_title'];
    referenceDescription = json['reference_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reference_id'] = referenceId;
    data['reference_title'] = referenceTitle;
    data['reference_description'] = referenceDescription;
    return data;
  }
}