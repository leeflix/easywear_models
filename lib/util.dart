Map<String, dynamic> removeUnderscoreFromId(Map<String, dynamic> doc) {
  doc["id"] = doc["_id"];
  doc.remove("_id");
  return doc;
}

Map<String, dynamic> addUnderscoreToId(Map<String, dynamic> json) {
  json["_id"] = json["id"];
  json.remove("id");
  return json;
}
