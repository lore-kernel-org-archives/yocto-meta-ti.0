Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3AB50E00405; Mon, 27 Feb 2017 15:15:15 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F1D3E00655
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2017 15:15:13 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id B576E52A34; Mon, 27 Feb 2017 23:15:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170227231512.B576E52A34@arago-project.org>
Date: Mon, 27 Feb 2017 23:15:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Dan Murphy : conf: am43: Add hdmi dtb file to Device tree files
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
X-List-Received-Date: Mon, 27 Feb 2017 23:15:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty
Commit: 4c76c98d2a9d77c48450b01c12a63ac8d18820f2
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4c76c98d2a9d77c48450b01c12a63ac8d18820f2

Author: Dan Murphy <dmurphy@ti.com>
Date:   Fri Feb 24 02:54:28 2017 +0000

conf: am43: Add hdmi dtb file to Device tree files

AM43x was missing the hdmi dtb file in the
KERNEL_DEVICETREE variable.  Adding this in allows for
a copy to deploy directory.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/ti43x.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index 8f2e11f..2a2fd8d 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -26,7 +26,7 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 KERNEL_IMAGETYPE = "zImage"
 
-KERNEL_DEVICETREE = "am43x-epos-evm.dtb am437x-gp-evm.dtb am437x-sk-evm.dtb am437x-idk-evm.dtb"
+KERNEL_DEVICETREE = "am43x-epos-evm.dtb am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb am437x-sk-evm.dtb am437x-idk-evm.dtb"
 
 UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "am43xx_evm_config"


