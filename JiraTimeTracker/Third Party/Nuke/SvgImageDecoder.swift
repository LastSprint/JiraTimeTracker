//
//  SvgImageDecoder.swift
//  JiraTimeTrackerDebug
//
//  Created by Александр Кравченков on 02.05.2020.
//

import Foundation
import Nuke
import PocketSVG

struct SVGIMageDecoder: ImageDecoding {
    func decode(data: Data, isFinal: Bool) -> PlatformImage? {
        guard
            isFinal,
            let svgString = String(data: data, encoding: .utf8)
        else {
            return nil
        }

        let paths = SVGBezierPath.paths(fromSVGString: svgString)

        let rect = SVGBoundingRectForPaths(paths)

        UIGraphicsBeginImageContextWithOptions(.init(width: rect.maxX, height: rect.maxY), false, 0)

        defer {
            UIGraphicsEndImageContext()
        }

        guard let content = UIGraphicsGetCurrentContext() else {
            return nil
        }

        SVGDrawPaths(paths, content, rect, nil, nil)

        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
