Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BBA44E00C67; Fri,  4 Sep 2015 13:13:53 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4DF5E00AE4
	for <meta-ti@yoctoproject.org>; Fri,  4 Sep 2015 13:13:50 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C471552A67; Fri,  4 Sep 2015 20:13:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150904201349.C471552A67@arago-project.org>
Date: Fri,  4 Sep 2015 20:13:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging, keystone: update with latest fixes, switch keystone over
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
X-List-Received-Date: Fri, 04 Sep 2015 20:13:53 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a56d68804c2a895c3c496f3fa1e0ed038b257a22
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a56d68804c2a895c3c496f3fa1e0ed038b257a22

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Sep  5 01:40:41 2015 +0000

u-boot-ti-staging, keystone: update with latest fixes, switch keystone over

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/keystone.inc               |    4 ++--
 recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index 7920447..c541241 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -5,8 +5,8 @@ DEFAULTTUNE ?= "cortexa15thf-neon"
 require conf/machine/include/tune-cortexa15.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-keystone"
-PREFERRED_PROVIDER_u-boot = "u-boot-keystone"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
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


