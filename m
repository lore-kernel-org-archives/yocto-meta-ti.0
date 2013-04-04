Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1DD91E01513
	for <meta-ti@yoctoproject.org>; Wed,  3 Apr 2013 17:26:06 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3352352A3B; Thu,  4 Apr 2013 00:26:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130404002606.3352352A3B@arago-project.org>
Date: Thu,  4 Apr 2013 00:26:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : omap-a15.inc: also set TI staging preferred provider for u-boot
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
X-List-Received-Date: Thu, 04 Apr 2013 00:26:07 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 88dd446c6b871a99eb96b3822051b07cda56e689
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=88dd446c6b871a99eb96b3822051b07cda56e689

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Apr  3 18:45:18 2013 -0400

omap-a15.inc: also set TI staging preferred provider for u-boot

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/omap-a15.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index 702898f..623f2df 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -8,6 +8,7 @@ MACHINE_KERNEL_PR = "r1"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 KERNEL_IMAGETYPE = "uImage"
 


