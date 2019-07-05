using System.Collections;
using System.Collections.Generic;
using GoogleMobileAds.Api;
using UnityEngine;

public class AdController : MonoBehaviour {

	// Use this for initialization
	void Start () {
		#if UNITY_ANDROID
			string appID = "ca-app-pub-1253338250345262~9954589561";
		#else
			string appID = "unexpected_platform";
		#endif

		// Initialize the Google Mobile Ads SDK
		MobileAds.Initialize(appID);
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
