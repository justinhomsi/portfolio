using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BackgroundScroll : MonoBehaviour {

	private Material backgroundMaterial;

	Vector2 offset;

	public float velocityX, velocityY;

	// Use this for initialization
	void Start () {
		backgroundMaterial = GetComponent<Renderer>().material;
		offset = new Vector2(velocityX, velocityY);
	}
	
	// Update is called once per frame
	void Update () {
		backgroundMaterial.mainTextureOffset += offset * Time.deltaTime;
	}
}
