Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6666CE00708; Wed,  2 Jul 2014 13:03:37 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 184CFE00723
	for <meta-ti@yoctoproject.org>; Wed,  2 Jul 2014 13:03:27 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B8BA952AB8; Wed,  2 Jul 2014 20:03:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140702200326.B8BA952AB8@arago-project.org>
Date: Wed,  2 Jul 2014 20:03:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Maupin, Chase : vis: inhibit package strip for DSP binaries
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
X-List-Received-Date: Wed, 02 Jul 2014 20:03:37 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: c58a5d88a21613c9e4b031df9aa1e19392547f4d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c58a5d88a21613c9e4b031df9aa1e19392547f4d

Author: Maupin, Chase <chase.maupin@ti.com>
Date:   Wed Jul  2 19:04:31 2014 +0000

vis: inhibit package strip for DSP binaries

* These binaries are for the DSP and the strip command in the
  ARM compiler does not work on them.  Without this the following
  error is seen:
    * ERROR: runstrip: ''arm-linux-gnueabihf-strip' --remove-section=.comment
      --remove-section=.note '<PATH>/dra7-dsp1-fw-radio.xe66'' strip
      command failed

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/vis-fw/vis_01.50.07.15.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/recipes-bsp/vis-fw/vis_01.50.07.15.bb
index 85d8539..dfd2f41 100644
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


