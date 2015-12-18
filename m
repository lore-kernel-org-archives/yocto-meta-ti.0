Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 799D6E00C02; Thu, 17 Dec 2015 17:07:25 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B76FDE00B88
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2015 17:07:23 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 30EA852A14; Fri, 18 Dec 2015 01:07:23 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151218010723.30EA852A14@arago-project.org>
Date: Fri, 18 Dec 2015 01:07:23 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : linux-ti-staging: Work around to avoid race condition with external module
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
X-List-Received-Date: Fri, 18 Dec 2015 01:07:25 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 4f542c3fe47a8c6be195b3c97fd83efbf930bb70
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4f542c3fe47a8c6be195b3c97fd83efbf930bb70

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Mon Dec 14 17:47:48 2015 +0000

linux-ti-staging: Work around to avoid race condition with external module

- Currently there is an issue with compiling external kernel module
which depends on symbols from another kernel module which is part of the
list of modules configured to be built as modules in the default config.
- This work around allows to avoid the issue by copying the module
symbols to the kernel directory after making the kernel modules build.
- This issue is already fixed in oe-core: master branch as of date
- This is just work around before updating to latest oe-core

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.14.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index 54530e4..88950ae 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -65,3 +65,7 @@ KERNEL_GIT_PROTOCOL = "git"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
             file://defconfig \
            "
+
+do_compile_kernelmodules_append() {
+	cp Module.symvers ${STAGING_KERNEL_BUILDDIR}/
+}


