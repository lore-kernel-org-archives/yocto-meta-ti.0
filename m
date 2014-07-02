Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 425DAE0054C; Wed,  2 Jul 2014 06:04:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 004FFE003D2
	for <meta-ti@yoctoproject.org>; Wed,  2 Jul 2014 06:04:37 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s62D4aYe017849
	for <meta-ti@yoctoproject.org>; Wed, 2 Jul 2014 08:04:36 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s62D4a9X027497
	for <meta-ti@yoctoproject.org>; Wed, 2 Jul 2014 08:04:36 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 2 Jul 2014 08:04:36 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s62D4Xhp015761;	Wed, 2 Jul 2014 08:04:35 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 2 Jul 2014 08:04:31 -0500
Message-ID: <1404306271-4026-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] vis: inhibit package strip for DSP binaries
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
X-List-Received-Date: Wed, 02 Jul 2014 13:04:40 -0000
Content-Type: text/plain

* These binaries are for the DSP and the strip command in the
  ARM compiler does not work on them.  Without this the following
  error is seen:
    * ERROR: runstrip: ''arm-linux-gnueabihf-strip' --remove-section=.comment
      --remove-section=.note '<PATH>/dra7-dsp1-fw-radio.xe66'' strip
      command failed

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes-bsp/vis-fw/vis_01.50.07.15.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/recipes-bsp/vis-fw/vis_01.50.07.15.bb
index 85d8539..ad9b920 100644
--- a/recipes-bsp/vis-fw/vis_01.50.07.15.bb
+++ b/recipes-bsp/vis-fw/vis_01.50.07.15.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://${S}/J6_VIS_DEMO_LINUX_BINARY_01.50.07.15-Manifest.ht
 COMPATIBLE_MACHINE = "dra7xx-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+PR = "r1"
+
 SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/vis/01_50_07_15/exports/vis-${MACHINE}-01.50.07.15.tar.gz;protocol=http"
 
 SRC_URI[md5sum] = "fe8b00e398fb3b7ada0c15b601867acb"
@@ -28,4 +30,5 @@ RDEPENDS_${PN} += "${PN}-fw"
 FILES_${PN}-fw += "${base_libdir}/firmware/${DSPAPP}"
 
 INSANE_SKIP_${PN}-fw = "arch"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1" 
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INHIBIT_PACKAGE_STRIP = "1" 
-- 
1.7.9.5


