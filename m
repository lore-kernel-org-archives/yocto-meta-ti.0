Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE6D4E006BE
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 20:29:54 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 76B4E52A65; Fri, 22 Nov 2013 04:29:53 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131122042953.76B4E52A65@arago-project.org>
Date: Fri, 22 Nov 2013 04:29:53 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Mrinmayee Hingolikar : abefw: firmware for OMAP4 and OMAP5 ABE
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
X-List-Received-Date: Fri, 22 Nov 2013 04:29:55 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: a3932f6c66047007dc6c6be7cc5ae19c314b05f6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a3932f6c66047007dc6c6be7cc5ae19c314b05f6

Author: Mrinmayee Hingolikar <mrinmayee@ti.com>
Date:   Mon Oct 21 18:47:23 2013 +0530

abefw: firmware for OMAP4 and OMAP5 ABE

  The OMAP5 Audio Backend requires a 'firmware' to enable
  sound. This recipe installs a prebuilt firmware. This
  part is a hack, as in the current form, the firmware
  cannot be cross-compiled. There is a plan to fix this
  and hopefully, this recipe is short-lived. Once the code
  is fixed, we should have new recipes that build the firmware
  and clean up this recipe.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/abefw/abefw_1.0.14.bb |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-bsp/abefw/abefw_1.0.14.bb
new file mode 100644
index 0000000..302bdcd
--- /dev/null
+++ b/recipes-bsp/abefw/abefw_1.0.14.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Firmware for OMAP4 and OMAP5 ABE"
+HOMEPAGE = "http://git.ti.com"
+LICENSE = "BSD | GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=923db086ed9463ab3215b24d87e05ec5"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+COMPATIBLE_MACHINE = "pandaboard|omap5-evm"
+
+SRC_URI = "git://git.ti.com/glsdk/abefw-omap4plus.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+SRCREV = "ceccc0332264e39bdc51e54f80ea7256a3886c58"
+
+PR = "r0"
+
+do_install() {
+        mkdir -p ${D}/lib/firmware
+        cp ${S}/firmware/omap4_abe_new ${D}/lib/firmware/
+}
+
+FILES_${PN} += "/lib/firmware/omap4_abe_new"


