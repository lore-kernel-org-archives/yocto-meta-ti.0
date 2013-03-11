Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B661DE00738
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 14:36:09 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6DD3052AA2; Mon, 11 Mar 2013 21:36:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130311213609.6DD3052AA2@arago-project.org>
Date: Mon, 11 Mar 2013 21:36:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : linux-ti-staging: use setup-defconfig
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
X-List-Received-Date: Mon, 11 Mar 2013 21:36:09 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: aa8bdcbeff95aa562053b5b8c5541b59f3977b6a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=aa8bdcbeff95aa562053b5b8c5541b59f3977b6a

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Mon Mar 11 15:03:32 2013 -0500

linux-ti-staging: use setup-defconfig

* Use the setup-defconfig.inc functionality to specify the in
  kernel tree defconfig file to use rather than hard coding it
  in the do_configure step.
* This is to make it easier to modify which configs are use by
  other layers as well as supporting additional machines which
  may not use omap2plus_defconfig as needed.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging/defconfig |    1 +
 recipes-kernel/linux/linux-ti-staging_git.bb    |   15 +++++----------
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging/defconfig b/recipes-kernel/linux/linux-ti-staging/defconfig
new file mode 100644
index 0000000..926b35a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging/defconfig
@@ -0,0 +1 @@
+use-kernel-config=omap2plus_defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index 8cc7206..2581409 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -6,6 +6,7 @@ KERNEL_IMAGETYPE = "uImage"
 
 inherit kernel
 require recipes-kernel/linux/linux-dtb.inc
+require recipes-kernel/linux/setup-defconfig.inc
 
 # Stage the power management firmware before building the kernel
 DEPENDS += "am33x-cm3"
@@ -23,17 +24,11 @@ SRCREV = "d26595a42220789b81a9d243e2fc0837c7776360"
 PV = "3.8.2"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 
-SRC_URI = "git://gitorious.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH}"
-
-do_setup_defconfig() {
-        :
-}
-
-do_configure() {
-    oe_runmake omap2plus_defconfig
-}
+SRC_URI = "git://gitorious.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
+           file://defconfig \
+          "
 
 # Copy the am33x-cm3 firmware if it is available
 do_compile_prepend() {


