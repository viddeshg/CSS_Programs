# Multiplication of two polynomials with a given irreducible polynomial

# finding higher degree among the two polynomials
print "\nHighest degree in First Polynomial:: "
highestDegree1 = gets.to_i
print "Highest degree in Second Polynomial:: "
highestDegree2 = gets.to_i
wordLen = (highestDegree1 >= highestDegree2) ? highestDegree1 + 1 : highestDegree2 + 1

# size of word is 1 more than the highest degree
print "Word is of #{wordLen} bits."

# creating array and initializing it to 0
word = Array.new(wordLen,0)

# == FIRST POLYNOMIAL ==

# finding number of terms 'ELE1' in first polynomial
print "\n\nEnter number of terms in First Polynomial:: "
ele1 = gets.to_i

# looping 'ELE1' number of times to get coefficients
i = 0
while (i < ele1)
    print "Degree of term number #{i+1}:: "
    temp = gets.to_i
    word[wordLen - 1 - temp] = 1
    i = i + 1
end

# storing first polynomial in firstpoly
j = 0
firstpoly =""
while (j < wordLen)
    firstpoly = firstpoly + word[j].to_s
    j = j + 1
end

# reseting word array
reset = 0
while ( reset < wordLen)
    word[reset] = 0
    reset = reset + 1
end
# == END FIRST POLYNOMIAL ==

# == SECOND POLYNOMIAL ==
print "\nEnter number of terms in Second Polynomial:: "
ele2 = gets.to_i

i = 0
while (i < ele2)
    print "Degree of term number #{i+1}:: "
    temp = gets.to_i
    word[wordLen - 1 - temp] = 1
    i = i + 1
end

j = 0
secondpoly =""
while (j < wordLen)
    secondpoly = secondpoly + word[j].to_s
    j = j + 1
end

reset = 0
while ( reset < wordLen)
    word[reset] = 0
    reset = reset + 1
end
# == END SECOND POLYNOMIAL ==

# == MODULUS ==
print "\nHighest degree in the modulus:: "
highestDegreeMod = gets.to_i

mod_array = Array.new(highestDegreeMod+1,0)

print "Enter number of terms in the modulus:: "
eleMod = gets.to_i

i = 0
while (i < eleMod)
    print "Degree of term number #{i+1}:: "
    temp = gets.to_i
    mod_array[highestDegreeMod - temp] = 1
    i = i + 1
end

j = 0
modulus =""
while (j < highestDegreeMod+1)
    modulus = modulus + mod_array[j].to_s
    j = j + 1
end
# == END MODULUS ==

print "\nPolynomial 1: #{firstpoly} \nPolynomial 2: #{secondpoly}\nModulus     : #{modulus}\n"

# calculating polynomial with higher and lower degrees
lowerPolyLength = 0
higher = 0
if (highestDegree1 < highestDegree2)
    lowerPolyLength = highestDegree1 + 1
    higher = secondpoly
    lower = firstpoly
else
    lowerPolyLength = highestDegree2 + 1
    higher = firstpoly
    lower = secondpoly
end

# array 'xor' st
ores xor with the modulus
xor = Array.new(lowerPolyLength,"")
xor.insert(0,"#{higher}")

# == MAIN ALGORITHM ==
n = 1
print "\n  Powers    Shift-Left    X-OR\nx^0 xor P2     ----     #{higher}\n"
while (n < lowerPolyLength)
    print "x^#{n} xor P2   "
    x = 0
    newHigh = ""
    if(higher[0]=='1')

        # shift left operation
        last = higher.length - 1
        temp = 0
        while (temp < higher.length)
            if(temp == last)
                higher[temp] = '0'
                temp = temp + 1
            else
                higher[temp] = higher[temp+1]
                temp = temp + 1
            end
        end
        print "#{higher}  "

        # xor
        while(x < higher.length)
            a = higher[x].to_i
            b = modulus[x+1].to_i
            r = a ^ b
            newHigh = newHigh + r.to_s
            x = x + 1
        end

        higher = newHigh
        xor.insert(n,"#{higher}")
        n = n + 1
        print " #{higher}\n"

    else 
        # shift left operation
        temp = 0
        while (temp < higher.length)
            if(temp == (higher.length - 1))
                higher[temp] = '0'
                temp = temp + 1
            else
                higher[temp] = higher[temp+1]
                temp = temp + 1
            end
        end
        print "#{higher}  "
        print " #{higher}\n"
        xor.insert(n,"#{higher}")
        n = n + 1
    end
end
# == END MAIN ALGORITHM ==

# storing degrees of lower polynomial in the array
finalTerms = Array.new
element = 0
while (element < lower.length)
    if (lower[element]=='1')
        temp = lower.length - element - 1
        finalTerms.push(xor[temp])
        element = element + 1
    else
        element = element + 1
    end
end

# ex-or-ing all the final terms (P1 xor P2)
result = finalTerms[0]
y = 1
while (y < finalTerms.length)
    newResult = ""
    # xor
    x=0
    while(x < higher.length)
        a = result[x].to_i
        b = (finalTerms[y])[x].to_i
        r = a ^ b
        newResult = newResult + r.to_s
        x = x + 1
    end
    result = newResult
    y = y + 1
end

# converting result from binary to expression form
puts "\nResult::"
for i in 0..result.length
    if(result[i]=='1')
        temp = result.length - i - 1
        print "x^#{temp}"
        if (temp != 0)
            print " + "
        end
    end
end
print "\n(#{result})\n\n"