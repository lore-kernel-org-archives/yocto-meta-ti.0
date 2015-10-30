Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D8896E00B76; Fri, 30 Oct 2015 16:36:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
X-Greylist: delayed 3601 seconds by postgrey-1.32 at yocto-www;
	Fri, 30 Oct 2015 16:36:26 PDT
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AEA0BE00B5D
	for <meta-ti@yoctoproject.org>; Fri, 30 Oct 2015 16:36:26 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NX2006481G1BR40@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 30 Oct 2015 17:36:06 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=5lJygRwiOn0A:10 a=sozttTNsAAAA:8
	a=lNLbqB1nbMv5Kq3l_bEA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E7544161CBE;	Fri,
	30 Oct 2015 18:36:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 30 Oct 2015 18:35:54 -0400
Message-id: <1446244554-20019-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1446244554-20019-1-git-send-email-denis@denix.org>
References: <1446244554-20019-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/3] linux-ti-staging: update to 4.1.12 with latest merges
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
X-List-Received-Date: Fri, 30 Oct 2015 23:36:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_4.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index 3bc43f4..c8c3f2c 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -53,8 +53,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.1.y"
 
-SRCREV = "780c47e7ec4e024e9f7224b51234e545697896a5"
-PV = "4.1.10+git${SRCPV}"
+SRCREV = "8a6bfa3c90407b6588ec58724b0f6c3eefbca8fc"
+PV = "4.1.12+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
2.2.0


