Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 43C39E00C9C; Fri, 12 Feb 2016 13:34:04 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42B45E00C94
	for <meta-ti@yoctoproject.org>; Fri, 12 Feb 2016 13:33:59 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id AD43152A81; Fri, 12 Feb 2016 21:33:57 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160212213357.AD43152A81@arago-project.org>
Date: Fri, 12 Feb 2016 21:33:57 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : netcp-pa-fw: update to 3.0.1.8 version
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
X-List-Received-Date: Fri, 12 Feb 2016 21:34:04 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 6d733273cc290e4db5a2000036b9c60c546164f6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6d733273cc290e4db5a2000036b9c60c546164f6

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Feb 13 02:04:59 2016 +0000

netcp-pa-fw: update to 3.0.1.8 version

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
index 9fd2541..773ad7a 100644
--- a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
+++ b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "NETCP PA firmware for Keystone"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
 
-PV = "1.0.0"
+PV = "3.0.1.8"
 PR = "r0"
 
 CLEANBROKEN = "1"
@@ -12,7 +12,7 @@ COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm|k2e-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "55c708e391c5663a9ef0bb13970f2153f82fba36"
+SRCREV = "dd8db49ed57f8ac448451cc5e54973c71a99faea"
 BRANCH ?= "ti-linux-firmware-4.1.y"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
@@ -49,7 +49,7 @@ ks2_pa_pdsp5_pam \
 do_install() {
 	install -d ${D}${base_libdir}/firmware
 	for f in ${FWBASENAME}; do
-		install -m 0644 ${S}/ti-keystone/$f-${PV}.bin ${D}${base_libdir}/firmware/$f.bin
+		install -m 0644 ${S}/ti-keystone/$f.bin ${D}${base_libdir}/firmware/$f.bin
 	done
 }
 


