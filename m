Return-Path: <kgy@teledigit.eu>
Received: from teledigit.eu (teledigit.eu [195.56.148.37])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9002DE00406
	for <meta-ti@yoctoproject.org>; Sat, 10 Aug 2013 02:59:22 -0700 (PDT)
X-AuthUser: kgy@teledigit.eu
Received: from kgy-pc.localnet ([46.107.59.216]:40157)
	by teledigit.eu with [XMail 1.27 ESMTP Server]
	id <S2BC2A> for <meta-ti@yoctoproject.org> from <kgy@teledigit.eu>;
	Sat, 10 Aug 2013 11:58:47 +0200
From: Kovesdi Gyorgy <kgy@teledigit.eu>
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Date: Sat, 10 Aug 2013 12:58:15 +0200
Message-ID: <1687303.zqgYtDvr2z@kgy-pc>
User-Agent: KMail/4.8.5 (Linux/3.4.47-2.38-desktop; KDE/4.8.5; i686; ; )
MIME-Version: 1.0
Subject: How to compile omap3-sgx-modules_4.09.00.01
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
X-List-Received-Date: Sat, 10 Aug 2013 09:59:26 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

I tried to compile recent versions (4.08 or 4.09) of SGX modules for my=
=20
Beagleboard-C4 using the current Yoctoproject environment (tried Poky,=20=

beagleboard-dylan-9.0.0, and Angstrom Linux with the same result).

In every case i got this error message:

| make[3]: *** No rule to make target=20
`/home/kgy/work/Yocto/poky/build/out/work/beagleboard-poky-linux-
gnueabi/omap3-sgx-modules/4.09.00.01-
r124a/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm=
/drm_auth.o',=20
needed by `/home/kgy/work/Yocto/poky/build/out/work/beagleboard-poky-li=
nux-
gnueabi/omap3-sgx-modules/4.09.00.01-
r124a/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm=
/drm.o'. =20
Stop.

Please help me to compile it!

Thanx in advance
Gy=F6rgy K=F6vesdi


