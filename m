Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F35D7E00BEC; Wed, 17 Feb 2016 13:22:31 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW,URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.9 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E1DCE00BE8
	for <meta-ti@yoctoproject.org>; Wed, 17 Feb 2016 13:22:28 -0800 (PST)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.153])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O2P00GKLNCLHO40@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 17 Feb 2016 15:21:57 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=ImGI9YP_xKlKK8iGtc4A:9
Received: by 100.15.86.14 with SMTP id 5ebcc866; Wed, 17 Feb 2016 21:21:57 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2F0A3161E90;	Wed,
	17 Feb 2016 16:21:55 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 17 Feb 2016 16:21:54 -0500
Message-id: <1455744114-5086-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/1] omap5-sgx-ddk-um-linux: bump SRCREV for gl2ext header change
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
X-List-Received-Date: Wed, 17 Feb 2016 21:22:32 -0000

From: Anand Balagopalakrishnan <anandb@ti.com>

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 .../libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
index 1d0f09f..5ac3f31 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
@@ -8,13 +8,13 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 BRANCH = "ti-img-sgx/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "0e98623e944864f080cd886906b46ea9a5d830e5"
+SRCREV = "562db8257cc4bf04647e06a8644d73f5d77fe711"
 
 TARGET_PRODUCT_omap-a15 = "jacinto6evm"
 TARGET_PRODUCT_ti33x = "ti335x"
 TARGET_PRODUCT_ti43x = "ti437x"
 
-PR = "r2"
+PR = "r3"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
 RDEPENDS_${PN} += "libdrm libudev libgbm wayland libffi libdrm-omap"
-- 
1.7.9.5


