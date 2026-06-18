import { AfterViewInit, Component, ElementRef, HostListener, OnInit, ViewChild } from '@angular/core';
import * as THREE from '../../../node_modules/@types/three';
import { OrbitControls } from 'three/addons/controls/OrbitControls.js';
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader.js';
import WebGL from 'three/addons/capabilities/WebGL.js';

@Component({
  selector: 'app-model-viewer',
  templateUrl: './model-viewer.component.html',
  styleUrls: ['./model-viewer.component.scss']
})
export class ModelViewerComponent implements OnInit, AfterViewInit {
  @ViewChild('canvas', { static: false }) canvas!: ElementRef<HTMLCanvasElement>;

  private scene1!: THREE.Scene;
  private scene2!: THREE.Scene;
  private camera1!: THREE.PerspectiveCamera;
  private camera2!: THREE.PerspectiveCamera;
  private renderer!: THREE.WebGLRenderer;
  private gltfLoader!: GLTFLoader;
  private modelOrigin!: THREE.Object3D;
  private modelModified!: THREE.Object3D;

  private isRotating: boolean = true;
  private rotationDirection: number = 1;
  private moveSpeed: number = 0.1;

 
  private isBody: boolean = false;


  ngOnInit(): void {
    if (!this.isWebGL2Available()) {
      return;
    }
    this.init3D();
  }

  ngAfterViewInit(): void {
    this.initRenderer();
    this.loadGLBModels();
    this.animate();
  }

  private isWebGL2Available(): boolean {
    if (!WebGL.isWebGL2Available()) {
      alert('Este dispositivo não suporta WebGL2');
      const warning = WebGL.getWebGL2ErrorMessage();
      document.getElementById('container')?.appendChild(warning);
      return false;
    }
    return true;
  }

  private init3D(): void {
    this.scene1 = new THREE.Scene();
    this.scene2 = new THREE.Scene();

    this.scene1.background = new THREE.Color(0xe0e0e0);
    this.scene2.background = new THREE.Color(0xe0e0e0);

    this.camera1 = new THREE.PerspectiveCamera(60, window.innerWidth / (2 * window.innerHeight), 0.1, 100);
    this.camera1.position.set(0, 0, 2);

    this.camera2 = new THREE.PerspectiveCamera(60, window.innerWidth / (2 * window.innerHeight), 0.1, 100);
    this.camera2.position.set(0, 0, 2);

    this.renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true, logarithmicDepthBuffer: true });
    this.renderer.setSize(window.innerWidth, window.innerHeight);
    this.renderer.setPixelRatio(window.devicePixelRatio);
    document.body.appendChild(this.renderer.domElement); 

    const ambientLight = new THREE.AmbientLight(0xffffff, 0.8);
    this.scene1.add(ambientLight);
    this.scene2.add(ambientLight);

    const directionalLight = new THREE.DirectionalLight(0xffffff, 1);
    directionalLight.position.set(5, 5, 5);
    this.scene1.add(directionalLight);
    this.scene2.add(directionalLight);

    this.gltfLoader = new GLTFLoader();
  }

  private initRenderer(): void {
    this.renderer = new THREE.WebGLRenderer({ canvas: this.canvas.nativeElement, antialias: true });
    this.resizeRenderer();
  }

  private loadGLBModels(): void {
    this.gltfLoader.load('./assets/models/Werewolf_Warrior.glb', (gltf) => {
      this.modelOrigin = gltf.scene;
      this.modelOrigin.scale.set(2, 2, 2);
      this.modelOrigin.rotation.set(0, 0, 0);
      this.scene1.add(this.modelOrigin);
    });

    this.gltfLoader.load('./assets/models/Werewolf_Warrior.glb', (gltf) => {
      this.modelModified = gltf.scene;
      this.modelModified.scale.set(2, 2, 2);
      this.modelModified.rotation.set(0, 0, 0);
      this.scene2.add(this.modelModified);
    });
  }

  private animate(): void {
    requestAnimationFrame(() => this.animate());

    this.rotationAnimate();

    const width = window.innerWidth;
    const height = window.innerHeight;

    this.renderer.setScissorTest(true);

    this.renderer.setViewport(0, 0, width / 2, height);
    this.renderer.setScissor(0, 0, width / 2, height);
    this.renderer.render(this.scene1, this.camera1);

    this.renderer.setViewport(width / 2, 0, width / 2, height);
    this.renderer.setScissor(width / 2, 0, width / 2, height);
    this.renderer.render(this.scene2, this.camera2);

    this.renderer.setScissorTest(false);
  }

  @HostListener('window:keydown', ['$event'])
  private onKeyDown(event: KeyboardEvent): void {
    if (!this.modelOrigin || !this.modelModified) return;

    this.isRotating = false;

    switch (event.key) {
      case 'ArrowUp': // Rotaciona para cima
        this.rotationAxiY(-1);
        break;
      case 'ArrowDown': // Rotaciona para baixo
        this.rotationAxiY(1)
        break;
      case 'ArrowLeft': // Rotaciona para a esquerda
        this.rotationAxiX(-1)
        break;
      case 'ArrowRight': // Rotaciona para a direita
        this.rotationAxiX(1);
        break;
      case 'w': // Aproxima ambas as câmeras
        this.moveAxiZ(1);
        break;
      case 's': // Afasta ambas as câmeras
        this.moveAxiZ(-1);
        break;
      case 'a': // Move câmeras para a esquerda
        this.moveAxiX(-1);
        break;
      case 'd': // Move câmeras para a direita
        this.moveAxiX(1);
        break;
      case 'r': // Move para cima
        this.moveAxiY(1);
        break;
      case 'f': // Move para baixo
      this.moveAxiY(-1);
        break;
    }
  }

  @HostListener('window:resize')
  private resizeRenderer(): void {
    const width = window.innerWidth;
    const height = window.innerHeight;

    this.renderer.setSize(width, height);
    
    const aspect = (width / 2) / height;
    this.camera1.aspect = aspect;
    this.camera2.aspect = aspect;
    this.camera1.updateProjectionMatrix();
    this.camera2.updateProjectionMatrix();
  }

  private rotationAnimate() {
    if (this.modelOrigin && this.modelModified) {
      if (this.isRotating) {
        if (this.modelOrigin.rotation.y > 1.4 || this.modelOrigin.rotation.y < -1.4) {
          this.rotationDirection *= -1;
        }
        if (this.modelOrigin.rotation.y <= 0) {
          this.rotationAxiX(this.rotationDirection * 0.1);
        }
        if (this.modelOrigin.rotation.y > 0) {
          this.rotationAxiX(this.rotationDirection * 0.1);
        }        
      } else if (this.rotationDirection !== 0) {
        this.modelOrigin.rotation.set(0,0,0);
        this.modelModified.rotation.set(0,0,0);
        this.rotationDirection = 0; 
      }
    }
  }

  private rotationAxiX(direction: number) {
    if (
      this.isBody ||
      this.modelOrigin.rotation.y > -1.5 && this.modelOrigin.rotation.y < 1.5 ||
      this.modelOrigin.rotation.y > 0 && direction === -1 ||
      this.modelOrigin.rotation.y < 0 && direction === 1
    ) {
      this.modelOrigin.rotation.y += this.moveSpeed * direction;
      this.modelModified.rotation.y += this.moveSpeed * direction;
      this.modelOrigin.rotation.y = parseFloat(this.modelOrigin.rotation.y.toFixed(2));
      this.modelModified.rotation.y = parseFloat(this.modelModified.rotation.y.toFixed(2));
    }
  }

  private rotationAxiY(direction: number) {
    if (
      this.isBody ||
      this.modelOrigin.rotation.x > -1 && this.modelOrigin.rotation.x < 0.2 ||
      this.modelOrigin.rotation.x > 0 && direction === -1 ||
      this.modelOrigin.rotation.x < 0 && direction === 1
    ) {
      this.modelOrigin.rotation.x += this.moveSpeed * direction;
      this.modelModified.rotation.x += this.moveSpeed * direction;
      this.modelOrigin.rotation.x = parseFloat(this.modelOrigin.rotation.x.toFixed(2));
      this.modelModified.rotation.x = parseFloat(this.modelModified.rotation.x.toFixed(2));
    }
  }

  private moveAxiZ(direction: number) {
    if (
      this.isBody ||
      this.camera1.position.z > 0.7 && this.camera1.position.z < 4 ||
      this.camera1.position.z >= 0.7 && direction === -1 ||
      this.camera1.position.z < 0.8 && direction === 1
    ) {
      this.camera1.position.z += this.moveSpeed * direction;
      this.camera2.position.z += this.moveSpeed * direction;
      this.camera1.position.z = parseFloat(this.camera1.position.z.toFixed(2));
      this.camera2.position.z = parseFloat(this.camera2.position.z.toFixed(2));
    }
  }

  private moveAxiX(direction: number) {
    if(
      this.isBody ||
      this.camera1.position.x > -0.6 && this.camera1.position.x < 0.6 ||
      this.camera1.position.x > 0 && direction === -1 ||
      this.camera1.position.x < 0 && direction === 1
    ) {
      this.camera1.position.x += this.moveSpeed * direction;
      this.camera2.position.x += this.moveSpeed * direction;
      this.camera1.position.x = parseFloat(this.camera1.position.x.toFixed(2));
      this.camera2.position.x = parseFloat(this.camera2.position.x.toFixed(2));
    }
  }

  private moveAxiY(direction: number) {
    if(
      this.isBody ||
      this.camera1.position.y > -0.5 && this.camera1.position.y < 0.5 ||
      this.camera1.position.y > 0 && direction === -1 ||
      this.camera1.position.y < 0 && direction === 1
    ) {
      this.camera1.position.y += this.moveSpeed * direction;
      this.camera2.position.y += this.moveSpeed * direction;
      this.camera1.position.y = parseFloat(this.camera1.position.y.toFixed(2));
      this.camera2.position.y = parseFloat(this.camera2.position.y.toFixed(2));
    }
  }

  private setAmbientForBody() {
    const modelConfig = {
        scale: 1.5,
        position: { x: 0, y: -1, z: 0 },
        rotation: { x: 0, y: 0, z: 0 },
    };

    const cameraConfig = {
        fov: 45,
        position: { x: 0, y: 1, z: 8 },
        lookAt: { x: 0, y: 0, z: 0 }
    };
  }

  private setAmbientForFace() {
    const modelConfig = {
        scale: 1.0,
        position: { x: 0, y: 0, z: 0 },
        rotation: { x: 0, y: 0, z: 0 },
    };

    const cameraConfig = {
        fov: 50,
        position: { x: 0, y: 0, z: 5 },
        lookAt: { x: 0, y: 0, z: 0 }
    };
  }
}
