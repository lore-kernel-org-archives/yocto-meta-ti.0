Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1A663E00BDE; Wed,  1 Jun 2016 20:16:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.13 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3C7AE00BCE
	for <meta-ti@yoctoproject.org>; Wed,  1 Jun 2016 20:16:41 -0700 (PDT)
Received: from vz-proxy-m006.mx.aol.com ([64.236.83.10])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O84007KOJRDPQ10@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 01 Jun 2016 22:16:25 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=pKq81LsWol7b8sI3Hpopew==:117
	a=pD_ry4oyNxEA:10 a=sozttTNsAAAA:8	a=GscoqnuHgEbaftV3j58A:9
Received: by 100.15.86.14 with SMTP id 150bd5f9; Thu, 02 Jun 2016 03:16:25 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CEE00162037;	Wed,
	1 Jun 2016 23:16:24 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 01 Jun 2016 23:16:24 -0400
Message-id: <1464837384-32205-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] cm3-pm-firmware: correct license to TI-TSPA
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
X-List-Received-Date: Thu, 02 Jun 2016 03:16:45 -0000

From: Denys Dmytriyenko <denys@ti.com>

It was incorrectly identified as BSD-3-Clause

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb | 2 +-
 recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb
index 2f55421..62aebb9 100644
--- a/recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb
+++ b/recipes-bsp/cm3-pm-firmware/am33x-cm3_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
 
-LICENSE = "BSD-3-Clause"
+LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
 
 PV = "1.9.0"
diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index 3b64be9..7d4626b 100644
--- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
 
-LICENSE = "BSD-3-Clause"
+LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
 
 PV = "1.9.1"
-- 
2.2.0


