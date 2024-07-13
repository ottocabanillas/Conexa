//
//  NetworkErrorTests.swift
//  Conexa-ChallengeTests
//
//  Created by Oscar A. Rafael Cabanillas on 12/07/2024.
//

import XCTest
@testable import Conexa_Challenge

final class NetworkErrorTests: XCTestCase {

    func test_NetworkErrorDescriptions() {
            // Given
            let invalidURL = NetworkError.invalidURL
            let generic = NetworkError.generic
            let couldNotDecodeData = NetworkError.couldNotDecodeData
            let httpResponseError = NetworkError.httpResponseError
            let statusCodeError = NetworkError.statusCodeError
            
            // When
            let invalidURLDescription = invalidURL.errorDescription
            let genericDescription = generic.errorDescription
            let couldNotDecodeDataDescription = couldNotDecodeData.errorDescription
            let httpResponseErrorDescription = httpResponseError.errorDescription
            let statusCodeErrorDescription = statusCodeError.errorDescription
            
            // Then
            XCTAssertEqual(invalidURLDescription, NSLocalizedString("La URL es inválida", comment: ""))
            XCTAssertEqual(genericDescription, NSLocalizedString("La app falló por un error desconocido, validar API-Key", comment: ""))
            XCTAssertEqual(couldNotDecodeDataDescription, NSLocalizedString("No se pudo hacer el decode de la data", comment: ""))
            XCTAssertEqual(httpResponseErrorDescription, NSLocalizedString("Imposible obtener el HTTPURLResponse", comment: ""))
            XCTAssertEqual(statusCodeErrorDescription, NSLocalizedString("Es status code es diferente a 200", comment: ""))
        }

}
