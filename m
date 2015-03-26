Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CEB3BE00961; Thu, 26 Mar 2015 05:38:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E17C2E0095D
	for <meta-ti@yoctoproject.org>; Thu, 26 Mar 2015 05:38:53 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2QCcqYi001188
	for <meta-ti@yoctoproject.org>; Thu, 26 Mar 2015 07:38:52 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2QCcpZ5028059
	for <meta-ti@yoctoproject.org>; Thu, 26 Mar 2015 07:38:51 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Mar 2015 07:38:51 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2QCcn22007021;
	Thu, 26 Mar 2015 07:38:50 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 26 Mar 2015 18:08:47 +0530
Message-ID: <1427373527-22732-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: ipumm-fw: Add RDEPENDS to libdce
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
X-List-Received-Date: Thu, 26 Mar 2015 12:38:55 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb |    4 +++-
 recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb |    4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
index f5ebd14..642c94c 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
@@ -14,6 +14,8 @@ LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=39a593dd8fc2a9654c74f679e
 COMPATIBLE_MACHINE = "omap5-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+RDEPENDS_${PN} = " libdce"
+
 SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_04_02/exports/ipumm-${MACHINE}-${PV}.tar.gz;protocol=http"
 
 SRC_URI[md5sum] = "1572073ebd4f6d127c4e8cf47d270b6a"
@@ -30,4 +32,4 @@ do_install() {
 
 FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
 
-PR = "r3"
+PR = "r4"
diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb
index 2401583..576931f 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb
@@ -14,6 +14,8 @@ LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=caa45d993ac010abe2fd319f6
 COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+RDEPENDS_${PN} = " libdce"
+
 SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_07_02/exports/ipumm-dra7xx-evm-${PV}.tar.gz;protocol=http"
 
 SRC_URI[md5sum] = "06aaf4f144d48ca16054e67e40cc7bc3"
@@ -30,4 +32,4 @@ do_install() {
 
 FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
 
-PR = "r4"
+PR = "r5"
-- 
1.7.9.5


