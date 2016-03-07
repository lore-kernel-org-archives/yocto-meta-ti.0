Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9D5EBE00848; Mon,  7 Mar 2016 12:24:48 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF2C0E00803
	for <meta-ti@yoctoproject.org>; Mon,  7 Mar 2016 12:24:45 -0800 (PST)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.148])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O3O00MGQRCIKID0@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 07 Mar 2016 14:24:19 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=owABuQrjGiYlg7QJ0YIA:9
Received: by 100.15.86.14 with SMTP id 72966777; Mon, 07 Mar 2016 20:24:19 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A4CDE161EFC;	Mon,
	7 Mar 2016 15:24:18 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 07 Mar 2016 15:24:18 -0500
Message-id: <1457382258-13697-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] multiprocmgr-test: don't repackage between machines, as only K2 uses it
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
X-List-Received-Date: Mon, 07 Mar 2016 20:24:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/multiprocmgr/multiprocmgr-test_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
index 8605cf1..7ec8796 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
@@ -2,13 +2,16 @@ DESCRIPTION = "TI Multiproc Manager test code"
 
 include multiprocmgr.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEPENDS = "multiprocmgr cmem"
 RDEPENDS_${PN} = "multiprocmgr mpm-transport cmem"
 
 CC += "-I${STAGING_KERNEL_DIR}/include"
 
+# Assuming the multiprocmgr kernel API is safe
+CC[vardepsexclude] = "STAGING_KERNEL_DIR"
+
 do_compile() {
 	make -C ${S} test
 }
-- 
2.2.0


