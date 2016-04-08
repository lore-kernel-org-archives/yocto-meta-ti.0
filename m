Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4676AE00C7B; Thu,  7 Apr 2016 21:58:05 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7ABC1E00C37
	for <meta-ti@yoctoproject.org>; Thu,  7 Apr 2016 21:58:00 -0700 (PDT)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.148])
	by vms173011.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5A00I7NTS8Y540@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 07 Apr 2016 23:57:44 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=mD6xdeS-3xI4InH0lz4A:9
Received: by 100.15.86.14 with SMTP id 3a1a6573; Fri, 08 Apr 2016 04:57:44 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C896A161F54;	Fri,
	8 Apr 2016 00:57:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 08 Apr 2016 00:57:42 -0400
Message-id: <1460091462-16011-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] bios: prevent any stripping of binaries due to different arch/format
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
X-List-Received-Date: Fri, 08 Apr 2016 04:58:05 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/bios/ti-sysbios.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-ti/bios/ti-sysbios.inc b/recipes-ti/bios/ti-sysbios.inc
index c44fec3..408be78 100644
--- a/recipes-ti/bios/ti-sysbios.inc
+++ b/recipes-ti/bios/ti-sysbios.inc
@@ -22,4 +22,7 @@ do_install() {
 ALLOW_EMPTY_${PN} = "1"
 FILES_${PN}-dev += "${SYSBIOS_INSTALL_DIR_RECIPE}"
 
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INSANE_SKIP_${PN}-dev = "arch ldflags staticdev"
-- 
2.2.0


