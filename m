Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1CE49E00911; Tue,  8 Mar 2016 14:38:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.7 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2D8BAE0090E
	for <meta-ti@yoctoproject.org>; Tue,  8 Mar 2016 14:38:12 -0800 (PST)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.150])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O3Q00G5RS6YC980@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 08 Mar 2016 16:37:56 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=0tGySW8maceftNfHUCUfCA==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=cOf1G1nJWbc6OAYi8e4A:9
Received: by 100.15.86.14 with SMTP id 273843fa; Tue, 08 Mar 2016 22:37:56 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BD2F9161F1C;	Tue,
	8 Mar 2016 17:37:43 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 08 Mar 2016 17:37:42 -0500
Message-id: <1457476663-12641-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1457476663-12641-1-git-send-email-denis@denix.org>
References: <1457476663-12641-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/3] ipumm-fw: use update-alternatives to manage FW symlink
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
X-List-Received-Date: Tue, 08 Mar 2016 22:38:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

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
-- 
2.2.0


