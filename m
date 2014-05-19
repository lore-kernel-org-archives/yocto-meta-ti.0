Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8C1D1E00C09; Mon, 19 May 2014 12:20:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from comal.ext.ti.com (unknown [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD754E00B6C
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 12:20:16 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJKGQd028419
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 14:20:16 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJKGbe017000
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 14:20:16 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:20:15 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJJogA019914;	Mon, 19 May 2014 14:20:14 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 May 2014 14:19:47 -0500
Message-ID: <1400527188-16951-9-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400527188-16951-1-git-send-email-Chase.Maupin@ti.com>
References: <1400527188-16951-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] dra7xx-evm: Add sgx to MACHINE_FEATURES
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
X-List-Received-Date: Mon, 19 May 2014 19:20:23 -0000
Content-Type: text/plain

* Add sgx to the MACHINE_FEATURES so that the dra7xx-evm can
  start including sgx libraries.  NOTE: currently there are
  no driver modules that work with v3.12 of the Linux kernel
  but this does work with version 3.8.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 conf/machine/dra7xx-evm.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 14253cf..8ba2757 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -33,4 +33,4 @@ UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
 
 # Currently removing the sgx machine feature because there is no SGX package
 # available for omap5
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen sgx"
-- 
1.7.9.5


