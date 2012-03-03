Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7D0FE003E4
	for <meta-ti@yoctoproject.org>; Sat,  3 Mar 2012 00:14:40 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 8ECA0529B7; Sat,  3 Mar 2012 08:14:39 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120303081439.8ECA0529B7@arago-project.org>
Date: Sat,  3 Mar 2012 08:14:39 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : multi-kernel.inc: fix the unpack issue when there' s no machine configs
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
X-List-Received-Date: Sat, 03 Mar 2012 08:14:40 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 020b6f893d13e36bccd7a2d8e6a0e6ab5e602450
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=020b6f893d13e36bccd7a2d8e6a0e6ab5e602450

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Mar  3 03:07:40 2012 -0500

multi-kernel.inc: fix the unpack issue when there's no machine configs

BitBake's fetch2 unpack() seems to be picky about multi-kernel's
file://configs/* and defaults to only looking into machine-specific
location. This fixes the issue, as tested by building these platforms:
beaglebone, am335x-evm and am180x-evm.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/multi-kernel.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kernel.inc
index 12f2284..5314454 100644
--- a/recipes-kernel/linux/multi-kernel.inc
+++ b/recipes-kernel/linux/multi-kernel.inc
@@ -13,7 +13,7 @@
 require linux.inc
 
 SRC_URI += " \
-           file://configs/* "
+           file://configs "
 
 MULTI_CONFIG_BASE_SUFFIX = "multi-config-"
 


