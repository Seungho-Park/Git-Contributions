//
//  Scene.swift
//  Github-Contribution
//
//  Created by 박승호 on 10/6/23.
//

import Foundation
import UIKit

protocol Scene {
    func instantiate()-> UIViewController
}
