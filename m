Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1D86E006D9
	for <meta-ti@yoctoproject.org>; Thu, 31 May 2012 15:34:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 858F65298B; Thu, 31 May 2012 22:34:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120531223400.858F65298B@arago-project.org>
Date: Thu, 31 May 2012 22:34:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti33x-psp 3.2: set PV accordingly, when not using tipspkernel
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 31 May 2012 22:34:02 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 67088ec673a440947daa4da1af9da5115a3c9ee2
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=67088ec673a440947daa4da1af9da5115a3c9ee2

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed May 30 18:14:14 2012 -0400

linux-ti33x-psp 3.2: set PV accordingly, when not using tipspkernel

The patchset in PATCHES_OVER_PSP updates the kernel to 3.2.x, so make PV match.
This doesn't need PR or MACHINE_KERNEL_PR bumps since both the kernel ABI and
file locations remain the same.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Koen Kooi <koen@circuitco.com>

---

 recipes-kernel/linux/linux-ti33x-psp_3.2.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 38202fa..cd10044 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -10,6 +10,9 @@ S = "${WORKDIR}/git"
 
 MULTI_CONFIG_BASE_SUFFIX = ""
 
+# the PATCHES_OVER_PSP updates it to 3.2.x, so adjust PV to match
+PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.18", d)}"
+
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
 MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"


