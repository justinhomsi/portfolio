using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RawioController : MonoBehaviour {

	public float speed;
	public float height;

	private Vector3 pos;

	private float newY;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		pos = transform.position;
		newY = Mathf.Sin(Time.time * speed);
		transform.position = new Vector3(pos.x, newY, pos.z) * height;
	}
}
