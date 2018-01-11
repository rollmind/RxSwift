//
//  DisposeBaseCommon.swift
//  RxSwift-iOS
//
//  Created by rollmind on 2018. 1. 11..
//  Copyright © 2018년 Krunoslav Zaher. All rights reserved.
//


/// represented protocol for common use of DisposeBase
public protocol DisposeBaseCommon {

	func input(with disposable: Disposable)

}

extension DisposeBag: DisposeBaseCommon {}
extension SingleAssignmentDisposable: DisposeBaseCommon {}
extension SerialDisposable: DisposeBaseCommon {}

extension DisposeBaseCommon where Self: DisposeBag {

	public func input(with disposable: Disposable) {

		disposable.disposed(by: self)

	}

}

extension DisposeBaseCommon where Self: SingleAssignmentDisposable {

	public func input(with disposable: Disposable) {

		self.setDisposable(disposable)

	}

}

extension DisposeBaseCommon where Self: SerialDisposable {

	public func input(with disposable: Disposable) {

		self.disposable = disposable

	}

}

extension Disposable {

	public func disposed<Base>(with disposeBase: Base) where Base: DisposeBaseCommon {

		disposeBase.input(with: self)

	}

}
