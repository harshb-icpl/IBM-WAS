AdminTask.listSSLConfigs('[-all true -displayObjectName true]')

AdminTask.modifySSLConfig('[-alias NodeDefaultSSLSettings -scopeName (cell):DESKTOP-U93A7BSNode01Cell:(node):DESKTOP-U93A7BSNode01 -keyStoreName NodeDefaultKeyStore -keyStoreScopeName (cell):DESKTOP-U93A7BSNode01Cell:(node):DESKTOP-U93A7BSNode01 -trustStoreName NodeDefaultTrustStore -trustStoreScopeName (cell):DESKTOP-U93A7BSNode01Cell:(node):DESKTOP-U93A7BSNode01 -jsseProvider IBMJSSE2 -sslProtocol SSLv3 -clientAuthentication false -clientAuthenticationSupported false -securityLevel LOW -enabledCiphers ]')

AdminConfig.save()
