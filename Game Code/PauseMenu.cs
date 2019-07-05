using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using UnityEngine;

public class PauseMenu : MonoBehaviour {

	public string mainMenuLevel;
	public AudioSource backgroundMusic;
	public Button muteButton;
	public Sprite notMutedImage;
	public Sprite mutedImage;

	private bool isMute = false;

	public GameObject pauseMenu;

	private CurrencyManager currencyManager;

	public InterstitialAdQuitToMain interstitial;

	public void PauseGame()
	{
		Time.timeScale = 0f;
		backgroundMusic.Pause();
		pauseMenu.SetActive(true);
	}

	public void ResumeGame()
	{
		Time.timeScale = 1f;
		backgroundMusic.Play();
		pauseMenu.SetActive(false);
	}

	public void RestartGame()
	{
		pauseMenu.SetActive(false);
		backgroundMusic.Stop();
		FindObjectOfType<GameManager>().Reset();
	}

	public void QuitToMain()
	{
		currencyManager = FindObjectOfType<CurrencyManager>();
		Time.timeScale = 1f;
		currencyManager.SaveCurrency();
		backgroundMusic.Stop();
		SceneManager.LoadScene(mainMenuLevel);
		Time.timeScale = 0;
		interstitial.ShowInterstitial();
	}
}

