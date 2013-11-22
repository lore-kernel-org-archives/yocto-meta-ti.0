Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DFC38E006EB
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 20:29:54 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id A4AA652A6A; Fri, 22 Nov 2013 04:29:53 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131122042954.A4AA652A6A@arago-project.org>
Date: Fri, 22 Nov 2013 04:29:53 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Mrinmayee Hingolikar : libgles: added OMAP5 libs for graphics acceleration
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
Commit: 8f881dd9655a4c213c425065498d58193d9ba014
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8f881dd9655a4c213c425065498d58193d9ba014

Author: Mrinmayee Hingolikar <mrinmayee@ti.com>
Date:   Thu Oct 24 11:35:08 2013 +0530

libgles: added OMAP5 libs for graphics acceleration

These libraries are not distributable in source and hence
are available only as binary. They implement OpenGLES 1.x and
OpenGLES 2.x accelerated using SGX 544-MP2 found in OMAP5
class of devices.

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb     |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
new file mode 100644
index 0000000..8a03cd2
--- /dev/null
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Userspace libraries for omap5 sgx"
+HOMEPAGE = "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
+LICENSE = "TSPA"
+LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=d280df8e94bb2e7b9251c8526078eeb8"
+
+COMPATIBLE_MACHINE = "omap-a15"
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/OMAP5_1_09_00_10//exports/${PN}-${PV}.tar.gz;protocol=http"
+
+PR = "r0"
+
+SRC_URI[md5sum] = "3cfb875de031098a4c1eeeaf4e442367"
+SRC_URI[sha256sum] = "20b849088c0fd3ee5dd6bad8ddf16fb2b3267aa053cf3488c762fbc72f22489a"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+do_install () {
+    oe_runmake install DESTDIR=${D}
+}
+
+FILES_${PN} += "${libdir}/gbm/"
+
+INSANE_SKIP_${PN} = "useless-rpaths"
+INSANE_SKIP_${PN}-dev = "useless-rpaths"


