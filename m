Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8C398E00D1F; Fri, 24 Jun 2016 07:31:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3BC37E00D25
	for <meta-ti@yoctoproject.org>; Fri, 24 Jun 2016 07:31:28 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 87FFE52AC1; Fri, 24 Jun 2016 14:31:27 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160624143127.87FFE52AC1@arago-project.org>
Date: Fri, 24 Jun 2016 14:31:27 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : uio-module-drv-test: Updates to fix issues with Keystone platforms
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
X-List-Received-Date: Fri, 24 Jun 2016 14:31:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: a71da0f8247d7b7d33dec6938b9c8f757600899c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a71da0f8247d7b7d33dec6938b9c8f757600899c

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Jun 21 20:34:50 2016 +0000

uio-module-drv-test: Updates to fix issues with Keystone platforms

Made the package machine dependent due to content changes with platform
Fixed DEVICE_NAME to keystone instead of keystone-evm

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../uio-module-drv/uio-module-drv-test_git.bb      |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
index 1923b36..fd41b74 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
+++ b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
@@ -2,12 +2,13 @@ DESCRIPTION = "Test code for user space IO (UIO) driver"
 
 include uio-module-drv.inc
 
-PR = "r0"
+PR = "r1"
 
 COMPATIBLE_MACHINE = "keystone|am57xx-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEVICE_NAME_am57xx-evm = "am57xx"
-DEVICE_NAME_keystone-evm = "keystone"
+DEVICE_NAME_keystone = "keystone"
 RDEPENDS_${PN} = "uio-module-drv"
 
 do_compile() {


