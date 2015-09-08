Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3CAB6E00C71; Tue,  8 Sep 2015 08:58:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99938E00C9C
	for <meta-ti@yoctoproject.org>; Tue,  8 Sep 2015 08:57:58 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5B35A529FA; Tue,  8 Sep 2015 15:57:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150908155758.5B35A529FA@arago-project.org>
Date: Tue,  8 Sep 2015 15:57:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : keystone: with the switch to latest u-boot, update UBI volume name
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
X-List-Received-Date: Tue, 08 Sep 2015 15:58:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: f6a8394593aa9a251cfbe447d72e12eeaf2c1a10
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f6a8394593aa9a251cfbe447d72e12eeaf2c1a10

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Sep  5 04:36:34 2015 +0000

keystone: with the switch to latest u-boot, update UBI volume name

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/keystone.inc |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index c541241..1253312 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -9,13 +9,17 @@ PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r9"
+MACHINE_KERNEL_PR = "r10"
 
 KERNEL_IMAGETYPE = "zImage"
 
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
+# Use the expected value of the ubifs filesystem's volume name in the kernel
+# and u-boot.
+UBI_VOLNAME = "rootfs"
+
 EXTRA_IMAGEDEPENDS += "u-boot"
 EXTRA_IMAGEDEPENDS += "boot-monitor"
 


