

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
		
	
		
		let task = URLSession.shared.dataTask(with: url){ (data, response , error) in
			if let error = error {
				print(error)
				return
			}
			
			do{
				
				let jsonSerialization = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
				
				//let asd = jsonSerialization["response"] as? [[String:AnyObject]]
				
				
				
				let jsonDecode = JSONDecoder()

				let result = try jsonDecode.decode(moduleDecod, from: data!)
				
		
				func insertOrUpdate(model: ModelFriends) {
					let realm = try! Realm()
					try! realm.write({
						let newsRealm = RealmSwiftFriends()
						newsRealm.id = 5
						newsRealm.photo50 = "fff"

						realm.add(newsRealm)
						
						})
					try! realm.commitWrite()
					print(realm.configuration.fileURL ?? "")
				}

				
				insertOrUpdate(model: result as! ModelFriends)
				
				
				
				
				
				
				
				
				completion(result as Codable)
				
			}catch{
				print("error decodeJson")
			}
			
		}
		task.resume()
		
	}
}
