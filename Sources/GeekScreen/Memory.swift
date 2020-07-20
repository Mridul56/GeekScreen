//
//  File.swift
//  
//
//  Created by Mridul Gupta on 20/07/20.
//

import Foundation
 
public typealias MemoryUsage = (used: UInt64, total: UInt64)

public class Memory {
    public func currentMemoryOfApp() -> Double {
        let TASK_VM_INFO_COUNT = MemoryLayout<task_vm_info_data_t>.size / MemoryLayout<natural_t>.size
        
        var memoryInfo = task_vm_info_data_t()
        var vmInfoSize = mach_msg_type_number_t(TASK_VM_INFO_COUNT)
        
        let kern: kern_return_t = withUnsafeMutablePointer(to: &memoryInfo) {
            $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
                task_info(mach_task_self_,
                          task_flavor_t(TASK_VM_INFO),
                          $0,
                          &vmInfoSize)
            }
        }
        
        if kern == KERN_SUCCESS {
            let totalSize: mach_vm_size_t = memoryInfo.internal + memoryInfo.compressed
            return Double(totalSize)
        } else {
            return 0
        }
    }
    
    public func memoryUsage() -> MemoryUsage {
        var taskInfo = task_vm_info_data_t()
        var count = mach_msg_type_number_t(MemoryLayout<task_vm_info>.size) / 4
        let result: kern_return_t = withUnsafeMutablePointer(to: &taskInfo) {
            $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
                task_info(mach_task_self_, task_flavor_t(TASK_VM_INFO), $0, &count)
            }
        }
        
        var used: UInt64 = 0
        if result == KERN_SUCCESS {
            used = UInt64(taskInfo.phys_footprint)
        }
        
        let total = ProcessInfo.processInfo.physicalMemory
        return (used, total)
    }
}
