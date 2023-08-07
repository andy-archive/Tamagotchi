//
//  SettingInfo.swift
//  Tamagotchi
//
//  Created by Taekwon Lee on 2023/08/07.
//

import Foundation

struct SettingInfo {
    var list: [Setting] = [
        Setting(image: "pencil", title: "내 이름 설정하기"),
        Setting(image: "moon.fill", title: "다마고치 변경하기"),
        Setting(image: "arrow.clockwise", title: "데이터 초기화"),
    ]
}
