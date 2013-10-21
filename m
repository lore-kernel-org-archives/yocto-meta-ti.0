Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A37B0E013B7
	for <meta-ti@yoctoproject.org>; Mon, 21 Oct 2013 07:31:51 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9LEVp1I018184
	for <meta-ti@yoctoproject.org>; Mon, 21 Oct 2013 09:31:51 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9LEVpid030540
	for <meta-ti@yoctoproject.org>; Mon, 21 Oct 2013 09:31:51 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Mon, 21 Oct 2013 09:31:51 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCHv2] u-boot-glsdk: Update to latest fixes
Thread-Index: AQHOzl0LErpcBoNTEUSybRvrBUqVV5n/N79w
Date: Mon, 21 Oct 2013 14:31:50 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597CA85F@DLEE11.ent.ti.com>
References: <20131021125642.GA5975@ti.com>
In-Reply-To: <20131021125642.GA5975@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCHv2] u-boot-glsdk: Update to latest fixes
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
X-List-Received-Date: Mon, 21 Oct 2013 14:31:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Hingolikar, Mrinmayee
>Sent: Monday, October 21, 2013 7:57 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCHv2] u-boot-glsdk: Update to latest fixes
>
> * Migration of u-boot code to omapzoom.org. The development tree
>is shared
>   between the Linux and Android teams.This enables a common u-
>boot development
>   platform for both the teams for better alignment.
> * Enable UART boot mode for dra7xx
> * Add VIP,VPE and Ethernet crossbar setting for dra7xx
> * Add SPL API, QSPI, and serial flash support of dra7xx
>
>v2:
>
> * Update to conditional assignment for BRANCH and SRCREV
>
>Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>---
> recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb |    6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
>b/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
>index d60ef44..1805020 100644
>--- a/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
>+++ b/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
>@@ -6,11 +6,11 @@ PR =3D "r0+gitr${SRCPV}"
>
> DEFAULT_PREFERENCE =3D "-1"
>
>-SRC_URI =3D "git://git.ti.com/glsdk/glsdk-u-
>boot.git;protocol=3Dgit;branch=3D${BRANCH}"
>+SRC_URI =3D "git://git.omapzoom.org/repo/u-
>boot.git;protocol=3Dgit;branch=3D${BRANCH}"
>
>-BRANCH ?=3D "master"
>+BRANCH ?=3D "p-ti-u-boot-2013.04"
>
>-SRCREV =3D "81836e8cc84bd6523d9a4e187965dcd1633c4bc9"
>+SRCREV ?=3D "76447484441a4b8e00840a2bde74e66dbac9e631"
>
> SPL_BINARY =3D "MLO"
> SPL_UART_BINARY =3D "u-boot-spl.bin"
>--
>1.7.9.5
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

