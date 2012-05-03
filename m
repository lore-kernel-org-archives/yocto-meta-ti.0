Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9C00E00723
	for <meta-ti@yoctoproject.org>; Wed,  2 May 2012 23:33:28 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M3F00KQDOVRDC20@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 03 May 2012 01:33:28 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CD08B200F4; Thu,
	03 May 2012 02:33:27 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 03 May 2012 02:33:26 -0400
Message-id: <1336026806-13314-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.8.5
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] omap3-sgx-modules, libgles-omap3: add version 4.06.00.01
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2012 06:33:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Ported from Arago
* Added version 4.06.00.01 of the Graphics SDK which supports Power Management
  features for the AM335x
* Use a variable PLATFORM for the directory structure since newer SDKs use
  LinuxARMV7 and older SDKs use LinuxOMAP3
* Modifiy rc.pvr to check return of the insmod of pvrsrvkm. If this driver
  fails to load the devmem2 read access can put the system in a state where
  it will not come out of suspend.
* some header files like pvr2d.h and the GLES headers have moved to the
  top-level include directory so we need to copy them from there.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../omap3-sgx-modules_4.06.00.01.bb                |   47 +++++++++++++++++++
 recipes-graphics/libgles/libgles-omap3.inc         |   48 ++++++++++---------
 recipes-graphics/libgles/libgles-omap3/rc.pvr      |    7 +++
 .../libgles/libgles-omap3_4.06.00.01.bb            |   28 +++++++++++
 4 files changed, 107 insertions(+), 23 deletions(-)
 create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules_4.06.00.01.bb
 create mode 100644 recipes-graphics/libgles/libgles-omap3_4.06.00.01.bb

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.06.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.06.00.01.bb
new file mode 100644
index 0000000..8b549db
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.06.00.01.bb
@@ -0,0 +1,47 @@
+DESCRIPTION = "Kernel drivers for the PowerVR SGX chipset found in the omap3 SoCs"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=21228a42e27d1d104b31a83f7c9da935"
+
+TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
+require ../../recipes-ti/includes/ti-eula-unpack.inc
+
+SGXPV = "4_06_00_01"
+BINFILE := "Graphics_SDK_setuplinux_${SGXPV}.bin"
+
+inherit module
+
+MACHINE_KERNEL_PR_append = "c"
+PR = "${MACHINE_KERNEL_PR}"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE}"
+
+SRC_URI[md5sum] = "bd0692875ab3f0bdb0f61464cf8472f9"
+SRC_URI[sha256sum] = "051baf6f18223ea12865ab3c4d514833c4d4da9e2ffdcb9439df881e8e7369f3"
+
+TI_BIN_UNPK_WDEXT="/Graphics_SDK_${SGXPV}"
+S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
+
+PVRBUILD = "release"
+export KERNELDIR = "${STAGING_KERNEL_DIR}"
+
+PACKAGE_STRIP = "no"
+
+TI_PLATFORM_omap3 = "omap3630"
+TI_PLATFORM_ti814x = "ti81xx"
+TI_PLATFORM_ti816x = "ti81xx"
+TI_PLATFORM_ti33x = "ti335x"
+
+MODULESLOCATION_omap3 = "dc_omapfb3_linux"
+MODULESLOCATION_ti814x = "dc_ti81xx_linux"
+MODULESLOCATION_ti816x = "dc_ti81xx_linux"
+MODULESLOCATION_ti33x = "dc_ti335x_linux"
+
+MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM}"
+
+do_install() {
+	mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+	cp ${S}/pvrsrvkm.ko \
+	   ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \
+	   ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
+	   ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+}
diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 6137097..c0d351e 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r31"
+PR = "r32"
 
 COMPATIBLE_MACHINE = "(omap3|ti814x|ti816x|ti33x)"
 
@@ -61,10 +61,11 @@ TARGET_CC_ARCH += " ${TARGET_LINK_HASH_STYLE} -Wl,-rpath-link,${BINLOCATION} -L$
 -L${STAGING_DIR_TARGET}${libdir} -Wl,-rpath-link,${STAGING_DIR_TARGET}${libdir}"
 PARALLEL_MAKE = ""
 
+PLATFORM ?= "LinuxOMAP3"
+
 do_compile() {
 	export X11ROOT="${STAGING_DIR_HOST}/usr"
 	export TOOLCHAIN="${TOOLCHAIN_PATH}"
-	export PLATFORM="LinuxOMAP3"
 
 	export PLAT_CC="${CC}"
 	export PLAT_CPP="${CXX}"
@@ -77,23 +78,23 @@ do_compile() {
 	for X11BUILD in 0 1 ; do
 		for demo in ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Demos/* ; do
 			cd $demo/OGLES/Build/LinuxGeneric
-			oe_runmake Common=1 PLATFORM=$PLATFORM X11BUILD=$X11BUILD  
-			rm $demo/OGLES/Build/LinuxOMAP3/Release*/*.o
-			install -m 0755 $demo/OGLES/Build/LinuxOMAP3/ReleaseX11/* ${S}/demos/x11 || true
+			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=$X11BUILD
+			rm $demo/OGLES/Build/${PLATFORM}/Release*/*.o
+			install -m 0755 $demo/OGLES/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 || true
 			sed -e s:NAME:$(basename $demo): \
-			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES/Build/LinuxOMAP3/ReleaseX11/*): \
+			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES/Build/${PLATFORM}/ReleaseX11/*): \
 			     ${WORKDIR}/sample.desktop > ${WORKDIR}/$(basename $demo).desktop
-			install -m 0755 $demo/OGLES/Build/LinuxOMAP3/ReleaseRaw/* ${S}/demos/raw || true	
+			install -m 0755 $demo/OGLES/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw || true
 		done
 		for demo in ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Demos/* ; do
 			cd $demo/OGLES2/Build/LinuxGeneric
-			oe_runmake Common=1 PLATFORM=$PLATFORM X11BUILD=$X11BUILD  
-			rm -f $demo/OGLES2/Build/LinuxOMAP3/Release*/*.o
-			install -m 0755 $demo/OGLES2/Build/LinuxOMAP3/ReleaseX11/* ${S}/demos/x11 || true
+			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=$X11BUILD
+			rm -f $demo/OGLES2/Build/${PLATFORM}/Release*/*.o
+			install -m 0755 $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/demos/x11 || true
 			sed -e s:NAME:$(basename $demo): \
-			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES2/Build/LinuxOMAP3/ReleaseX11/*): \
+			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/*): \
 			     ${WORKDIR}/sample.desktop > ${WORKDIR}/$(basename $demo).desktop
-			install -m 0755 $demo/OGLES2/Build/LinuxOMAP3/ReleaseRaw/* ${S}/demos/raw || true	
+			install -m 0755 $demo/OGLES2/Build/${PLATFORM}/ReleaseRaw/* ${S}/demos/raw || true
 		done
 	done
 
@@ -109,14 +110,14 @@ do_compile() {
 				cd $training/OGLES2/Build/LinuxGeneric
 			fi
 
-			if [ -e $training/OGLES2/Build/LinuxOMAP3/Makefile ] ; then
-				cd $training/OGLES2/Build/LinuxOMAP3
+			if [ -e $training/OGLES2/Build/${PLATFORM}/Makefile ] ; then
+				cd $training/OGLES2/Build/${PLATFORM}
 			fi			
 
-			oe_runmake Common=1 PLATFORM=$PLATFORM X11BUILD=$X11BUILD  
-			rm -f $training/OGLES2/Build/LinuxOMAP3/Release*/*.o
-			install -m 0755 $training/OGLES2/Build/LinuxOMAP3/ReleaseX11/* ${S}/trainingcourses/x11 || true
-			install -m 0755 $training/OGLES2/Build/LinuxOMAP3/ReleaseRaw/* ${S}/trainingcourses/raw || true	
+			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=$X11BUILD
+			rm -f $training/OGLES2/Build/${PLATFORM}/Release*/*.o
+			install -m 0755 $training/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/trainingcourses/x11 || true
+			install -m 0755 $training/OGLES2/Build/${PLATFORM}/ReleaseRaw/* ${S}/trainingcourses/raw || true
 		done
 	done
 
@@ -137,7 +138,7 @@ do_install () {
 	install -m 0755 ${BINLOCATION}/xgles1test1 ${D}${bindir}/
 
 	install -m 0755 ${BINLOCATION}/freedesktop/kdrive/usr/X11R6_SGX/bin/Xsgx ${D}${bindir}/|| true
-	cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/LinuxOMAP3/lib/*X11WS* ${D}${libdir} || true
+	cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/lib/*X11WS* ${D}${libdir} || true
 
 	install -d ${D}${includedir}
 	cp -pPR ${S}/GFX_Linux_KM/include4 ${D}${includedir}/
@@ -145,13 +146,15 @@ do_install () {
 
 	cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/Include/* ${D}${includedir}/
 	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/* ${D}${includedir}/
-	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/LinuxOMAP3/Include/GLES/* ${D}${includedir}/GLES/ || true
-	cp -pPr ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/LinuxOMAP3/Include/GLES/* ${D}${includedir}/GLES2/ || true
+	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/${PLATFORM}/Include/GLES/* ${D}${includedir}/GLES/ || true
+	cp -pPr ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/Include/GLES/* ${D}${includedir}/GLES2/ || true
 	cp -pPr ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/v* ${D}${includedir}/ || true
 	cp -pPr ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/V* ${D}${includedir}/ || true
 	cp -pPr ${S}/include/*.h ${D}${includedir} || true
 	cp -pPr ${S}/include/wsegl/*.h ${D}${includedir} || true
-	
+	cp -pPr ${S}/include/pvr2d/*.h ${D}${includedir} || true
+	cp -pPr ${S}/include/OGLES/GLES ${D}${includedir}/ || true
+
 	install -d ${D}${sysconfdir}/init.d/
 	cp -pP ${WORKDIR}/rc.pvr ${D}${sysconfdir}/init.d/pvr-init
 
@@ -363,4 +366,3 @@ echo "WindowSystem=libpvrPVR2D_X11WSEGL.so.1" >> $D${sysconfdir}/powervr.ini
 pkg_postinst_${PN}-driwsegl() {
 rm -f $D${sysconfdir}/powervr-esrev
 }
-
diff --git a/recipes-graphics/libgles/libgles-omap3/rc.pvr b/recipes-graphics/libgles/libgles-omap3/rc.pvr
index 00cd994..ef471fe 100755
--- a/recipes-graphics/libgles/libgles-omap3/rc.pvr
+++ b/recipes-graphics/libgles/libgles-omap3/rc.pvr
@@ -42,6 +42,13 @@ fbset -vyres $(expr $YRES \* 3)
 sgxprepare () {
 	echo Starting PVR
 	insmod $(busybox find /lib/modules/$(uname -r) -name "pvrsrvkm.ko")
+
+	if [ "$?" != "0" ]
+	then
+		echo "Could not find pvrsrvkm driver"
+		exit 1
+	fi
+
 	modprobe omaplfb
 	modprobe bufferclass_ti
 
diff --git a/recipes-graphics/libgles/libgles-omap3_4.06.00.01.bb b/recipes-graphics/libgles/libgles-omap3_4.06.00.01.bb
new file mode 100644
index 0000000..e0d3f35
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3_4.06.00.01.bb
@@ -0,0 +1,28 @@
+BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
+BINLOCATION_ti814x = "${S}/gfx_rel_es6.x"
+BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
+BINLOCATION_ti33x = "${S}/gfx_rel_es8.x"
+
+PLATFORM = "LinuxARMV7"
+
+require libgles-omap3.inc
+
+# download required binary distribution from:
+# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FDS.html
+# see libgles-omap3.inc for detailed installation instructions
+
+SGXPV = "4_06_00_01"
+IMGPV = "1.7.783851"
+BINFILE := "Graphics_SDK_setuplinux_${SGXPV}.bin"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
+                   file://cputype \
+                   file://rc.pvr \
+                   file://sample.desktop \
+                   file://99-bufferclass.rules  \
+"
+
+SRC_URI[md5sum] = "bd0692875ab3f0bdb0f61464cf8472f9"
+SRC_URI[sha256sum] = "051baf6f18223ea12865ab3c4d514833c4d4da9e2ffdcb9439df881e8e7369f3"
+
+S = "${WORKDIR}"
-- 
1.7.8.5


