Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21A7EE00546
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2013 12:21:17 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAJKLHxd015628
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2013 14:21:17 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJKLG65024919
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2013 14:21:16 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 19 Nov 2013 14:21:16 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 2/4] libgles-omap3: Add new 5.00.00.01
	Graphics	SDK alpha release
Thread-Index: AQHO5UAtSz/jYwoXlUypP5VE9RYI35os/0Ug
Date: Tue, 19 Nov 2013 20:21:16 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159839EA3@DLEE11.ent.ti.com>
References: <1384880351-6571-1-git-send-email-fcooper@ti.com>
	<1384880351-6571-2-git-send-email-fcooper@ti.com>
In-Reply-To: <1384880351-6571-2-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] libgles-omap3: Add new 5.00.00.01 Graphics	SDK alpha release
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
X-List-Received-Date: Tue, 19 Nov 2013 20:21:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, November 19, 2013 10:59 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 2/4] libgles-omap3: Add new 5.00.00.01
>Graphics SDK alpha release
>
>* A new Graphics SDK that support 3.12 kernel for am335x
>* This Graphics SDK also adds initial support for AM43x
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../rc.pvr                                         |   28
>+++++++++++++------
> .../rc_dri.pvr                                     |   28
>++++++++++++-------
> ...08.00.02.bb =3D> libgles-omap3-x11_5.00.00.01.bb} |   29
>+++++++++++++------
> ...3_4.09.00.01.bb =3D> libgles-omap3_5.00.00.01.bb} |   24
>+++++++---------
> 4 files changed, 68 insertions(+), 41 deletions(-)
> copy recipes-graphics/libgles/{libgles-omap3-x11-4.09.00.01 =3D>
>libgles-omap3-5.00.00.01}/rc.pvr (87%)
> mode change 100644 =3D> 100755
> copy recipes-graphics/libgles/{libgles-omap3-x11-4.09.00.01 =3D>
>libgles-omap3-5.00.00.01}/rc_dri.pvr (88%)
> mode change 100644 =3D> 100755
> copy recipes-graphics/libgles/{libgles-omap3_4.08.00.02.bb =3D>
>libgles-omap3-x11_5.00.00.01.bb} (72%)
> copy recipes-graphics/libgles/{libgles-omap3_4.09.00.01.bb =3D>
>libgles-omap3_5.00.00.01.bb} (42%)
>
>diff --git a/recipes-graphics/libgles/libgles-omap3-x11-
>4.09.00.01/rc.pvr b/recipes-graphics/libgles/libgles-omap3-
>5.00.00.01/rc.pvr
>old mode 100644
>new mode 100755
>similarity index 87%
>copy from recipes-graphics/libgles/libgles-omap3-x11-
>4.09.00.01/rc.pvr
>copy to recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc.pvr
>index 590d06c..830d602
>--- a/recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/rc.pvr
>+++ b/recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc.pvr
>@@ -41,13 +41,20 @@ fbset -vyres $(expr $YRES \* 3)
>
> sgxprepare () {
> 	echo Starting PVR
>-	insmod $(busybox find /lib/modules/$(uname -r) -name
>"pvrsrvkm.ko")
>
>-    if [ "$?" !=3D "0" ]
>-    then
>-        echo "Could not find pvrsrvkm driver"
>-        exit 1
>-    fi
>+	lsmod | grep pvrsrvkm > /dev/null
>+
>+
>+	if [ "$?" !=3D "0" ]
>+	then
>+		insmod $(busybox find /lib/modules/$(uname -r) -name
>"pvrsrvkm.ko")
>+
>+		if [ "$?" !=3D "0" ]
>+		then
>+			echo "Could not find pvrsrvkm driver"
>+			exit 1
>+		fi
>+	fi
>
> 	modprobe omaplfb
> 	modprobe bufferclass_ti
>@@ -100,8 +107,12 @@ case $CPUTYPE in
> "TI33XX")
> 	sgxprepare
>
>-	devmem2 0x44e01104 w 0x0 > /dev/null
>-	devmem2 0x44e00904 w 0x2 > /dev/null
>+	ES_REVISION=3D"$(devmem2 0x56000014 | sed -e s:0x00010205:8: |
>tail -n1 | awk -F': ' '{print $2}')"
>+
>+	sgxfinish
>+	;;
>+"TI43XX")
>+	sgxprepare
>
> 	ES_REVISION=3D"$(devmem2 0x56000014 | sed -e s:0x00010205:8: |
>tail -n1 | awk -F': ' '{print $2}')"
>
>@@ -122,4 +133,3 @@ case $CPUTYPE in
> 	echo No SGX hardware, not starting PVR
> 	;;
> esac
>-
>diff --git a/recipes-graphics/libgles/libgles-omap3-x11-
>4.09.00.01/rc_dri.pvr b/recipes-graphics/libgles/libgles-omap3-
>5.00.00.01/rc_dri.pvr
>old mode 100644
>new mode 100755
>similarity index 88%
>copy from recipes-graphics/libgles/libgles-omap3-x11-
>4.09.00.01/rc_dri.pvr
>copy to recipes-graphics/libgles/libgles-omap3-
>5.00.00.01/rc_dri.pvr
>index bc44937..847e7a9
>--- a/recipes-graphics/libgles/libgles-omap3-x11-
>4.09.00.01/rc_dri.pvr
>+++ b/recipes-graphics/libgles/libgles-omap3-5.00.00.01/rc_dri.pvr
>@@ -54,13 +54,18 @@ sgxprepare () {
>
> 	modprobe drm
>
>-	insmod $(busybox find /lib/modules/$(uname -r) -name
>"pvrsrvkm.ko")
>+	lsmod | grep pvrsrvkm > /dev/null
>
>-    if [ "$?" !=3D "0" ]
>-    then
>-        echo "Could not find pvrsrvkm driver"
>-        exit 1
>-    fi
>+	if [ "$?" !=3D "0" ]
>+	then
>+		insmod $(busybox find /lib/modules/$(uname -r) -name
>"pvrsrvkm.ko")
>+
>+		if [ "$?" !=3D "0" ]
>+		then
>+			echo "Could not find pvrsrvkm driver"
>+			exit 1
>+		fi
>+	fi
>
> 	modprobe bufferclass_ti
>
>@@ -112,13 +117,17 @@ case $CPUTYPE in
> "TI33XX")
> 	sgxprepare
>
>-	devmem2 0x44e01104 w 0x0 > /dev/null
>-	devmem2 0x44e00904 w 0x2 > /dev/null
>-
> 	ES_REVISION=3D"$(devmem2 0x56000014 | sed -e s:0x00010205:8: |
>tail -n1 | awk -F': ' '{print $2}')"
>
> 	sgxfinish
> 	;;
>+"TI43XX")
>+	sgxprepare
>+
>+    ES_REVISION=3D"$(devmem2 0x56000014 | sed -e s:0x00010205:8: |
>tail -n1 | awk -F': ' '{print $2}')"
>+
>+	sgxfinish
>+	;;
> "TI816x")
> 	sgxprepare
>
>@@ -134,4 +143,3 @@ case $CPUTYPE in
> 	echo No SGX hardware, not starting PVR
> 	;;
> esac
>-
>diff --git a/recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb
>b/recipes-graphics/libgles/libgles-omap3-x11_5.00.00.01.bb
>similarity index 72%
>copy from recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb
>copy to recipes-graphics/libgles/libgles-omap3-x11_5.00.00.01.bb
>index e57ba42..df53306 100644
>--- a/recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb
>+++ b/recipes-graphics/libgles/libgles-omap3-x11_5.00.00.01.bb
>@@ -1,13 +1,16 @@
>-require libgles-omap3.inc
>+require libgles-omap3-x11.inc
>
> LICENSE =3D "TSPA"
>
>+PR =3D "${INC_PR}.0"
>+
> DEFAULT_PREFERENCE =3D "-1"
>
>-BINLOCATION_omap3  =3D "${S}/gfx_rel_es3.x"
>+BINLOCATION_omap3 =3D "${S}/gfx_rel_es3.x"
> BINLOCATION_ti816x =3D "${S}/gfx_rel_es6.x"
> BINLOCATION_ti814x =3D "${S}/gfx_rel_es6.x"
> BINLOCATION_ti33x =3D "${S}/gfx_rel_es8.x"
>+BINLOCATION_ti43x =3D "${S}/gfx_rel_es9.x"
>
> PLATFORM =3D "LinuxARMV7"
> PVR_INIT =3D "pvrsrvctl"
>@@ -16,11 +19,19 @@ PVR_INIT =3D "pvrsrvctl"
> # http://software-
>dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/i
>ndex_FDS.html
> # see libgles-omap3.inc for detailed installation instructions
>
>-SGXPV =3D "4_08_00_02"
>+SGXPV =3D "5_00_00_01"
> IMGPV =3D "1.9.2188537"
>-BINFILE =3D "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
>+
> TI_BIN_UNPK_WDEXT :=3D "/Graphics_SDK_${SGXPV}"
>-SRC_URI =3D "http://software-
>dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}
>/exports/${BINFILE} \
>+
>+BINFILE_HARDFP =3D
>"Graphics_SDK_setuplinux_${SGXPV}_hardfp_minimal_demos_alpha.bin "
>+MD5SUM_HARDFP =3D "ae6125d7f8a313ea5c02afded893052d"
>+SHA256SUM_HARDFP =3D
>"c2782a2f85024741722b936ec9dca66b858ae8561aa71b693f11e12d8c0385e0"
>+
>+# For now we only have hardfp version
>+BINFILE :=3D "${BINFILE_HARDFP}"
>+
>+SRC_URI =3D "http://software-
>dl.ti.com/dsps/dsps_public_sw/gfxsdk/${SGXPV}/exports/${BINFILE} \
>            file://cputype \
>            file://rc.pvr \
>            file://rc_dri.pvr \
>@@ -28,12 +39,12 @@ SRC_URI =3D "http://software-
>dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gf
>            file://99-bufferclass.rules  \
> "
>
>-SRC_URI[md5sum] =3D "0efa3a38266e6f41f8cc4fad0187f0d6"
>-SRC_URI[sha256sum] =3D
>"c732044b515a598e1fab661b7463aa9c53d4fa37f4980dfa85cd02b7468d0cd9"
>+SRC_URI[md5sum] :=3D "${MD5SUM_HARDFP}"
>+SRC_URI[sha256sum] :=3D "${SHA256SUM_HARDFP}"
>
> S =3D "${WORKDIR}/Graphics_SDK_${SGXPV}"
>
>-LIBGLESWINDOWSYSTEM ?=3D "${@base_contains('DISTRO_FEATURES',
>'x11',"libpvrPVR2D_DRIWSEGL.so" ,"libpvrPVR2D_FRONTWSEGL.so.1",
>d)}"
>+LIBGLESWINDOWSYSTEM ?=3D "libpvrPVR2D_DRIWSEGL.so"
>
> do_configure_append() {
>
>@@ -62,7 +73,7 @@ do_install_append() {
>     cp -pPr ${S}/include/pvr2d/*.h ${D}${includedir}
>     cp -pPr ${S}/include/OGLES/GLES ${D}${includedir}/
>
>-    rm ${D}${sysconfdir}/init.d/pvr-init
>+    rm -f ${D}${sysconfdir}/init.d/pvr-init
>
>     if [ "$SUPPORT_XORG" =3D "1" ]; then
>         cp -pP ${WORKDIR}/rc_dri.pvr
>${D}${sysconfdir}/init.d/pvr-init
>diff --git a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
>b/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
>similarity index 42%
>copy from recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
>copy to recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
>index d094b5c..de6ba55 100644
>--- a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
>+++ b/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
>@@ -2,7 +2,7 @@ require libgles-omap3-no-x.inc
>
> LICENSE =3D "TSPA"
>
>-PR =3D "${INC_PR}.2"
>+PR =3D "${INC_PR}.0"
>
> DEFAULT_PREFERENCE =3D "-1"
>
>@@ -10,6 +10,7 @@ BINLOCATION_omap3 =3D "${S}/gfx_rel_es3.x"
> BINLOCATION_ti816x =3D "${S}/gfx_rel_es6.x"
> BINLOCATION_ti814x =3D "${S}/gfx_rel_es6.x"
> BINLOCATION_ti33x =3D "${S}/gfx_rel_es8.x"
>+BINLOCATION_ti43x =3D "${S}/gfx_rel_es9.x"
>
> PLATFORM =3D "LinuxARMV7"
> PVR_INIT =3D "pvrsrvctl"
>@@ -18,30 +19,27 @@ PVR_INIT =3D "pvrsrvctl"
> # http://software-
>dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/i
>ndex_FDS.html
> # see libgles-omap3.inc for detailed installation instructions
>
>-SGXPV =3D "4_09_00_01"
>+SGXPV =3D "5_00_00_01"
> IMGPV =3D "1.9.2188537"
>
> TI_BIN_UNPK_WDEXT :=3D "/Graphics_SDK_${SGXPV}"
>
>-# Select the corresponding hardfp/softfp filename and checksums
>based on tune flags
>-BINFILE_SOFTFP =3D
>"Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
>-MD5SUM_SOFTFP =3D "bd35e9d8843aff3a2aca9d41e7db1c7d"
>-SHA256SUM_SOFTFP =3D
>"eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
>
>-BINFILE_HARDFP =3D
>"Graphics_SDK_setuplinux_${SGXPV}_hardfp_minimal_demos.bin"
>-MD5SUM_HARDFP =3D "c9f656dce062d1ab10afffd4dfb71b67"
>-SHA256SUM_HARDFP =3D
>"dbfeba8e1298f139495816334edec1455e6b49b1e11bd1b2aa0a888e5788bb6b"
>+BINFILE_HARDFP =3D
>"Graphics_SDK_setuplinux_${SGXPV}_alpha_hardfp_minimal_demos.bin"
>+MD5SUM_HARDFP =3D "ae6125d7f8a313ea5c02afded893052d"
>+SHA256SUM_HARDFP =3D
>"c2782a2f85024741722b936ec9dca66b858ae8561aa71b693f11e12d8c0385e0"
>
>-BINFILE =3D "${@base_contains('TUNE_FEATURES', 'callconvention-
>hard', '${BINFILE_HARDFP}', '${BINFILE_SOFTFP}', d)}"
>+# For now we only have hardfp version
>+BINFILE :=3D "${BINFILE_HARDFP}"
>
>-SRC_URI =3D "http://software-
>dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}
>/exports/${BINFILE} \
>+SRC_URI =3D "http://software-
>dl.ti.com/dsps/dsps_public_sw/gfxsdk/${SGXPV}/exports/${BINFILE} \
>            file://cputype \
>            file://rc.pvr \
>            file://99-bufferclass.rules  \
> "
>
>-SRC_URI[md5sum] :=3D "${@base_contains('TUNE_FEATURES',
>'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}',
>d)}"
>-SRC_URI[sha256sum] :=3D "${@base_contains('TUNE_FEATURES',
>'callconvention-hard', '${SHA256SUM_HARDFP}',
>'${SHA256SUM_SOFTFP}', d)}"
>+SRC_URI[md5sum] :=3D "${MD5SUM_HARDFP}"
>+SRC_URI[sha256sum] :=3D "${SHA256SUM_HARDFP}"
>
> S =3D "${WORKDIR}/Graphics_SDK_${SGXPV}"
>
>--
>1.7.0.4
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

