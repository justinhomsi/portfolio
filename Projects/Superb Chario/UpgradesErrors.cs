using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UpgradesErrors : MonoBehaviour
{

    public GameObject notEnoughCurrencyError;
    public GameObject maximumUpgradesReachedError;

    public void ShowCurrencyError()
    {
        notEnoughCurrencyError.SetActive(true);
    }

    public void ShowMaximumError()
    {
        maximumUpgradesReachedError.SetActive(true);
    }

    public void OKButton()
    {
        notEnoughCurrencyError.SetActive(false);
        maximumUpgradesReachedError.SetActive(false);
    }
}
