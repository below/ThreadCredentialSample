# ThreadCredentialSample
A sample for the ThreadClient access in iOS

The app is using the `com.apple.developer.networking.manage-thread-network-credentials` entitlements.

Tested on iOS 16.3 (20D47)

## Errors thrown

### For Store Credentials

The following error is shown in the console when calling `threadClient.storeCredentials(forBorderAgent: activeOperationalDataSet:)` : 
```
2023-01-27 12:11:47.926550+0100 ThreadCredentialSample[24248:2153332] [thclient] Client: -[THClient getConnectionEntitlementValidity]_block_invoke - Error: (null)
2023-01-27 12:11:47.930120+0100 ThreadCredentialSample[24248:2153332] [thclient] -[THClient storeCredentialsForBorderAgent:activeOperationalDataSet:completion:]_block_invoke:612: - Error: Error Domain=NSCocoaErrorDomain Code=4099 "The connection to service with pid 9836 named com.apple.ThreadNetwork.xpc was invalidated from this process." UserInfo={NSDebugDescription=The connection to service with pid 9836 named com.apple.ThreadNetwork.xpc was invalidated from this process.}
"Couldn’t communicate with a helper application."

```

### Retrieve Credentials

On calling `retrievePreferredCredentials:`, the permissions dialog is shown and the following error is shown in the console.

```
2023-01-27 12:03:11.030374+0100 ThreadCredentialSample[24200:2148566] [thclient] Client: -[THClient getConnectionEntitlementValidity]_block_invoke - Error: (null)
"<THClient: 0x281796f60>"
2023-01-27 12:03:11.031619+0100 ThreadCredentialSample[24200:2148566] [thclient] Client: -[THClient retrievePreferredCredentials:]_block_invoke - Error: Error Domain=NSCocoaErrorDomain Code=4099 "The connection to service with pid 9836 named com.apple.ThreadNetwork.xpc was invalidated from this process." UserInfo={NSDebugDescription=The connection to service with pid 9836 named com.apple.ThreadNetwork.xpc was invalidated from this process.}
"ERROR: Couldn’t communicate with a helper application."
```
