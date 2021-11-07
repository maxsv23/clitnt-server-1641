
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

class JsonDecodingToRealmDB {
	
	class func fetch<T:Object>(moduleDecod: T.Type, url: URL){
		print(url)
		
		let task = URLSession.shared.dataTask(with: url){ (data, response , error) in
			if let error = error {
				print(error)
				return
			}
	
			do {
				let response = try JSONDecoder().decode(FriendsRealmSwiftModel.self, from: data!)
				let verRealm = Realm.Configuration(schemaVersion:25)
				let realm = try Realm(configuration: verRealm)
				realm.beginWrite()
				let result = response.response!.items as List<FriendsItem>
				realm.add(result, update: .all)
				try realm.commitWrite()
				print(realm.configuration.fileURL ?? "")
								
				
			
				
			}catch {
				print("JSONDEC error")
			}

		}
		task.resume()
		
	}
}
