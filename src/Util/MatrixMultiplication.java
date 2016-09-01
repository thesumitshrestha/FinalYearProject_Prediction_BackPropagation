package Util;

/**
 * Created by Sumit on 8/29/2016.
 */
public class MatrixMultiplication {
    public double [][] matrixMultiply(double[][] theta1DoubleArray,double [][] theta2DoubleArray){
        int theta1LengthRow = theta1DoubleArray.length;
        int theta2LengthCol = theta2DoubleArray.length;
        double finalResult [][]= new double[theta1LengthRow][theta2LengthCol];
        for(int i=0;i<theta1LengthRow;i++) {
            for(int j=0;j<theta2LengthCol;j++) {
                finalResult[i][j] = 0.0;
                for(int k=0;k<theta2LengthCol;k++) {
                    finalResult[i][j] += theta1DoubleArray[i][k] * theta2DoubleArray[k][j];
                }
            }
        }
        return finalResult;
    }
}
