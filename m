Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68BB7E00CA3; Fri,  1 Apr 2016 20:40:46 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BECE8E00A9C
	for <meta-ti@yoctoproject.org>; Fri,  1 Apr 2016 20:40:43 -0700 (PDT)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.151])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4Z00H8EM792I10@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 01 Apr 2016 22:40:27 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=vqsbpsINRNsxPEIYNsgA:9
Received: by 100.15.86.14 with SMTP id 078e7575; Sat, 02 Apr 2016 03:40:27 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 775D3161F76;	Fri,
	1 Apr 2016 23:40:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 01 Apr 2016 23:40:21 -0400
Message-id: <1459568421-18894-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] HACK: ti-xdctools, ti-xdais: disable stripping for now
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
X-List-Received-Date: Sat, 02 Apr 2016 03:40:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/devtools/ti-xdctools_3.32.00.06.bb | 2 ++
 recipes-ti/xdais/ti-xdais_7.24.00.04.bb       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb b/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
index 19bbe5d..6db742a 100644
--- a/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
+++ b/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
@@ -1,3 +1,5 @@
+INHIBIT_PACKAGE_STRIP = "1"
+
 require recipes-ti/devtools/ti-xdctools-core.inc
 
 PV = "3_32_00_06"
diff --git a/recipes-ti/xdais/ti-xdais_7.24.00.04.bb b/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
index 8148f73..6c81960 100644
--- a/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
+++ b/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
@@ -1,3 +1,5 @@
+INHIBIT_PACKAGE_STRIP = "1"
+
 require ti-xdais.inc
 
 PV = "7_24_00_04"
-- 
2.2.0


