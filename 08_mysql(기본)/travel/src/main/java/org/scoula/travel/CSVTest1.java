package org.scoula.travel;

public class CSVTest1 {
    public static void main(String[] args) throws Exception {
        CSVReader csvReader = new CSVReader(new FileReader("travel.csv"));
        String[] line;
        while ((line = csvReader.readNext()) != null) {
            System.out.println(String.join(",", line));
        }
    }
}
