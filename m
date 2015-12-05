Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EDB6BE00A73; Fri,  4 Dec 2015 19:12:14 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BAD9CE009BD
	for <meta-ti@yoctoproject.org>; Fri,  4 Dec 2015 19:12:10 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C9D2C52ABD; Sat,  5 Dec 2015 03:12:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151205031209.C9D2C52ABD@arago-project.org>
Date: Sat,  5 Dec 2015 03:12:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to the latest, rename pmmc-fw to ti-sci-fw
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
X-List-Received-Date: Sat, 05 Dec 2015 03:12:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 163555182edb967c38400630bf1347bbbd078a20
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=163555182edb967c38400630bf1347bbbd078a20

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Dec  5 04:15:16 2015 +0000

linux-ti-staging: update to the latest, rename pmmc-fw to ti-sci-fw

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_4.1.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index ef953f9..fab0c2a 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -28,8 +28,8 @@ RDEPENDS_kernel-base_append_dra7xx = " vpdma-fw"
 # Install boot-monitor skern file into /boot dir of rootfs
 RDEPENDS_kernel-base_append_keystone = " boot-monitor"
 
-# Install pmmc-fw into /boot dir of rootfs
-RDEPENDS_kernel-base_append_k2g-evm = " pmmc-fw"
+# Install ti-sci-fw into /boot dir of rootfs
+RDEPENDS_kernel-base_append_k2g-evm = " ti-sci-fw"
 
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
@@ -57,11 +57,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.1.y"
 
-SRCREV = "e7ce6b9cdee62083862c3d86853819d871f853de"
+SRCREV = "f0f52afb60f57f31c099dc849c6757fea5664e89"
 PV = "4.1.13+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"


