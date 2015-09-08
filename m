Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3664E00C11; Tue,  8 Sep 2015 15:43:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A11D9E00B68
	for <meta-ti@yoctoproject.org>; Tue,  8 Sep 2015 15:43:38 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3F29352979; Tue,  8 Sep 2015 22:43:38 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150908224338.3F29352979@arago-project.org>
Date: Tue,  8 Sep 2015 22:43:38 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Gou, Hongmei : ti-codec-engine: update to version 3.24.00.08
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
X-List-Received-Date: Tue, 08 Sep 2015 22:43:41 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: eaf9466cf2ce9e05bf00809cb7c6892d49c418a7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=eaf9466cf2ce9e05bf00809cb7c6892d49c418a7

Author: Gou, Hongmei <h-gou@ti.com>
Date:   Thu Sep  3 03:09:04 2015 +0000

ti-codec-engine: update to version 3.24.00.08

* version update and install/stage the source tree w/o compiling examples

Signed-off-by: Hongmei Gou <h-gou@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../codec-engine/ti-codec-engine_3.24.00.08.bb     |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb b/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
new file mode 100644
index 0000000..06a7ce1
--- /dev/null
+++ b/recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Codec Engine for TI ARM/DSP processors"
+HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ce"
+SECTION = "devel"
+LICENSE = "BSD"
+
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/ti-staging.inc
+
+PV = "3_24_00_08"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://codec_engine_${PV}_Manifest.html;md5=de7d9c2594a6f3868e42a33b6a748ce7"
+
+SRC_URI[cetarball.md5sum] = "d66a8ccbd6cdfe9f735af9f4a07e2b9b"
+SRC_URI[cetarball.sha256sum] = "ed7b7399903bbf76af06ee6457836f344ad75b903618339bae82b3967f27ffa1"
+
+S = "${WORKDIR}/codec_engine_${PV}"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ce/${PV}/exports/codec_engine_${PV},lite.tar.gz;name=cetarball "
+
+do_install() {
+
+        # Install/Stage the Source Tree
+        install -d ${D}${CE_INSTALL_DIR_RECIPE}
+        cp -pPrf ${S}/* ${D}${CE_INSTALL_DIR_RECIPE}
+}
+
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN}-dev += "${CE_INSTALL_DIR_RECIPE}"


