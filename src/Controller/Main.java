package Controller;

import Util.MatrixMultiplication;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Sumit on 8/29/2016.
 */
public class Main extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String home= request.getParameter("homeTeam");
        String away= request.getParameter("awayTeam");
        String csvFile = "teamName.csv";
        String line = "";
        String cvsSplitBy = ",";
        System.out.println("HERE");
        Map<String, Double> map = new HashMap<>();
        try (BufferedReader br = new BufferedReader(new FileReader("C:\\Users\\Sumit\\Desktop\\Prediction_FinalYearProject\\"+csvFile))) {
            while ((line = br.readLine()) != null) {
                String[] team = line.split(cvsSplitBy);
                //System.out.println(team[0] +" "+ team[1]);
                map.put(team[1], Double.valueOf(team[0]));
                //System.out.println(team[1]);
                //System.out.println(team[0]);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("THETEAA");
        double homeValue = map.get(home);
        System.out.println("THETEAAssssssss");
        double awayValue = map.get(away);
        String theta1 = "C:\\Users\\Sumit\\Desktop\\Prediction_FinalYearProject\\Theta1.txt";
        String theta2 = "C:\\Users\\Sumit\\Desktop\\Prediction_FinalYearProject\\Theta2.txt";
        FileReader theta1File = new FileReader(theta1);
        FileReader theta2File = new FileReader(theta2);
        BufferedReader theta1Reader = new BufferedReader(theta1File);
        BufferedReader theta2Reader = new BufferedReader(theta2File);
        String theta1Line;
        String theta2Line;
        double[][] theta1DoubleArray = new double[10][3];
        for(int i=0;i<10;i++){
            theta1Line = theta1Reader.readLine();
            String[] theta1values = theta1Line.split(" ");
            for (int j=0;j<3;j++){
                theta1DoubleArray[i][j] = Double.parseDouble(theta1values[j]);
            }
        }
        double[][] theta2DoubleArray = new double[3][11];
        for(int i=0;i<3;i++){
            theta2Line = theta2Reader.readLine();
            String[] theta2values = theta2Line.split(" ");
            for (int j=0;j<11;j++){
                theta2DoubleArray[i][j] = Double.parseDouble(theta2values[j]);
            }
        }
        MatrixMultiplication m = new MatrixMultiplication();
        double [][] oneMatrix = m.matrixMultiply(theta1DoubleArray, theta2DoubleArray);
        System.out.println(oneMatrix.length);
        theta1Reader.close();
        theta2Reader.close();

        double [][] input = {{1,homeValue,awayValue}};
        System.out.println(input.length);
        System.out.println(theta1DoubleArray.length);
        double [][] transposeTheta1Matrix = new double[3][10];

        //Transpose of a matrix
        for(int i=0;i<10;i++){
            for(int j=0;j<3;j++)
            {
                transposeTheta1Matrix[j][i] = theta1DoubleArray[i][j];
            }
        }
        double [][] firstResult = new double[input.length][transposeTheta1Matrix[0].length];
        for(int i=0;i<input.length;i++)
        {
            for(int j=0;j<transposeTheta1Matrix.length;j++){
                firstResult[i][j] = 0.0;
                for(int k=0;k<input[0].length;k++) {
                    firstResult[i][j] += input[i][k] * transposeTheta1Matrix[k][j];
                }
            }
        }

        System.out.println(firstResult.length + "x" + firstResult[0].length);
        System.out.println(transposeTheta1Matrix.length + "x" + transposeTheta1Matrix[0].length);
        System.out.println(input.length + "x" + theta2DoubleArray[0].length);
        double  [][] firstModifiedResult = new double[input.length][theta2DoubleArray[0].length];
        for(int i = 0; i < input.length; i++){
            for(int j = 0; j < theta2DoubleArray.length; j++){
                firstModifiedResult [i][j]= (1 / (1 + Math.pow(Math.E, (-1 * firstResult[i][j]))));
                System.out.println(firstModifiedResult[i][j ]);
            }
        }

        double [][] firstResultAfterBias = new double[input.length][transposeTheta1Matrix[0].length + 1];
        firstResultAfterBias[0][1] = 1;
        for(int i=0;i<input.length;i++)
        {
            for(int j=1;j<transposeTheta1Matrix.length + 1;j++){
                for(int k=0;k<input[0].length;k++) {
                    firstResultAfterBias[i][j] = firstModifiedResult[i][j - 1];
                }
            }
        }
        System.out.println(firstResultAfterBias.length + "x" + firstResultAfterBias[0].length);

        double [][] theta2Transpose = new double[11][3];
        //Transpose of a matrix
        for(int i=0;i<3;i++){
            for(int j=0;j<11;j++)
            {
                theta2Transpose[j][i] = theta2DoubleArray[i][j];
            }
        }
        System.out.println("OSOSOS");
        double [][] finalResult = new double[firstResultAfterBias.length][theta2Transpose[0].length];
        System.out.println(finalResult.length + "x" + finalResult[0].length);
        for(int i=0;i<firstResultAfterBias.length;i++) {
            for(int j=0;j<theta2Transpose[0].length;j++){
                finalResult[i][j] = 0.0;
                for(int k=0;k<theta2Transpose[0].length;k++) {
                    finalResult[i][j] += firstResultAfterBias[i][k] * theta2Transpose[k][j];
                }
            }
        }

        System.out.println("--------------RESULT--------------------");
        double  [][] secondModifiedresult = new double[firstResultAfterBias.length][theta2Transpose[0].length];
        System.out.println(firstResult.length);
        System.out.println(firstResult[0].length);
        for(int i = 0; i < finalResult.length; i++){
            for(int j = 0; j < finalResult[0].length; j++){
                secondModifiedresult [i][j]= (1 / (1 + Math.pow(Math.E, (-1 * finalResult[i][j]))));
                System.out.println(secondModifiedresult[i][j]);
            }
        }
        if(secondModifiedresult[0][0] <= 0.99 && (secondModifiedresult[0][1] < 0.02 || secondModifiedresult[0][1] > 0.00000001) && secondModifiedresult[0][2] > 0.01){
            System.out.println("Home team wins");
            secondModifiedresult[0][0] = 1;
            secondModifiedresult[0][1] = 0;
            secondModifiedresult[0][2] = 0;
        }else if(secondModifiedresult[0][1] > 0.0000009){
            System.out.println("Draw");
            secondModifiedresult[0][0] = 0;
            secondModifiedresult[0][1] = 1;
            secondModifiedresult[0][2] = 0;
        }
        else{
            System.out.println("Away Team Wins");
            secondModifiedresult[0][0] = 0;
            secondModifiedresult[0][1] = 0;
            secondModifiedresult[0][2] = 1;
        }
        int result;
        if(secondModifiedresult[0][0] == 1){
            result = 1;

        }
        else if(secondModifiedresult[0][1] == 1){
            result = 2;
        }
        else{
            result = 3;
        }
        request.setAttribute("map",map);
        request.setAttribute("theta1",theta1DoubleArray);
        request.setAttribute("theta2",theta2DoubleArray);
        request.setAttribute("modifiedResult",secondModifiedresult);
        request.setAttribute("result",result);
        request.getRequestDispatcher("/predict.jsp").forward(request,response);

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        request.getRequestDispatcher("/predict.jsp").forward(request,response);
    }
}
