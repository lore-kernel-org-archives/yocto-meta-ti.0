Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C09EAE00D7D; Mon, 18 Apr 2016 08:29:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2355E00C44
	for <meta-ti@yoctoproject.org>; Mon, 18 Apr 2016 08:29:10 -0700 (PDT)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.153])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5U008505O1NI30@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 18 Apr 2016 10:28:54 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=bZ94BChTKKEEaxevg_YA:9
Received: by 100.15.86.14 with SMTP id 4b4ae0bb; Mon, 18 Apr 2016 15:28:54 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id ED24F161FA3;	Mon,
	18 Apr 2016 11:28:48 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 18 Apr 2016 11:28:48 -0400
Message-id: <1460993328-18034-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] ti-softhsmv2: stop altering and expanding SELECTED_OPTIMIZATION variable
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
X-List-Received-Date: Mon, 18 Apr 2016 15:29:12 -0000

From: Denys Dmytriyenko <denys@ti.com>

This var now contains staging paths and by expanding it early, sstate ends up
churning the package for each machine built.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
index a863c3a..ea2eb3f 100644
--- a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
+++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://git.ti.com/keystone-linux/ti-softhsmv2.git;protocol=git;branch=
 #Following commit corresponds to tag DEV.SOFTHSM-01.03.00.04
 SRCREV = "c2688afb9373309751e640088705cb739997665d"
 PV = "1.3.0.4"
+PR = "r1"
 
 S = "${WORKDIR}/git"
 
@@ -31,9 +32,6 @@ INITSCRIPT_PARAMS = "defaults 10"
 
 inherit update-rc.d
 
-SELECTED_OPTIMIZATION := "${@d.getVar("SELECTED_OPTIMIZATION", True).replace("-O2", "-O3")}"
-SELECTED_OPTIMIZATION := "${@d.getVar("SELECTED_OPTIMIZATION", True).replace("-ggdb2", "")}"
-
 FILES_${PN} += "${libdir}/softhsm/lib*.so.* ${mntdir}/*"
 FILES_${PN}-dbg += "${libdir}/softhsm/.debug"
 FILES_${PN}-staticdev += "${libdir}/softhsm/*.a "
-- 
2.2.0


