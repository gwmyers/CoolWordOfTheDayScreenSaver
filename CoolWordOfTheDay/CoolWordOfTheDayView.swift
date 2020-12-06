//
//  CoolWordOfTheDayView.swift
//  CoolWordOfTheDay
//
//  Created by Greg Myers on 12/6/20.
//
import AppKit
import ScreenSaver
class CoolWordOfTheDayView: ScreenSaverView
{
  // MARK: - Members
  private var displayString = "Eat prey, bruh"
  private var fontAttributes = [NSAttributedString.Key.font: NSFont(name: "Helvetica Bold", size: 48.0),
                                NSAttributedString.Key.foregroundColor: NSColor.white]
  private var displayTextRect = NSRect(x: 800, y: 700, width: 1000, height: 200)

  // MARK: - Initialization

  override init?(frame: NSRect, isPreview: Bool)
  {
    super.init(frame: frame, isPreview: isPreview)
  }

  @available(*, unavailable)
  required init?(coder decoder: NSCoder)
  {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Lifecycle

  override func draw(_ rect: NSRect)
  {
    super.draw(rect)
    drawBackground()
    drawText()
  }

  override func animateOneFrame()
  {
    super.animateOneFrame()
    
    setNeedsDisplay(bounds)
  }
  
  override func stopAnimation()
  {
    super.stopAnimation()
  }
  
  // MARK: - Private
  
  private func drawBackground()
  {
      let background = NSBezierPath(rect: bounds)
      NSColor.black.setFill()
      background.fill()
  }
  
  private func drawText()
  {
    displayString.draw(in: displayTextRect, withAttributes: fontAttributes)
  }
}
