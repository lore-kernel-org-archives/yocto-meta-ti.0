Return-Path: <helio.chissini.de.castro@collabora.com>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E88FAE00348
	for <meta-ti@yoctoproject.org>; Wed, 26 Sep 2012 06:58:41 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: helio) with ESMTPSA id 2E6F1603F2C
From: Helio Chissini de Castro <helio.chissini.de.castro@collabora.com>
To: meta-ti@yoctoproject.org
Date: Wed, 26 Sep 2012 10:58:35 -0300
Message-ID: <1585056.lA2uBBeeEh@travel.area51>
Organization: Collabora
X-Face: b:|>2MCZ=zP>gr.~Gjk[v(.\p5^X]2OY=vuF%ndlN'\JB0{DbW]/-=+r; J^QfihM=&FVsq
	R>Us@JpB1UsJ=:>5Q`TjPUWB-(mZXWGd]Mg[.QV?+0(3K67th3DaXbEoFpyA\z){:)%zrs
	-I~YN$gp`Y{.wn^Hq/yNWq'hX]XXz`F%b#X`|gg"X/9hD>vBCcVwLuF#-rea_=i7.d|=c?
	P`LX~,X4Uk@vIU~aR7dEW_;
	zGg1gsm#(Ag4eK/gh2IK=IY@EpHY,6-"76]8Z^%/Lxo@G,# sMcL8+o
User-Agent: KMail/4.9.1 (Linux/3.5.4-1.fc17.x86_64; KDE/4.9.1; x86_64; ; )
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Sep 2012 09:24:18 -0700
Subject: Generate sdcard image ?
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
X-List-Received-Date: Wed, 26 Sep 2012 13:58:42 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi

Few months ago, Ot=E1vio Salvador sent a bunch of patches to enable sdc=
ard image=20
generation on Yocto for Freescale.

We're planning to do the same for Pandaboard, but seens his patch was n=
ot=20
accepted and we still have only tar.bz2 image created ( at least on Den=
zil )

Is there any plan upstream to add it ? Otherwise we will give a shot to=
 add=20
support based on Ot=E1vio works and submit upstream again.

Btw, we're using meta-ti from git.yoctoproject.org denzil branch and no=
t=20
Angstron, if this matters.

Thanks in advance

--=20
Helio Chissini de Castro
Collabora

