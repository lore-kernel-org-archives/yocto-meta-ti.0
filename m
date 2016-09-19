Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6C705E008E4; Mon, 19 Sep 2016 16:00:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36E42E00777
	for <meta-ti@yoctoproject.org>; Mon, 19 Sep 2016 15:59:55 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id AF56352ABC; Mon, 19 Sep 2016 22:59:54 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160919225954.AF56352ABC@arago-project.org>
Date: Mon, 19 Sep 2016 22:59:54 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: disable SPL target for k2e-hs-evm
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
X-List-Received-Date: Mon, 19 Sep 2016 23:00:03 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 3a20d0540c72ea92a151f3ab6edb816fb42ec578
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3a20d0540c72ea92a151f3ab6edb816fb42ec578

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Sep 19 22:59:28 2016 +0000

u-boot-ti-staging: disable SPL target for k2e-hs-evm

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
index 2e8d2e6..868109b 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
@@ -21,6 +21,7 @@ TI_SECURE_DEV_PKG ?= ""
 export TI_SECURE_DEV_PKG
 
 SPL_BINARY = "MLO"
+SPL_BINARY_k2e-hs-evm = ""
 SPL_UART_BINARY = "u-boot-spl.bin"
 
 # Keystone specifics


