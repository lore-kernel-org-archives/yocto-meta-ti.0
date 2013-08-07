Return-Path: <kgy@teledigit.eu>
Received: from teledigit.eu (teledigit.eu [195.56.148.37])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91130E0052E
	for <meta-ti@yoctoproject.org>; Wed,  7 Aug 2013 11:42:08 -0700 (PDT)
X-AuthUser: kgy@teledigit.eu
Received: from kgy-pc.localnet ([46.107.59.216]:39000)
	by teledigit.eu with [XMail 1.27 ESMTP Server]
	id <S2B8F7> for <meta-ti@yoctoproject.org> from <kgy@teledigit.eu>;
	Wed, 7 Aug 2013 20:41:34 +0200
From: Kovesdi Gyorgy <kgy@teledigit.eu>
To: meta-ti@yoctoproject.org
Date: Wed, 07 Aug 2013 21:41:04 +0200
Message-ID: <1477888.0bvqrzpNgz@kgy-pc>
User-Agent: KMail/4.8.5 (Linux/3.4.47-2.38-desktop; KDE/4.8.5; i686; ; )
MIME-Version: 1.0
Subject: Select proper versions for Beagleboard-C4
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
X-List-Received-Date: Wed, 07 Aug 2013 18:42:13 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

I have a Beagleboard-C4 and would like to have a working environment wi=
th=20
OpenGL support. My question is which kernel and which TI driver version=
 is=20
necessary to do this.
Currently the kernel 2.6.39 and 4.05.00.03 is the only working combinat=
ion for=20
me, but it would be necessary to use 3.x kernel.
I tried the followings:
3.x kernel with 4.05.00.03: it leads to kernel crash (see my previous m=
ail).
3.8.13 kernel with any newer TI version (>=3D 4.08.*): cannot be compil=
ed, the=20
result is the following:
| make[3]: *** No rule to make target `/home/kgy/work/Angstrom/try-007-=

X/build/tmp-angstrom_v2012_12-eglibc/work/beagleboard-angstrom-linux-
gnueabi/omap3-sgx-modules-4.08.00.01-
r122a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm=
/drm_auth.o',=20
needed by `/home/kgy/work/Angstrom/try-007-X/build/tmp-angstrom_v2012_1=
2-
eglibc/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modules-4.08.0=
0.01-
r122a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm=
/drm.o'. =20
Stop.
| make[2]: *** [/home/kgy/work/Angstrom/try-007-X/build/tmp-angstrom_v2=
012_12-
eglibc/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modules-4.08.0=
0.01-
r122a/Graphics_SDK_4_08_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm=
] Error=20
2

Please show me a working combination.

Thanx in advance
Gy=F6rgy K=F6vesdi


