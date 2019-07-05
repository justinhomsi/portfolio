using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PickupPoints : MonoBehaviour {

	public int scoreToGive;

	public int currencyToGive;

	private CurrencyManager currencyManager;

	private ScoreManager scoreManager;

	private CameraController camera;

	// Android Native Audio Variables
	private int tomatoFileID;

	private int tomatoSoundID;
	

	// Use this for initialization
	void Start () {
		scoreManager = FindObjectOfType<ScoreManager>();
		currencyManager = FindObjectOfType<CurrencyManager>();
		camera = FindObjectOfType<CameraController>();

		tomatoFileID = AndroidNativeAudio.load("tomato-squish.wav");

		}
	
	// Update is called once per frame
	void Update () {
		
	}

	void OnTriggerEnter2D(Collider2D other)
	{
		if(other.gameObject.name == "Player")
		{
			tomatoSoundID = AndroidNativeAudio.play(tomatoFileID, 0.3f);
			scoreManager.AddScore(scoreToGive);
			currencyManager.AddCurrency(currencyToGive);
			gameObject.SetActive(false);
		}
	}

	void OnApplicationQuit()
	{
		AndroidNativeAudio.unload(tomatoFileID);
	}
}
