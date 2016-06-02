Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2320E00D45; Thu,  2 Jun 2016 10:07:25 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D7BFE00D36
	for <meta-ti@yoctoproject.org>; Thu,  2 Jun 2016 10:07:17 -0700 (PDT)
Received: from vz-proxy-m008.mx.aol.com ([64.236.83.1])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O85006W2M7W6I30@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 02 Jun 2016 12:07:09 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=IfeYs1eZmZ/JIJO4DN4ZPw==:117
	a=pD_ry4oyNxEA:10 a=sozttTNsAAAA:8	a=MDFdVLQYG8FeA0TxC2gA:9
Received: by 100.15.86.14 with SMTP id 227fb00f; Thu, 02 Jun 2016 17:07:09 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4EC48162037;	Thu,
	2 Jun 2016 13:07:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 02 Jun 2016 13:07:06 -0400
Message-id: <1464887227-13817-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] linux-ti-staging: update to 4.4.12 and ti2016.01-rc4 tag
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
X-List-Received-Date: Thu, 02 Jun 2016 17:07:26 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.4.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.4.bb    | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
index df7efdc..159693b 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"
 
 BRANCH = "ti-rt-linux-4.4.y"
 
-SRCREV = "df2157fb7ad3a5d435a9445d7b16c16c52a98969"
+SRCREV = "8c26434b1cf4e1c3011c7a9925aeb2bec735db6a"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index 2ce97e5..a756e4a 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -71,11 +71,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.4.y"
 
-SRCREV = "1d85a66844655b0cbd99c00870d77956494c59ab"
-PV = "4.4.11+git${SRCPV}"
+SRCREV = "51452e46647ed57ae83e6a95e1a4d700260e6bf0"
+PV = "4.4.12+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "c"
+MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
-- 
2.2.0


