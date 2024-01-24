

class LocationModel{
  String title;
  String description;
  String lot;
  String lat;

  LocationModel({
 required this.title,
 required this.description,
 required this.lot,
 required this.lat,
});

  Map<String,String> toJson() =>{
    "title": title,
    "description": description,
    "lot": lot,
    "lat": lat
  };
}