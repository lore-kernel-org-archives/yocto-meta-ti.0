Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54FD7E013C2
	for <meta-ti@yoctoproject.org>; Sun,  4 Mar 2012 20:37:08 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 41B7952A86; Mon,  5 Mar 2012 04:37:07 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120305043707.41B7952A86@arago-project.org>
Date: Mon,  5 Mar 2012 04:37:07 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: remove patch that slipped in when regenerating SRC_URI
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
X-List-Received-Date: Mon, 05 Mar 2012 04:37:08 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 81f7f807d2cf11c0bf140039b786c6d8e66ea8dd
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=81f7f807d2cf11c0bf140039b786c6d8e66ea8dd

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Mar  1 10:06:46 2012 +0100

linux-ti33x-psp 3.2: remove patch that slipped in when regenerating SRC_URI

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti33x-psp_3.2.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 530fb48..b2f706a 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -480,7 +480,6 @@ PATCHES_OVER_PSP = " \
 	file://3.2.9/0051-hwmon-max6639-Fix-PPR-register-initialization-to-set.patch \
 	file://3.2.9/0052-hwmon-ads1015-Fix-file-leak-in-probe-function.patch \
 	file://3.2.9/0053-ARM-omap-fix-oops-in-drivers-video-omap2-dss-dpi.c.patch \
-	file://3.2.9/0054-ARM-omap-fix-oops-in-arch-arm-mach-omap2-vp.c-when-p.patch \
 	file://3.2.9/0055-x86-amd-Fix-L1i-and-L2-cache-sharing-information-for.patch \
 	file://3.2.9/0056-ath9k-stop-on-rates-with-idx-1-in-ath9k-rate-control.patch \
 	file://3.2.9/0057-genirq-Unmask-oneshot-irqs-when-thread-was-not-woken.patch \


