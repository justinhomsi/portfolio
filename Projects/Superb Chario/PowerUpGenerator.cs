using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PowerUpGenerator : MonoBehaviour {

	public ObjectPooler powerUpPool;

	// Use this for initialization
	void Start () {

	}
	
	public void SpawnPowerUp(Vector3 position) {
		GameObject powerUp = powerUpPool.GetPooledObject();
		powerUp.transform.position = position;
		powerUp.SetActive(true);
	}
}
