WEKA
Q1:
    The linear equation is:
    class = -0.1084 * CRIM
            + 0.0458 * ZN
            + 2.7187 * CHAS=1
            + -17.376 * NOX
            + 3.8016 * RM
            - 1.4927 * DIS
            + 0.2996 * RAD
            - 0.0118 * TAX
            - 0.9465 * PTRATIO
            + 0.0093 * B
            - 0.5226 * LSTAT
            + 36.3411
    There are 12 terms are in the equation. Because only CRIM, ZN, CHAS (when is 1), NOX, RM, DIS, RAD, TAX, PTRATIO, B and LSTAT factors contribute to MEDV. In other words, INDUS and AGE are not important when predicting MEDV. And we should also see that some factors have bad impacts on MEDV, like CRIM, NOX, DIS, TAX, PTRATIO and LSTAT. The higher those factors are, the smaller MEDV would be. Most of those factors impact the median home price have straight forward meanings like crime rate (most people dont want to live in a high crime rate area), nitric oxides concentration (health concern) etc. Also, with the default configuration that linear regression achieves an RMSE of 4.9. See screenshot Q1.png.

Q2:
    The lowest RMSE I was able to achieve is 2.5648 with L=0.1 and M=0.15. See screenshots Q2a.png and Q2b.png.


KNIME
Q3:
    The linear equation is:
    Rings = - 0.8249 * Sex=I 
            + 0.0577 * Sex=M
            - 0.4583 * Length
            + 11.0751 * Diameter
            + 10.7615 * Height
            + 8.9754 * Whole_weight
            - 19.7869 * Shucked_weight
            - 10.5818 * Viscera_weight
            + 8.7418 * Shell_weight
            + 3.8946

    See screenshot Q3.png.

Q4:
    See screenshot Q4.png.


RapidMiner
Q5:
    Cluster 0: 1388 data points, Cluster 1: 499 data points, Cluster 2: 448 data points, Cluster 3: 22 data points, Cluster 4: 172 data points, Cluster 5: 1648 data points.

Q6:
    The linear equation is:
    Rings = - 11.933 * Length
            + 25.766 * Diameter
            + 20.358 * Height
            + 2.836
    See screenshot Q6.png.
    