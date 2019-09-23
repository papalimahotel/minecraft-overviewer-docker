# minecraft-overviewer-docker
Docker for Minecraft Overviewer map generator served from nginx


### Volumes
**/data/world**  This should point at the world folder of your Minecraft server

### Ports
**80**  The default port for web/nginx where the output of Overviewer is viewable

### Environment Variables
**OVERVIEWER_CYCLE** (_default = 3600_) This is the length of time between renders of the map(s) in seconds.

**OVERVIEWER_TEXTURE_URL** (_default = "https://launcher.mojang.com/v1/objects/8c325a0c5bd674dd747d6ebaa4c791fd363ad8a9/client.jar"_)  This is the URL to grab the texture pack from.

**OVERVIEWER_WORLD_NAME**  (_default = "myworld"_)  This is the name of the game world.

### Example

```
docker run -d -v /opt/minecraft/world:/data/world -p 80:80 -e OVERVIEWER_WORLD_NAME="Alderaan" papalimahotel/minecraft-overviewer
```
