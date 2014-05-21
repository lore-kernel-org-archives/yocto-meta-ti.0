Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7AABDE00B95; Wed, 21 May 2014 12:57:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57833E00BBC
	for <meta-ti@yoctoproject.org>; Wed, 21 May 2014 12:57:18 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3DFA352A78; Wed, 21 May 2014 19:57:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140521195718.3DFA352A78@arago-project.org>
Date: Wed, 21 May 2014 19:57:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Mrinmayee Hingolikar : dspdce-fw: Add DSP firmware recipe
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
X-List-Received-Date: Wed, 21 May 2014 19:57:22 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 8168e00b6df872e35b2b74f93efbbd8c15a7ad20
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8168e00b6df872e35b2b74f93efbbd8c15a7ad20

Author: Mrinmayee Hingolikar <mrinmayee@ti.com>
Date:   Tue May 20 01:19:44 2014 +0000

dspdce-fw: Add DSP firmware recipe

* Migrated the dspdce-fw recipe from meta-ti-glsdk and
  preserved authorship for Mrinmayee.
* Cleaned up for upstream:
    * Removed the MACHINE name from the recipe name
    * Used MACHINE variable in SRC_URI
    * Update to use default variables such as base_libdir

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/dspdce-fw/dspdce-fw_1.00.00.02.bb |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/dspdce-fw/dspdce-fw_1.00.00.02.bb b/recipes-ti/dspdce-fw/dspdce-fw_1.00.00.02.bb
new file mode 100644
index 0000000..69e9814
--- /dev/null
+++ b/recipes-ti/dspdce-fw/dspdce-fw_1.00.00.02.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Firmware for DSP "
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://DSPDCE-${PV}-Manifest.doc;md5=587a7b9fdd99f98fbe99af4a4ba3362a"
+
+COMPATIBLE_MACHINE = "dra7xx-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/dspdce/1_00_00_02/exports/dspdce-${MACHINE}-1.00.00.02.tar.gz;protocol=http"
+
+S = "${WORKDIR}/dspdce-${MACHINE}-${PV}"
+
+SRC_URI[md5sum] = "df19baf16f828b5d32b4eed50f0364f5"
+SRC_URI[sha256sum] = "0c0f34674110d1ef0300b61b572a326daffb95a31cc9d45888b2e50a83c6f555"
+
+TARGET = "dra7-dsp1-fw.xe66"
+
+do_install() {
+        mkdir -p ${D}${base_libdir}/firmware
+        cp ${S}/firmware/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
+}
+
+FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
+
+INSANE_SKIP_${PN} = "arch"


