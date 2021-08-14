import sys


def interface():

    clearTuple = ( "clear", "cl" )
    exitTuple = ( "exit", "quit" )
    last = 0
    output = None


    try:
        inputString = input()

        while inputString  not in  exitTuple:

            if inputString in clearTuple:
                print(chr(27) + "[2J")


            else:
                strippedInput = stripString( inputString )
                valueTuple    = parseString( strippedInput )
                output        = calculate( last, valueTuple )


            print( str( output ) + "\n" )

            last = output

            inputString   = input()


    except KeyboardInterrupt:
        print("\n")          
        sys.exit(0)          




def stripString( stringToStrip ):
    
    strippedString = stringToStrip.replace(" ", "")
    
    return strippedString




def parseString( stringToParse ):

    operators = ["/","*","-","+"]
    firstVal  = "" 
    secondVal = ""
    operator  = ""

    for char in stringToParse:
        if char not in operators and operator == "":
            firstVal += char

        elif char not in operators and operator != "":
            secondVal += char

        else:
            operator += char


    return (firstVal, secondVal, operator)




def calculate( lastOutput, valueTuple ):

    firstVal  = valueTuple[0]
    secondVal = valueTuple[1]
    operator  = valueTuple[2]       


    processedFirstVal = determineType( firstVal, lastOutput )
    processedSecondVal = determineType( secondVal, lastOutput )
    

    opDict = {

            "/" : processedFirstVal / processedSecondVal,
            "*" : processedFirstVal * processedSecondVal,
            "-" : processedFirstVal - processedSecondVal,
            "+" : processedFirstVal + processedSecondVal,

             }
    

    return opDict[operator]




def determineType( val, lastVal ):

    lastString = "last"
    period = '.'

    if ( period in val and lastString not in val ):
        val = float( val )

    elif ( lastString in val ):
        val = lastVal

    else:
      val = int( val )

    return val





# execute main
interface()
