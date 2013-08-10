Return-Path: <kgy@teledigit.eu>
Received: from teledigit.eu (teledigit.eu [195.56.148.37])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 314BEE0048B
	for <meta-ti@yoctoproject.org>; Sat, 10 Aug 2013 07:50:02 -0700 (PDT)
X-AuthUser: kgy@teledigit.eu
Received: from kgy-pc.localnet ([46.107.59.216]:42333)
	by teledigit.eu with [XMail 1.27 ESMTP Server]
	id <S2BC4C> for <meta-ti@yoctoproject.org> from <kgy@teledigit.eu>;
	Sat, 10 Aug 2013 16:49:25 +0200
From: Kovesdi Gyorgy <kgy@teledigit.eu>
To: "Sundareson, Prabindh" <prabu@ti.com>
Date: Sat, 10 Aug 2013 17:48:52 +0200
Message-ID: <2080630.Ym40fTraDf@kgy-pc>
User-Agent: KMail/4.8.5 (Linux/3.4.47-2.38-desktop; KDE/4.8.5; i686; ; )
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB8E6DA@DBDE04.ent.ti.com>
References: <1687303.zqgYtDvr2z@kgy-pc>
	<321768C95D21724485BCE784F1BE98473EB8E6DA@DBDE04.ent.ti.com>
MIME-Version: 1.0
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: How to compile omap3-sgx-modules_4.09.00.01
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
X-List-Received-Date: Sat, 10 Aug 2013 14:50:04 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

> It appears you are trying to build a drm driver - correct ?
Yes, i would need a working OpenGL on my Beagleboard-C4 with 3.x kernel=
. (4.05=20
works well with 2.6 but crashes with 3.x)

> ________________________________________
> From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.=
org] on
> behalf of Kovesdi Gyorgy [kgy@teledigit.eu] Sent: Saturday, August 10=
, 2013
> 4:28 PM
> To: meta-ti mailing list
> Subject: [meta-ti] How to compile omap3-sgx-modules_4.09.00.01
>=20
> Hi,
>=20
> I tried to compile recent versions (4.08 or 4.09) of SGX modules for =
my
> Beagleboard-C4 using the current Yoctoproject environment (tried Poky=
,
> beagleboard-dylan-9.0.0, and Angstrom Linux with the same result).
>=20
> In every case i got this error message:
> | make[3]: *** No rule to make target
>=20
> `/home/kgy/work/Yocto/poky/build/out/work/beagleboard-poky-linux-
> gnueabi/omap3-sgx-modules/4.09.00.01-
> r124a/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/linux_d=
rm/drm_
> auth.o', needed by
> `/home/kgy/work/Yocto/poky/build/out/work/beagleboard-poky-linux-
> gnueabi/omap3-sgx-modules/4.09.00.01-
> r124a/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/linux_d=
rm/drm.
> o'. Stop.
>=20
> Please help me to compile it!
>=20
> Thanx in advance
> Gy=F6rgy K=F6vesdi
>=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

