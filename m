Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DA3C2E00C75; Fri,  4 Sep 2015 08:36:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4EA9DE00B28
	for <meta-ti@yoctoproject.org>; Fri,  4 Sep 2015 08:36:39 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NU500K9OSP1XFG0@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 04 Sep 2015 10:36:38 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=ff-B7xzCdYMA:10 a=sozttTNsAAAA:8
	a=Gb0LvP4lQJUKMwJ9OU4A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D7C16161BD2;	Fri,
	4 Sep 2015 11:36:37 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 04 Sep 2015 11:36:37 -0400
Message-id: <1441380997-23166-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [master/fido][PATCH] u-boot-ti-staging, keystone: update with latest fixes, switch keystone over
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
X-List-Received-Date: Fri, 04 Sep 2015 15:36:41 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/keystone.inc               | 2 +-
 recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index 7920447..a91773a 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -6,7 +6,7 @@ require conf/machine/include/tune-cortexa15.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-keystone"
-PREFERRED_PROVIDER_u-boot = "u-boot-keystone"
+PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 # Increase this everytime you change something in the kernel
 MACHINE_KERNEL_PR = "r9"
diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
index 25f4782..677112a 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
@@ -7,14 +7,14 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=0507cd7da8e7ad6d6701926ec9b84c95"
 
-PR = "r6"
+PR = "r7"
 PV_append = "+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2015.07"
 
-SRCREV = "5e31eb59f03a424371c605448b6bbc2f93da787b"
+SRCREV = "3ec018bb44bca64873c934be87c182e5fea0290b"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"
-- 
2.2.0


