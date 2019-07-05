using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using UnityEngine;

public class DeathMenu : MonoBehaviour {

	public string mainMenuLevel;

	private CurrencyManager currencyManager;

	public InterstitialAdQuitToMain interstitial;

	public void RestartGame()
	{
		FindObjectOfType<GameManager>().Reset();
	}

	public void QuitToMain()
	{
		currencyManager = FindObjectOfType<CurrencyManager>();
		Time.timeScale = 1;
		currencyManager.SaveCurrency();
		SceneManager.LoadScene(mainMenuLevel);
		Time.timeScale = 0;
		interstitial.ShowInterstitial();
	}
}
