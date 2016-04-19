Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 89E49E00D47; Tue, 19 Apr 2016 14:48:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.11 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AA6B0E00C2E
	for <meta-ti@yoctoproject.org>; Tue, 19 Apr 2016 14:48:07 -0700 (PDT)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.151])
	by vms173011.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5W002UXHVCHR10@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 19 Apr 2016 16:47:51 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=rLs7NKvCgGDY0Y56LuIA:9
Received: by 100.15.86.14 with SMTP id 65c1d4bc; Tue, 19 Apr 2016 21:47:51 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id DE619161FB0;	Tue,
	19 Apr 2016 17:47:35 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 19 Apr 2016 17:47:33 -0400
Message-id: <1461102453-6703-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1461102453-6703-1-git-send-email-denis@denix.org>
References: <1461102453-6703-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] eudev: only install omap rules file for TI machines
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
X-List-Received-Date: Tue, 19 Apr 2016 21:48:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

Play nice with other BSPs

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-core/udev/eudev_%.bbappend | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/recipes-core/udev/eudev_%.bbappend b/recipes-core/udev/eudev_%.bbappend
index fd0d99b..a23d015 100644
--- a/recipes-core/udev/eudev_%.bbappend
+++ b/recipes-core/udev/eudev_%.bbappend
@@ -2,8 +2,24 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI_append = " file://omap-tty.rules"
 
-PR_append = ".0"
+PR_append = ".1"
 
-do_install_append() {
+install_omap_rules() {
     install -m 0644 ${WORKDIR}/omap-tty.rules ${D}${sysconfdir}/udev/rules.d/
 }
+
+do_install_append_ti33x() {
+    install_omap_rules
+}
+
+do_install_append_ti43x() {
+    install_omap_rules
+}
+
+do_install_append_omap-a15() {
+    install_omap_rules
+}
+
+do_install_append_keystone() {
+    install_omap_rules
+}
-- 
2.2.0


