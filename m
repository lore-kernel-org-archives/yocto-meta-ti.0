Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D41E4E00A84; Mon, 12 Sep 2016 15:41:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: *  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP,
	but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [206.46.173.15 listed in list.dnswl.org]
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6DDBE00A4B
	for <meta-ti@yoctoproject.org>; Mon, 12 Sep 2016 15:41:05 -0700 (PDT)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.148])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0ODE003F4XODEJA0@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 12 Sep 2016 17:41:04 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=GW1xBdLrtEIA:10 a=sozttTNsAAAA:8	a=MDFdVLQYG8FeA0TxC2gA:9
Received: by 100.15.86.14 with SMTP id 5825bc4a; Mon, 12 Sep 2016 22:41:04 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 661BA162107;	Mon, 12 Sep 2016 18:41:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 12 Sep 2016 18:40:52 -0400
Message-id: <1473720059-26466-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/8] linux-ti-staging: update to 4.4.20 and ti2016.04-rc1 tag
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
X-List-Received-Date: Mon, 12 Sep 2016 22:41:08 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.4.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.4.bb    | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
index 12607d9..049a7ee 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"
 
 BRANCH = "ti-rt-linux-4.4.y"
 
-SRCREV = "efd77c72b9d67a96c9179e0cdf850aa47feb8c21"
+SRCREV = "f8c45f6a24b969bfe5a734ebd721ab9c0a3d9f0c"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index 4c4a8e5..7029f35 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -73,11 +73,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.4.y"
 
-SRCREV = "20272d4fd5fd81c551d8a31a3daddc18923b71bb"
-PV = "4.4.19+git${SRCPV}"
+SRCREV = "00f19d3e5347c2992fe0de52cabe5d379673973d"
+PV = "4.4.20+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-- 
2.7.4


