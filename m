Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7361EE0158A
	for <meta-ti@yoctoproject.org>; Fri,  8 Mar 2013 13:18:19 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7C3A552AAF; Fri,  8 Mar 2013 21:18:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130308211818.7C3A552AAF@arago-project.org>
Date: Fri,  8 Mar 2013 21:18:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-omapl138: correct recipe's DESCRIPTION
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
X-List-Received-Date: Fri, 08 Mar 2013 21:18:19 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: a7288a2712c16ac8392adbafb7e8a76c0a353268
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a7288a2712c16ac8392adbafb7e8a76c0a353268

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Mar  8 16:13:03 2013 -0500

linux-omapl138: correct recipe's DESCRIPTION

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
index d569a8f..9618d42 100644
--- a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
@@ -1,5 +1,5 @@
 SECTION = "kernel"
-DESCRIPTION = "Linux kernel for DaVinci EVM from PSP, based on linux-davinci kernel"
+DESCRIPTION = "Linux kernel for OMAPL1 machines from PSP, based on linux-davinci kernel"
 LICENSE = "GPLv2"
 KERNEL_IMAGETYPE = "uImage"
 


