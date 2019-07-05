using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour {

    public float moveSpeed;
    public float jumpForce;

    public float jumpTime;
    private float jumpTimeCounter;

    private bool stoppedJumping;

    private Rigidbody2D myRigidbody;

    public bool grounded;
    public LayerMask whatIsGround;
    public Transform groundCheck;
    public float groundCheckRadius;

    //private Collider2D myCollider;

    private Animator myAnimator;

    public GameManager gameManager;

    // Android Native Audio Variables
    private int jumpFileID;
    private int jumpSoundID;

    private int gameOverFileID;
    private int gameOverSoundID;

	// Use this for initialization
	void Start () {
        myRigidbody = GetComponent<Rigidbody2D>();
        //myCollider = GetComponent<Collider2D>();
        myAnimator = GetComponent<Animator>();
        jumpTimeCounter = jumpTime;
        moveSpeed = 10;
        
        // Set up Android Native Audio
		AndroidNativeAudio.makePool(3);
		jumpFileID = AndroidNativeAudio.load("jump.wav");
        gameOverFileID = AndroidNativeAudio.load("game-over-sound.wav");
        
        stoppedJumping = true;
	}

	// Update is called once per frame
	void Update () {
        //grounded = Physics2D.IsTouchingLayers(myCollider, whatIsGround);

        grounded = Physics2D.OverlapCircle(groundCheck.position, groundCheckRadius, whatIsGround);

        myRigidbody.velocity = new Vector2(moveSpeed, myRigidbody.velocity.y);

        if (Input.GetKeyDown(KeyCode.Space) || Input.GetMouseButtonDown(0))
        {
            if (grounded)
            {
                myRigidbody.velocity = new Vector2(myRigidbody.velocity.x, jumpForce);
                jumpSoundID = AndroidNativeAudio.play(jumpFileID, 1.0f);
                stoppedJumping = false;
            }
            
        }

        if ((Input.GetKey(KeyCode.Space) || Input.GetMouseButton(0)) && !stoppedJumping) 
        {
            if (jumpTimeCounter > 0) 
            {
                myRigidbody.velocity = new Vector2(myRigidbody.velocity.x, jumpForce);
                jumpTimeCounter -= Time.deltaTime;
            }
        }

        if (Input.GetKeyUp(KeyCode.Space) || Input.GetMouseButtonUp(0)) 
        {
            jumpTimeCounter = 0;
            stoppedJumping = true;
        }

        if (grounded)
        {
            jumpTimeCounter = jumpTime;
        }

        myAnimator.SetFloat("Speed", myRigidbody.velocity.x);
        myAnimator.SetBool("Grounded", grounded);
	}

    void OnCollisionEnter2D(Collision2D other)
    {
        if(other.gameObject.tag == "Rawio")
        {
            gameOverSoundID = AndroidNativeAudio.play(gameOverFileID, 0.5f);
            gameManager.RestartGame();
        }
    }

    public void ChangeMoveSpeed(float amount)
    {
        moveSpeed = amount;
        StartCoroutine(PowerUpTimer());
    }

    void OnApplicationQuit()
	{
		AndroidNativeAudio.unload(jumpFileID);
		AndroidNativeAudio.releasePool();
	}

    private IEnumerator PowerUpTimer()
    {
        yield return new WaitForSeconds(2);
        NormalMoveSpeed();
    }

    public void NormalMoveSpeed()
    {
        moveSpeed = 10;
    }
}
