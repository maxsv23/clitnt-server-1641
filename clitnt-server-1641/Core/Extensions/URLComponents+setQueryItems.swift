//
//  URLComponents+setQueryItems.swift
//  clitnt-server-1641
//
//  Created by maxim on 27.10.2021.
//

import Foundation


/// расширим URLComponents для добовления параметров из Array

extension URLComponents {
    
    //создадим функцию которой расширим URLComponents
    
    /// <#Description#> 
    /// - Parameter parameters: тут методы дескрипшина теперь жми оптион + левая кл мыши
    /// мы меняем внутриннюю структуру URLComponents по этому надо ставить МУТАЦИЮ
    mutating func setQueryItems(with parameters: [String: String]) {
        
        //мапим каждый элемент в массиве КЛЮЧ $0-первый элемент и Значение $1-Второй элемент
        // далее нам надо обработать исключение для знака "+" пробелов и тд
        //$1.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!)
        // но это приводит к глюкам по этому убранно
        
        self.queryItems = parameters.map { URLQueryItem(name: $0, value: $1) }
    }
}
