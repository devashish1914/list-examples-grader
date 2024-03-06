CPATH=".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar"

rm -rf student-submission
rm -rf grading-area

mkdir grading-area
mkdir student-submission
git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

if ! [ -f "student-submission/ListExamples.java" ]
then 
    echo "Missing ListExamples.java in student submission"
    echo "Score: 0"
    exit
else 
    echo "ListExamples.java Found"
fi

cp student-submission/ListExamples.java grading-area/
javac -cp $CPATH grading-area/*.java &> grading-area/compile.txt
if [ $? -ne 0 ]
then 
    echo "Compilation Error"
    echo "Score: 0"
    exit
else
    echo "Compilation Successful"
fi

# java -cp $CPATH org.junit.runner.JUnitCore TestExamples &> grading-area/grade.txt
# third_last_line=$(tail -n 3 "grading-area/grade.txt" )
# NUM_TESTS_RUN=$(echo "$third_last_line" | awk '{print $3}' )
# NUM_TESTS_FAILED=$(echo "$third_last_line" | awk '{print $5}' )
# echo $third_last_line
# echo $NUM_TESTS_RUN
# echo $NUM_TESTS_FAILED
# LAST=$(tail -n 3 grading-area/grade.txt)
# run=$(awk  -v var="$last_line" '{print $0}' <<< "$var")
# echo $run
#grep -Eo "Tests run: [0-9]+,  Failures: [0-9]+" grading-area/grade.txt
