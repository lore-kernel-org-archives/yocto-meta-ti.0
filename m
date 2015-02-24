Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69B09E00944; Tue, 24 Feb 2015 13:11:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_PCNT autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  2.5 TO_NO_BRKTS_PCNT To: misformatted + percentage
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0212CE0086E
	for <meta-ti@yoctoproject.org>; Tue, 24 Feb 2015 13:11:39 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 4713452A63; Tue, 24 Feb 2015 21:11:39 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150224211139.4713452A63@arago-project.org>
Date: Tue, 24 Feb 2015 21:11:39 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : ipumm-fw: Latest firmware compatible with IPC 3.30.03.14
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
X-List-Received-Date: Tue, 24 Feb 2015 21:11:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 936fa6c78907f8b1078ea529e733703933ec33f0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=936fa6c78907f8b1078ea529e733703933ec33f0

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Mon Feb 23 19:22:58 2015 +0000

ipumm-fw: Latest firmware compatible with IPC 3.30.03.14

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...umm-fw_3.00.06.00.bb => ipumm-fw_3.00.07.02.bb} |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

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


