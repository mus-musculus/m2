// lib/ascii


ascii_NUL = 0    // Null
ascii_SOH = 1    // Start of heading
ascii_STX = 2    // Start of text
ascii_ETX = 3    // End of text
ascii_EOT = 4    // End of transmission
ascii_ENQ = 5    // Enquiry
ascii_ACK = 6    // Acknowledge
ascii_BEL = 7    // Bell
ascii_BS = 8     // Backspace
ascii_TAB = 9    // Horizontal tab
ascii_LF = 10    // Line feed
ascii_VT = 11    // Vertical tab
ascii_FF = 12    // Form feed
ascii_CR = 13    // Carriage return
ascii_SO = 14    // Shift out
ascii_SI = 15    // Shift in
ascii_DLE = 16   // Data link escape
ascii_DC1 = 17   // Device control 1
ascii_DC2 = 18   // Device control 2
ascii_DC3 = 19   // Device control 3
ascii_DC4 = 20   // Device control 4
ascii_NAK = 21   // Negative acknowledge
ascii_SYN = 22   // Synchronous idle
ascii_ETB = 23   // End of trans. block
ascii_CAN = 24   // Cancel
ascii_EM = 25    // End of medium
ascii_SUB = 26   // Substitute
ascii_ESC = 27   // Escape
ascii_FS = 28    // File separator
ascii_GS = 29    // Group separator
ascii_RS = 30    // Record separator
ascii_US = 31    // Unit separator
/**/
ascii_DEL = 127  // Del



isLowerCase = (c : Nat8) -> Bool {return (c >= "a"[0]) and (c <= "z"[0])}
isUpperCase = (c : Nat8) -> Bool {return (c >= "A"[0]) and (c <= "Z"[0])}
isDigit = (c : Nat8) -> Bool {return (c >= "0"[0]) and (c <= "9"[0])}
isAlpha = (c : Nat8) -> Bool {return isLowerCase(c) or isUpperCase(c)}
isAlNum = (c : Nat8) -> Bool {return isAlpha(c) or isDigit(c)}


