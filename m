Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03051E016E2
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 05:36:46 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9ICaklh026760
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 07:36:46 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9ICaknH022136
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 07:36:46 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Fri, 18 Oct 2013 07:36:46 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] linux-ti-glsdk: Update to latest fixes
Thread-Index: AQHOy/qcyyOtUsqTBEK61JFV5zlbaZn6ZVLg
Date: Fri, 18 Oct 2013 12:36:45 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597C17DF@DLEE11.ent.ti.com>
References: <20131018120716.GA3238@ti.com>
In-Reply-To: <20131018120716.GA3238@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] linux-ti-glsdk: Update to latest fixes
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
X-List-Received-Date: Fri, 18 Oct 2013 12:36:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Hingolikar, Mrinmayee
>Sent: Friday, October 18, 2013 7:07 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH] linux-ti-glsdk: Update to latest fixes
>
> * Kernel source migration from git.ti.com to omapzoom.org

Any particular reason why to move the sources?

> * Add support for VIP and VPE
> * Add wilink/wlan support
> * Enable rpmsg/remoteproc driver for multimedia
>
>Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>---
> recipes-kernel/linux/linux-ti-glsdk_3.8.bb |    8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-
>kernel/linux/linux-ti-glsdk_3.8.bb
>index 9e3e499..82ae16e 100644
>--- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
>+++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
>@@ -18,14 +18,14 @@ DEFAULT_PREFERENCE =3D "-1"
>
> S =3D "${WORKDIR}/git"
>
>-BRANCH =3D "master"
>+BRANCH =3D "p-ti-glsdk-3.8.y"
>
>-SRCREV =3D "6076e6882d1d6a64b104e42e56a3eada36605cb3"
>+SRCREV =3D "cc16f99176bf083829c028f9af5b8eb560debcc1"
> PV =3D "3.8.13"
>
> # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause
>a rebuild
>-MACHINE_KERNEL_PR_append =3D "b+gitr${SRCPV}"
>+MACHINE_KERNEL_PR_append =3D "c+gitr${SRCPV}"
>
>-SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-3-8-y-
>kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
>+SRC_URI =3D
>"git://git.omapzoom.org/kernel/omap.git;protocol=3Dgit;branch=3D${BRAN
>CH} \
>            file://defconfig \
>           "
>--
>1.7.9.5
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

