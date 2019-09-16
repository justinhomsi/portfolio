using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PickUpPowerUp : MonoBehaviour {

	private PlayerController player;

	private float playerStartingSpeed;

	private bool powerUpActive;

	// Android Native Audio Variables
	private int powerUpFileID;
	private int powerUpSoundID;

	// Use this for initialization
	void Start () {
		player = FindObjectOfType<PlayerController>();
		playerStartingSpeed = player.moveSpeed;
		powerUpActive = false;

		powerUpFileID = AndroidNativeAudio.load("power-up-sound.mp3");
	}
	
	// Update is called once per frame
	void Update () {

	}

	private void OnTriggerEnter2D(Collider2D other) {

		if(other.gameObject.name == "Player" && !powerUpActive) 
		{
			powerUpSoundID = AndroidNativeAudio.play(powerUpFileID, 0.2f);
			gameObject.SetActive(false);
			//gameObject.GetComponent<Renderer>().enabled = false;
			player.ChangeMoveSpeed(12);
			//gameObject.GetComponent<Renderer>().enabled = true;
			
			powerUpActive = false;
		}
	}

	void OnApplicationQuit()
	{
		AndroidNativeAudio.unload(powerUpFileID);
	}
}
