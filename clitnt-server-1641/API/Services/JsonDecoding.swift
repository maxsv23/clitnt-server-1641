
//фишки xcode
//Быстрое перемещение по файлу CTRL + 6
// удаление пустых строк регулярное выражение (   ^\s+$   )
//opt+cmd+ []  движение блока вверх вниз
//cmd + -  увеличить уменьшить код
//переименование переменной класса итд во всем коде  ПР. клавиша -> Refactor -> rename
//Быстрый поиск cmd shift + o
//снипиты
// переименовать в БЛОКЕ выделить слово - cmd + ctrl + e
// коментарий для встроеной справки нажать на строку CMD + opt + /    тоже самое можно сделать
/// три слеша это дескрипшен будет  в строке ниже будет описание параметров

import Foundation
import RealmSwift

class JsonDecoding {

	class func fetch<T:Codable>(moduleDecod: T.Type, url: URL,completion: @escaping (Codable) -> ()){
		print(url)

		let task = URLSession.shared.dataTask(with: url){ (data, response , error) in
			if let error = error {
				print(error)
				return
			}
			
			
			do {
				let user = try JSONDecoder().decode(RealmSwiftFriends.self, from: data!)
				let migration = Realm.Configuration(schemaVersion: 5)
				let realm = try Realm(configuration: migration)
				realm.beginWrite()
				realm.add(user)
				print(realm.configuration.fileURL ?? "")
				try realm.commitWrite()
				
				
			}catch{
				print("Err realm")
			}
			
			

			do{

				let jsonDecode = JSONDecoder()

				let result = try jsonDecode.decode(moduleDecod, from: data!)

				completion(result as Codable)

			}catch{
				print("error decodeJson")
			}

		}
		task.resume()

	}
}
