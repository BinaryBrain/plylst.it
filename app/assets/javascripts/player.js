function initPlayer() {
	var current = 0;
	var songElements = [];
	var npStatus = $('#npStatus');
	var npTitle = $('#npTitle');
	var audioElement = $('#audio');
	var playing = true;
	audio = audioElement.get(0);

	$(document).bind('keypress', function (event) {
		if (event.keyCode == 32) {
			if (playing) {
				$('#audio').pause();
			} else {
				$('#audio').play();
			}
		}
	});

	$('#plList li').each(function (i) {
		$(this).attr('data-index', i);
		songElements[i] = $(this);
		songElements[i].find('.plNum').text((i + 1) + '.');
	});

	playTrack(songElements[current]);

	audioElement.bind('play', function () {
		playing = true;
		npStatus.text('Now Playing...');
		npTitle.text(songElements[current].attr('data-name'));
	});
	
	audioElement.bind('pause', function () {
		playing = false;
		npStatus.text('Paused...');
	});

	audioElement.bind('ended', function () {
		current++;

		if (current > songElements.length - 1) {
			current = 0;
		}

		playTrack(songElements[current]);
	});

	$('#plList li').click(function () {
		var index = parseInt($(this).attr('data-index'));
		var id = $(this).attr('data-id');
		var name = $(this).attr('data-name');
		var filename = $(this).attr('data-filename');

		if (index !== current) {
			current = index;
			playTrack(songElements[index]);
		}
	});

	$('#btnPrev').click(function () {
		current--;
		
		if (current < 0) {
			current = 0;
			audio.currentTime = 0;
		} else {
			if (playing) {
				playTrack(songElements[current]);
			} else {
				loadTrack(songElements[current])
			}
		}

	});

	$('#btnNext').click(function () {
		current++;

		if (current > songElements.length - 1) {
			current = 0;
		}

		if (playing) {
			playTrack(songElements[current]);
		} else {
			loadTrack(songElements[current]);
		}
	});

	function loadTrack(filename) {
		audio.src = '/downloads/' + filename + '.mp3';
	}

	function playTrack(songElement) {
		$('.plSel').removeClass('plSel');
		songElement.addClass('plSel');

		loadTrack(songElement.attr('data-filename'));
		audio.play();
	}
}
