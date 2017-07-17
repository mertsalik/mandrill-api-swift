//
//  MandrillApiErrorMessageExtractor.swift
//  mandrill-api-swift
//
//  Created by Mert Salik on 17/07/17.
//  Copyright © 2017 Mert Salik. All rights reserved.
//

import Foundation
import Siesta
import SwiftyJSON


struct MandrillApiErrorMessageExtractor: ResponseTransformer{
    func process(_ response: Response) -> Response {
        switch response {
        case .success:
            return response
        case .failure(var error):
            guard let entity = error.entity,
                let jsonEntity = (entity.content as? JSON)  else {
                    return .failure(error)
            }
            error.entity!.content = MandrillErrorResponse(json: jsonEntity)
            return .failure(error)
        }
    }
}
