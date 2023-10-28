//
//  MountainsViewController.swift
//  ModernCollectionViews
//
//  Created by 鈴木楓香 on 2023/10/28.
//

import UIKit
import PinLayout

class MountainsViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    private let searchBar: UISearchBar = .init()
    private var dataSource: UICollectionViewDiffableDataSource<Section, MountainsController.Mountain>!
    private var collectionView: UICollectionView!
    private let mountainsController: MountainsController = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        configureHierarchy()
        configureDataSource()
        performQuery("B")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchBar.pin.left().top(view.pin.safeArea.top).right().height(50)
        collectionView.pin.below(of: searchBar).left().right().bottom().marginTop(10)
    }
}

extension MountainsViewController {
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        let gruopSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(32))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: gruopSize, repeatingSubitem: item, count: 2)
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension MountainsViewController {
    private func configureHierarchy() {
        view.addSubview(searchBar)
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
    }
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<LabelCell, MountainsController.Mountain> { cell, indexPath, itemIdentifier in
            cell.label.text = "\(itemIdentifier.name)"
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
    }
    
    private func performQuery(_ filter: String?) {
        let mountains = mountainsController.filterdMountains(with: filter).sorted { $0.name < $1.name }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, MountainsController.Mountain>()
        snapshot.appendSections([.main])
        snapshot.appendItems(mountains)
        dataSource.apply(snapshot)
    }
}

extension MountainsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        performQuery(searchText)
    }
}
