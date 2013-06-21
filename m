Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B123E014F4
	for <meta-ti@yoctoproject.org>; Fri, 21 Jun 2013 11:54:29 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id E6D6752AB1; Fri, 21 Jun 2013 18:54:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130621185428.E6D6752AB1@arago-project.org>
Date: Fri, 21 Jun 2013 18:54:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : libgles-omap3-x11: add missing X11 version of the recipe, after it got split
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
X-List-Received-Date: Fri, 21 Jun 2013 18:54:30 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 139669f04a8bc594ea7782e2f23206792b657d15
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=139669f04a8bc594ea7782e2f23206792b657d15

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Jun 21 14:32:12 2013 -0400

libgles-omap3-x11: add missing X11 version of the recipe, after it got split

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../99-bufferclass.rules                           |    7 ++
 .../libgles/libgles-omap3-x11-4.09.00.01/cputype   |   17 +++++
 .../libgles-omap3-x11-4.09.00.01/sample.desktop    |    8 ++
 .../libgles/libgles-omap3-x11_4.09.00.01.bb        |   75 ++++++++++++++++++++
 4 files changed, 107 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/99-bufferclass.rules b/recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/99-bufferclass.rules
new file mode 100644
index 0000000..780423b
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/99-bufferclass.rules
@@ -0,0 +1,7 @@
+# Give everyone access to bufferclass nodes and make a compatibility symlink for the first one
+SUBSYSTEM=="bccat", MODE="0666"
+KERNEL=="bccat0", SYMLINK+="bc_cat", MODE="0666"
+
+# Give everyone access to v4l nodes
+SUBSYSTEM=="video4linux", MODE="0666"
+
diff --git a/recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/cputype b/recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/cputype
new file mode 100755
index 0000000..4448c30
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/cputype
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+machine_id() { # return the machine ID
+	awk 'BEGIN { FS=": " } /Hardware/ \
+		{ gsub(" ", "_", $2); print tolower($2) } ' </proc/cpuinfo
+}
+
+if [ "$(machine_id)" = "ti8168evm" ] ; then
+	echo TI816x
+elif [ "$(machine_id)" = "am335xevm" ] ; then
+    echo TI33XX
+else
+	devmem2 0x4800244c | \
+	grep 'Read at address' | \
+	sed -e 's/.*): //' | \
+	sed -e 's/0x00005C00/OMAP3503/' -e 's/0x00001C00/OMAP3515/' -e 's/0x00004C00/OMAP3525/' -e 's/0x00000C00/OMAP3530/' -e 's/0x00005E00/OMAP3503/' -e 's/0x00001E00/OMAP3515/' -e 's/0x00004E00/OMAP3525/' -e 's/0x00000E00/OMAP3530/' -e 's/0x00000CC0/OMAP3530/'
+fi
diff --git a/recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/sample.desktop b/recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/sample.desktop
new file mode 100644
index 0000000..6bacac9
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/sample.desktop
@@ -0,0 +1,8 @@
+[Desktop Entry]
+Name=NAME Demo
+Comment=OGLES Demo
+Exec=EXEC
+Icon=star
+Type=Application
+Categories=Graphics;
+
diff --git a/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb b/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
new file mode 100644
index 0000000..1c70cae
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
@@ -0,0 +1,75 @@
+require libgles-omap3-x11.inc
+
+LICENSE = "TSPA"
+
+DEFAULT_PREFERENCE = "-1"
+
+BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
+BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
+BINLOCATION_ti814x = "${S}/gfx_rel_es6.x"
+BINLOCATION_ti33x = "${S}/gfx_rel_es8.x"
+
+PLATFORM = "LinuxARMV7"
+PVR_INIT = "pvrsrvctl"
+
+# download required binary distribution from:
+# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FDS.html
+# see libgles-omap3.inc for detailed installation instructions
+
+SGXPV = "4_09_00_01"
+IMGPV = "1.9.2188537"
+BINFILE = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
+TI_BIN_UNPK_WDEXT := "/Graphics_SDK_${SGXPV}"
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE} \
+           file://cputype \
+           file://rc.pvr \
+           file://rc_dri.pvr \
+           file://sample.desktop \
+           file://99-bufferclass.rules  \
+"
+SRC_URI[md5sum] = "bd35e9d8843aff3a2aca9d41e7db1c7d"
+SRC_URI[sha256sum] = "eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
+
+S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
+
+LIBGLESWINDOWSYSTEM ?= "libpvrPVR2D_DRIWSEGL.so"
+
+do_configure_append() {
+
+    # Change PVR server's user mode library to point to DRI
+    for drifile in $(find ${S} -name "libsrv_um_dri.so"); do
+    if [ "$drifile" != "" ]
+    then
+        dir=$(dirname ${drifile})
+        if [ "$SUPPORT_XORG" = "1" ]
+        then
+            mv ${dir}/libsrv_um_dri.so ${dir}/libsrv_um.so
+        else
+            rm -rf ${dir}/libsrv_um_dri.so
+        fi
+    fi
+
+    done
+}
+
+do_install_append() {
+
+    # In this version of the graphics SDK the following directories do not exist:
+    #    /GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/pvr2d.h (doesn't exist)
+    #    /GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/GLES/egltypes.h (doesn't exist)
+    # Therefore, need to copy these files manually at the only location that they do exist
+    cp -pPr ${S}/include/pvr2d/*.h ${D}${includedir}
+    cp -pPr ${S}/include/OGLES/GLES ${D}${includedir}/
+
+    rm ${D}${sysconfdir}/init.d/pvr-init
+
+    if [ "$SUPPORT_XORG" = "1" ]; then
+        cp -pP ${WORKDIR}/rc_dri.pvr ${D}${sysconfdir}/init.d/pvr-init
+    else
+        cp -pP ${WORKDIR}/rc.pvr ${D}${sysconfdir}/init.d/pvr-init
+    fi
+
+}
+
+RRECOMMENDS_${PN}-x11demos = "${PN}-driwsegl"
+RRECOMMENDS_${PN}-x11trainingcourses = "${PN}-driwsegl"


