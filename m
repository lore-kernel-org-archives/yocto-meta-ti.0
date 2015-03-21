Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BFC9AE0091F; Fri, 20 Mar 2015 18:57:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6FD8FE00839
	for <meta-ti@yoctoproject.org>; Fri, 20 Mar 2015 18:57:32 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id BF697529BD; Sat, 21 Mar 2015 01:57:31 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150321015731.BF697529BD@arago-project.org>
Date: Sat, 21 Mar 2015 01:57:31 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ipumm-fw: dra7xx variant is reused for am57x MACHINE too
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
X-List-Received-Date: Sat, 21 Mar 2015 01:57:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 1b66b5a01c1d657c7603dd63110cfb21998dbc98
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1b66b5a01c1d657c7603dd63110cfb21998dbc98

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Mar 21 04:17:49 2015 +0000

ipumm-fw: dra7xx variant is reused for am57x MACHINE too

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb
index 036ea33..2401583 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb
@@ -14,12 +14,12 @@ LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=caa45d993ac010abe2fd319f6
 COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_07_02/exports/ipumm-${MACHINE}-${PV}.tar.gz;protocol=http"
+SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_07_02/exports/ipumm-dra7xx-evm-${PV}.tar.gz;protocol=http"
 
 SRC_URI[md5sum] = "06aaf4f144d48ca16054e67e40cc7bc3"
 SRC_URI[sha256sum] = "0f07176e313a692a05fa6bfe9f7920b677b0924287121945c6e22b3f4408670c"
 
-S = "${WORKDIR}/ipumm-${MACHINE}-${PV}"
+S = "${WORKDIR}/ipumm-dra7xx-evm-${PV}"
 
 TARGET = "dra7-ipu2-fw.xem4"
 
@@ -30,4 +30,4 @@ do_install() {
 
 FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
 
-PR = "r3"
+PR = "r4"


