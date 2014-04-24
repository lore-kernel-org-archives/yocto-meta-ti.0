Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0CE38E006EC
	for <meta-ti@yoctoproject.org>; Thu, 24 Apr 2014 05:44:05 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3OCi42p010984;
	Thu, 24 Apr 2014 07:44:04 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OCi3Vg027096;
	Thu, 24 Apr 2014 07:44:04 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 24 Apr 2014 07:44:03 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 2/3] am33x-cm3, ti-msp430: update license
	from TI-BSD to BSD-3-Clause
Thread-Index: AQHPXz7I92xSXTnrrEKi64SCl/P81JsgtesQ
Date: Thu, 24 Apr 2014 12:44:03 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CFB211C@DLEE11.ent.ti.com>
References: <1398290092-20034-1-git-send-email-denis@denix.org>
	<1398290092-20034-2-git-send-email-denis@denix.org>
In-Reply-To: <1398290092-20034-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] am33x-cm3, ti-msp430: update license from TI-BSD to BSD-3-Clause
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
X-List-Received-Date: Thu, 24 Apr 2014 12:44:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Wednesday, April 23, 2014 4:55 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 2/3] am33x-cm3, ti-msp430: update
>license from TI-BSD to BSD-3-Clause
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Per recommendation from OSRB and Legal.
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> recipes-bsp/ti/am33x-cm3_git.bb                   | 4 ++--
> recipes-ti/msp430/ti-msp430-chronos_1.05.00.00.bb | 2 +-
> 2 files changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-
>bsp/ti/am33x-cm3_git.bb
>index 01d1273..42f20da 100644
>--- a/recipes-bsp/ti/am33x-cm3_git.bb
>+++ b/recipes-bsp/ti/am33x-cm3_git.bb
>@@ -1,10 +1,10 @@
> DESCRIPTION =3D "Cortex-M3 binary blob for suspend-resume"
>
>-LICENSE =3D "TI-BSD"
>+LICENSE =3D "BSD-3-Clause"
> LIC_FILES_CHKSUM =3D
>"file://License.txt;md5=3D7bdc54a749ab7a7dea999d25d99a41b8"
>
> PV =3D "05.00.00.03"
>-PR =3D "r0"
>+PR =3D "r1"
>
> # Make package machine specific due to different init scripts
> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>diff --git a/recipes-ti/msp430/ti-msp430-chronos_1.05.00.00.bb
>b/recipes-ti/msp430/ti-msp430-chronos_1.05.00.00.bb
>index 0a48b17..dd493f8 100644
>--- a/recipes-ti/msp430/ti-msp430-chronos_1.05.00.00.bb
>+++ b/recipes-ti/msp430/ti-msp430-chronos_1.05.00.00.bb
>@@ -1,6 +1,6 @@
> DESCRIPTION =3D "eZ430 Chronos Tools - MSP430 Development
>Kit/Watch"
> HOMEPAGE =3D "http://processors.wiki.ti.com/index.php/EZ430-
>Chronos"
>-LICENSE =3D "TI-BSD"
>+LICENSE =3D "BSD-3-Clause"

Why no PR bump here?  And as we look at Dora should we enable the PR servic=
e?

> # We can't use the actualy source file, since it has space in its
>name :(
> LIC_FILES_CHKSUM =3D "file://eZ430-
>Chronos_CC_1_1.tcl;md5=3D59ba6ee0a26650ec660a4e65a9462806"
>
>--
>1.9.2
>
>--
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

