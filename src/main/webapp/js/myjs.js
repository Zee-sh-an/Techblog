
	function dolike(pid, uid) {
		console.log(pid + "," + uid)
		var d = {
			uid: uid,
			pid: pid,
			operation: 'like'
		}
		$.ajax({
			url: "LikeServlet",
			data: d,
			success: function(data,
				textStatus, jqXHR) {
				//console.log(pid+","+uid)
				console.log(data);
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log(data);
			}

		})
	}

