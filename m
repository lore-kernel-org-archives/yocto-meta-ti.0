Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8FDBE013CB
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 10:46:44 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5RHkiHB013519
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 12:46:44 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5RHkiJw000681
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 12:46:44 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 27 Jun 2013 12:46:43 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Heroor, Siddharth" <heroor@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] libdrm: Add GLSDK specific staging tree for
	omap-a15
Thread-Index: AQHOc1oe16GALWbbqE27p1ENN8XNuZlJ0/EQ
Date: Thu, 27 Jun 2013 17:46:43 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015961D1CF@DLEE11.ent.ti.com>
References: <20130627171636.GA7291@ti.com>
In-Reply-To: <20130627171636.GA7291@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] libdrm: Add GLSDK specific staging tree for	omap-a15
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
X-List-Received-Date: Thu, 27 Jun 2013 17:46:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Heroor, Siddharth
>Sent: Thursday, June 27, 2013 12:17 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH] libdrm: Add GLSDK specific staging tree
>for omap-a15
>
>* Override SRC_URI to use TI's tree at
>https://git.ti.com/glsdk/libdrm
>  This tree includes patches on top of the upstream libdrm for
>  omap5 and dra7xx class of devices.
>
>Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>Signed-off-by: Siddharth Heroor <heroor@ti.com>
>---
> recipes-graphics/drm/libdrm_2.4.41.bb |   15 +++++++++++++++
> 1 files changed, 15 insertions(+), 0 deletions(-)
> create mode 100644 recipes-graphics/drm/libdrm_2.4.41.bb
>
>diff --git a/recipes-graphics/drm/libdrm_2.4.41.bb b/recipes-
>graphics/drm/libdrm_2.4.41.bb
>new file mode 100644
>index 0000000..31f7cee
>--- /dev/null
>+++ b/recipes-graphics/drm/libdrm_2.4.41.bb

I thought you were going to bbappend this instead of overlaying the whole r=
ecipe.

>@@ -0,0 +1,15 @@
>+require recipes-graphics/drm/libdrm.inc
>+
>+COMPATIBLE_MACHINE =3D "omap-a15"
>+
>+DEFAULT_PREFERENCE =3D "-1"
>+
>+EXTRA_OECONF +=3D "--enable-omap-experimental-api"
>+
>+SRC_URI =3D "git://git.ti.com/glsdk/libdrm.git;protocol=3Dgit"
>+SRCREV =3D "3cb5405084111193cedb8796d259b56560b088f0"
>+
>+# Append to the PR so that a new SRCREV will cause a rebuild
>+PR_append =3D "a+gitr${SRCPV}"

I always had issue with this.  I'm not sure that this statement holds true =
because whether a new SRCREV will cause a rebuild would depend on whether t=
hat SRCREV sorts higher than the old one.  Unless something else has change=
d.  This is useful though if you want to know what SRCREV was used for a bu=
ild.

That being said if you were going to overlay this recipe the PR should be s=
omething like

PR =3D "${INC_PR}.0"

Right now you are appending to the default since PR is not defined.  With a=
 bbappend you should append a -arago flag.

So this comes back to why no bbappend?  Is it because the base version in o=
e-core is 2.4.39 and not 2.4.41?  Can you not append the _git version of th=
e recipe and update the PV appropriately?

>+
>+S =3D "${WORKDIR}/git"
>--
>1.7.0.4
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

