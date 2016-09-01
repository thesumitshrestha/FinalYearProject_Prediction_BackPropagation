package Util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Sumit on 8/29/2016.
 */
public class ReadCSV {
    public static void main(String[] args) {
        String csvFile = "teamName.csv";
        String line = "";
        String cvsSplitBy = ",";
        Map map = new HashMap();
        try (BufferedReader br = new BufferedReader(new FileReader(csvFile))) {
            while ((line = br.readLine()) != null) {
                String[] team = line.split(cvsSplitBy);
                System.out.println(team[0] +" "+ team[1]);
                map.put(team[1],team[0]);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
