//
//  NetworkError.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 10/07/2024.
//

import Foundation

// MARK: NetworkError Enum
enum NetworkError: String, Error{
    case invalidURL
    case generic
    case couldNotDecodeData
    case httpResponseError
    case statusCodeError
}

extension NetworkError : LocalizedError{
    public var errorDescription: String?{
        switch self{
        case .invalidURL:
            return NSLocalizedString("La URL es inválida", comment: "")
        case .generic:
            return NSLocalizedString("La app falló por un error desconocido, validar API-Key", comment: "")
        case .couldNotDecodeData:
            return NSLocalizedString("No se pudo hacer el decode de la data", comment: "")
        case .httpResponseError:
            return NSLocalizedString("Imposible obtener el HTTPURLResponse", comment: "")
        case .statusCodeError:
            return NSLocalizedString("Es status code es diferente a 200", comment: "")
        }
    }
}
