Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5173EE0121B
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 14:36:10 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id F0EAF52AA2; Mon, 11 Mar 2013 21:36:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130311213609.F0EAF52AA2@arago-project.org>
Date: Mon, 11 Mar 2013 21:36:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : setup-defconfig: move from meta-arago to meta-ti
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
X-List-Received-Date: Mon, 11 Mar 2013 21:36:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b2946775880fd6c6d7c5c9ce61b1d4b47ebe59e9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b2946775880fd6c6d7c5c9ce61b1d4b47ebe59e9

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Mon Mar 11 15:03:31 2013 -0500

setup-defconfig: move from meta-arago to meta-ti

* Moved the setup-defconfig.inc file from meta-arago to meta-ti.
  This functionality is used by the SDKs to allow the option for
  using an in-tree configuration file for the kernel build.
* This option was chosen to make it easy for other layers to
  override the config with their own using the normal OE method
  of specifying a defconfig file in their layer rather than having
  to use some custom variable setting.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/setup-defconfig.inc |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

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


