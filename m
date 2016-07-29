Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ABDE1E00DF1; Fri, 29 Jul 2016 14:52:16 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7CE57E00DE7
	for <meta-ti@yoctoproject.org>; Fri, 29 Jul 2016 14:52:09 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0250E52AC2; Fri, 29 Jul 2016 21:52:08 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160729215209.0250E52AC2@arago-project.org>
Date: Fri, 29 Jul 2016 21:52:08 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : ipumm-fw: bump for multi-instance sync fix
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
X-List-Received-Date: Fri, 29 Jul 2016 21:52:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a3eb80a83d6886335619b1ca538ca9d8b72bd502
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a3eb80a83d6886335619b1ca538ca9d8b72bd502

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Thu Jul 28 19:02:59 2016 +0000

ipumm-fw: bump for multi-instance sync fix

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ipumm-fw/ipumm-fw_git.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 3f55847..53b4245 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -9,7 +9,7 @@ python __anonymous() {
 DESCRIPTION = "Firmware for IPU for supporting Accelerated MM decode and encode"
 LICENSE = "TI-TSPA"
 
-LIC_FILES_CHKSUM = "file://Texas_Instruments_ipumm_Manifest.pdf;md5=036f6300761559fbc5ce7d06e1ccea5a"
+LIC_FILES_CHKSUM = "file://Texas_Instruments_ipumm_Manifest.pdf;md5=e3e7d6efc7aca87789775198c4ca9f8e"
 
 COMPATIBLE_MACHINE = "dra7xx"
 
@@ -17,11 +17,12 @@ RDEPENDS_${PN} = " libdce"
 
 SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
 
-SRCREV = "1627fec802da688fe44c6b0cac43ff811b08f064"
+SRCREV = "7c283ebc252223a728cb542dbc10c3ca0ab53e59"
 
 S = "${WORKDIR}/git"
 
-PV = "3.00.10.01"
+PV = "3.00.11.00"
+PR = "r4"
 
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc


