//
// main.swift
//
// Created by carel
// Created on 2026-10-09
// Version 1.0
// Copyright (c) 2026 carel. All rights reserved.
//
// Reads lines of integers from an input file, calculates their sum,
// and writes the results or error messages to an output file.

import Foundation

// File paths
let inputPath = "Unit2-02-input.txt"
let outputPath = "Unit2-02-output.txt"

do {
    // Read the input file into lines
    let content = try String(contentsOfFile: inputPath, encoding: .utf8)
    let lines = content.components(separatedBy: .newlines)
    var results = [String]()

    // Process line by line
    for line in lines {
        let trimmed = line.trimmingCharacters(in: .whitespaces)

        // Handle empty line
        if trimmed.isEmpty {
            results.append("Error: No integers were found on this line.")
            continue
        }

        // Split line into words
        let tokens = trimmed.components(separatedBy: .whitespaces).filter { !$0.isEmpty }
        var sum = 0
        var isValid = true

        // Sum numbers or catch bad tokens
        for token in tokens {
            if let num = Int(token) {
                sum += num
            } else {
                results.append("Error: \(token) is not a number")
                isValid = false
                break
            }
        }

        // Save sum if no errors occurred
        if isValid {
            results.append("\(sum)")
        }
    }

    // Write all results to output file
    try results.joined(separator: "\n").write(toFile: outputPath, atomically: true, encoding: .utf8)
    print("Done! Output saved.")

} catch {
    print("Error reading or writing file: \(error)")
}