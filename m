Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75D25E00809
	for <meta-ti@yoctoproject.org>; Fri, 21 Feb 2014 08:00:06 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 2D198529CF; Fri, 21 Feb 2014 16:00:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140221160006.2D198529CF@arago-project.org>
Date: Fri, 21 Feb 2014 16:00:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-omap-psp: specify branch for bitbake to find SRCREV
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
X-List-Received-Date: Fri, 21 Feb 2014 16:00:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 90f78e4355153a8595b7885e6de696c4b7060091
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=90f78e4355153a8595b7885e6de696c4b7060091

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Feb 21 01:17:30 2014 -0500

linux-omap-psp: specify branch for bitbake to find SRCREV

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-omap-psp_2.6.37.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-omap-psp_2.6.37.bb b/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
index 8333cc8..8f6a450 100644
--- a/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
@@ -8,12 +8,14 @@ COMPATIBLE_MACHINE = "omap3"
 # SRCREV corresponds to tag v2.6.37_OMAPPSP_04.02.00.07
 SRCREV= "adcd067326836777c049e3cb32a5b7d9d401fc31"
 
+BRANCH = "OMAPPSP_04.02.00.07"
+
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 devices
 # see conf/machine/include/omap3.inc
 MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
-SRC_URI = "git://arago-project.org/git/projects/linux-omap3.git;protocol=git \
+SRC_URI = "git://arago-project.org/git/projects/linux-omap3.git;protocol=git;branch=${BRANCH} \
            file://defconfig"
 
 # The following patches below have been upstreamed to linux kernel 2.6.39 tree


