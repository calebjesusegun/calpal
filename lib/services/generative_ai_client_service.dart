import 'dart:typed_data';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GenerativeAiClientService {
  Future<String?> generateFoodDetails(Uint8List image) async {
    String generativeAIApiKey = dotenv.env['API_KEY'] ?? "";
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: generativeAIApiKey,
    );
    const prompt =
        'You are a chef expert working in a restaurant where all different races come in to eat and the customers are required to take a picture of their preferred food as an image and submit it to you while you carefully examine the image based on your expertise and generate the name of the food, generate a list of ingredients used to make the food and lastly generate a list of instructions on how to use the ingredients to make the food.'
        'Generate the name of the food from the image. Keep the name of the food concise'
        'Generate a list of well-defined ingredients that are used by professional chefs in the world to prepare the food. Keep the ingredient name concise'
        'Generate a list of well-defined instructions that are used by professional chefs in the world to cook the food step by step using the ingredients already provided. Include the number of minutes each section takes before moving to the next section within the instructions. Include the resources being used in the instructions as well. The instructions should be easy to follow and not hard to understand'
        'Provide your response as a JSON object with the following schema: {{"foodName": ""}, {"ingredients": ["", "", ...]}, {"instructions": ["", "", ...]}}'
        'Do not return your result as Markdown.'
        'If an image is not a food, return an empty schema: {}'
        'If you are not sure about an image, return an empty schema: {}';

    final response = await model.generateContent([
      Content.multi([TextPart(prompt), DataPart('image/jpeg', image)]),
    ]);

    return response.text;
  }
}
