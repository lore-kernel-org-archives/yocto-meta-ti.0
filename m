Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D73C3E01570
	for <meta-ti@yoctoproject.org>; Tue, 27 Aug 2013 18:26:57 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 322BA52A24; Wed, 28 Aug 2013 01:26:55 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130828012656.322BA52A24@arago-project.org>
Date: Wed, 28 Aug 2013 01:26:55 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-dtb.inc: overlay the latest version from oe-core/ master
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
X-List-Received-Date: Wed, 28 Aug 2013 01:26:59 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 95d34de649d0f95e13e89776e93e5cac61aaa59c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=95d34de649d0f95e13e89776e93e5cac61aaa59c

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Aug 26 12:21:21 2013 -0400

linux-dtb.inc: overlay the latest version from oe-core/master

With recent kernel versions now using CPP and kernel headers, it's better
to use kernel's in-tree DTB compilation instead of building and using our
own DTC compiler externally. This overlays the changed approach from latest
oe-core/master into Dylan.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-dtb.inc |   69 ++++++++++++++++++++++++++++++++++++
 1 files changed, 69 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux-dtb.inc b/recipes-kernel/linux/linux-dtb.inc
new file mode 100644
index 0000000..6b8f1a5
--- /dev/null
+++ b/recipes-kernel/linux/linux-dtb.inc
@@ -0,0 +1,69 @@
+# Support for device tree generation
+FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/devicetree*"
+
+python __anonymous () {
+    d.appendVar("PACKAGES", " kernel-devicetree")
+}
+
+do_install_append() {
+	if test -n "${KERNEL_DEVICETREE}"; then
+		for DTB in ${KERNEL_DEVICETREE}; do
+			if echo ${DTB} | grep -q '/dts/'; then
+				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
+				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
+			fi
+			DTB_BASE_NAME=`basename ${DTB} .dtb`
+			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+			DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
+			oe_runmake ${DTB}
+			if [ ! -e "${DTB_PATH}" ]; then
+				DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
+			fi
+			install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
+		done
+	fi
+}
+
+do_deploy_append() {
+	if test -n "${KERNEL_DEVICETREE}"; then
+		for DTB in ${KERNEL_DEVICETREE}; do
+			if echo ${DTB} | grep -q '/dts/'; then
+				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
+				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
+			fi
+			DTB_BASE_NAME=`basename ${DTB} .dtb`
+			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+			DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
+			if [ ! -e "${DTB_PATH}" ]; then
+				DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
+			fi
+			install -d ${DEPLOYDIR}
+			install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.dtb
+			cd ${DEPLOYDIR}
+			ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
+			cd -
+		done
+	fi
+}
+
+pkg_postinst_kernel-devicetree () {
+	cd /${KERNEL_IMAGEDEST}
+	for DTB_FILE in ${KERNEL_DEVICETREE}
+	do
+		DTB_BASE_NAME=`basename ${DTB_FILE} | awk -F "." '{print $1}'`
+		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+		update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+	done
+}
+
+pkg_postrm_kernel-devicetree () {
+	cd /${KERNEL_IMAGEDEST}
+	for DTB_FILE in ${KERNEL_DEVICETREE}
+	do
+		DTB_BASE_NAME=`basename ${DTB_FILE} | awk -F "." '{print $1}'`
+		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+		update-alternatives --remove ${DTB_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+	done
+}


