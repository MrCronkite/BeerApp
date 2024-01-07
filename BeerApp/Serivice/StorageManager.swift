

import UIKit

// MARK: - CRUD
protocol StorageManagerProtocol {
    func set(_ object: Any?, forKey key: StorageManager.Keys)
    func setImages(_ object: [UIImage], forKey key: StorageManager.Keys)
    
    func dict(forKey key: StorageManager.Keys) -> [BeerElement]?
    func images(forKey key: StorageManager.Keys) -> [UIImage]?
    func int(forKey key: StorageManager.Keys) -> [Int]?
}

final class StorageManager {
    
    enum Keys: String {
        case keysBeer
    }
    
    private let userDefaults = UserDefaults.standard
    
    private func store(_ object: Any?, key: String) {
        userDefaults.set(object, forKey: key)
    }
    
    private func restore(forKey key: String) -> Any? {
        userDefaults.object(forKey: key)
    }
}

extension StorageManager: StorageManagerProtocol {
    func set(_ object: Any?, forKey key: Keys) {
        store(object, key: key.rawValue)
    }
    
    func setImages(_ object: [UIImage], forKey key: Keys) {
        var images: [Data] = []
        for i in 0..<object.count {
            let img = object[i].jpegData(compressionQuality: 0.5)
            let encode = try! PropertyListEncoder().encode(img)
            images.append(encode)
        }
        store(images, key: key.rawValue)
    }
    
    func dict(forKey key: Keys) -> [BeerElement]? {
        restore(forKey: key.rawValue) as? [BeerElement]
    }
    
    func images(forKey key: Keys) -> [UIImage]? {
        var arreyImages: [UIImage] = []
        guard let data = restore(forKey: key.rawValue) as? [Data] else { return nil }
        for i in 0..<data.count {
            let decoded = try! PropertyListDecoder().decode(Data.self, from: data[i])
            let image = UIImage(data: decoded)
            arreyImages.append(image!)
        }
        return arreyImages
    }
    
    func int(forKey key: Keys) -> [Int]? {
        restore(forKey: key.rawValue) as? [Int]
    }
    
    func remove(forKey key: Keys) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
}
