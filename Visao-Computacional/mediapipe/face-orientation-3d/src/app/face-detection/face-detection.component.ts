import { Component, ElementRef, AfterViewInit, ViewChild } from '@angular/core';
import { FaceMesh, FACEMESH_TESSELATION } from '@mediapipe/face_mesh';
import { Camera } from '@mediapipe/camera_utils';
import { drawConnectors } from '@mediapipe/drawing_utils';

@Component({
  selector: 'app-face-detection',
  templateUrl: './face-detection.component.html',
  styleUrls: ['./face-detection.component.scss'],
})
export class FaceDetectionComponent implements AfterViewInit {
  @ViewChild('videoElement') video!: ElementRef<HTMLVideoElement>;
  @ViewChild('canvasElement') canvas!: ElementRef<HTMLCanvasElement>;

  private faceMesh!: FaceMesh;
  private camera!: Camera;

  ngAfterViewInit(): void {
    this.initializeFaceMesh();
  }

  private initializeFaceMesh(): void {
    this.faceMesh = new FaceMesh({
      locateFile: (file) => `https://cdn.jsdelivr.net/npm/@mediapipe/face_mesh/${file}`,
    });

    this.faceMesh.setOptions({
      maxNumFaces: 1,
      refineLandmarks: true,
      minDetectionConfidence: 0.5,
      minTrackingConfidence: 0.5,
    });

    this.faceMesh.onResults((results) => this.onResults(results));

    this.camera = new Camera(this.video.nativeElement, {
      onFrame: async () => {
        await this.faceMesh.send({ image: this.video.nativeElement });
      },
      width: 640,
      height: 480,
    });

    this.camera.start();
  }

  private onResults(results: any): void {
    const canvasElement = this.canvas.nativeElement;
    const canvasCtx = canvasElement.getContext('2d') as CanvasRenderingContext2D;

    canvasElement.width = this.video.nativeElement.videoWidth;
    canvasElement.height = this.video.nativeElement.videoHeight;

    canvasCtx.clearRect(0, 0, canvasElement.width, canvasElement.height);
    canvasCtx.drawImage(results.image, 0, 0, canvasElement.width, canvasElement.height);

    if (results.multiFaceLandmarks) {
      for (const landmarks of results.multiFaceLandmarks) {
        const side = this.detectFaceSideByNoseAngle(landmarks);
        this.drawFaceSideText(canvasCtx, side);

        const resultado = side !== 'indefinido' ? "green" : "red";

        drawConnectors(canvasCtx, landmarks, FACEMESH_TESSELATION, {
          color: resultado,
          lineWidth: 0.8,
        });
      }
    }
  }

  private detectFaceSideByNoseAngle(landmarks: any): string {
    const nose = landmarks[1];
    const leftEye = landmarks[33];
    const rightEye = landmarks[263];

    const noseTilt = nose.x - (leftEye.x + rightEye.x) / 2;
    const threshold = 0.02;
    console.log("chechando frente", Math.abs(noseTilt) <= threshold);
    
    if (noseTilt > threshold) {
      return 'direita';
    } else if (noseTilt < -threshold) {
      return 'esquerda';
    } else {
      return 'frente';
    }
    
  }

  private drawFaceSideText(canvasCtx: CanvasRenderingContext2D, side: string): void {
    canvasCtx.font = '16px Arial';
    canvasCtx.fillStyle = 'red';
    canvasCtx.fillText(`Lado da face: ${side}`, 10, 30);
  }
}
