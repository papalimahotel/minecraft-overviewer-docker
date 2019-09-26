#!/usr/bin/env python
import os

def playerIcons(poi):
	if poi['id'] == 'Player':
		poi['icon'] = "https://minotar.net/helm/%s/32" % poi['EntityId']
		return "Last known location for %s" % poi['EntityId']

# Only signs with "-- RENDER --" in them, and no others. Otherwise, people
# can't have secret bases and the render is too busy anyways.
def signFilter(poi):
	if poi['id'] in ['Sign', 'minecraft:sign']:
		if '-=POI=-' in poi.values():
			return "\n".join([poi['Text1'], poi['Text2'], poi['Text3'], poi['Text4']])


world_name = os.environ.get('OVERVIEWER_WORLD_NAME')
worlds[world_name] = '/mc/world'

texturepath = '/ov/texture'
outputdir = '/var/www/html'

markers = [
	dict(name='Players', filterFunction=playerIcons, checked=True),
	dict(name='Signs', filterFunction=signFilter, checked=True)
]

renders['day'] = {
	'world': world_name,
	'title': 'Day',
	'rendermode': smooth_lighting,
	'dimension': 'overworld',
	'markers': markers
}

renders['night'] = {
	'world': world_name,
	'title': 'Night',
	'rendermode': smooth_night,
	'dimension': 'overworld',
	'markers': markers
}

renders['cave'] = {
	'world': world_name,
	'title': 'Cave',
	'rendermode': cave,
	'dimension': 'overworld',
	'markers': markers
}

renders['nether'] = {
	'world': world_name,
	'title': 'Nether',
	'rendermode': nether_smooth_lighting,
	'dimension': 'nether',
	'markers': markers
}

renders['end'] = {
	'world': world_name,
	'title': 'The End',
	'rendermode': [Base(), EdgeLines(), SmoothLighting(strength=0.5)],
	'dimension': 'end',
	'markers': markers
}

renders['overlay_biome'] = {
	'world': world_name,
	'title': 'Biome Colouring Overlay',
	'rendermode': [ClearBase(), BiomeOverlay()],
	'dimension': 'overworld',
	'overlay': ['day']
}

renders['overlay_mobs'] = {
	'world': world_name,
	'title': 'Mob Spawnable Areas Overlay',
	'rendermode': [Clearbase(), SpawnOverlay()],
	'dimension': 'overworld',
	'overlay': ['day']
}

renders['overlay_slime'] = {
	'world': world_name,
	'title': 'Slime Chunk Overlay',
	'rendermode': [ClearBase(), SlimeOverlay()],
	'dimension': 'overworld',
	'overlay': ['day']
}
