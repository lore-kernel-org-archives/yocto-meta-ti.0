Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1328CE013A6
	for <meta-ti@yoctoproject.org>; Mon,  3 Sep 2012 02:11:37 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q839BbFU007047;
	Mon, 3 Sep 2012 04:11:37 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q839BbT7010214;
	Mon, 3 Sep 2012 04:11:37 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Mon, 3 Sep 2012 04:11:37 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] libgles-omap3: Pull in changes from arago to
	meta-ti
Thread-Index: AQHNia9aFVeZWOSSTkWPxypu5ZiR35d4oQ8A//+ye0A=
Date: Mon, 3 Sep 2012 09:11:36 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2B3D9F@DFLE09.ent.ti.com>
References: <1346662382-9673-1-git-send-email-fcooper27jr@gmail.com>
	<5100579D-2BFE-4867-94CC-A7EB81D8942C@dominion.thruhere.net>
In-Reply-To: <5100579D-2BFE-4867-94CC-A7EB81D8942C@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] libgles-omap3: Pull in changes from arago to	meta-ti
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
X-List-Received-Date: Mon, 03 Sep 2012 09:11:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Valid point. I looked at commit 6cff7f12d22523b44803b5e191dc18e4d9c93784 an=
d the message wasn't clear why this was changed and looked like the tweak c=
ould of left out something. Looking closer I can see that this wasn't the c=
ase. I will send an updated patch shortly.

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Koen Kooi
Sent: Monday, September 03, 2012 3:44 AM
To: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH] libgles-omap3: Pull in changes from arago to=
 meta-ti


Op 3 sep. 2012, om 10:53 heeft "Franklin S. Cooper Jr" <fcooperjr27@gmail.c=
om> het volgende geschreven:

> * Package additional include files from pvr2d and OGLES/GLES. This is=20
> required  when trying to build qt4-embedded-gles (currently being=20
> developed)
> * Other minor tweaks.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
> ---
> recipes-graphics/libgles/libgles-omap3.inc    |   32 +++++++++++++-------=
----
> recipes-graphics/libgles/libgles-omap3/rc.pvr |    7 +++++
> 2 files changed, 24 insertions(+), 15 deletions(-)
>=20
> diff --git a/recipes-graphics/libgles/libgles-omap3.inc=20
> b/recipes-graphics/libgles/libgles-omap3.inc
> do_install () {
> @@ -133,8 +134,7 @@ do_install () {
>=20
> 	install -m 0755 ${BINLOCATION}/*_test ${D}${bindir}/
> 	install -m 0755 ${BINLOCATION}/gl* ${D}${bindir}/
> -	install -m 0755 ${BINLOCATION}/pvrsrvinit ${D}${bindir}/
> -
> +	install -m 0755 ${BINLOCATION}/p[dv]* ${D}${bindir}/
> 	install -m 0755 ${BINLOCATION}/xgles1test1 ${D}${bindir}/

You're reverting an older commit here without explaining why.
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

