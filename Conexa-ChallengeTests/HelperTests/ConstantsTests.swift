//
//  ConstantsTests.swift
//  Conexa-ChallengeTests
//
//  Created by Oscar A. Rafael Cabanillas on 12/07/2024.
//

import XCTest
@testable import Conexa_Challenge
final class ConstantsTests: XCTestCase {
    
    func test_HomeConstants() {
        // Given or Arrange
        let expectedTitle = "Conexa"
        let expectedSubtitle = "Challenge"
        let expectedContentText = """
                        La aplicación debe constar de 4 pantallas:
                        
                        - Lista y buscador de noticias por título o contenido (Pantalla de Inicio)
                        - Detalles de la noticia seleccionada (Pantalla de Detalle)
                        - Lista de usuarios (Pantalla de Usuarios)
                        - Ubicación en el mapa del usuario (Pantalla de Mapa)
                        
                        La app deberá ser una lista de noticias y una lista de usuarios. En la lista de usuarios debe mostrarse un botón que abra la pantalla de mapa, en donde con Google Maps debe mostrar la ubicación del usuario seleccionado. No hay restricciones en cuanto a los datos que se muestran tanto de las noticias como de los usuarios.
                        """
        // When or Act
        
        // Then or Assert
        XCTAssertEqual(Constants.Home.title, expectedTitle, "El título de Home debe ser 'Conexa'")
        XCTAssertEqual(Constants.Home.subTitle, expectedSubtitle, "El subtítulo de Home debe ser 'Challenge'")
        XCTAssertEqual(Constants.Home.contentText, expectedContentText, "El contenido de texto de Home debe coincidir con el esperado")
    }
    
}
