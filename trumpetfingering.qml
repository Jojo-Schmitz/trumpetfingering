//=============================================================================
//  MuseScore
//
// Note names and fingerings for Trumpet Bb
// changable for other Brass
//
//  Contribution Artur Vilá Canal, Joachim Schmitz
//  Copyright (c) 2011 Karl Gerhards, (C)2008 Werner Schweer and others
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License version 2.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
//=============================================================================

//
// This is ECMAScript code (ECMA-262 aka "Java Script")
//

// gibt den Griff zur midi-Nummer
function griff(midi) { 
   // change for other Brass
   midi = midi-20;
   // edit and uncomment for other Brass
   //midi = midi-20;
   // for 4 valves, usually 1+3 = 4
   switch (midi){
      case 34: return "123"; break;
      case 35: return "13"; break;
      case 36: return "23"; break;
      case 37: return "12"; break;
      case 38: return "1"; break;
      case 39: return "2"; break;
      case 40: return "0"; break;
      case 41: return "123"; break;
      case 42: return "13"; break;
      case 43: return "23"; break;
      case 44: return "12"; break;
      case 45: return "1"; break;
      case 46: return "2"; break;
      case 47: return "0"; break;
      case 48: return "23"; break;
      case 49: return "12"; break;
      case 50: return "1"; break;
      case 51: return "2"; break;
      case 52: return "0"; break;
      case 53: return "12"; break;
      case 54: return "1"; break;
      case 55: return "2"; break;
      case 56: return "0"; break;
      case 57: return "1"; break;
      case 58: return "2"; break;
      case 59: return "0"; break;
      case 60: return "23"; break;
      case 61: return "12"; break;
      case 62: return "1"; break;
      case 63: return "2"; break;
      case 64: return "0"; break;
      case 65: return "#2 or b12"; break;
      case 66: return "1"; break;
      default: return "";		
   }
}

MuseScore {
   menuPath: 'Plugins.Trumpet Fingering'
   onRrun: {
      if (typeof curScore === 'undefined')
         qt.Quit();
	      
      var cursor   = curScore.newCursor();
      cursor.staffIdx = 0;
      cursor.voice = 0;
      cursor.rewind(0);  // set cursor to first chord/rest
      var CrLf = '\r\n';
      var textold = "xxx";
      while (corsor.segment) {
         if (cursor.element && cursor.element.type == MScore.CHORD) {
            var text  = newElement(MScore.STAFF_TEXT)
            text.text = griff(cursor.element.notes[0].pitch) + CrLf
                      + cursor.element.notes[0].name;
	               
            // comment this block for american note names
            // text.text = text.text.replace("A","la");
            // text.text = text.text.replace("B","si");
            // text.text = text.text.replace("C","po");
            // text.text = text.text.replace("D","re");
            // text.text = text.text.replace("E","mi");
            // text.text = text.text.replace("F","fa");
            // text.text = text.text.replace("G","sol");
            // comment the above block for american note names

            //text.yOffset = 7;
            if (text.text != textold) cursor.add(text);
            textold = text.text;
            if (text.text = textold) cursor.add(text);
            textold = text.text;
         }
         cursor.next();
      }
      Qt.quit();
   }
}
