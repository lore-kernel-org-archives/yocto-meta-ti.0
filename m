Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19AB5E00871; Mon, 23 Feb 2015 05:22:07 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF395E006B5
	for <meta-ti@yoctoproject.org>; Mon, 23 Feb 2015 05:22:03 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1NDM2wq004258
	for <meta-ti@yoctoproject.org>; Mon, 23 Feb 2015 07:22:02 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1NDM1T0006675
	for <meta-ti@yoctoproject.org>; Mon, 23 Feb 2015 07:22:01 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 23 Feb 2015 07:22:01 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1NDLx48011732;
	Mon, 23 Feb 2015 07:22:00 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 23 Feb 2015 18:51:58 +0530
Message-ID: <1424697718-23076-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-ti 1/1] dspdce-fw: Updated dspdce firmware for IPC 3.30.03.14
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
X-List-Received-Date: Mon, 23 Feb 2015 13:22:07 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 ...ce-fw_1.00.00.04.bb => dspdce-fw_1.00.00.05.bb} |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename recipes-bsp/dspdce-fw/{dspdce-fw_1.00.00.04.bb => dspdce-fw_1.00.00.05.bb} (55%)

diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb b/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.05.bb
similarity index 55%
rename from recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb
rename to recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.05.bb
index d8d5b01..fb38586 100644
--- a/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb
+++ b/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.05.bb
@@ -1,16 +1,16 @@
 DESCRIPTION = "Firmware for DSP for an example application called copycodectest"
 LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://DSPDCE-${PV}-Manifest.doc;md5=b8feda5a3ed8197d05993c0d0ff5590e"
+LIC_FILES_CHKSUM = "file://DSPDCE-${PV}-Manifest.doc;md5=386d1802eefc2fcf00ab01a5b4556277"
 
 COMPATIBLE_MACHINE = "dra7xx-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/dspdce/1_00_00_04/exports/dspdce-${MACHINE}-1.00.00.04.tar.gz;protocol=ftp"
+SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/dspdce/1_00_00_05/exports/dspdce-${MACHINE}-1.00.00.05.tar.gz;protocol=ftp"
 
 S = "${WORKDIR}/dspdce-${MACHINE}-${PV}"
 
-SRC_URI[md5sum] = "72722b12e90c26a85f7f1b56d749cad0"
-SRC_URI[sha256sum] = "64057db41dbee5a992db88129a9154f27c67cfbba8efdc0f09b7de38df4d58eb"
+SRC_URI[md5sum] = "4f3d5c6ef088019aa4804eaaedc8e949"
+SRC_URI[sha256sum] = "8d99c4f149613448a6d72c62a18cc7445c63c687b786658da1762c4e1c03a6a0"
 
 TARGET = "dra7-dsp1-fw.xe66"
 
-- 
1.7.9.5


