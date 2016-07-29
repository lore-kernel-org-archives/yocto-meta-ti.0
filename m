Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 980AEE00D72; Fri, 29 Jul 2016 11:20:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41C04E00D63
	for <meta-ti@yoctoproject.org>; Fri, 29 Jul 2016 11:20:55 -0700 (PDT)
Received: from vz-proxy-m001.mx.aol.com ([64.236.83.14])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OB300JKZ9M6CA70@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 29 Jul 2016 13:20:30 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=MJxOpqxZADbEbEImuSX/mw==:117
	a=cAmyUtKerLwA:10 a=sozttTNsAAAA:8	a=VwQbUJbxAAAA:8
	a=luf42yig4mzWprlT-FwA:9
Received: by 100.15.86.14 with SMTP id 77b09422; Fri, 29 Jul 2016 18:20:29 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id A48201620BD;	Fri, 29 Jul 2016 14:20:29 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 29 Jul 2016 14:20:28 -0400
Message-id: <1469816428-17878-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kselftests: update to 4.4, don't need to depend on kernel
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
X-List-Received-Date: Fri, 29 Jul 2016 18:20:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/kselftests/{kselftests_4.1.bb => kselftests_4.4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-kernel/kselftests/{kselftests_4.1.bb => kselftests_4.4.bb} (95%)

diff --git a/recipes-kernel/kselftests/kselftests_4.1.bb b/recipes-kernel/kselftests/kselftests_4.4.bb
similarity index 95%
rename from recipes-kernel/kselftests/kselftests_4.1.bb
rename to recipes-kernel/kselftests/kselftests_4.4.bb
index 2dced11..3cdf4f1 100644
--- a/recipes-kernel/kselftests/kselftests_4.1.bb
+++ b/recipes-kernel/kselftests/kselftests_4.4.bb
@@ -4,14 +4,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 SRC_URI = "https://www.kernel.org/pub/linux/kernel/v4.x/linux-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "fe9dc0f6729f36400ea81aa41d614c37"
-SRC_URI[sha256sum] = "caf51f085aac1e1cea4d00dbbf3093ead07b551fc07b31b2a989c05f8ea72d9f"
+SRC_URI[md5sum] = "9a78fa2eb6c68ca5a40ed5af08142599"
+SRC_URI[sha256sum] = "401d7c8fef594999a460d10c72c5a94e9c2e1022f16795ec51746b0d165418b2"
 
 S = "${WORKDIR}/linux-${PV}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-DEPENDS = "virtual/kernel popt"
+DEPENDS = "popt"
 
 inherit kernel-arch
 
-- 
2.7.4


