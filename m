Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B3BEFE009F8; Mon, 18 May 2015 10:33:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE5F4E009EB
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 10:33:04 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4IHX3q6019253
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 12:33:03 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4IHX3Fj000704
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 12:33:03 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 18 May 2015 12:33:02 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4IHWx5R023023;	Mon, 18 May 2015 12:33:02 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 18 May 2015 13:32:56 -0400
Message-ID: <1431970376-24163-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1431970376-24163-1-git-send-email-j-stiffler@ti.com>
References: <1431970376-24163-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] gdbc6x: Add version 1.1.0
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
X-List-Received-Date: Mon, 18 May 2015 17:33:14 -0000
Content-Type: text/plain

* The gdbc6x utility provides remote gdb capabilities for C6x DSP
  cores.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-devtools/gdbc6x/gdbc6x/init   |   48 +++++++++++++++++++++++++++++++++
 recipes-devtools/gdbc6x/gdbc6x_git.bb |   48 +++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 recipes-devtools/gdbc6x/gdbc6x/init
 create mode 100644 recipes-devtools/gdbc6x/gdbc6x_git.bb

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
index 0000000..9fc95fe
--- /dev/null
+++ b/recipes-devtools/gdbc6x/gdbc6x_git.bb
@@ -0,0 +1,48 @@
+DESCRIPTION="GNU debugger for TI C6X DSP."
+
+LICENSE = "GPLv3+"
+SECTION = "devel"
+DEPENDS = "expat ncurses readline"
+
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=bf0fe2872eb3dfeebb2cbe38206fe81f"
+
+include gdbc6x.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS = "ncurses bison texinfo flex gettext"
+
+RDEPENDS_${PN}  = "gdbserver-c6x gdbserverproxy-module-drv"
+
+S = "${WORKDIR}/git/gdbc6x"
+
+SRC_URI_append = " \
+    file://init \
+"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "gdbserverproxy"
+INITSCRIPT_PARAMS = "defaults 95"
+
+inherit gettext
+
+PARALLEL_MAKE = ""
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
-- 
1.7.9.5


