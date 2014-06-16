Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D79AE00C0A; Mon, 16 Jun 2014 15:40:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=RDNS_DYNAMIC autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D82EE00C36
	for <meta-ti@yoctoproject.org>; Mon, 16 Jun 2014 15:40:18 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5CD9A529F5; Mon, 16 Jun 2014 22:40:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140616224018.5CD9A529F5@arago-project.org>
Date: Mon, 16 Jun 2014 22:40:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Hao Zhang : keystone: config: fix K2L boot monitor build target name error
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
X-List-Received-Date: Mon, 16 Jun 2014 22:40:21 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 4fcc5d8c08a8507115072b138d197e02f6b84cc1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4fcc5d8c08a8507115072b138d197e02f6b84cc1

Author: Hao Zhang <hzhang@ti.com>
Date:   Tue Jun 17 00:56:12 2014 +0000

keystone: config: fix K2L boot monitor build target name error

Signed-off-by: Hao Zhang <hzhang@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/k2l-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
index 0824a09..76fb3f8 100644
--- a/conf/machine/k2l-evm.conf
+++ b/conf/machine/k2l-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/keystone.inc
 
 UBOOT_MACHINE = "k2l_evm_config"
 
-BOOT_MONITOR_MAKE_TARGET = "k2hk"
+BOOT_MONITOR_MAKE_TARGET = "k2l"
 
 IMAGE_FSTYPES += "ubi tar.gz cpio"
 


