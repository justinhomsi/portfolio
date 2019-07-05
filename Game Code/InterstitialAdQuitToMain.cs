using System.Collections;
using System.Collections.Generic;
using System;
using GoogleMobileAds.Api;
using UnityEngine;

public class InterstitialAdQuitToMain : MonoBehaviour {

	private InterstitialAd interstitial;

	private BannerAdBottom bannerAd;

	private void RequestInterstitial()
	{
		#if UNITY_ANDROID
			string adUnitId = "ca-app-pub-3940256099942544/1033173712";
		#else
			string adUnitId = "unexpected_platform";
		#endif

		// Initialize an IntersititalAd
		this.interstitial = new InterstitialAd(adUnitId);

    	// Called when an ad is shown.
    	this.interstitial.OnAdOpening += HandleOnAdOpened;
		// Called when the ad is closed.
    	this.interstitial.OnAdClosed += HandleOnAdClosed;


		// Create an empty ad request
		AdRequest request = new AdRequest.Builder().Build();
		// Load the intersitital with the request
		this.interstitial.LoadAd(request);
	}

	public void HandleOnAdOpened(object sender, EventArgs args)
	{
		AudioListener.volume = 0;
		bannerAd.HideAd();
	}

	public void HandleOnAdClosed(object sender, EventArgs args)
	{
		AudioListener.volume = 1;
		Time.timeScale = 1f;
		bannerAd.ShowAd();
	}

	// Use this for initialization
	void Start () {
		bannerAd = FindObjectOfType<BannerAdBottom>();
		RequestInterstitial();
	}
	

	public void ShowInterstitial()
	{
		if (this.interstitial.IsLoaded())
		{
			this.interstitial.Show();
		}
	}

	void OnApplicationQuit()
	{
		interstitial.Destroy();
	}
}
