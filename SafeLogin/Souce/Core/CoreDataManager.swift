//
//  CoreDataManager.swift
//  SafeLogin
//
//  Created by 서문가은 on 4/19/25.
//

import CoreData
import UIKit

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() {}
    
    private var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    // User 생성
    func createUser(id: String, password: String, nickname: String) {
        let newUser = UserEntity(context: context)
        newUser.id = id
        newUser.password = password
        newUser.nickname = nickname
        
        do {
            try context.save()
            print("User 생성")
        } catch {
            print("User 생성 에러 \(error)")
        }
    }
    
    // 전체 User 조회
    func fetchAllUsers() -> [UserEntity] {
        let fetchRequest = UserEntity.fetchRequest()
        
        do {
            let users = try context.fetch(fetchRequest)
            print("User 조회: \(users)")
            return users
        } catch {
            print("User 조회 에러 \(error)")
            return []
        }
    }
    
    // User 조회
    func fetchUser(_ id: String) -> UserEntity? {
        let fetchRequest = UserEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        do {
            let users = try context.fetch(fetchRequest)
            return users.first
        } catch {
            print("\(id) User 조회 실패 \(error)")
            return nil
        }
    }
    
    // User 삭제
    func deleteUser(_ id: String) {
        guard let user = fetchUser(id) else {
            print("User: \(id) 찾기 실패")
            return
        }
        
        do {
            context.delete(user)
            try context.save()
            print("User 삭제")
        } catch {
            print("User 삭제 에러 \(error)")
        }
    }
    
}
