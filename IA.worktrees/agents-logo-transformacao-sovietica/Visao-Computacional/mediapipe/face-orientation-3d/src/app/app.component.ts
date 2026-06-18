import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { FaceDetectionComponent } from './face-detection/face-detection.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [FaceDetectionComponent],
  template: '<app-face-detection></app-face-detection>',  // Template embutido
  styleUrls: ['./app.component.scss']  // Corrigido para o plural
})
export class AppComponent {
  title = 'face-appp';
}
