Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2C20FE00973; Tue,  8 Mar 2016 15:44:38 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9EBE4E009D7
	for <meta-ti@yoctoproject.org>; Tue,  8 Mar 2016 15:44:32 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 5A64952AD5; Tue,  8 Mar 2016 23:44:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160308234430.5A64952AD5@arago-project.org>
Date: Tue,  8 Mar 2016 23:44:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ipumm-fw: use update-alternatives to manage FW symlink
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
X-List-Received-Date: Tue, 08 Mar 2016 23:44:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 771673de5b2a40aed9ef950bb5eb2ed754b1bcfb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=771673de5b2a40aed9ef950bb5eb2ed754b1bcfb

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Mar  9 04:37:42 2016 +0000

ipumm-fw: use update-alternatives to manage FW symlink

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ipumm-fw/ipumm-fw_git.bb |   15 +++++++++++----
 1 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 022d307..f415599 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -26,6 +26,8 @@ PV = "3.00.10.00"
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 
+inherit update-alternatives
+
 DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-ccsv6-native ti-ipc-rtos"
 
 export HWVERSION="ES10"
@@ -53,10 +55,15 @@ do_compile() {
 TARGET = "dra7-ipu2-fw.xem4"
 
 do_install() {
-        mkdir -p ${D}${base_libdir}/firmware
-        cp ${S}/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
+    install -d ${D}${base_libdir}/firmware
+    install -m 0644 ${S}/${TARGET} ${D}${base_libdir}/firmware/${TARGET}.${BPN}
 }
 
-FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
+ALTERNATIVE_${PN} = "dra7-ipu2-fw.xem4"
+ALTERNATIVE_LINK_NAME[dra7-ipu2-fw.xem4] = "${base_libdir}/firmware/${TARGET}"
+ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] = "${base_libdir}/firmware/${TARGET}.${BPN}"
+ALTERNATIVE_PRIORITY = "20"
+
+FILES_${PN} += "${base_libdir}/firmware/*"
 
-PR = "r0"
+PR = "r1"


