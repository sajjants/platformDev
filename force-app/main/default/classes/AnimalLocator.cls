public class AnimalLocator {
    public static String getAnimalNameById(Integer identifier) {
        String retVal = null; 
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+identifier);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> mapOfAnimal = (Map<String, Object>) results.get('animal');
            retVal = String.valueOf(mapOfAnimal.get('name'));
            System.debug(retVal);
        }
        return retVal;        
    }
}