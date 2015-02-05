Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9A0C6E00894; Thu,  5 Feb 2015 10:10:56 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99A76E007AB
	for <meta-ti@yoctoproject.org>; Thu,  5 Feb 2015 10:10:42 -0800 (PST)
Received: from gandalf.denix.org ([108.28.89.130]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NJB0052195D5MZ0@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 05 Feb 2015 12:10:26 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=CoYIqc8G c=1 sm=1 tr=0	a=ckUr7rGttv+NBxkAVUaaIw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=0HtSIViG9nkA:10
	a=sozttTNsAAAA:8	a=kTEH2CxHhKMHeiuU8MkA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C8689200DD;	Thu,
	5 Feb 2015 13:10:25 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 05 Feb 2015 13:10:25 -0500
Message-id: <1423159825-17883-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] keystone: stop backfilling rtc
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
X-List-Received-Date: Thu, 05 Feb 2015 18:10:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/keystone.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index 9a5c11f..820fe12 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -20,3 +20,4 @@ EXTRA_IMAGEDEPENDS += "u-boot"
 EXTRA_IMAGEDEPENDS += "boot-monitor"
 
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat pci"
+MACHINE_FEATURES_BACKFILL_CONSIDERED = "rtc"
-- 
2.2.0


