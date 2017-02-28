Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6B9C3E00826; Tue, 28 Feb 2017 15:55:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26B17E004D2
	for <meta-ti@yoctoproject.org>; Tue, 28 Feb 2017 15:55:04 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4A27320B6C;
	Tue, 28 Feb 2017 23:55:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id PLnMkkSXnM6I; Tue, 28 Feb 2017 23:55:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2998D209A1;
	Tue, 28 Feb 2017 23:55:02 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3E7DF16238F;
	Tue, 28 Feb 2017 18:55:01 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Tue, 28 Feb 2017 18:55:01 -0500
Message-Id: <1488326101-53160-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] ti-ipc: explicitly depend on virtual/kernel:do_shared_workdir
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
X-List-Received-Date: Tue, 28 Feb 2017 23:55:08 -0000

ipc code looks for kernel's generated version.h file:
  #include linux_version_include(KERNEL_BUILD_DIR)

which now ends up in the following shared workdir:
  work-shared/<mach>/kernel-build-artifacts/include/generated/uapi/linux/version.h

It appears if kernel is provided by sstate, shared workdir is not
getting populated, so depend on the task explicitly.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/ipc/ti-ipc_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index 6ccd2c4..5878b63 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -27,6 +27,8 @@ INITSCRIPT_PARAMS = "defaults 10"
 
 EXTRA_OECONF += "PLATFORM=${PLATFORM} KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} KERNEL_BUILD_DIR=${STAGING_KERNEL_BUILDDIR}"
 
+do_compile[depends] += "virtual/kernel:do_shared_workdir"
+
 do_configure() {
     ( cd ${S}; autoreconf -f -i -s )
     oe_runconf
-- 
2.7.4


