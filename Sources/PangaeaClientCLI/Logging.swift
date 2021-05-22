//
// Logging.swift
// Copyright 2021 Heiko Pälike
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


import Foundation
import Logging

//public struct StderrOutputStream: TextOutputStream {
//    public mutating func write(_ string: String) { fputs(string, stderr) }
//}
//public var errStream = StderrOutputStream()


extension Logger.Level {
  init(verbosity: Int, defaultLevel: Self) {
    switch verbosity {
    case 0: self = defaultLevel
    case 1: self = .critical
    case 2: self = .error
    case 3: self = .warning
    case 4: self = .notice
    case 5: self = .info
    case 6: self = .debug
    case 7: self = .trace
    default: self = defaultLevel
    }
  }
}
