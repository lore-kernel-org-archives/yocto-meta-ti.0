Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B6D1AE00C78; Wed,  2 Sep 2015 14:09:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 580C1E006D5
	for <meta-ti@yoctoproject.org>; Wed,  2 Sep 2015 14:09:20 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t82L9Jfn011380
	for <meta-ti@yoctoproject.org>; Wed, 2 Sep 2015 16:09:19 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t82L9Jem012730
	for <meta-ti@yoctoproject.org>; Wed, 2 Sep 2015 16:09:19 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 2 Sep 2015 16:09:19 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t82L9Jxf019286;	Wed, 2 Sep 2015 16:09:19 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 2 Sep 2015 17:09:04 -0400
Message-ID: <1441228144-26221-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-codec-engine: update to version 3.24.00.08
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
X-List-Received-Date: Wed, 02 Sep 2015 21:09:23 -0000
Content-Type: text/plain

* version update and install/stage the source tree w/o compiling examples

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../codec-engine/ti-codec-engine_3.24.00.08.bb     | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 recipes-ti/codec-engine/ti-codec-engine_3.24.00.08.bb

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
-- 
1.9.1


