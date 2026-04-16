# attraction-screen-godot
A simple autoload scene to show an overlay video after some idle time and restart a scene on interaction in Godot. For exhibitions.

### Set Up
Set idle timeout time, attraction screen video, and optionally a scene to go to upon dismissal (default restarts current scene) on the root node script of `attraction-screen.tscn`.

<img height="120" src="https://github.com/user-attachments/assets/388c1b63-00b5-4e0d-9e91-97c4d333adcb"/><br>

> [!IMPORTANT]
> Without extensions, the only supported video format in Godot is Ogg Theora ([more information in Godot Documentation](https://docs.godotengine.org/en/stable/tutorials/animation/playing_videos.html)).
> Convert a video to Ogg Theora with VLC or ffmpeg using e.g.:
> 
> `ffmpeg -i input.mp4 -c:v libtheora -q:v 10 -an output.ogv` (no audio needed for attraction screen)

### Autoload
Add `attraction-screen.tscn` to **Project Settings > Globals > Autoload** to have the idle timer always run in the background.

<img height="360" src="https://github.com/user-attachments/assets/04e056b0-fb57-4988-99e6-7f41a53b3193"/>
