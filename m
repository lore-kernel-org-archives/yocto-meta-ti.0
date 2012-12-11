Return-Path: <ndec13@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD3D5E00777
	for <meta-ti@yoctoproject.org>; Tue, 11 Dec 2012 14:12:51 -0800 (PST)
Received: by mail-vb0-f48.google.com with SMTP id fc21so4721791vbb.35
	for <meta-ti@yoctoproject.org>; Tue, 11 Dec 2012 14:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=TT5k9AFbaXPCjeKa7pYuq+62sh/1Fe8dhzR1HFD0wio=;
	b=N48wlWbO5WmQh7hcbb77HhbM5xWon4R6bck4L8cUv7pzW0r8ERN4XHHsxwnHjzas0n
	Leumqbso/gh7OlpUGIaoRkGICNNAnZ/nAJztqJiwfrw1Gs8oub4enIzmtJ+nHlJt9qfJ
	T0B7QAUTmHwh2uUgvmyUNguWrHqSeVtEJN9dHg816hptkrjo1HyJrmjLQ0mPlltEPSQE
	ByiglVFVreEbemQ888LoMueQfQ6+895ZLifbuyp7uXhDzbllLxKCYNszhlckIgCu2RzB
	pNrL85RshWMEePWbDMgy2F0u56ZHnV7BjI9IQZyDmdqnSg1LKdZLJnpvw9IZG4H6UrK2
	flcA==
Received: by 10.52.21.107 with SMTP id u11mr5541115vde.101.1355263970923; Tue,
	11 Dec 2012 14:12:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.248.74 with HTTP; Tue, 11 Dec 2012 14:12:30 -0800 (PST)
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Tue, 11 Dec 2012 23:12:30 +0100
Message-ID: <CAOT3miLrspTsg-YTp-yaiacN7zi6zzMYghTjDH=yqXdAgGsnmA@mail.gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: meta-ti master build broken
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Dec 2012 22:12:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

hi,

i just noticed that meta-ti + poky/master is broken since some mesa
updates were merged

66d92cb mesa-dri: upgrade -git version to current master
a63dc47 mesa: upgrade to 8.0.5

I suspect something along these lines should fix the problem:

$ git diff --cached -M
diff --git a/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
b/recipes-graphics/mesa/mesa-dri_8.0.5.bbappend
similarity index 100%
rename from recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
rename to recipes-graphics/mesa/mesa-dri_8.0.5.bbappend

however I can't test that right now on any plaform... so I just wanted
to share the information with the hope that someone can fix it quicker
than me.

cheers
nico

