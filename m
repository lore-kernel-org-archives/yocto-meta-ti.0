Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8205AE00D30; Tue, 25 Jun 2019 06:27:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7FC16E00BAF
	for <meta-ti@yoctoproject.org>; Tue, 25 Jun 2019 06:27:22 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5PDRLMQ104006
	for <meta-ti@yoctoproject.org>; Tue, 25 Jun 2019 08:27:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561469241;
	bh=sep4/4pvRF2x1/MWznj7SYrdNmygzWs1FxonuHHkFmA=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=wn8rrygLP5jNcCryvpS5Wf3SqPg8Ib9x+3NwD5EPzPpQzKlJQDskoepyimB+PvTOo
	sOcspVxf8Gk9k5Ynlp71+JBiIUTgUbXx6Llpy0HCpWwbDRHm2xfy/VaDgyfj5PUXwL
	YfKAFN8Vh8kCM9/8z7lAuxyIl9ribDigv+3R2dbQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5PDRLMH006083
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 25 Jun 2019 08:27:21 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 25 Jun 2019 08:27:21 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.1713.004; Tue, 25 Jun 2019 08:27:21 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [EXTERNAL] [meta-ti] [thud/master][PATCH] conf/machine: rename
	"sgx" flag to "gpu" in MACHINE_FEATURES
Thread-Index: AQHVKv89o7ILFNpig0aZBl7/bPSPyKarvClg
Date: Tue, 25 Jun 2019 13:27:21 +0000
Message-ID: <f8b551aa87c04dd999c570665023a9dc@ti.com>
References: <1561430365-14142-1-git-send-email-denys@ti.com>
In-Reply-To: <1561430365-14142-1-git-send-email-denys@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.30.184]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [thud/master][PATCH] conf/machine: rename "sgx" flag to "gpu" in MACHINE_FEATURES
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
X-List-Received-Date: Tue, 25 Jun 2019 13:27:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This looks good to me.

ACK.

-Gowtham

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoprojec=
t.org] On Behalf Of
>Dmytriyenko, Denys
>Sent: Monday, June 24, 2019 9:39 PM
>To: meta-ti@yoctoproject.org
>Subject: [EXTERNAL] [meta-ti] [thud/master][PATCH] conf/machine: rename "s=
gx" flag to "gpu" in
>MACHINE_FEATURES
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> conf/machine/include/k3.inc       | 2 +-
> conf/machine/include/omap-a15.inc | 2 +-
> conf/machine/include/omap3.inc    | 2 +-
> conf/machine/include/ti33x.inc    | 2 +-
> conf/machine/include/ti43x.inc    | 2 +-
> conf/machine/pandaboard.conf      | 2 +-
> 6 files changed, 6 insertions(+), 6 deletions(-)
>
>diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
>index 22fdeb9..8b836ea 100644
>--- a/conf/machine/include/k3.inc
>+++ b/conf/machine/include/k3.inc
>@@ -29,5 +29,5 @@ MACHINE_GUI_CLASS =3D "smallscreen"
> UBI_VOLNAME =3D "rootfs"
>
> # List common SoC features, may need to add touchscreen for specific mach=
ines
>-MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen als=
a ethernet pci sgx"
>+MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen als=
a ethernet pci gpu"
> # Not ready yet - dsp mmip
>diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap=
-a15.inc
>index 233b45f..cc05536 100644
>--- a/conf/machine/include/omap-a15.inc
>+++ b/conf/machine/include/omap-a15.inc
>@@ -36,4 +36,4 @@ MACHINE_GUI_CLASS =3D "smallscreen"
> UBI_VOLNAME =3D "rootfs"
>
> # List common SoC features, may need to add touchscreen for specific mach=
ines
>-MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen als=
a ethernet sgx mmip dsp"
>+MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen als=
a ethernet gpu mmip dsp"
>diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.i=
nc
>index 9270cbb..489f1f9 100644
>--- a/conf/machine/include/omap3.inc
>+++ b/conf/machine/include/omap3.inc
>@@ -39,4 +39,4 @@ UBOOT_LOADADDRESS =3D "0x80008000"
> EXTRA_IMAGEDEPENDS +=3D "u-boot"
>
> # List common SoC features, may need to add touchscreen/ethernet for spec=
ific machines
>-MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen als=
a sgx"
>+MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen als=
a gpu"
>diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.i=
nc
>index 5a0ad54..8ddae81 100644
>--- a/conf/machine/include/ti33x.inc
>+++ b/conf/machine/include/ti33x.inc
>@@ -52,7 +52,7 @@ UBI_VOLNAME =3D "rootfs"
> EXTRA_IMAGEDEPENDS +=3D "u-boot"
>
> # List common SoC features, may need to add touchscreen for specific mach=
ines
>-MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen als=
a ethernet sgx"
>+MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen als=
a ethernet gpu"
>
> # Set the list of device targets for ti-pdk class recipes
> TI_PDK_LIMIT_SOCS =3D "am335x"
>diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.i=
nc
>index d966eaf..a0cc9cc 100644
>--- a/conf/machine/include/ti43x.inc
>+++ b/conf/machine/include/ti43x.inc
>@@ -50,7 +50,7 @@ UBI_VOLNAME =3D "rootfs"
> EXTRA_IMAGEDEPENDS +=3D "u-boot"
>
> # List common SoC features, may need to add touchscreen for specific mach=
ines
>-MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen als=
a ethernet sgx"
>+MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen als=
a ethernet gpu"
>
> # Set the list of device targets for ti-pdk class recipes
> TI_PDK_LIMIT_SOCS =3D "am437x"
>diff --git a/conf/machine/pandaboard.conf b/conf/machine/pandaboard.conf
>index f01472d..edfc612 100644
>--- a/conf/machine/pandaboard.conf
>+++ b/conf/machine/pandaboard.conf
>@@ -13,4 +13,4 @@ KERNEL_DEVICETREE =3D "omap4-panda.dtb omap4-panda-a4.dt=
b omap4-panda-es.dtb"
> SERIAL_CONSOLES =3D "115200;ttyS2"
>
> MACHINE_EXTRA_RRECOMMENDS =3D " kernel-modules"
>-MACHINE_FEATURES =3D "kernel26 wifi bluetooth alsa apm ext2 screen usbgad=
get usbhost vfat sgx"
>+MACHINE_FEATURES =3D "kernel26 wifi bluetooth alsa apm ext2 screen usbgad=
get usbhost vfat gpu"
>--
>2.7.4
>
>--
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

