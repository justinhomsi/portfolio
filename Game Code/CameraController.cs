using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour {

	public float cameraScrollSpeed;

	void FixedUpdate() {
		transform.Translate(cameraScrollSpeed, 0f, 0f);
	}
}
