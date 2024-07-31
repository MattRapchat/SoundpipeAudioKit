// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/
// This file was auto-autogenerated by scripts and templates at http://github.com/AudioKit/AudioKitDevTools/

import AudioKit
import AudioKitEX
import AVFoundation
import CAudioKitEX

/// Faust-based pitch shfiter
public class PitchShifter: Node {
    let input: Node

    /// Connected nodes
    public var connections: [Node] { [input] }

    /// Underlying AVAudioNode
    public var avAudioNode = instantiate(effect: "pshf")

    // MARK: - Parameters

    /// Specification details for shift
    public static let shiftDef = NodeParameterDef(
        identifier: "shift",
        name: "Shift",
        address: akGetParameterAddress("PitchShifterParameterShift"),
        defaultValue: 0,
        range: -24.0 ... 24.0,
        unit: .relativeSemiTones
    )

    /// Pitch shift (in semitones)
    @Parameter(shiftDef) public var shift: AUValue

    /// Specification details for windowSize
    public static let windowSizeDef = NodeParameterDef(
        identifier: "windowSize",
        name: "Window size",
        address: akGetParameterAddress("PitchShifterParameterWindowSize"),
        defaultValue: 1024,
        range: 0.0 ... 10000.0,
        unit: .sampleFrames
    )

    /// Window size (in samples)
    @Parameter(windowSizeDef) public var windowSize: AUValue

    /// Specification details for crossfade
    public static let crossfadeDef = NodeParameterDef(
        identifier: "crossfade",
        name: "Crossfade",
        address: akGetParameterAddress("PitchShifterParameterCrossfade"),
        defaultValue: 512,
        range: 0.0 ... 10000.0,
        unit: .sampleFrames
    )

    /// Crossfade (in samples)
    @Parameter(crossfadeDef) public var crossfade: AUValue

    /// Specification details for dryWetMix
    public static let dryWetMixDef = NodeParameterDef(
        identifier: "dryWetMix",
        name: "Dry/Wet Mix",
        address: akGetParameterAddress("PitchShifterParameterDryWetMix"),
        defaultValue: 1.0,
        range: 0.0 ... 1.0,
        unit: .percent
    )

    /// Dry/Wet Mix
    @Parameter(dryWetMixDef) public var dryWetMix: AUValue

    // MARK: - Initialization

    /// Initialize this pitchshifter node
    ///
    /// - Parameters:
    ///   - input: Input node to process
    ///   - shift: Pitch shift (in semitones)
    ///   - windowSize: Window size (in samples)
    ///   - crossfade: Crossfade (in samples)
    ///   - dryWetMix: Dry/Wet Mix
    ///
    public init(
        _ input: Node,
        shift: AUValue = shiftDef.defaultValue,
        windowSize: AUValue = windowSizeDef.defaultValue,
        crossfade: AUValue = crossfadeDef.defaultValue,
        dryWetMix: AUValue = dryWetMixDef.defaultValue
    ) {
        self.input = input

        setupParameters()

        self.shift = shift
        self.windowSize = windowSize
        self.crossfade = crossfade
        self.dryWetMix = dryWetMix
    }
}
