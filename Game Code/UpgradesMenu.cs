using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine;

public class UpgradesMenu : MonoBehaviour {

	public int powerUpUpgradeCost;

	public int carrotUpgradeCost;
	public int currencyCount;

	public Text currencyText;

	private int carrotSpawnChanceUpgrade;
	private int powerUpChanceUpgrade;

	public Text carrotUpgradeCostText;
	public Text powerUpUpgradeCostText;

	private int newPowerUpUpgradeCost;
	private int newCarrotUpgradeCost;

	public Text numberOfCarrotUpgradesText;
	public Text numberOfPowerUpUpgradesText;

	private UpgradesErrors errorMessages;

	// Use this for initialization
	void Start () {
		if (!PlayerPrefs.HasKey("PowerUpChanceUpgrade"))
		{
			PlayerPrefs.SetInt("PowerUpChanceUpgrade", 0);
		}

		if (!PlayerPrefs.HasKey("CarrotSpawnChanceUpgrade"))
		{
			PlayerPrefs.SetInt("CarrotSpawnChanceUpgrade", 0);
		}

		errorMessages = FindObjectOfType<UpgradesErrors>();
	}
	
	// Update is called once per frame
	void Update () {
		if (PlayerPrefs.HasKey("Currency"))
		{
			currencyCount = PlayerPrefs.GetInt("Currency");
		}

		if (PlayerPrefs.HasKey("PowerUpChanceUpgrade"))
		{
			powerUpChanceUpgrade = PlayerPrefs.GetInt("PowerUpChanceUpgrade");
			if (powerUpChanceUpgrade >= 1)
			{
				for (int i = 1; i <= powerUpChanceUpgrade; i++)
				{
					newPowerUpUpgradeCost = ((i * powerUpUpgradeCost) * 2);
					numberOfPowerUpUpgradesText.text = i + "/15";
				}
				powerUpUpgradeCostText.text = "x " + newPowerUpUpgradeCost;

			}
			else
			{
				newPowerUpUpgradeCost = powerUpUpgradeCost;
			}
		}

		if (PlayerPrefs.HasKey("CarrotSpawnChanceUpgrade"))
		{
			carrotSpawnChanceUpgrade = PlayerPrefs.GetInt("CarrotSpawnChanceUpgrade");
			if (carrotSpawnChanceUpgrade >= 1)
			{
				for (int i = 1; i <= carrotSpawnChanceUpgrade; i++)
				{
					newCarrotUpgradeCost = ((i * carrotUpgradeCost) * 2);
					numberOfCarrotUpgradesText.text = i + "/15";
				}
				carrotUpgradeCostText.text = "x " + newCarrotUpgradeCost;
			}
			else
			{
				newCarrotUpgradeCost = carrotUpgradeCost;
			}
		}

		currencyText.text = "Tomatoes: " + currencyCount;
	}

	public void BuyPowerUpUpgrade () {
		if (powerUpChanceUpgrade < 15)
		{
			if (currencyCount >= newPowerUpUpgradeCost)
			{
				powerUpChanceUpgrade += 1;
				currencyCount -= newPowerUpUpgradeCost;
				PlayerPrefs.SetInt("PowerUpChanceUpgrade", powerUpChanceUpgrade);
				PlayerPrefs.SetInt("Currency", currencyCount);
			}
			else
			{
				errorMessages.ShowCurrencyError();
			}
		}
		else
		{
			errorMessages.ShowMaximumError();
		}

	}

	public void BuyCarrotChanceUpgrade () {
		if (carrotSpawnChanceUpgrade < 15)
		{
			if (currencyCount >= newCarrotUpgradeCost)
			{
				carrotSpawnChanceUpgrade += 1;
				currencyCount -= newCarrotUpgradeCost;
				PlayerPrefs.SetInt("CarrotSpawnChanceUpgrade", carrotSpawnChanceUpgrade);
				PlayerPrefs.SetInt("Currency", currencyCount);
			}
			else
			{
				errorMessages.ShowCurrencyError();
			}
		}
		else
		{
			errorMessages.ShowMaximumError();
		}

	}

	public void BackToMain () {
		gameObject.SetActive(false);
	}
}
