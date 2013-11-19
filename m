Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9934E00543
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2013 12:23:04 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAJKN3Cp007199
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2013 14:23:03 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJKN3WC030918
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2013 14:23:03 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 19 Nov 2013 14:23:03 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 4/4] libgles-omap3: Update cputype to support
	3.12	and new device.
Thread-Index: AQHO5UA4aDKwGJMv+06jUfiEJdyO6pos/8RQ
Date: Tue, 19 Nov 2013 20:23:02 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159839F5C@DLEE11.ent.ti.com>
References: <1384880351-6571-1-git-send-email-fcooper@ti.com>
	<1384880351-6571-4-git-send-email-fcooper@ti.com>
In-Reply-To: <1384880351-6571-4-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] libgles-omap3: Update cputype to support 3.12	and new device.
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
X-List-Received-Date: Tue, 19 Nov 2013 20:23:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, November 19, 2013 10:59 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 4/4] libgles-omap3: Update cputype to
>support 3.12 and new device.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../libgles/libgles-omap3-x11_5.00.00.01.bb        |    2 +-
> recipes-graphics/libgles/libgles-omap3/cputype     |   25
>++++++++++++-------
> .../libgles/libgles-omap3_5.00.00.01.bb            |    2 +-
> 3 files changed, 18 insertions(+), 11 deletions(-)
>
>diff --git a/recipes-graphics/libgles/libgles-omap3-
>x11_5.00.00.01.bb b/recipes-graphics/libgles/libgles-omap3-
>x11_5.00.00.01.bb
>index df53306..0bcf08c 100644
>--- a/recipes-graphics/libgles/libgles-omap3-x11_5.00.00.01.bb
>+++ b/recipes-graphics/libgles/libgles-omap3-x11_5.00.00.01.bb
>@@ -2,7 +2,7 @@ require libgles-omap3-x11.inc
>
> LICENSE =3D "TSPA"
>
>-PR =3D "${INC_PR}.0"
>+PR =3D "${INC_PR}.1"
>
> DEFAULT_PREFERENCE =3D "-1"
>
>diff --git a/recipes-graphics/libgles/libgles-omap3/cputype
>b/recipes-graphics/libgles/libgles-omap3/cputype
>index 4448c30..de534a8 100755
>--- a/recipes-graphics/libgles/libgles-omap3/cputype
>+++ b/recipes-graphics/libgles/libgles-omap3/cputype
>@@ -1,17 +1,24 @@
> #!/bin/sh
>
>+
>+legacy_machine_id() { # return the machine ID
>+        awk 'BEGIN { FS=3D": " } /Hardware/ \
>+                { gsub(" ", "_", $2); print tolower($2) } '
></proc/cpuinfo
>+}
>+
> machine_id() { # return the machine ID
>-	awk 'BEGIN { FS=3D": " } /Hardware/ \
>-		{ gsub(" ", "_", $2); print tolower($2) } '
></proc/cpuinfo
>+        cat /proc/cpuinfo | grep Hardware | awk -F" " '{ print $4
>}'
> }
>
>-if [ "$(machine_id)" =3D "ti8168evm" ] ; then
>-	echo TI816x
>-elif [ "$(machine_id)" =3D "am335xevm" ] ; then
>+if [ "$(machine_id)" =3D "ti8168evm" -o "$(legacy_machine_id)" =3D
>"ti8168evm" ] ; then
>+        echo TI816x
>+elif [ "$(machine_id)" =3D "AM33XX" -o "$(legacy_machine_id)" =3D
>"am335xevm" ] ; then
>     echo TI33XX
>+elif [ "$(machine_id)" =3D "AM43" ] ; then
>+    echo TI43XX
> else
>-	devmem2 0x4800244c | \
>-	grep 'Read at address' | \
>-	sed -e 's/.*): //' | \
>-	sed -e 's/0x00005C00/OMAP3503/' -e 's/0x00001C00/OMAP3515/'
>-e 's/0x00004C00/OMAP3525/' -e 's/0x00000C00/OMAP3530/' -e
>'s/0x00005E00/OMAP3503/' -e 's/0x00001E00/OMAP3515/' -e
>'s/0x00004E00/OMAP3525/' -e 's/0x00000E00/OMAP3530/' -e
>'s/0x00000CC0/OMAP3530/'
>+    devmem2 0x4800244c | \
>+    grep 'Read at address' | \
>+    sed -e 's/.*): //' | \
>+    sed -e 's/0x00005C00/OMAP3503/' -e 's/0x00001C00/OMAP3515/' -
>e 's/0x00004C00/OMAP3525/' -e 's/0x00000C00/OMAP3530/' -e
>'s/0x00005E00/OMAP3503/' -e 's/0x00001E00/OMAP3515/' -e
>'s/0x00004E00/OMAP3525/' -e 's/0x00000E00/OMAP3530/' -e
>'s/0x00000CC0/OMAP3530/'
> fi
>diff --git a/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
>b/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
>index de6ba55..cb96ca7 100644
>--- a/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
>+++ b/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
>@@ -2,7 +2,7 @@ require libgles-omap3-no-x.inc
>
> LICENSE =3D "TSPA"
>
>-PR =3D "${INC_PR}.0"
>+PR =3D "${INC_PR}.1"
>
> DEFAULT_PREFERENCE =3D "-1"
>
>--
>1.7.0.4
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

