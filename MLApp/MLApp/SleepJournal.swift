//
//  SleepJournal.swift
//  MLApp
//
//  Created by Alejandra Coeto on 12/02/23.
//

import Foundation
import CoreML
import NaturalLanguage

class SleepJournal: ObservableObject {
    @Published var prediction = ""
    @Published var confidence = 0.0
    
    var model = MLModel()
    var sentimentPredictor = NLModel()
    
    init(){
        do {
            let sentiment_model = try SleepyTimeSentiment1(configuration: MLModelConfiguration()).model
            self.model = sentiment_model
            
            do {
                let predictor = try NLModel(mlModel: model)
                self.sentimentPredictor = predictor
            } catch {
                print(error)
            }
            
        } catch {
            print(error)
        }
    }
        
        func predict(_ text: String) {
            self.prediction = sentimentPredictor.predictedLabel(for: text) ?? ""
            let predictionSet = sentimentPredictor.predictedLabelHypotheses(for: text, maximumCount: 1)
            self.confidence = predictionSet[prediction] ?? 0.0
            //?? means otherwise
        }
    }
    

