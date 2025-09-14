import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { ModelViewerComponent } from './model-viewer/model-viewer.component';

@Component({
  selector: 'app-root',
  imports: [ModelViewerComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent {
  title = 'face3d';
}
