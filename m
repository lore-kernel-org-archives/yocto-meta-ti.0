Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B983E006F5
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 13:03:46 -0700 (PDT)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2BK3iC9024077
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 15:03:44 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2BK3g6p016449
	for <meta-ti@yoctoproject.org>; Tue, 12 Mar 2013 01:33:43 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 12 Mar 2013 01:33:42 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2BK3bVV012196;
	Tue, 12 Mar 2013 01:33:41 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 11 Mar 2013 15:03:31 -0500
Message-ID: <1363032215-12645-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/5] setup-defconfig: move from meta-arago to meta-ti
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
X-List-Received-Date: Mon, 11 Mar 2013 20:03:46 -0000
Content-Type: text/plain

* Moved the setup-defconfig.inc file from meta-arago to meta-ti.
  This functionality is used by the SDKs to allow the option for
  using an in-tree configuration file for the kernel build.
* This option was chosen to make it easy for other layers to
  override the config with their own using the normal OE method
  of specifying a defconfig file in their layer rather than having
  to use some custom variable setting.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-kernel/linux/setup-defconfig.inc |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 recipes-kernel/linux/setup-defconfig.inc

diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
new file mode 100644
index 0000000..fc5e18e
--- /dev/null
+++ b/recipes-kernel/linux/setup-defconfig.inc
@@ -0,0 +1,26 @@
+# Check the defconfig file and see if it points to an in kernel
+# defconfig that should be used, or if it is a complete config file
+
+addtask setup_defconfig before do_configure after do_patch
+do_setup_defconfig() {
+    # Always copy the defconfig file to .config to keep consistency
+    # between the case where there is a real config and the in kernel
+    # tree config
+    cp ${WORKDIR}/defconfig ${S}/.config
+}
+
+# define our own do_configure that will:
+#   1. Check the .config file and see if string use-kernel-config= is present
+#   2. If the use-kernel-config string is present parse out the config to use
+#      and run make ${config}
+#   3. else run yes '' | oe_runmake oldconfig like the default do_configure
+#      does
+do_configure() {
+    config=`cat ${S}/.config | grep use-kernel-config | cut -d= -f2`
+    if [ "x${config}" != "x" ]
+    then
+        oe_runmake ${config}
+    else
+        yes '' | oe_runmake oldconfig
+    fi
+}
-- 
1.7.0.4


