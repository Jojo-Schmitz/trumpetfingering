//=============================================================================
//  MuseScore
//
// Note names and fingerings for Trumpet Bb
// changable for other Brass
//
//  Contribution Artur Vilà Canal, Joachim Schmitz, BurkardS
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

import QtQuick 2.9
import MuseScore 3.0

MuseScore {
   version: "3.0"
   description: "This plugin names notes and adds trumpet fingering"
   menuPath: 'Plugins.Trumpet Fingering'
   id: trumpetFingering
   //4.4 title: "Trumpet Fingering"
   Component.onCompleted : {
      if (mscoreMajorVersion >= 4 && mscoreMinorVersion <= 3) }
          trumpetFingering.title = "Trumpet Fingering";
      }
   }

   onRun: {
   
      curScore.startCmd()
    
      // gibt den Griff zur midi-Nummer
      function griff(midi) { 
         // change for other Brass
         midi = midi-18;
         // edit and uncomment for other Brass
         //midi = midi-20;
         // for 4 valves, usually 1+3 = 4
         switch (midi){
            case 34: return "123";
            case 35: return "13";
            case 36: return "23";
            case 37: return "12";
            case 38: return "1";
            case 39: return "2";
            case 40: return "0";
            case 41: return "123";
            case 42: return "13";
            case 43: return "23";
            case 44: return "12";
            case 45: return "1";
            case 46: return "2";
            case 47: return "0";
            case 48: return "23";
            case 49: return "12";
            case 50: return "1";
            case 51: return "2";
            case 52: return "0";
            case 53: return "12";
            case 54: return "1";
            case 55: return "2";
            case 56: return "0";
            case 57: return "1";
            case 58: return "2";
            case 59: return "0";
            case 60: return "23";
            case 61: return "12";
            case 62: return "1";
            case 63: return "2";
            case 64: return "0";
            case 65: return "#2 or b12";
            case 66: return "1";
            default: return "";		
         }
      }

      var names = ["D","D#","E","F","F#","G","G#","A","A#","B","C","C#"];
      // comment this block for american note names
      //var names = ["re","re#","mi","fa","fa#","sol","sol#","la","la#","si", "do","do#"];
      // comment the above block for american note names
      var cursor   = curScore.newCursor();
      cursor.staffIdx = 0;
      cursor.voice = 0;
      cursor.rewind(Cursor.SCORE_START);  // set cursor to first chord/rest
      var CrLf = '\n';
      var textold = "xxx";
      while (cursor.segment) {
         if (cursor.element && cursor.element.type === Element.CHORD) {
            var text  = newElement(Element.STAFF_TEXT)
            text.text = griff(cursor.element.notes[0].pitch) + CrLf
                      + names[cursor.element.notes[0].pitch % 12];
            //text.offsetY = 9;
            if (text.text !== textold) cursor.add(text);
            textold = text.text;
            if (text.text === textold) cursor.add(text);
            textold = text.text;
         }
         cursor.next();
      }
      
      curScore.endCmd()
      (typeof(quit) === 'undefined' ? Qt.quit : quit)()
   }
}
