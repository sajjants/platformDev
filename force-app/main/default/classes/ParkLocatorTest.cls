@isTest
private class ParkLocatorTest {
    @isTest static void testCountry() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        List<String> result = ParkLocator.country('Germany');
        // Verify that a fake result is returned
        System.assertEquals(new List<String>{'Garner State Park', 'Fowler Park', 'Hoosier National Forest Park'}, result); 
    }
}