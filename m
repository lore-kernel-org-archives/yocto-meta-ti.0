Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EB308E00A71; Mon, 27 Jul 2015 17:39:37 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8885FE00A3B
	for <meta-ti@yoctoproject.org>; Mon, 27 Jul 2015 17:39:31 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3066252987; Tue, 28 Jul 2015 00:39:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150728003931.3066252987@arago-project.org>
Date: Tue, 28 Jul 2015 00:39:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : ipumm-fw: Update download path and checksum
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
X-List-Received-Date: Tue, 28 Jul 2015 00:39:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: cdce9f93dd7ed77314945ce65e843682f591daf3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=cdce9f93dd7ed77314945ce65e843682f591daf3

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Mon Jul 27 12:54:42 2015 +0000

ipumm-fw: Update download path and checksum

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb
index 2e43584..81de45e 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.08.01.bb
@@ -9,17 +9,17 @@ python __anonymous() {
 DESCRIPTION = "Firmware for IPU for supporting Accelerated MM decode and encode"
 LICENSE = "TI-TSPA"
 
-LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=caa45d993ac010abe2fd319f6613bc26"
+LIC_FILES_CHKSUM = "file://MMIP-${PV}-Manifest.doc;md5=57d49afcca8f1be47b1c4e79aa06b3ba"
 
 COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 RDEPENDS_${PN} = "libdce"
 
-SRC_URI = "http://arago-project.org/files/short-term/misc/ipumm-dra7xx-evm-${PV}.tar.gz;protocol=http"
+SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_08_01/exports/ipumm-dra7xx-evm-${PV}.tar.gz;protocol=http"
 
-SRC_URI[md5sum] = "e770dce63fdf218bb19ceb748d9812c0"
-SRC_URI[sha256sum] = "044d49b77560660bdfc29894e669fe8f70dc467c66b4acb49b24722a0799baa1"
+SRC_URI[md5sum] = "a1873333e7676ec1b7fcb18fb8b90696"
+SRC_URI[sha256sum] = "d583d827191a3772f496145cbf81747e10e7ed553d4653379576ac891019d7fb"
 
 S = "${WORKDIR}/ipumm-dra7xx-evm-${PV}"
 


