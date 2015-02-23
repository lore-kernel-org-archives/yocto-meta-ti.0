Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BDFE9E00871; Mon, 23 Feb 2015 05:23:05 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE4BCE006B5
	for <meta-ti@yoctoproject.org>; Mon, 23 Feb 2015 05:23:03 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1NDN32Z004834
	for <meta-ti@yoctoproject.org>; Mon, 23 Feb 2015 07:23:03 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1NDN2sH007495
	for <meta-ti@yoctoproject.org>; Mon, 23 Feb 2015 07:23:02 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 23 Feb 2015 07:23:02 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1NDN0oO021245;
	Mon, 23 Feb 2015 07:23:01 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 23 Feb 2015 18:52:58 +0530
Message-ID: <1424697778-23182-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-ti 1/1] ipumm-fw: Latest firmware compatible with IPC 3.30.03.14
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
X-List-Received-Date: Mon, 23 Feb 2015 13:23:05 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 ...umm-fw_3.00.06.00.bb => ipumm-fw_3.00.07.02.bb} |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename recipes-bsp/ipumm-fw/{ipumm-fw_3.00.06.00.bb => ipumm-fw_3.00.07.02.bb} (80%)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb
similarity index 80%
rename from recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb
rename to recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb
index 1cf24cc..5b85f83 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.07.02.bb
@@ -9,19 +9,19 @@ python __anonymous() {
 DESCRIPTION = "Firmware for IPU for supporting Accelerated MM decode and encode"
 LICENSE = "TI-TSPA"
 
-LIC_FILES_CHKSUM_dra7xx = "file://MMIP-${PV}-Manifest.doc;md5=8206ccaf28c2932afb5afd9c9575287c"
+LIC_FILES_CHKSUM_dra7xx = "file://MMIP-${PV}-Manifest.doc;md5=caa45d993ac010abe2fd319f6613bc26"
 LIC_FILES_CHKSUM_omap5-evm = "file://MMIP-${PV}-Manifest.doc;md5=39a593dd8fc2a9654c74f679ed329c45"
 
 COMPATIBLE_MACHINE = "dra7xx|omap5-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI_dra7xx = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_06_00/exports/ipumm-dra7xx-evm-3.00.06.00.tar.gz;protocol=ftp;name=dra7xx-evm"
+SRC_URI_dra7xx = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_07_02/exports/ipumm-dra7xx-evm-3.00.07.02.tar.gz;protocol=ftp;name=dra7xx-evm"
 
 SRC_URI_omap5-evm  = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_04_02/exports/ipumm-${MACHINE}-3.00.04.02.tar.gz;protocol=http;name=${MACHINE}"
 
 # DRA7xx checksums
-SRC_URI[dra7xx-evm.md5sum] = "8e1ae40eb10d631318d001463fa11d79"
-SRC_URI[dra7xx-evm.sha256sum] = "30c275146c34d11dbc2dfd568f0bbc3098a13cd981eee8a7a9766cb07d2f1ca5"
+SRC_URI[dra7xx-evm.md5sum] = "06aaf4f144d48ca16054e67e40cc7bc3"
+SRC_URI[dra7xx-evm.sha256sum] = "0f07176e313a692a05fa6bfe9f7920b677b0924287121945c6e22b3f4408670c"
 
 # OMAP5 checksums
 SRC_URI[omap5-evm.md5sum] = "1572073ebd4f6d127c4e8cf47d270b6a"
@@ -40,4 +40,4 @@ do_install() {
 
 FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
 
-PR = "r1"
+PR = "r2"
-- 
1.7.9.5


