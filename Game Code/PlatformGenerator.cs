using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlatformGenerator : MonoBehaviour {

    public GameObject thePlatform;
    public Transform generationPoint;
    public float distanceBetweenPlatforms;

    private float platformWidth;

    public float distanceBetweenPlatformsMin;
    public float distanceBetweenPlatformsMax;

    //public GameObject[] thePlatforms;
    private int platformSelector;
    private float[] platformWidths;

    public ObjectPooler[] theObjectPools;

    private float minPlatformHeight;
    public Transform maxPlatformHeightPoint;
    public Transform midPlatformHeightPoint;
    private float maxPlatformHeight;
    public float maxHeightChange;
    private float heightChange;

    private CoinGenerator coinGenerator;
    private float randomCarrotThreshold;

    private PowerUpGenerator powerUpGenerator;
    private float powerUpThreshold;

    private int aboveMidCounter;


	// Use this for initialization
	void Start () {
        //platformWidth = thePlatform.GetComponent<BoxCollider2D>().size.x;
        platformWidths = new float[theObjectPools.Length];

        for(int i = 0; i < theObjectPools.Length; i++) {
            platformWidths[i] = theObjectPools[i].pooledObject.GetComponent<BoxCollider2D>().size.x;
        }

        minPlatformHeight = transform.position.y;
        maxPlatformHeight = maxPlatformHeightPoint.position.y;

        coinGenerator = FindObjectOfType<CoinGenerator>();
        powerUpGenerator = FindObjectOfType<PowerUpGenerator>();

        if (PlayerPrefs.HasKey("PowerUpChanceUpgrade"))
        {
            powerUpThreshold = 1 + PlayerPrefs.GetInt("PowerUpChanceUpgrade");
        }
        else
        {
            powerUpThreshold = 1;
        }

        if (PlayerPrefs.HasKey("CarrotSpawnChanceUpgrade"))
        {
            randomCarrotThreshold = 35 + PlayerPrefs.GetInt("CarrotSpawnChanceUpgrade");
        }
        else
        {
            randomCarrotThreshold = 35;
        }

        aboveMidCounter = 0;
        
	}
	
	// Update is called once per frame
	void Update () {
        if (transform.position.x < generationPoint.position.x)
        {
            distanceBetweenPlatforms = Random.Range(distanceBetweenPlatformsMin, distanceBetweenPlatformsMax);

            platformSelector = Random.Range(0, theObjectPools.Length);

            heightChange = transform.position.y + Random.Range(maxHeightChange, -maxHeightChange);

            if (heightChange > maxPlatformHeight) {
                heightChange = maxPlatformHeight;
            }
            else if (heightChange < minPlatformHeight) {
                heightChange = minPlatformHeight;
            }

            transform.position = new Vector3(transform.position.x + (platformWidths[platformSelector] / 2) + distanceBetweenPlatforms, heightChange, transform.position.z);

            if (transform.position.y > midPlatformHeightPoint.position.y + 0.5f)
            {
                aboveMidCounter++;
            }
            else
            {
                aboveMidCounter = 0;
            }

            if (aboveMidCounter == 3)
            {
                transform.position = new Vector3(transform.position.x + (platformWidths[platformSelector] / 2) + distanceBetweenPlatforms, midPlatformHeightPoint.position.y, transform.position.z);
                
                GameObject midPlatform = theObjectPools[platformSelector].GetPooledObject();

                midPlatform.transform.position = transform.position;
                midPlatform.transform.rotation = transform.rotation;
                midPlatform.SetActive(true);
                
                if (Random.Range(0f, 100f) <= powerUpThreshold) {
                    powerUpGenerator.SpawnPowerUp(new Vector3(transform.position.x, transform.position.y + 1f, transform.position.z));
                }
                else if(Random.Range(0f, 100f) <= randomCarrotThreshold)
                {
                    coinGenerator.SpawnCoins(new Vector3(transform.position.x, transform.position.y + 1f, transform.position.z));
                }

                transform.position = new Vector3(transform.position.x + (platformWidths[platformSelector] / 2), midPlatformHeightPoint.position.y, transform.position.z);

                aboveMidCounter = 0;
            }
            else
            {
                //Instantiate(/* thePlatform */thePlatforms[platformSelector], transform.position, transform.rotation);

                GameObject newPlatform = theObjectPools[platformSelector].GetPooledObject();

                newPlatform.transform.position = transform.position;
                newPlatform.transform.rotation = transform.rotation;
                newPlatform.SetActive(true);

                if (Random.Range(0f, 100f) <= powerUpThreshold) {
                    powerUpGenerator.SpawnPowerUp(new Vector3(transform.position.x, transform.position.y + 1f, transform.position.z));
                }
                else if(Random.Range(0f, 100f) <= randomCarrotThreshold)
                {
                    coinGenerator.SpawnCoins(new Vector3(transform.position.x, transform.position.y + 1f, transform.position.z));
                }

                transform.position = new Vector3(transform.position.x + (platformWidths[platformSelector] / 2), transform.position.y, transform.position.z);
            }
        }
	}
}
