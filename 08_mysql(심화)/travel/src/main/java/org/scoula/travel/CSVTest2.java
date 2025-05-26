package org.scoula.travel;

public class CSVTest2 {
    public static void main(String[] args) throws Exception {
        List<TravelVO> travels = new CsvToBeanBuilder<TravelVO>(new FileReader("travel.csv"))
                .withType(TravelVO.class)
                .build()
                .parse();
        travels.forEach(travel -> {
            System.out.println(travel);
        });
    }
}
