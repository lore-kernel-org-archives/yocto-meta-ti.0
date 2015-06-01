Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BFD24E00A54; Mon,  1 Jun 2015 07:33:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93C8AE00A38
	for <meta-ti@yoctoproject.org>; Mon,  1 Jun 2015 07:33:06 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 44BA052A14; Mon,  1 Jun 2015 14:33:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150601143306.44BA052A14@arago-project.org>
Date: Mon,  1 Jun 2015 14:33:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : gdbc6x: Add version 1.1.0
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
X-List-Received-Date: Mon, 01 Jun 2015 14:33:18 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 4287b0fafa2c5d4f3f4cea121719b463502eb1f6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4287b0fafa2c5d4f3f4cea121719b463502eb1f6

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Tue May 19 18:51:22 2015 +0000

gdbc6x: Add version 1.1.0

* The gdbc6x utility provides remote gdb capabilities for C6x DSP
  cores.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-devtools/gdbc6x/gdbc6x/init   |   48 +++++++++++++++++++++++++++++++++
 recipes-devtools/gdbc6x/gdbc6x_git.bb |   44 ++++++++++++++++++++++++++++++
 2 files changed, 92 insertions(+), 0 deletions(-)

diff --git a/recipes-devtools/gdbc6x/gdbc6x/init b/recipes-devtools/gdbc6x/gdbc6x/init
new file mode 100644
index 0000000..90210b8
--- /dev/null
+++ b/recipes-devtools/gdbc6x/gdbc6x/init
@@ -0,0 +1,48 @@
+#!/bin/bash
+
+GDB_DEVICE_NAME='/dev/gdbtty$i'
+DSP_FIRMWARE_NAME='/lib/firmware/dra7-dsp$[$i+1]-fw.xe66'
+
+DSP_L2_GLOBAL_OFFSET="40000000"
+DSP_L2_GLOBAL_SHIFT="00800000"
+
+case "$1" in
+  start)
+
+    dsp_core_l2_offset=$DSP_L2_GLOBAL_OFFSET
+
+    i=0
+    while [ -c "`eval echo $GDB_DEVICE_NAME`" ]
+    do
+      dsp_firmware=`eval echo $DSP_FIRMWARE_NAME`
+
+      if [ -f "`eval echo $DSP_FIRMWARE_NAME`" ]
+      then 
+        eval echo "Initializing $GDB_DEVICE_NAME based on $DSP_FIRMWARE_NAME ..."
+
+        gdb_data_local=`eval readelf -s "$DSP_FIRMWARE_NAME" | \
+                        grep 'gdb_globalData' | \
+                        awk '{print $2}'`
+
+        echo "gdb_globalData (local)  = $gdb_data_local"
+        printf "gdb_globalData (global) = %X\n" \
+          $[0x$gdb_data_local + 0x$dsp_core_l2_offset]
+
+
+        printf "%X\n" $[0x$gdb_data_local + 0x$dsp_core_l2_offset] \
+          >> `eval echo $GDB_DEVICE_NAME`
+      fi
+      i=$[$i + 1]
+      dsp_core_l2_offset=`printf "%X" $[0x$dsp_core_l2_offset + 0x$DSP_L2_GLOBAL_SHIFT]`
+    done
+  ;;
+  stop)
+    # Nothing to be done.
+  ;;
+  *)
+    echo "Usage: $0 {start|stop}"
+    exit 1
+  ;;
+esac
+
+
diff --git a/recipes-devtools/gdbc6x/gdbc6x_git.bb b/recipes-devtools/gdbc6x/gdbc6x_git.bb
new file mode 100644
index 0000000..0e6a907
--- /dev/null
+++ b/recipes-devtools/gdbc6x/gdbc6x_git.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "GNU debugger for TI C6X DSP."
+SECTION = "devel"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=bf0fe2872eb3dfeebb2cbe38206fe81f"
+
+DEPENDS = "ncurses bison texinfo flex gettext"
+
+PR = "${INC_PR}.0"
+
+SRC_URI_append = " \
+    file://init \
+"
+
+S = "${WORKDIR}/git/gdbc6x"
+
+inherit update-rc.d
+inherit gettext
+
+do_configure () {
+    cd ${S}
+    ./configure --program-suffix=c6x --target=tic6x-elf-tirtos --host=${HOST_SYS} --prefix=${S}/install_gdb
+}
+
+do_install () {
+    make install
+
+    # Custom install to prevent conflict with standard GDB.
+    install -d ${D}${bindir}
+    install -d ${D}${includedir}
+    install -m 755  ${S}/install_gdb/bin/gdbc6x ${D}${bindir} 
+    cp -rf ${S}/install_gdb/include/* ${D}${includedir}
+
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/gdbserverproxy
+}
+
+RDEPENDS_${PN} = "gdbserverproxy-module-drv"
+
+include gdbc6x.inc
+
+INITSCRIPT_NAME = "gdbserverproxy"
+INITSCRIPT_PARAMS = "defaults 95"
+
+PARALLEL_MAKE = ""


