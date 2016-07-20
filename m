Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9E44FE00D05; Tue, 19 Jul 2016 18:42:31 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 662AFE00D05
	for <meta-ti@yoctoproject.org>; Tue, 19 Jul 2016 18:42:27 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3792552ACA; Wed, 20 Jul 2016 01:42:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160720014225.3792552ACA@arago-project.org>
Date: Wed, 20 Jul 2016 01:42:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : ipumm-fw: Install map file into the targetfs
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
X-List-Received-Date: Wed, 20 Jul 2016 01:42:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 40bfd01824abb9da80d0e54ded36595de84e226c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=40bfd01824abb9da80d0e54ded36595de84e226c

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Tue Jul 12 12:58:40 2016 +0000

ipumm-fw: Install map file into the targetfs

This will be required to analyze the remoteproc crash related
issues, whenever it occurs.

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ipumm-fw/ipumm-fw_git.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 331c25d..3f55847 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -53,10 +53,12 @@ do_compile() {
 }
 
 TARGET = "dra7-ipu2-fw.xem4"
+TARGET_MAP = "platform/ti/dce/baseimage/package/cfg/out/ipu/release/ipu.xem4.map"
 
 do_install() {
     install -d ${D}${base_libdir}/firmware
     install -m 0644 ${S}/${TARGET} ${D}${base_libdir}/firmware/${TARGET}.${BPN}
+    install -m 0644 ${S}/${TARGET_MAP} ${D}${base_libdir}/firmware/${TARGET}.map
 }
 
 ALTERNATIVE_${PN} = "dra7-ipu2-fw.xem4"
@@ -66,4 +68,4 @@ ALTERNATIVE_PRIORITY = "20"
 
 FILES_${PN} += "${base_libdir}/firmware/*"
 
-PR = "r1"
+PR = "r2"


