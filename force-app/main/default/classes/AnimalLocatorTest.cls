@isTest
public class AnimalLocatorTest {
    @isTest
    public static void testgetAnimalNameById() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String result = AnimalLocator.getAnimalNameById(2);
        System.assertNotEquals(null,result,'The callout returned a null reponse.');
        System.assertEquals('bear',result);
    }

}