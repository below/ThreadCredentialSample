//
//  ContentView.swift
//  ThreadCredentialSample
//
//  Created by Alexander von Below on 27.01.23.
//

import SwiftUI
#if canImport(ThreadNetwork)
import ThreadNetwork
#endif

func convertHexToBytes(_ str: String) -> Data? {
    let values = str.compactMap { $0.hexDigitValue } // map char to value of 0-15 or nil
    if values.count == str.count && values.count % 2 == 0 {
        var data = Data()
        for x in stride(from: 0, to: values.count, by: 2) {
          let byte = (values[x] << 4) + values[x+1] // concat high and low bits
          data.append(UInt8(byte))
        }
        return data
    }
    return nil
}

struct ContentView: View {
    var body: some View {
        Button("THClient", action: {
#if canImport(ThreadNetwork)
            let threadClient = THClient()
            guard let borderAgent = "OpenThread BorderRouter #14BF".data(
                using: .utf8) else {
                debugPrint("Unable to convert to UTF")
                return
            }
            guard let activeOperationalDataSet = convertHexToBytes("0e080000000000010000000300000e35060004001fffe00208352b7e33239e648d0708fd401a3474a849310510e2676d300d20dfd0f18c487b48c3c323030f4f70656e5468726561642d646439380102dd980410ac8503b16eb1b550c09c4698f6c8a4f10c0402a0f7f8") else {
                debugPrint("Unable to convert hex string")
                return
            }

            threadClient.storeCredentials(
                forBorderAgent: borderAgent,
                activeOperationalDataSet: activeOperationalDataSet) { error in
                    if let error = error {
                        debugPrint("\(error.localizedDescription)")
                    } else {
                        debugPrint("Storing Credentials successful")
                    }

                }
//            threadClient.retrievePreferredCredentials { credentials, error in
//                if let error = error {
//                    debugPrint("ERROR: \(error.localizedDescription)")
//                }
//                if let credentials = credentials {
//                    debugPrint("SUCCESS: \(credentials.debugDescription)")
//                }
//            }
#endif
        })
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
