Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2FB94E008BA; Mon, 27 Oct 2014 19:04:23 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65400E0087E
	for <meta-ti@yoctoproject.org>; Mon, 27 Oct 2014 19:04:17 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id AE28552A6D; Tue, 28 Oct 2014 02:04:13 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141028020413.AE28552A6D@arago-project.org>
Date: Tue, 28 Oct 2014 02:04:13 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : dspdce-fw: Updated dspdce firmware for latest IPC version
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
X-List-Received-Date: Tue, 28 Oct 2014 02:04:23 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 61396da367b8483461e016eb6a7ccfdc3018241e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=61396da367b8483461e016eb6a7ccfdc3018241e

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Mon Oct 27 14:41:20 2014 +0000

dspdce-fw: Updated dspdce firmware for latest IPC version

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...ce-fw_1.00.00.02.bb => dspdce-fw_1.00.00.04.bb} |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

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


