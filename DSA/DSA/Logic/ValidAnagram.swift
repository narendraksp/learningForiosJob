//
//  ValidAnagram.swift
//  DSA
//
//  Created by narendra kumar s on 27/02/25.
//

func ValidAnagramUsingSort(inputT:String,inputS:String) -> Bool{
    return  inputT.sorted() == inputS.sorted()
}

func ValidAnagramUsingDict(inputT:String,inputS:String) -> Bool{
    if inputT.count == inputS.count {
        var dict = Dictionary<Character, Int>()
        for chr in inputT {
            dict[chr, default: 0] += 1            }
        for chr in inputS {
            if let  value = dict[chr] ,value > 0{
                dict[chr] = value - 1
            } else {
                return  false
            }
        }
        return true
    } else {
        return false
        
    }
    }
func ValidAnagramUsingFque(inputT:String,inputS:String) -> Bool{
    let MAX_CHAR = 26  // Assuming 256 for the number of possible characters (like ASCII)
    var freq = [Int](repeating: 0, count: MAX_CHAR)
    for value in inputS {
        let chr:Character = "a"
        let value =   Int(value.asciiValue!) -  Int(chr.asciiValue!)
        print(value)
        freq[value] += 1
        
    }
    for value in inputT {
        let chr:Character = "a"
        let value =   Int(value.asciiValue!) -  Int(chr.asciiValue!)
        freq[value] -= 1
        
    }
    print(freq)
    for value in freq {
        if value != 0 {
            return false
        }
    }
    return true
}

/// group 
func groupAnagrams(_ strs: [String]) -> [[String]] {
    
    var mapAngramDic : [String:[String]] = [:]
        //        var resultArray:[[String]] = []
    for value in strs {
        let ValueSort = String(value.sorted())
        
        var arrayString = mapAngramDic[ValueSort] ?? []
        arrayString.append(value)
        mapAngramDic[ValueSort] = arrayString
        
    }
        print(mapAngramDic.keys)
    return Array(mapAngramDic.values)
    
    }


func groupAnagramsWithFreq(_ strs: [String]) -> [[String]] {
    var mapAngramDic : [String:[String]] = [:]
        //        var resultArray:[[String]] = []
    for value in strs {
        var  arryAssici = Array(repeating: 0, count: 26)
        for char in value {
            var ref:Character = "a"
            let refer =  Int(char.asciiValue ?? 0) - Int(ref.asciiValue ?? 0)
            print(refer)
            arryAssici[refer] += 1
        }
        let ValueSort = arryAssici.map{String($0)}.joined()
        
        var arrayString = mapAngramDic[ValueSort] ?? []
        arrayString.append(value)
        mapAngramDic[ValueSort] = arrayString
        
    }
    print(mapAngramDic.keys)
    return Array(mapAngramDic.values)
    
    }
