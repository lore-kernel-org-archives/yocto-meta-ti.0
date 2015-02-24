Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD595E00960; Tue, 24 Feb 2015 13:11:55 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43AF3E0092E
	for <meta-ti@yoctoproject.org>; Tue, 24 Feb 2015 13:11:48 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id EB8A5529D9; Tue, 24 Feb 2015 21:11:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150224211147.EB8A5529D9@arago-project.org>
Date: Tue, 24 Feb 2015 21:11:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : dspdce-fw: Updated dspdce firmware for IPC 3.30.03.14
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
X-List-Received-Date: Tue, 24 Feb 2015 21:11:55 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: d05b2e694c8c3ccc172286c3d3250b350ef5672d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d05b2e694c8c3ccc172286c3d3250b350ef5672d

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Mon Feb 23 19:21:58 2015 +0000

dspdce-fw: Updated dspdce firmware for IPC 3.30.03.14

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...ce-fw_1.00.00.04.bb => dspdce-fw_1.00.00.05.bb} |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb b/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.05.bb
similarity index 64%
rename from recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb
rename to recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.05.bb
index d8d5b01..777c221 100644
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
 


