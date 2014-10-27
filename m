Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 669C3E00902; Mon, 27 Oct 2014 01:46:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2CBDDE0084A
	for <meta-ti@yoctoproject.org>; Mon, 27 Oct 2014 01:46:17 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9R8kGTv016006
	for <meta-ti@yoctoproject.org>; Mon, 27 Oct 2014 03:46:16 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9R8kGju010667
	for <meta-ti@yoctoproject.org>; Mon, 27 Oct 2014 03:46:16 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 27 Oct 2014 03:46:15 -0500
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s9R8kENU032274;	Mon, 27 Oct 2014 03:46:15 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 27 Oct 2014 14:11:20 +0530
Message-ID: <1414399280-21816-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v3 1/1] dspdce-fw: Updated dspdce firmware for latest IPC version
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
X-List-Received-Date: Mon, 27 Oct 2014 08:46:23 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 ...ce-fw_1.00.00.02.bb => dspdce-fw_1.00.00.04.bb} |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)
 rename recipes-bsp/dspdce-fw/{dspdce-fw_1.00.00.02.bb => dspdce-fw_1.00.00.04.bb} (52%)

diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.02.bb b/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb
similarity index 52%
rename from recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.02.bb
rename to recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb
index 69e9814..d8d5b01 100644
--- a/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.02.bb
+++ b/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb
@@ -1,16 +1,16 @@
-DESCRIPTION = "Firmware for DSP "
+DESCRIPTION = "Firmware for DSP for an example application called copycodectest"
 LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://DSPDCE-${PV}-Manifest.doc;md5=587a7b9fdd99f98fbe99af4a4ba3362a"
+LIC_FILES_CHKSUM = "file://DSPDCE-${PV}-Manifest.doc;md5=b8feda5a3ed8197d05993c0d0ff5590e"
 
 COMPATIBLE_MACHINE = "dra7xx-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/dspdce/1_00_00_02/exports/dspdce-${MACHINE}-1.00.00.02.tar.gz;protocol=http"
+SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/dspdce/1_00_00_04/exports/dspdce-${MACHINE}-1.00.00.04.tar.gz;protocol=ftp"
 
 S = "${WORKDIR}/dspdce-${MACHINE}-${PV}"
 
-SRC_URI[md5sum] = "df19baf16f828b5d32b4eed50f0364f5"
-SRC_URI[sha256sum] = "0c0f34674110d1ef0300b61b572a326daffb95a31cc9d45888b2e50a83c6f555"
+SRC_URI[md5sum] = "72722b12e90c26a85f7f1b56d749cad0"
+SRC_URI[sha256sum] = "64057db41dbee5a992db88129a9154f27c67cfbba8efdc0f09b7de38df4d58eb"
 
 TARGET = "dra7-dsp1-fw.xe66"
 
@@ -22,3 +22,5 @@ do_install() {
 FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
 
 INSANE_SKIP_${PN} = "arch"
+
+PR = "r1"
-- 
1.7.9.5


