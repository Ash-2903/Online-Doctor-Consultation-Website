<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	User u = (User) session.getAttribute("userObject");
	Doctor d = (Doctor) session.getAttribute("doctorObject");
    if (u == null && d == null) {
        response.sendRedirect("../user_login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Video Conference</title>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
	<%@include file="../components/common_css.jsp" %>
	 <link rel='stylesheet' type='text/css' media='screen' href='Styles.css'>
	 <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300&family=Permanent+Marker&display=swap" rel="stylesheet">
</head>
<body>

 <main>

       <div class="navbars" style="background-color: #B0DAFF">
            <nav class="text-center" >
            	<div class=" mt-4 mb-3">
	                <a class="navbar-brand navbar-light" href="../index.jsp" style="color:black">
	    				<i class="fa-solid fa-stethoscope fa-beat fa-2xl"></i>	
	    			</a>
    			</div>
    			<p style="color:black">Cure Quest</p>
            </nav>
        </div>


        <!-- <div id="users-list"></div> -->

        <h1 id="site-title">&nbsp;</h1>
        <div id="join-wrapper">
            <input type="hidden" id="username" type="text" placeholder="Enter your name..." />
            <button id="join-btn" style="color:black">Join Stream</button>
        </div>
        <div id="user-streams" ></div>
        


        <!-- Wrapper for join button -->
        <div class="contarols" id="footer">
            <div class="icon-wrapper">
                <img class="control-icon" id="camera-btn" src="../images/cam.png"/>
                <!-- <a href="https://www.flaticon.com/free-icons/cam" title="cam icons">Cam icons created by icon_small - Flaticon</a> -->
                <p>Cam</p>
            </div>

            <div class="icon-wrapper">
                <img class="control-icon call-icon" id="leave-btn" src="../images/leave.png" />
                <p>Leave</p>
            </div>

            <div class="icon-wrapper">
                <img class="control-icon" id="mic-btn" src="../images/mic.png" />
                <p>Mic</p>
            </div>
        </div>

    </main>

    <script src="https://download.agora.io/sdk/release/AgoraRTC_N.js"></script>
    <script>
		
		
		//#1
let client = AgoraRTC.createClient({mode:'rtc', codec:"vp8"})

//#2 connecting to agora
let config = {
    appid:'09e4dc3d8ffa84332b7b6bc96c668dc6c',
    token:'007eJxTYFBc62q35rCeQtMOgT+rD706sEpw+uuN/tfv3N3Je1pJ8NACBQbLVJOUZOMUi7S0RAsTY2OjJPMks6RkS7NkMzOLlGSz5K0Wn1MaAhkZpnQ9ZGJkgEAQn4shPy8nMy9VISU/mYEBAOFyJNY=',
    uid:null,
    channel:'online doc',
}

//#3 - Setting tracks(audio or video) for when user joins
let localTracks = {
    audioTrack:null,
    videoTrack:null
}

// #4 - Want to hold state for users audio and video so user can mute and hide
let localTrackState = {
    audioTrackMuted:false,
    videoTrackMuted:false
}

//#5 - Set remote tracks to store other users
let remoteTracks = {}


document.getElementById('join-btn').addEventListener('click', async () => {
    config.uid = document.getElementById('username').value
    await joinStreams()
    document.getElementById('join-wrapper').style.display = 'none'
    document.getElementById('footer').style.display = 'flex'
})



document.getElementById('mic-btn').addEventListener('click', async () => {
    //Check if what the state of muted currently is
    //Disable button
    if(!localTrackState.audioTrackMuted){
        //Mute your audio
        await localTracks.audioTrack.setMuted(true);
        localTrackState.audioTrackMuted = true
        document.getElementById('mic-btn').style.backgroundColor ='rgb(255, 80, 80, 0.7)'
    }else{
        await localTracks.audioTrack.setMuted(false)
        localTrackState.audioTrackMuted = false
        document.getElementById('mic-btn').style.backgroundColor ='#1f1f1f8e'

    }

})



document.getElementById('camera-btn').addEventListener('click', async () => {
    //Check if what the state of muted currently is
    //Disable button
    if(!localTrackState.videoTrackMuted){
        //Mute your audio
        await localTracks.videoTrack.setMuted(true);
        localTrackState.videoTrackMuted = true
        document.getElementById('camera-btn').style.backgroundColor ='rgb(255, 80, 80, 0.7)'
    }else{
        await localTracks.videoTrack.setMuted(false)
        localTrackState.videoTrackMuted = false
        document.getElementById('camera-btn').style.backgroundColor ='#1f1f1f8e'

    }

})



document.getElementById('leave-btn').addEventListener('click', async () => {
    //Loop threw local tracks and stop them so unpublish event gets triggered, then set to undefined
    //Hide footer
    for (trackName in localTracks){
        let track = localTracks[trackName]
        if(track){
            track.stop()
            track.close()
            localTracks[trackName] = null
        }
    }

    //Leave the channel
    await client.leave()
    document.getElementById('footer').style.display = 'none'
    document.getElementById('user-streams').innerHTML = ''
    document.getElementById('join-wrapper').style.display = 'block'

})




//Method will take all my info and set user stream in frame
let joinStreams = async () => {
    // Is this place hear strategicly or can I add to end of method?
    
    client.on("user-published", handleUserJoined);
    client.on("user-left", handleUserLeft);


    client.enableAudioVolumeIndicator(); // Triggers the "volume-indicator" callback event every two seconds.
    client.on("volume-indicator", function(evt){
        for (let i = 0; evt.length > i; i++){
            let speaker = evt[i].uid
            let volume = evt[i].level
            if(volume > 0){
                document.getElementById(`volume-${speaker}`).src = './assets/volume-on.svg'
            }else{
                document.getElementById(`volume-${speaker}`).src = './assets/volume-off.svg'
            }
            
        
            
        }
    });

    //#6 - Set and get back tracks for local user
    [config.uid, localTracks.audioTrack, localTracks.videoTrack] = await  Promise.all([
        client.join(config.appid, config.channel, config.token ||null, config.uid ||null),
        AgoraRTC.createMicrophoneAudioTrack(),
        AgoraRTC.createCameraVideoTrack()

    ])
    
    //#7 - Create player and add it to player list
    let player = `<div class="video-containers" id="video-wrapper-${config.uid}">
                        <p class="user-uid"><img class="volume-icon" id="volume-${config.uid}" src="./assets/volume-on.svg" /> ${config.uid}</p>
                        <div class="video-player player" id="stream-${config.uid}"></div>
                  </div>`

    document.getElementById('user-streams').insertAdjacentHTML('beforeend', player);
    //#8 - Player user stream in div
    localTracks.videoTrack.play(`stream-${config.uid}`)
    

    //#9 Add user to user list of names/ids

    //#10 - Publish my local video tracks to entire channel so everyone can see it
    await client.publish([localTracks.audioTrack, localTracks.videoTrack])

}


let handleUserJoined = async (user, mediaType) => {
    console.log('Handle user joined')

    //#11 - Add user to list of remote users
    remoteTracks[user.uid] = user

    //#12 Subscribe ro remote users
    await client.subscribe(user, mediaType)
   
    
    if (mediaType === 'video'){
        let player = document.getElementById(`video-wrapper-${user.uid}`)
        console.log('player:', player)
        if (player != null){
            player.remove()
        }
 
        player = `<div class="video-containers" id="video-wrapper-${user.uid}">
                        <p class="user-uid"><img class="volume-icon" id="volume-${user.uid}" src="./assets/volume-on.svg" /> ${user.uid}</p>
                        <div  class="video-player player" id="stream-${user.uid}"></div>
                      </div>`
        document.getElementById('user-streams').insertAdjacentHTML('beforeend', player);
         user.videoTrack.play(`stream-${user.uid}`)

        

          
    }
    

    if (mediaType === 'audio') {
        user.audioTrack.play();
      }
}


let handleUserLeft = (user) => {
    console.log('Handle user left!')
    //Remove from remote users and remove users video wrapper
    delete remoteTracks[user.uid]
    document.getElementById(`video-wrapper-${user.uid}`).remove()
}


	</script>

</body>
</html>