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
  private var fontAttributes = [NSAttributedString.Key.font: NSFont(name: "Helvetica Bold", size: 64.0),
                                NSAttributedString.Key.foregroundColor: NSColor.gray]
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
    
    let textRefreshCounter = Int.random(in: 1..<1000)
    if textRefreshCounter % 79 == 1
    {
      let offset = (Int.random(in: 0..<2) * (-1)) + textRefreshCounter
      
      displayTextRect = NSRect(x: 800+offset, y: 700+offset, width: 1000, height: 200)
    }
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
  
  // MARK: - PrivateMethods
  
  private func drawBackground()
  {
      let background = NSBezierPath(rect: bounds)
      NSColor.black.setFill()
      background.fill()
  }
  
  private func drawText()
  {
    displayString.draw(in: displayTextRect, withAttributes: fontAttributes as [NSAttributedString.Key : Any])
  }
}
