//
//  SQLiteAPI.swift
//  HRVacations
//
//  Created by Mohammad Shaker on 1/13/17.
//  Copyright © 2017 MsM. All rights reserved.
//

import UIKit
import FMDB

class SQLiteAPI: NSObject {
    
    var database = FMDatabase()
    
    
    static let sharedInstance : SQLiteAPI = {
        let instance = SQLiteAPI()
        return instance
    }()
    
    
    private func getPath(fileName: String) -> String {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent(fileName)
        
        return fileURL.path
    }
    

    private func copyDatabaseFile(fileName: NSString) {
        let dbPath: String = getPath(fileName: fileName as String)
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: dbPath) {
            
            let documentsURL = Bundle.main.resourceURL
            let fromPath = documentsURL?.appendingPathComponent(fileName as String)
            
            var error : NSError?
            do {
                try fileManager.copyItem(atPath: fromPath!.path, toPath: dbPath)
            } catch let error1 as NSError {
                error = error1
            }
            
            if (error != nil) {
                print("Error Occured: \(error?.localizedDescription)")
            } else {
                print("Your database copy successfully")
            }
        }
    }
    
    
    func prepareDatabase(databaseName: String) -> Void {
        self.copyDatabaseFile(fileName: databaseName as NSString)
        
        let fileURL = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(databaseName)
        
        guard let database = FMDatabase(path: fileURL.path) else {
            print("unable to create database")
            return
        }
        
        guard database.open() else {
            print("Unable to open database")
            return
        }
        
        print("Database connected successfully")
        self.database = database
    }
    
    
    
    func selectAll(query: String) -> FMResultSet? {
        do {
            let rs = try database.executeQuery(query, values: nil)
            return rs
        } catch let error as NSError {
            print("failed: \(error.localizedDescription)")
        }
        
        return nil
    }
    
    
    
    func executeQueryWithResult(query: String) -> Bool {
        do {
            try database.executeUpdate(query, values: nil)
            return true
        } catch let error as NSError {
            print("failed: \(error.localizedDescription)")
        }
        
        return false
    }
    
    
    
    func closeDatabase() {
        guard database.close() else {
            print("Unable to close database")
            return
        }
    }
    
}
