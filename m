Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 484B8E01301
	for <meta-ti@yoctoproject.org>; Fri, 25 Jan 2013 00:04:47 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 4121452ADE; Fri, 25 Jan 2013 08:04:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130125080446.4121452ADE@arago-project.org>
Date: Fri, 25 Jan 2013 08:04:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Cliff Brake : linux_3.1: add extra '#' to multi-line comment
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
X-List-Received-Date: Fri, 25 Jan 2013 08:04:47 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 9273b57d956aa4cbbb97b27fd8f8d2581ce247da
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9273b57d956aa4cbbb97b27fd8f8d2581ce247da

Author: Cliff Brake <cbrake@bec-systems.com>
Date:   Tue Jan 22 12:13:20 2013 -0500

linux_3.1: add extra '#' to multi-line comment

Bitbake is getting more particular:
ERROR: There is a confusing multiline, partially commented expression on
line 27 of file /scratch/oe/oe-build-core-3/sources/meta-ti/...
Please clarify whether this is all a comment or should be parsed.

Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux_3.1.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux_3.1.bb b/recipes-kernel/linux/linux_3.1.bb
index 0ec0d26..d6ed98c 100644
--- a/recipes-kernel/linux/linux_3.1.bb
+++ b/recipes-kernel/linux/linux_3.1.bb
@@ -24,6 +24,7 @@ SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;pro
 
 # Needs refresh:
 #            file://beagle/0003-OMAP3-beagle-HACK-add-in-1GHz-OPP.patch \
+#
 
 
 SRC_URI_append_beagleboard = " file://logo_linux_clut224.ppm \


