import 'package:faker/faker.dart';

var teamCTA = {
  "title": "Join Our Team",
  "subtitle":
      "We are always on the lookout for talented individuals who are enthusiastic about making a difference. Explore our career opportunities and join us in our mission to help people achieve their health and wellness goals.",
  "buttonText": "Apply Now"
};

var teamHeader = {
  "title": "Meet Our Team of Experts",
  "subtitle":
      "Our team at Nutritionist is composed of highly skilled professionals who are passionate about helping you achieve your health and wellness goals. With a diverse range of expertise in nutrition, coaching, and support, our team is dedicated to providing you with the guidance and personalized care you need. Get to know the experts behind our success and discover how they can make a positive impact on your journey to better health."
};

List<String> team = [
  "Management Team",
  "Nutritionists and Dietitians",
  "Customer Support",
  "Marketing and Communications",
  "Technology and Development"
];

List<List<Map<String, String>>> get teamDetail {
  var data = List.generate(team.length, (index) {
    return List.generate(
        4,
        (i) => {
              "name":
                  '${Faker().person.firstName()} ${Faker().person.lastName()}',
              "job": Faker().job.title(),
              "image": "team${(i + index) % 4}"
            });
  });
  return data;
}
