//
//  Constants.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 10/07/2024.
//

import Foundation

enum Constants {
    enum Home: String {
        case title = "Conexa"
        case subTitle = "Challenge"
        case contentText = """
                        La aplicación debe constar de 4 pantallas:
                        
                        - Lista y buscador de noticias por título o contenido (Pantalla de Inicio)
                        - Detalles de la noticia seleccionada (Pantalla de Detalle)
                        - Lista de usuarios (Pantalla de Usuarios)
                        - Ubicación en el mapa del usuario (Pantalla de Mapa)

                        La app deberá ser una lista de noticias y una lista de usuarios. En la lista de usuarios debe mostrarse un botón que abra la pantalla de mapa, en donde con Google Maps debe mostrar la ubicación del usuario seleccionado. No hay restricciones en cuanto a los datos que se muestran tanto de las noticias como de los usuarios.
                        """
    }
}
