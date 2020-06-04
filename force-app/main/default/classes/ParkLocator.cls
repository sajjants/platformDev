public class ParkLocator {
    public static String[] country(String cName) {
        ParkService.ParksImplPort parks = new ParkService.ParksImplPort();
        return parks.byCountry(cName);         
    }
}