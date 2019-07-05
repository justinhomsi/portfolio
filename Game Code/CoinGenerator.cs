using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CoinGenerator : MonoBehaviour {

	public ObjectPooler coinPool;

	public float distanceBetweenCoins;

	private float randomCoinAmount;

	// Use this for initialization
	public void SpawnCoins(Vector3 startPosition)
	{

		randomCoinAmount = Random.Range(0f, 100f);

		if (randomCoinAmount < 35)
		{
			GameObject coin1 = coinPool.GetPooledObject();
			coin1.transform.position = startPosition;
			coin1.SetActive(true);

			GameObject coin2 = coinPool.GetPooledObject();
			coin2.transform.position = new Vector3(startPosition.x - distanceBetweenCoins, startPosition.y, startPosition.z);
			coin2.SetActive(true);

			GameObject coin3 = coinPool.GetPooledObject();
			coin3.transform.position = new Vector3(startPosition.x + distanceBetweenCoins, startPosition.y, startPosition.z);
			coin3.SetActive(true);
		}
		else if (randomCoinAmount < 65)
		{
			GameObject coin1 = coinPool.GetPooledObject();
			coin1.transform.position = new Vector3(startPosition.x + distanceBetweenCoins, startPosition.y, startPosition.z);
			coin1.SetActive(true);

			GameObject coin2 = coinPool.GetPooledObject();
			coin2.transform.position = new Vector3(startPosition.x - distanceBetweenCoins, startPosition.y, startPosition.z);
			coin2.SetActive(true);
		}
		else if (randomCoinAmount < 85) 
		{
			GameObject coin1 = coinPool.GetPooledObject();
			coin1.transform.position = startPosition;
			coin1.SetActive(true);
		}

		
	}
}
