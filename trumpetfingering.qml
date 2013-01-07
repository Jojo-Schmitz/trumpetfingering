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

import QtQuick 1.0
import MuseScore 1.0

MuseScore {
   version: "1.0"
   description: "This plugin names notes and adds trumpet fingering"
   menuPath: 'Plugins.Trumpet Fingering'
   onRun: {
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

      if (typeof curScore === 'undefined')
         qt.Quit();
	      
      var names = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"];
      // comment this block for american note names
      //var names = ["po","po#","re","re#","mi","fa","fa#","sol","sol#","la","la#","si"];
      // comment the above block for american note names
      var cursor   = curScore.newCursor();
      cursor.staffIdx = 0;
      cursor.voice = 0;
      cursor.rewind(0);  // set cursor to first chord/rest
      var CrLf = '\n';
      var textold = "xxx";
      while (cursor.segment) {
         if (cursor.element && cursor.element.type == Element.CHORD) {
            var text  = newElement(Element.STAFF_TEXT)
            text.text = griff(cursor.element.notes[0].pitch) + CrLf
                      + names[cursor.element.notes[0].pitch % 12];
            text.pos.y = 9;
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
