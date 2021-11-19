# m2tanvee, Tanveer, Muhammad Furrukh, 501035362, Section 011
# a42chowd, Chowdhury, Afnan, 501038102, Section 091
# s6kohli, Kohli, Shaan, 501028410, Section 071
# a65chaud, Chaudhry, Ammar, 501029828, Section 051

#!/bin/bash
#source: LINUX




FILE=$1
#DECLARE 2D MATRIX
declare -A mat
numcol=5
numrow=5

#CALL LIST VARIABLES
declare -a callList
declare -a callList2 #actual call list
declare -a variableCallList #just to show the characters
count=0

#CHECKING FOR DUPLICATES
declare -a dupes=()

for ((c=0;c<=75;c++)) do
    callList[$c]=$c
done


#READING MATRIX FROM FILE
readMatrix() {
    local line
    local i=0
    local j
    
    seed=$(head -n 1 $FILE)
    
    RANDOM=$seed


    local linecount=1
    
    read
    while read -r line; do
        j=0
        for value in `echo $line`; do
            mat[$i,$j]="$value"
            j=$((j+1))
            if [ $j -eq 6 ]
            then
                echo "card format error"
                exit 4
            fi
        done
        i=$((i+1))
        linecount=$((linecount+1))
    done                     

    #ERROR HANDLING
    if [ $linecount != 6 ]
    then  
        echo "input file must have 6 lines"
        exit 2
    fi

    if [ ${#seed} != 4 ]
    then   
        echo "seed line format error"
        exit 3
    fi
   
    #COLUMN 1
    if [ ${mat[0,0]} -gt 15 ] 2> /dev/null
    then
        echo "card format error"
        exit 4
    elif [ ${mat[1,0]} -gt 15 ] 2> /dev/null
    then
        echo "card format error"
        exit 4
    elif [ ${mat[2,0]} -gt 15 ] 2> /dev/null
    then
        echo "card format error"
        exit 4
    elif [ ${mat[3,0]} -gt 15 ] 2> /dev/null
    then
        echo "card format error"
        exit 4
    elif [ ${mat[4,0]} -gt 15 ] 2> /dev/null
    then
        echo "card format error"
        exit 4     
    fi

    #COLUMN 2

    if [ ${mat[0,1]} -gt 30 ] 2> /dev/null
    then
        echo "card format error"
        exit 4
    elif [ ${mat[1,1]} -gt 30 ] 2> /dev/null
    then
        echo "card format error"
        exit 4
    elif [ ${mat[2,1]} -gt 30 ] 2> /dev/null
    then
        echo "card format error"
        exit 4
    elif [ ${mat[3,1]} -gt 30 ] 2> /dev/null
    then
        echo "card format error"
        exit 4
    elif [ ${mat[4,1]} -gt 30 ] 2> /dev/null
    then
        echo "card format error"
        exit 4     
    fi
    
    #COLUMN 3

    if [ ${mat[0,2]} -gt 45 ] 2> /dev/null
    then
        echo "card format error"
        exit 4
    elif [ ${mat[1,2]} -gt 45 ] 2> /dev/null
    then
        2> /dev/null
        echo "card format error"
        exit 4
    elif [ ${mat[3,2]} -gt 45 ] 2> /dev/null
    then
        echo "card format error"
        exit 4 
    elif [ ${mat[4,2]} -gt 45 ] 2> /dev/null
    then
        echo "card format error"
        exit 4     
    fi

    #COLUMN 4

    if [ ${mat[0,3]} -gt 60 ] 2> /dev/null
    then
        echo "card format error"
        exit 4
    elif [ ${mat[1,3]} -gt 60 ] 2> /dev/null
    then
        echo "card format error"
        exit 4
    elif [ ${mat[2,3]} -gt 60 ] 2> /dev/null
    then
        echo "card format error"
        exit 4
    elif [ ${mat[3,3]} -gt 60 ] 2> /dev/null
    then
        echo "card format error"
        exit 4
    elif [ ${mat[4,3]} -gt 60 ] 2> /dev/null
    then
        echo "card format error"
        exit 4     
    fi

    #COLUMN 5

    if [ ${mat[0,4]} -gt 75 ] 2> /dev/null
    then
        echo "card format error"
        exit 4
    elif [ ${mat[1,4]} -gt 75 ] 2> /dev/null
    then
        echo "card format error"
        exit 4
    elif [ ${mat[2,4]} -gt 75 ] 2> /dev/null
    then
        echo "card format error"
        exit 4
    elif [ ${mat[3,4]} -gt 75 ] 2> /dev/null
    then
        echo "card format error"
        exit 4
    elif [ ${mat[4,4]} -gt 75 ] 2> /dev/null
    then
        echo "card format error"
        exit 4     
    fi
    
     mat[2,2]=00m

    
    cnt=0
    
    #CONVERT ARRAY TO 1D TO CHECK FOR DUPLICATES
    for ((i=0;i<=numrow;i++)) do
        for ((j=0;j<=numcol;j++)) do
            dupes[$cnt]+=${mat[$i,$j]}
            cnt=$((cnt+1))
        done
    done

    #USE AWK TO CHECK FOR DUPLICATES
    [[ $( awk -v RS=" " ' a[$0]++ ' <<< "${dupes[@]} " ) ]] && echo "card format error" && exit 4
    
    


}

#CHECK TO SEE IF PLAYER WINS
checkMatrix(){
    
    if [[ ${#mat[0,0]} -gt 2 ]] && [[ ${#mat[4,0]} -gt 2 ]] && [[ ${#mat[0,4]} -gt 2 ]] && [[ ${#mat[4,4]} -gt 2 ]]
    then
        echo "WINNER"
        exit 0
    fi

    for ((i=0;i<=numrow;i++)) do
        for ((j=0;j<=numcol;j++)) do
            if [[ $i = 0 ]]
            then
                if [[ ${#mat[$i,0]} -gt 2 ]] && [[ ${#mat[$i,1]} -gt 2 ]] &&  [[ ${#mat[$i,2]} -gt 2 ]] &&  [[ ${#mat[$i,3]} -gt 2 ]] &&  [[ ${#mat[$i,4]} -gt 2 ]] 
                then
                    echo "WINNER"
                    exit 0
                fi 
            fi
            if [[ $i = 1 ]]
            then
                if [[ ${#mat[$i,0]} -gt 2 ]] && [[ ${#mat[$i,1]} -gt 2 ]] &&  [[ ${#mat[$i,2]} -gt 2 ]] &&  [[ ${#mat[$i,3]} -gt 2 ]] &&  [[ ${#mat[$i,4]} -gt 2 ]] 
                then
                    echo "WINNER"
                    exit 0
                fi 
            fi
            if [[ $i = 2 ]]
            then
                if [[ ${#mat[$i,0]} -gt 2 ]] && [[ ${#mat[$i,1]} -gt 2 ]] &&  [[ ${#mat[$i,2]} -gt 2 ]] &&  [[ ${#mat[$i,3]} -gt 2 ]] &&  [[ ${#mat[$i,4]} -gt 2 ]] 
                then
                    echo "WINNER"
                    exit 0
                fi 
            fi
            if [[ $i = 3 ]]
            then
                if [[ ${#mat[$i,0]} -gt 2 ]] && [[ ${#mat[$i,1]} -gt 2 ]] &&  [[ ${#mat[$i,2]} -gt 2 ]] &&  [[ ${#mat[$i,3]} -gt 2 ]] &&  [[ ${#mat[$i,4]} -gt 2 ]] 
                then
                    echo "WINNER"
                    exit 0
                fi 
            fi  
            if [[ $i = 4 ]]
            then
                if [[ ${#mat[$i,0]} -gt 2 ]] && [[ ${#mat[$i,1]} -gt 2 ]] &&  [[ ${#mat[$i,2]} -gt 2 ]] &&  [[ ${#mat[$i,3]} -gt 2 ]] &&  [[ ${#mat[$i,4]} -gt 2 ]] 
                then
                    echo "WINNER"
                    exit 0
                fi 
            fi          
            if [[ $j = 0 ]]
            then
                if [[ ${#mat[0,$j]} -gt 2 ]] && [[ ${#mat[1,$j]} -gt 2 ]] &&  [[ ${#mat[2,$j]} -gt 2 ]] &&  [[ ${#mat[3,$j]} -gt 2 ]] &&  [[ ${#mat[4,$j]} -gt 2 ]] 
                then
                    echo "WINNER"
                    exit 0
                fi 
            fi
           if [[ $j = 1 ]]
            then
                if [[ ${#mat[0,$j]} -gt 2 ]] && [[ ${#mat[1,$j]} -gt 2 ]] &&  [[ ${#mat[2,$j]} -gt 2 ]] &&  [[ ${#mat[3,$j]} -gt 2 ]] &&  [[ ${#mat[4,$j]} -gt 2 ]] 
                then
                    echo "WINNER"
                    exit 0
                fi 
            fi
           if [[ $j = 2 ]]
            then
                if [[ ${#mat[0,$j]} -gt 2 ]] && [[ ${#mat[1,$j]} -gt 2 ]] &&  [[ ${#mat[2,$j]} -gt 2 ]] &&  [[ ${#mat[3,$j]} -gt 2 ]] &&  [[ ${#mat[4,$j]} -gt 2 ]] 
                then
                    echo "WINNER"
                    exit 0
                fi 
            fi
           if [[ $j = 3 ]]
            then
                if [[ ${#mat[0,$j]} -gt 2 ]] && [[ ${#mat[1,$j]} -gt 2 ]] &&  [[ ${#mat[2,$j]} -gt 2 ]] &&  [[ ${#mat[3,$j]} -gt 2 ]] &&  [[ ${#mat[4,$j]} -gt 2 ]] 
                then
                    echo "WINNER"
                    exit 0
                fi 
            fi
           if [[ $j = 4 ]]
            then
                if [[ ${#mat[0,$j]} -gt 2 ]] && [[ ${#mat[1,$j]} -gt 2 ]] &&  [[ ${#mat[2,$j]} -gt 2 ]] &&  [[ ${#mat[3,$j]} -gt 2 ]] &&  [[ ${#mat[4,$j]} -gt 2 ]] 
                then
                    echo "WINNER"
                    exit 0
                fi 
            fi
        done
    done

}

#PRINT MATRIX
printMatrix(){
    echo "   L   I   N   U   X"
    for ((i=0;i<=numrow;i++)) do
        for ((j=0;j<=numcol;j++)) do 
                printf " %3s" ${mat[$i,$j]}
        done
        echo
    done
}

#(READ FILE IF IT EXISTS), FIRST PRINT TO SHOW MATRIX WHEN FILE LOADED
if [ -f "$FILE" ]
then
    readMatrix < $FILE
    clear
    echo "CALL LIST: "
    printMatrix

else
    echo "input file missing or unreadable"
    exit 1
fi

# RANDOM GENERATION
declare -A testIndex=()


#create array with random values

for ((i=0;i<=1000;i++))
do
    index=$((1 + $RANDOM % 75))
    if [[ testIndex[$i] -ne index ]]
    then
        testIndex[$i]=$index
    fi
done


#removed duplicates from array
readarray -t testList < <(printf '%s\n' "${testIndex[@]}" | awk '!x[$0]++')





#MAIN LOOP
while true
do

    #READ KEY INPUTTED
    read -n1 -p "enter any key to get a call or q to quit: " key
    
    #index=$(( $RANDOM % 75 + 1))
    clear
    
    #IF THE KEY IS NOT QUIT
    if [ $key != "q" ] 2> /dev/null
    then
        callList2[$count]=${testList[$count]}
        variableCallList[$count]=${testList[$count]}
        
        #VARIABLE CALL LIST

        if [[ variableCallList[$count] -lt 10 ]]
        then
            variableCallList[$count]="L0${testList[$count]}"
        elif [[ variableCallList[$count] -ge 10 ]] && [[ variableCallList[$count] -le 15 ]]
        then
            variableCallList[$count]="L${testList[$count]}"
        elif [[ variableCallList[$count] -gt 15 ]] && [[ variableCallList[$count] -le 30 ]]
        then
            variableCallList[$count]="I${testList[$count]}"
        elif [[ variableCallList[$count] -gt 30 ]] && [[ variableCallList[$count] -le 45 ]]
        then
            variableCallList[$count]="N${testList[$count]}"
        elif [[ variableCallList[$count] -gt 45 ]] && [[ variableCallList[$count] -le 60 ]]
        then
            variableCallList[$count]="U${testList[$count]}"
        else
            variableCallList[$count]="X${testList[$count]}"
        fi
       

        #MARKING (CHECK TO SEE IF IT MATCHES)
        for ((i=0;i<=numrow;i++)) do
            for ((j=0;j<=numcol;j++)) do 
                if [[ testList[$count] -eq ${mat[$i,$j]} ]] 2> /dev/null
                then
                    mat[$i,$j]="${mat[$i,$j]}m"
                fi
            done
        done

        #PRINT CALL LIST AND CHECK IF PLAYER WINS
        echo "CALL LIST: ${variableCallList[*]}"
        printMatrix
        checkMatrix
    else
        exit 0
    fi

    count=$((count+1))


done






