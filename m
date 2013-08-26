Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2D59DE00343
	for <meta-ti@yoctoproject.org>; Mon, 26 Aug 2013 09:27:44 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MS5007M7CDAO2H0@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 26 Aug 2013 11:27:11 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6BD6C20087; Mon,
	26 Aug 2013 12:27:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 26 Aug 2013 12:27:04 -0400
Message-id: <1377534425-14198-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [dylan][PATCH 1/2] linux-dtb.inc: overlay the latest version from oe-core/master
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
X-List-Received-Date: Mon, 26 Aug 2013 16:27:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

With recent kernel versions now using CPP and kernel headers, it's better
to use kernel's in-tree DTB compilation instead of building and using our
own DTC compiler externally. This overlays the changed approach from latest
oe-core/master into Dylan.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-dtb.inc | 69 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-dtb.inc

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
-- 
1.8.3.2


