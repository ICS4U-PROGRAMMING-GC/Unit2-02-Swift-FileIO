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

var sum = 0
var error = false
var errors = ""

do {
    // Read the input file
    let input = try String(contentsOfFile: "Unit2-02-input.txt")
    let lines = input.components(separatedBy: .newlines)

    // Read each line
    for line in lines {
        if line.isEmpty {
            continue
        }

        if let number = Int(line.trimmingCharacters(in: .whitespacesAndNewlines)) {
            sum += number
        } else {
            errors += line + " is not a valid int\n"
            error = true
        }
    }

    // Write the result
    if error {
        try errors.write(toFile: "Unit2-02-output.txt", atomically: true, encoding: .utf8)
    } else {
        try "The sum is \(sum)".write(toFile: "Unit2-02-output.txt", atomically: true, encoding: .utf8)
    }

} catch {
    print("Error with the files.")
}
