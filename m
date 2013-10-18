Return-Path: <mrinmayee@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 443F9E016E5
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 05:08:36 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9IC8ZwT024474
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 07:08:35 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9IC8Z2q015711
	for <meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 07:08:35 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 18 Oct 2013 07:08:35 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9IC8YGh022588	for
	<meta-ti@yoctoproject.org>; Fri, 18 Oct 2013 07:08:35 -0500
Date: Fri, 18 Oct 2013 17:38:34 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20131018120834.GA3408@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCHv3] abefw: Firmware for OMAP4 and OMAP5 ABE
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
X-List-Received-Date: Fri, 18 Oct 2013 12:08:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

 * The OMAP5 Audio Backend requires a 'firmware' to enable
  sound. This recipe installs a prebuilt firmware. This
  part is a hack, as in the current form, the firmware
  cannot be cross-compiled. There is a plan to fix this
  and hopefully, this recipe is short-lived. Once the code
  is fixed, we should have new recipes that build the firmware
  and clean up this recipe.

 v2:
 * Merged contents from abefw.inc and removed abefw.inc based
  on review.

 v3:
 * Corrected license to BSD or GPLv2
 * Add pandaboard as COMPATIBLE_MACHINE
 * Add PR

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 recipes-bsp/abefw/abefw_1.0.14.bb |   23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 recipes-bsp/abefw/abefw_1.0.14.bb

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
-- 
1.7.9.5


