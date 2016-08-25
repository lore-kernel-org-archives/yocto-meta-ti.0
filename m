Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1FCBAE00E09; Thu, 25 Aug 2016 11:09:38 -0700 (PDT)
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
X-Greylist: delayed 3600 seconds by postgrey-1.32 at yocto-www;
	Thu, 25 Aug 2016 11:09:36 PDT
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4FD0E00DF5
	for <meta-ti@yoctoproject.org>; Thu, 25 Aug 2016 11:09:36 -0700 (PDT)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.152])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OCH00H796BA07A0@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 25 Aug 2016 12:09:15 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=0UKH5BiQkwmWfwo1rRcA:9
Received: by 100.15.86.14 with SMTP id 3ef97f21; Thu, 25 Aug 2016 17:09:15 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id AF6FB1620DB;	Thu, 25 Aug 2016 13:09:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 25 Aug 2016 13:09:06 -0400
Message-id: <1472144947-3217-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-reply-to: <1472144947-3217-1-git-send-email-denis@denix.org>
References: <1472144947-3217-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/3] u-boot-ti-staging: update to ti2016.03-rc4 tag
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
X-List-Received-Date: Thu, 25 Aug 2016 18:09:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
index 84b7316..c6485ca 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
@@ -7,14 +7,14 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 
-PR = "r13"
+PR = "r14"
 PV_append = "+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2016.05"
 
-SRCREV = "95c03ee8afb843191be2778ab6f7860a048a9b00"
+SRCREV = "2f757e5b2c6b260c647a8a1bb295537f07c3a8b9"
 
 # Support for secure devices - detailed info is in doc/README.ti-secure
 TI_SECURE_DEV_PKG ?= ""
-- 
2.7.4


