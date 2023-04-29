//
//  ModelPersistance.swift
//  BigBangFinalApp
//
//  Created by Jose Portilla Portilla on 7/4/23.
//

import Foundation

final class ModelPersistance {
    static let shared = ModelPersistance()
    
    private let episodesURL = Bundle.main.url(forResource: "BigBang", withExtension: "json")
    
    private init() {}
    
    func getEpisodes() throws -> [EpisodesModel] {
        guard let episodesURL = episodesURL else {return [] }
        
        if let data = try? Data(contentsOf: episodesURL) {
            return try JSONDecoder().decode([EpisodesModel].self, from: data)
        }
        return []
    }
}


/*
 final class ModelPersistance {
 
 Se define una clase llamada "ModelPersistance" y se utiliza el modificador "final" para indicar que no puede ser heredada por otra clase.

static let shared = ModelPersistance()
 
Se define una propiedad estática llamada "shared" que se inicializa con una instancia de la clase "ModelPersistance". Esto se utiliza para tener una única instancia de la clase en toda la aplicación.

private let episodesURL = Bundle.main.url(forResource: "BigBang", withExtension: "json")
 
Se define una propiedad privada llamada "episodesURL" que contiene la URL del archivo JSON llamado "BigBang.json" dentro del paquete principal de la aplicación.

private init() {}
 
Se define un constructor privado vacío para evitar que se cree una instancia de la clase desde fuera de la misma.

func getEpisodes() throws -> [EpisodesModel] {
 
Se define una función pública llamada "getEpisodes" que devuelve un array de objetos EpisodesModel. También se utiliza la palabra clave "throws" para indicar que la función puede arrojar una excepción.

guard let episodesURL = episodesURL else {return [] }
 
Se utiliza la declaración "guard let" para desempaquetar de manera segura la propiedad "episodesURL". Si la propiedad es nula, se devuelve un array vacío.

if let data = try? Data(contentsOf: episodesURL) {
 
Se utiliza la declaración "if let" para desempaquetar de manera segura los datos del archivo JSON a través de la URL de la propiedad "episodesURL". Si los datos se pueden desempaquetar correctamente, se ejecutará el bloque de código dentro del if.

return try JSONDecoder().decode([EpisodesModel].self, from: data)
 
Se utiliza el objeto "JSONDecoder" para decodificar los datos del archivo JSON en un array de objetos EpisodesModel. La función "decode" también puede arrojar una excepción, por lo que se utiliza la palabra clave "try".

}
return []
 
Si la función no arroja una excepción, se devuelve el array de objetos EpisodesModel. De lo contrario, se devuelve un array vacío.
*/
