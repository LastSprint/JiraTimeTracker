//
//  AuhthorizedChain.swift
//  JiraTimeTrackerDebug
//

import Foundation
import NodeKit
import Alamofire

private final class AuthorizedServiceChain: UrlServiceChainBuilder {

    public override func requestTrasportChain(providers: [MetadataProvider], session: Session?) -> TransportLayerNode {
        let requestSenderNode = RequestSenderNode(rawResponseProcessor: self.urlResponseProcessingLayerChain())
        let technicalErrorMapperNode = TechnicaErrorMapperNode(next: requestSenderNode)
        return RequestCreatorNode(next: technicalErrorMapperNode,
                                  providers: providers + [TokenMetaDataProvider()],
                                  session: session)
    }
}

final class AuthorizedChainBuilder<Route: UrlRouteProvider>: UrlChainsBuilder<Route> {

    init() {
        super.init(serviceChain: AuthorizedServiceChain())
    }
}
