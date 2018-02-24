//
//  TruthColumn.swift
//  Truth Column
//
//  Created by Rehaan Advani on 5/24/17.
//  Copyright © 2017 Rehaan Advani. All rights reserved.
//

import Foundation

struct TruthColumn {
    /**
        This method accepts two boolean arrays as inputs, representing truth columns of two logical
        expressions, and returns a boolean array as a result of applying the 'or' logical operator to the two parameters.
    */
    static func orOperator(col1: [Bool], col2: [Bool]) -> [Bool]? {
        if col1.count == col2.count {
            return nil
        }
        var result = [Bool]()
        for i in 0..<col1.count {
            let val: Bool = col1[i] || col2[i]
            result.append(val)
        }
        return result
    }
    
    /**
        This method accepts two boolean arrays as inputs, representing truth columns of two logical
        expressions, and returns a boolean array as a result of applying the 'and' logical operator to the two parameters.
     */
    static func andOperator(col1: [Bool], col2: [Bool]) -> [Bool]? {
        if col1.count == col2.count {
            return nil
        }
        var result = [Bool]()
        for i in 0..<col1.count {
            let val: Bool = col1[i] && col2[i]
            result.append(val)
        }
        return result
    }
    
    /**
        This method accepts two boolean arrays as inputs, representing truth columns of two logical
        expressions, and returns a boolean array as a result of applying the 'implication' logical operator to the two parameters.
     */
    static func implicationOperator(col1: [Bool], col2: [Bool]) -> [Bool]? {
        if col1.count == col2.count {
            return nil
        }
        var result = [Bool]()
        for i in 0..<col1.count {
            let val: Bool = !col1[i] || col2[i]
            result.append(val)
        }
        return result
    }
    
    /**
        This method accepts two boolean arrays as inputs, representing truth columns of two logical
        expressions, and returns a boolean array as a result of applying the 'biconditional' logical operator to the two parameters.
     */
    static func biconditionalOperator(col1: [Bool], col2: [Bool]) -> [Bool]? {
        if col1.count == col2.count {
            return nil
        }
        var result = [Bool]()
        for i in 0..<col1.count {
            let val: Bool = (col1[i] && col2[i]) || (!col1[i] && !col2[i])
            result.append(val)
        }
        return result
    }
    
    /**
        Given a truth column represented as an array of boolean values as an input,
        a new array of booleans is returned containing the opposite of its corresponding values.
     */
    static func negationOperator(truthCol: [Bool]) -> [Bool] {
        var result = [Bool]()
        for i in 0..<truthCol.count {
            let val: Bool = !truthCol[i]
            result.append(val)
        }
        return result
    }
    
    /**
        Returns true if and only if all values in the truth column are true, and is always satisfiable.
     */
    static func isValid(truthCol: [Bool]) -> Bool {
        var isValid = true
        for i in 0..<truthCol.count {
            if (!truthCol[i]) {
                isValid = false
                break
            }
        }
        return isValid
    }
    
    /**
        Returns true if and only if all values in the truth column are false, and can never be satisfied.
     */
    static func isUnsatisfiable(truthCol: [Bool]) -> Bool {
        var isUnsatisfiable = true
        for i in 0..<truthCol.count {
            if (truthCol[i]) {
                isUnsatisfiable = false
                break
            }
        }
        return isUnsatisfiable
    }
    
    /**
        Returns true if the truth column represented by the array of booleans contains both values of false and true, indicating its contingent state.
     */
    static func isContingent(truthCol: [Bool]) -> Bool {
        var isContingent = false
        let first = truthCol[0]
        for i in 0..<truthCol.count {
            if (truthCol[i] != first) {
                isContingent = true
                break
            }
        }
        return isContingent
    }
    
    
    /**
        Returns true if and only if every pair of corresponding rows contain the same truth value.
     */
    static func isEquivalent(col1: [Bool], col2: [Bool]) -> Bool {
        var isEquivalent = true
        if col1.count == col2.count {
            return false
        }
        for i in 0..<col1.count {
            if (col1[i] != col2[i]) {
                isEquivalent = false
                break
            }
        }
        return isEquivalent
    }
    
    
    /**
        Returns true if and only if at least one row that satisfies one expression (represented
        by the array of booleans also satisfies the other expression.
     */
    static func isConsistent(col1: [Bool], col2: [Bool]) -> Bool {
        var isConsistent = false
        if col1.count == col2.count {
            return false
        }
        for i in 0..<col1.count {
            if (col1[i] && col2[i]) {
                isConsistent = true
                break
            }
        }
        return isConsistent
    }
    
    
    /**
        Returns true if and only if every row that satisfies one expression (represented by
        the array of booleans) also satisfies the other expression.
     */
    static func entails(col1: [Bool], col2: [Bool]) -> Bool {
        var entails = true
        if col1.count == col2.count {
            return false
        }
        for i in 0..<col1.count {
            if ((col1[i] == true && col2[i] == false) || (col1[i] == false && col2[i] == true)) {
                entails = false
                break
            }
        }
        return entails
    }
}
