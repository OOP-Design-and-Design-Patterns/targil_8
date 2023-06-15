package sortingClean;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

import static java.lang.System.currentTimeMillis;

public aspect TimeAspect {

    private long startTime;
    private long startTotalTime;
    private int quickSortTimes = 0;
    private int bubbleSortTimes = 0;
    private int insertionSortTimes = 0;
    private int mergeSortTimes = 0;
    private String output;

    @Pointcut("execution(* sortingClean.*.runAlgorithms*(..))")
    private void allAlgorithms(){}

    @Pointcut("execution(* sortingClean.*.sort*(..))")
    private void selectSorters(){}

    @Before("allAlgorithms()")
    public void startAllSorts(JoinPoint jp){
        startTotalTime = currentTimeMillis();
    }

    @After("allAlgorithms()")
    public void finishAllSorts(JoinPoint jp){
        long finishTotalTime = currentTimeMillis() - startTotalTime;
        output = "Total time of running all sort functions was " + finishTotalTime + "ms\n" + output;
        System.out.println(output);
    }

    @Before("selectSorters()")
    public void startSort(JoinPoint jp){
        startTime = currentTimeMillis();
        if(jp.getSignature().getClass().getName().equals("QuickSort"))
            quickSortTimes++;
        if(jp.getSignature().getClass().getName().equals("BubbleSort"))
            bubbleSortTimes++;
        if(jp.getSignature().getClass().getName().equals("InsertionSort"))
            insertionSortTimes++;
        if(jp.getSignature().getClass().getName().equals("MergeSort"))
            mergeSortTimes++;
    }

    @After("selectSorters()")
    public void finishSort(JoinPoint jp){
        long finishTime = currentTimeMillis() - startTime;

    }
}
