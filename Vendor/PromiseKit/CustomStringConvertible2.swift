//
//  CustomStringConvertible2.swift
//  PromiseKit
//
//  Created by Heiko Pälike on 21/03/2019.
//

#if !SWIFT_PACKAGE
extension AnyPromise {
	/// - Returns: A description of the state of this promise.
	override open var description: String {
		switch box.inspect() {
		case .pending:
			return "AnyPromise(…)"
		case .resolved(let obj?):
			return "AnyPromise(\(obj))"
		case .resolved(nil):
			return "AnyPromise(nil)"
		}
	}
}
#endif
