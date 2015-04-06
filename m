Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DFA0CE009C1; Mon,  6 Apr 2015 15:46:32 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD66EE009A5
	for <meta-ti@yoctoproject.org>; Mon,  6 Apr 2015 15:46:28 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3E097529C6; Mon,  6 Apr 2015 22:46:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150406224627.3E097529C6@arago-project.org>
Date: Mon,  6 Apr 2015 22:46:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : ipumm-fw: Add RDEPENDS to libdce
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
X-List-Received-Date: Mon, 06 Apr 2015 22:46:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c6d2bd9547ad46577c0d4ca9df7e1f8ab75f2a78
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c6d2bd9547ad46577c0d4ca9df7e1f8ab75f2a78

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Thu Mar 26 18:38:47 2015 +0000

ipumm-fw: Add RDEPENDS to libdce

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

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


