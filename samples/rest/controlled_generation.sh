set -eu

echo "json_controlled_generation"
# [START json_controlled_generation]
curl "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro-latest:generateContent?key=$GOOGLE_API_KEY" \
-H 'Content-Type: application/json' \
-d '{
    "contents": [{
      "parts":[
        {"text": "List a few popular cookie recipes using this JSON schema:
          {'type': 'object', 'properties': { 'recipe_name': {'type': 'string'}}}"
          }
        ]
    }],
    "generationConfig": {
        "response_mime_type": "application/json",
    }
}' 2> /dev/null | head
# [END json_controlled_generation]

echo "json_no_schema"
# [START json_no_schema]
curl "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro-latest:generateContent?key=$GOOGLE_API_KEY" \
-H 'Content-Type: application/json' \
-d '{
    "contents": [{
      "parts":[
        {"text": "List a few popular cookie recipes using this JSON schema:

        Recipe = {'recipe_name': str}
        Return: list[Recipe
        ]
    }],
}' 2> /dev/null | head
# [END json_no_schema]