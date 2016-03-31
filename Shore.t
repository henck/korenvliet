#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

shore: OutdoorRoom 'Lakeshore'
  "The small brook ends here and flows into a large lake. Thick bushes block passage along the shore. 
  You could follow the brook back to the west. "
  west = brook
  east = lakeEntrance
;

+ Decoration 'bush*bushes' 'bushes'
  "The undergrowth is very thick along the shore of the lake. The only way out of here is along the
  brook. "
  isPlural = true
;

+ lakeEntrance: Enterable ->lake 'large lake/water/pond/body/shore' 'lake'
  "The lake is a sizeable body of water. It flows right around Korenvliet. You can see the shore
  on the other side far away in the distance. "
  dobjFor(TravelVia) {
    check() { 
      if(!boat.isIn(me.location)) {
        failCheck('You will need a boat of some kind to venture onto the lake. ');
      }
      if(!boat.isInflated) {
        failCheck('Your rubber boat needs to be inflated first. ');
      }
    }
    action() {
      boat.moveInto(me.location);
      inherited;
    }
  }  
;

