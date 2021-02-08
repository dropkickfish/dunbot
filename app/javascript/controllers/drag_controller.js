import { Controller } from "stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
    connect(){
        this.sortable = Sortable.create(this.element, {
            onEnd: this.end.bind(this)
        })
    }

    end(event){
        console.log(event);
        let positions = document.querySelectorAll('#ballot__position');
        let i=0;
        while (positions.length>i) {
            positions[i].value = i+1;
            i++;
        }
    }
}