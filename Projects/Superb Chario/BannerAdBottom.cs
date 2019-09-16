using System.Collections;
using System.Collections.Generic;
using GoogleMobileAds.Api;
using UnityEngine;

public class BannerAdBottom : MonoBehaviour {

	private BannerView bannerView;

	// Use this for initialization
	void Start () {
		#if UNITY_ANDROID
			string appID = "ca-app-pub-1253338250345262~9954589561";
		#else
			string appID = "unexpected_platform";
		#endif

		// Initialize the Google Mobile Ads SDK.
		MobileAds.Initialize(appID);

		this.RequestBanner();
	}
	
	private void RequestBanner()
	{
		#if UNITY_ANDROID
			//string adUnitId = "ca-app-pub-1253338250345262/6162931636";
			string adUnitId = "ca-app-pub-3940256099942544/6300978111";
		#else
			string adUnitId = "unexpected_platform";
		#endif

		// Create a 320x50 banner at the bottom of the screen
		bannerView = new BannerView(adUnitId, AdSize.SmartBanner, AdPosition.Bottom);

		// Create an empty ad request.
		AdRequest request = new AdRequest.Builder().Build();

		// Load the banner with the request.
		bannerView.LoadAd(request);

		ShowAd();
	}

	public void ShowAd()
	{
		bannerView.Show();
	}

	public void DestroyAd()
	{
		bannerView.Destroy();
	}

	public void HideAd()
	{
		bannerView.Hide();
	}
}
