<!DOCTYPE html>
<html lang="zh-TW">

<head>
	<title>three.js webgl car</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
	<link type="text/css" rel="stylesheet" href="./main.css">
	<style>
		body {
			color: #bbbbbb;
			background: #333333;
		}

		.colorPicker {
			display: inline-block;
			margin: 0 10px
		}

		a.rgb {
			font-size: 1rem;
			font-family: Arial, Helvetica, sans-serif;
			letter-spacing: 0.3rem;
			animation: rgb 3s linear infinite, Breat 9s linear infinite;
			padding: 6px 0 6px 6px;
			border: 1px solid white;
			text-decoration: none;
			margin: 0 1rem;
		}

		@keyframes rgb {

			0%,
			100% {
				text-shadow: 0px 0px 1rem #ff0000ff, 0px 0px 5rem #ff000099;
			}

			33% {
				text-shadow: 0px 0px 1rem #00ff00ff, 0px 0px 5rem #00ff0099;
			}

			66% {
				text-shadow: 0px 0px 1rem #0000ffff, 0px 0px 5rem #0000ff99;
			}
		}

		@keyframes Breat {

			0%,
			100% {
				box-shadow: 0px 0px 1rem #ff0000ff, 0px 0px 5rem #ff000099, inset 0px 0px 1rem #ff0000ff, inset 0px 0px 5rem #ff000099;
			}

			12.5% {
				box-shadow: 0px 0px 1rem #ffFF00ff, 0px 0px 1rem #ffFF0099, inset 0px 0px 1rem #ffFF00ff, inset 0px 0px 1rem #ffFF0099;
			}

			33% {
				box-shadow: 0px 0px 1rem #00ff00ff, 0px 0px 5rem #00ff0099, inset 0px 0px 1rem #00ff00ff, inset 0px 0px 5rem #00ff0099;
			}

			45.5% {
				box-shadow: 0px 0px 1rem #00FFFFFF, 0px 0px 1rem #00FFFF99, inset 0px 0px 1rem #00FFFFFF, inset 0px 0px 1rem #00FFFF99;
			}

			66% {
				box-shadow: 0px 0px 1rem #0000ffff, 0px 0px 5rem #0000ff99, inset 0px 0px 1rem #0000ffff, inset 0px 0px 5rem #0000ff99;
			}

			78.5% {
				box-shadow: 0px 0px 1rem #FF00FFFF, 0px 0px 1rem #FF00FF99, inset 0px 0px 1rem #FF00FFFF, inset 0px 0px 1rem #FF00FF99;
			}
		}
	</style>
</head>

<body>
	<div id="info">
		<a href="/AKCO/index.php" class="rgb">首頁</a><a href="javascript:;" class="rgb" onclick="window.history.go(-1)">回上一頁</a>
		<br><br>
		<span class="colorPicker"><input id="body-color" type="color" value="#ff0000"></input><br />Body</span>
		<span class="colorPicker"><input id="details-color" type="color" value="#ffffff"></input><br />Details</span>
		<span class="colorPicker"><input id="glass-color" type="color" value="#ffffff"></input><br />Glass</span>
	</div>

	<div id="container"></div>

	<!-- Import maps polyfill -->
	<!-- Remove this when import maps will be widely supported -->
	<script async src="https://unpkg.com/es-module-shims@1.3.6/dist/es-module-shims.js"></script>

	<script type="importmap">
		{
				"imports": {
					"three": "../build/three.module.js",
					"three/addons/": "./jsm/"
				}
			}
		</script>

	<script type="module">
		import * as THREE from 'three';

		import Stats from 'three/addons/libs/stats.module.js';

		import {
			OrbitControls
		} from 'three/addons/controls/OrbitControls.js';

		import {
			GLTFLoader
		} from 'three/addons/loaders/GLTFLoader.js';
		import {
			DRACOLoader
		} from 'three/addons/loaders/DRACOLoader.js';
		import {
			RGBELoader
		} from 'three/addons/loaders/RGBELoader.js';

		let camera, scene, renderer;
		let stats;

		let grid;
		let controls;

		const wheels = [];

		function init() {

			const container = document.getElementById('container');

			renderer = new THREE.WebGLRenderer({
				antialias: true
			});
			renderer.setPixelRatio(window.devicePixelRatio);
			renderer.setSize(window.innerWidth, window.innerHeight);
			renderer.setAnimationLoop(render);
			renderer.outputEncoding = THREE.sRGBEncoding;
			renderer.toneMapping = THREE.ACESFilmicToneMapping;
			renderer.toneMappingExposure = 0.85;
			container.appendChild(renderer.domElement);

			window.addEventListener('resize', onWindowResize);

			stats = new Stats();
			container.appendChild(stats.dom);

			//

			camera = new THREE.PerspectiveCamera(40, window.innerWidth / window.innerHeight, 0.1, 100);
			camera.position.set(4.25, 1.4, -4.5);

			controls = new OrbitControls(camera, container);
			controls.enableDamping = true;
			controls.maxDistance = 9;
			controls.target.set(0, 0.5, 0);
			controls.update();

			scene = new THREE.Scene();
			scene.background = new THREE.Color(0x333333);
			scene.environment = new RGBELoader().load('textures/equirectangular/venice_sunset_1k.hdr');
			scene.environment.mapping = THREE.EquirectangularReflectionMapping;
			scene.fog = new THREE.Fog(0x333333, 10, 15);

			grid = new THREE.GridHelper(20, 40, 0xffffff, 0xffffff);
			grid.material.opacity = 0.2;
			grid.material.depthWrite = false;
			grid.material.transparent = true;
			scene.add(grid);

			// materials

			const bodyMaterial = new THREE.MeshPhysicalMaterial({
				color: 0xff0000,
				metalness: 1.0,
				roughness: 0.5,
				clearcoat: 1.0,
				clearcoatRoughness: 0.03,
				sheen: 0.5
			});

			const detailsMaterial = new THREE.MeshStandardMaterial({
				color: 0xffffff,
				metalness: 1.0,
				roughness: 0.5
			});

			const glassMaterial = new THREE.MeshPhysicalMaterial({
				color: 0xffffff,
				metalness: 0.25,
				roughness: 0,
				transmission: 1.0
			});

			const bodyColorInput = document.getElementById('body-color');
			bodyColorInput.addEventListener('input', function() {

				bodyMaterial.color.set(this.value);

			});

			const detailsColorInput = document.getElementById('details-color');
			detailsColorInput.addEventListener('input', function() {

				detailsMaterial.color.set(this.value);

			});

			const glassColorInput = document.getElementById('glass-color');
			glassColorInput.addEventListener('input', function() {

				glassMaterial.color.set(this.value);

			});

			// Car

			const shadow = new THREE.TextureLoader().load('models/gltf/ferrari_ao.png');

			const dracoLoader = new DRACOLoader();
			dracoLoader.setDecoderPath('jsm/libs/draco/gltf/');

			const loader = new GLTFLoader();
			loader.setDRACOLoader(dracoLoader);

			loader.load('models/gltf/ferrari.glb', function(gltf) {

				const carModel = gltf.scene.children[0];

				carModel.getObjectByName('body').material = bodyMaterial;

				carModel.getObjectByName('rim_fl').material = detailsMaterial;
				carModel.getObjectByName('rim_fr').material = detailsMaterial;
				carModel.getObjectByName('rim_rr').material = detailsMaterial;
				carModel.getObjectByName('rim_rl').material = detailsMaterial;
				carModel.getObjectByName('trim').material = detailsMaterial;

				carModel.getObjectByName('glass').material = glassMaterial;

				wheels.push(
					carModel.getObjectByName('wheel_fl'),
					carModel.getObjectByName('wheel_fr'),
					carModel.getObjectByName('wheel_rl'),
					carModel.getObjectByName('wheel_rr')
				);

				// shadow
				const mesh = new THREE.Mesh(
					new THREE.PlaneGeometry(0.655 * 4, 1.3 * 4),
					new THREE.MeshBasicMaterial({
						map: shadow,
						blending: THREE.MultiplyBlending,
						toneMapped: false,
						transparent: true
					})
				);
				mesh.rotation.x = -Math.PI / 2;
				mesh.renderOrder = 2;
				carModel.add(mesh);

				scene.add(carModel);

			});

		}

		function onWindowResize() {

			camera.aspect = window.innerWidth / window.innerHeight;
			camera.updateProjectionMatrix();

			renderer.setSize(window.innerWidth, window.innerHeight);

		}

		function render() {

			controls.update();

			const time = -performance.now() / 1000;

			for (let i = 0; i < wheels.length; i++) {

				wheels[i].rotation.x = time * Math.PI * 2;

			}

			grid.position.z = -(time) % 1;

			renderer.render(scene, camera);

			stats.update();

		}

		init();
	</script>

</body>

</html>