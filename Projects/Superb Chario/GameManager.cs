﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour {

	public Transform platformGenerator;
	public Transform mainCamera;
	private Vector3 cameraStartPoint;
	private Vector3 platformStartPoint;
	public PlayerController player;
	private Vector3 playerStartPoint;

	private PlatformDestroyer[] platformList;

	private ScoreManager scoreManager;

	public DeathMenu deathScreen;

	public AudioSource backgroundMusicSource;

	public GameObject pauseButton;

	// Use this for initialization
	void Start () {
		platformStartPoint = platformGenerator.position;;
		playerStartPoint = player.transform.position;
		cameraStartPoint = mainCamera.transform.position;

		scoreManager = FindObjectOfType<ScoreManager>();

		pauseButton.SetActive(true);
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	public void RestartGame () 
	{
		scoreManager.scoreIncreasing = false;
		player.gameObject.SetActive(false);
		Time.timeScale = 0;
		backgroundMusicSource.Stop();
		

		deathScreen.gameObject.SetActive(true);
		pauseButton.SetActive(false);
	}

	public void Reset()
	{
		deathScreen.gameObject.SetActive(false);
		pauseButton.SetActive(true);
		Time.timeScale = 1;
		backgroundMusicSource.Play();
		platformList = FindObjectsOfType<PlatformDestroyer>();

		for(int i = 0; i < platformList.Length; i++)
		{
			platformList[i].gameObject.SetActive(false);
		}

		player.transform.position = playerStartPoint;
		platformGenerator.position = platformStartPoint;
		mainCamera.position = cameraStartPoint;
		player.NormalMoveSpeed();
		player.gameObject.SetActive(true);

		scoreManager.scoreCount = 0;
		scoreManager.scoreIncreasing = true;
	}
}
