Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 443F0E0049D
	for <meta-ti@yoctoproject.org>; Thu,  4 Oct 2012 22:02:27 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9552OWu011481;
	Fri, 5 Oct 2012 00:02:24 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9552Fwb028259;
	Fri, 5 Oct 2012 00:02:23 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 00:01:05 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] libgles-omap3.inc: Tweak PLATFORM variable.
Thread-Index: AQHNlSoXNrt4SkCMtEOTGUFbAqwtaZeqQnOQ
Date: Fri, 5 Oct 2012 05:01:04 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2F7C7B@DFLE09.ent.ti.com>
References: <1346455197-18722-1-git-send-email-fcooper27jr@gmail.com>
	<8F29D6B095ED194EA1980491A5E029710C2D622E@DFLE09.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C2D622E@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] libgles-omap3.inc: Tweak PLATFORM variable.
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
X-List-Received-Date: Fri, 05 Oct 2012 05:02:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please pull this patch into denzil.

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Cooper Jr., Franklin
Sent: Monday, September 17, 2012 6:14 PM
To: Franklin S. Cooper Jr; meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH] libgles-omap3.inc: Tweak PLATFORM variable.

ping

-----Original Message-----
From: Franklin S. Cooper Jr [mailto:fcooperjr27@gmail.com]=20
Sent: Friday, August 31, 2012 6:20 PM
To: meta-ti@yoctoproject.org
Cc: Cooper Jr., Franklin
Subject: [meta-ti][PATCH] libgles-omap3.inc: Tweak PLATFORM variable.

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Newer versions of libgles-omap3 utilize a different PLATFORM value. This
  patch allows the PLATFORM variable to be easily overridden if needed.
* Replace the hardcoded usage of LinuxOMAP3 with the PLATFORM variable.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 recipes-graphics/libgles/libgles-omap3.inc |   41 ++++++++++++++----------=
---
 1 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/=
libgles/libgles-omap3.inc
index 6137097..18ee7ff 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -61,10 +61,11 @@ TARGET_CC_ARCH +=3D " ${TARGET_LINK_HASH_STYLE} -Wl,-rp=
ath-link,${BINLOCATION} -L$  -L${STAGING_DIR_TARGET}${libdir} -Wl,-rpath-li=
nk,${STAGING_DIR_TARGET}${libdir}"
 PARALLEL_MAKE =3D ""
=20
+PLATFORM ?=3D "LinuxOMAP3"
+
 do_compile() {
 	export X11ROOT=3D"${STAGING_DIR_HOST}/usr"
 	export TOOLCHAIN=3D"${TOOLCHAIN_PATH}"
-	export PLATFORM=3D"LinuxOMAP3"
=20
 	export PLAT_CC=3D"${CC}"
 	export PLAT_CPP=3D"${CXX}"
@@ -77,23 +78,23 @@ do_compile() {
 	for X11BUILD in 0 1 ; do
 		for demo in ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Demos/* ; do
 			cd $demo/OGLES/Build/LinuxGeneric
-			oe_runmake Common=3D1 PLATFORM=3D$PLATFORM X11BUILD=3D$X11BUILD =20
-			rm $demo/OGLES/Build/LinuxOMAP3/Release*/*.o
-			install -m 0755 $demo/OGLES/Build/LinuxOMAP3/ReleaseX11/* ${S}/demos/x1=
1 || true
+			oe_runmake Common=3D1 PLATFORM=3D${PLATFORM} X11BUILD=3D$X11BUILD
+			rm $demo/OGLES/Build/${PLATFORM}/Release*/*.o
+			install -m 0755 $demo/OGLES/Build/${PLATFORM}/ReleaseX11/*=20
+${S}/demos/x11 || true
 			sed -e s:NAME:$(basename $demo): \
-			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES/Build/Linu=
xOMAP3/ReleaseX11/*): \
+			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename=20
+$demo/OGLES/Build/${PLATFORM}/ReleaseX11/*): \
 			     ${WORKDIR}/sample.desktop > ${WORKDIR}/$(basename $demo).desktop
-			install -m 0755 $demo/OGLES/Build/LinuxOMAP3/ReleaseRaw/* ${S}/demos/ra=
w || true=09
+			install -m 0755 $demo/OGLES/Build/${PLATFORM}/ReleaseRaw/*=20
+${S}/demos/raw || true
 		done
 		for demo in ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Demos/* ; do
 			cd $demo/OGLES2/Build/LinuxGeneric
-			oe_runmake Common=3D1 PLATFORM=3D$PLATFORM X11BUILD=3D$X11BUILD =20
-			rm -f $demo/OGLES2/Build/LinuxOMAP3/Release*/*.o
-			install -m 0755 $demo/OGLES2/Build/LinuxOMAP3/ReleaseX11/* ${S}/demos/x=
11 || true
+			oe_runmake Common=3D1 PLATFORM=3D${PLATFORM} X11BUILD=3D$X11BUILD
+			rm -f $demo/OGLES2/Build/${PLATFORM}/Release*/*.o
+			install -m 0755 $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/*=20
+${S}/demos/x11 || true
 			sed -e s:NAME:$(basename $demo): \
-			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES2/Build/Lin=
uxOMAP3/ReleaseX11/*): \
+			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename=20
+$demo/OGLES2/Build/${PLATFORM}/ReleaseX11/*): \
 			     ${WORKDIR}/sample.desktop > ${WORKDIR}/$(basename $demo).desktop
-			install -m 0755 $demo/OGLES2/Build/LinuxOMAP3/ReleaseRaw/* ${S}/demos/r=
aw || true=09
+			install -m 0755 $demo/OGLES2/Build/${PLATFORM}/ReleaseRaw/*=20
+${S}/demos/raw || true
 		done
 	done
=20
@@ -109,14 +110,14 @@ do_compile() {
 				cd $training/OGLES2/Build/LinuxGeneric
 			fi
=20
-			if [ -e $training/OGLES2/Build/LinuxOMAP3/Makefile ] ; then
-				cd $training/OGLES2/Build/LinuxOMAP3
+			if [ -e $training/OGLES2/Build/${PLATFORM}/Makefile ] ; then
+				cd $training/OGLES2/Build/${PLATFORM}
 			fi		=09
=20
-			oe_runmake Common=3D1 PLATFORM=3D$PLATFORM X11BUILD=3D$X11BUILD =20
-			rm -f $training/OGLES2/Build/LinuxOMAP3/Release*/*.o
-			install -m 0755 $training/OGLES2/Build/LinuxOMAP3/ReleaseX11/* ${S}/tra=
iningcourses/x11 || true
-			install -m 0755 $training/OGLES2/Build/LinuxOMAP3/ReleaseRaw/* ${S}/tra=
iningcourses/raw || true=09
+			oe_runmake Common=3D1 PLATFORM=3D${PLATFORM} X11BUILD=3D$X11BUILD
+			rm -f $training/OGLES2/Build/${PLATFORM}/Release*/*.o
+			install -m 0755 $training/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/tr=
ainingcourses/x11 || true
+			install -m 0755 $training/OGLES2/Build/${PLATFORM}/ReleaseRaw/*=20
+${S}/trainingcourses/raw || true
 		done
 	done
=20
@@ -137,7 +138,7 @@ do_install () {
 	install -m 0755 ${BINLOCATION}/xgles1test1 ${D}${bindir}/
=20
 	install -m 0755 ${BINLOCATION}/freedesktop/kdrive/usr/X11R6_SGX/bin/Xsgx =
${D}${bindir}/|| true
-	cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/LinuxOMAP3/lib=
/*X11WS* ${D}${libdir} || true
+	cp -pPR=20
+${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/lib/*X11
+WS* ${D}${libdir} || true
=20
 	install -d ${D}${includedir}
 	cp -pPR ${S}/GFX_Linux_KM/include4 ${D}${includedir}/ @@ -145,8 +146,8 @@=
 do_install () {
=20
 	cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/Include/* ${D}=
${includedir}/
 	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/* ${D}${=
includedir}/
-	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/LinuxOMAP3/Inclu=
de/GLES/* ${D}${includedir}/GLES/ || true
-	cp -pPr ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/LinuxOMAP3/Inc=
lude/GLES/* ${D}${includedir}/GLES2/ || true
+	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/${PLATFORM}/Incl=
ude/GLES/* ${D}${includedir}/GLES/ || true
+	cp -pPr=20
+${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/Include/
+GLES/* ${D}${includedir}/GLES2/ || true
 	cp -pPr ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/v* ${D}${inc=
ludedir}/ || true
 	cp -pPr ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/V* ${D}${inc=
ludedir}/ || true
 	cp -pPr ${S}/include/*.h ${D}${includedir} || true
--
1.7.0.4

_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

