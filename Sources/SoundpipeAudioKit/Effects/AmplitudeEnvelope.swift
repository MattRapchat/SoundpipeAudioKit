// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/
// This file was auto-autogenerated by scripts and templates at http://github.com/AudioKit/AudioKitDevTools/

import AVFoundation
import AudioKit
import AudioKitEX
import CAudioKitEX

/// Triggerable classic ADSR envelope
public class AmplitudeEnvelope: Node, Gated {

    let input: Node

    /// Connected nodes
    public var connections: [Node] { [input] }

    /// Underlying AVAudioNode
    public var avAudioNode = instantiate(effect: "adsr")

    // MARK: - Parameters

    /// Specification details for attackDuration
    public static let attackDurationDef = NodeParameterDef(
        identifier: "attackDuration",
        name: "Attack time",
        address: akGetParameterAddress("AmplitudeEnvelopeParameterAttackDuration"),
        defaultValue: 0.1,
        range: 0 ... 99,
        unit: .seconds)

    /// Attack time
    @Parameter(attackDurationDef) public var attackDuration: AUValue

    /// Specification details for decayDuration
    public static let decayDurationDef = NodeParameterDef(
        identifier: "decayDuration",
        name: "Decay time",
        address: akGetParameterAddress("AmplitudeEnvelopeParameterDecayDuration"),
        defaultValue: 0.1,
        range: 0 ... 99,
        unit: .seconds)

    /// Decay time
    @Parameter(decayDurationDef) public var decayDuration: AUValue

    /// Specification details for sustainLevel
    public static let sustainLevelDef = NodeParameterDef(
        identifier: "sustainLevel",
        name: "Sustain Level",
        address: akGetParameterAddress("AmplitudeEnvelopeParameterSustainLevel"),
        defaultValue: 1.0,
        range: 0 ... 99,
        unit: .generic)

    /// Sustain Level
    @Parameter(sustainLevelDef) public var sustainLevel: AUValue

    /// Specification details for releaseDuration
    public static let releaseDurationDef = NodeParameterDef(
        identifier: "releaseDuration",
        name: "Release time",
        address: akGetParameterAddress("AmplitudeEnvelopeParameterReleaseDuration"),
        defaultValue: 0.1,
        range: 0 ... 99,
        unit: .seconds)

    /// Release time
    @Parameter(releaseDurationDef) public var releaseDuration: AUValue

    // MARK: - Initialization

    /// Initialize this envelope node
    ///
    /// - Parameters:
    ///   - input: Input node to process
    ///   - attackDuration: Attack time
    ///   - decayDuration: Decay time
    ///   - sustainLevel: Sustain Level
    ///   - releaseDuration: Release time
    ///
    public init(
        _ input: Node,
        attackDuration: AUValue = attackDurationDef.defaultValue,
        decayDuration: AUValue = decayDurationDef.defaultValue,
        sustainLevel: AUValue = sustainLevelDef.defaultValue,
        releaseDuration: AUValue = releaseDurationDef.defaultValue
        ) {
        self.input = input

        setupParameters()

        self.attackDuration = attackDuration
        self.decayDuration = decayDuration
        self.sustainLevel = sustainLevel
        self.releaseDuration = releaseDuration
   }
}
