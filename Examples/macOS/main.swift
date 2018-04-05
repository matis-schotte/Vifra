//
//  main.swift
//  VifraExample
//
//  Created by Matis Schotte on 16.03.18.
//  Copyright © 2018 ungeord.net. All rights reserved.
//

import Vifra

print("Hello, Vifra!")
Vifra.feedback([.strong, .weak, .delay(usec: 500_000), .strong])
