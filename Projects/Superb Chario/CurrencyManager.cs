using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine;

public class CurrencyManager : MonoBehaviour {

	public Text currencyText;

	private int startingCurrency;

	public int currencyCount;

	// Use this for initialization
	void Start () {
		if (PlayerPrefs.HasKey("Currency"))
		{
			startingCurrency = PlayerPrefs.GetInt("Currency");
			currencyText.text = "Tomatoes: " + startingCurrency;
		}
	}
	
	// Update is called once per frame
	void Update () {

		currencyText.text = "Tomatoes: " + (startingCurrency + currencyCount);
	}

	public void AddCurrency(int currencyToAdd)
	{
		currencyCount += currencyToAdd;
	}

	void OnApplicationQuit() {
		if (PlayerPrefs.HasKey("Currency"))
		{
			PlayerPrefs.SetInt("Currency", PlayerPrefs.GetInt("Currency", 0) + currencyCount);
		}
		else if (!PlayerPrefs.HasKey("Currency"))
		{
			PlayerPrefs.SetInt("Currency", currencyCount);
		}
	}

	public void SaveCurrency() {
		if (PlayerPrefs.HasKey("Currency"))
		{
			PlayerPrefs.SetInt("Currency", PlayerPrefs.GetInt("Currency", 0) + currencyCount);
		}
		else if (!PlayerPrefs.HasKey("Currency"))
		{
			PlayerPrefs.SetInt("Currency", currencyCount);
		}
	}
}
