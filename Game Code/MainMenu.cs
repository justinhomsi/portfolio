using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using UnityEngine;

public class MainMenu : MonoBehaviour {

	public string playGameEasyLevel;
	public UpgradesMenu upgradesMenu;
	public BannerAdBottom bannerAdBottom;

	public void PlayGameEasy()
	{
		Time.timeScale = 1;
		SceneManager.LoadScene(playGameEasyLevel);
	}

	public void OpenUpgrades()
	{
		upgradesMenu.gameObject.SetActive(true);
	}

	public void QuitGame()
	{
		bannerAdBottom.DestroyAd();
		Application.Quit();
	}
}
