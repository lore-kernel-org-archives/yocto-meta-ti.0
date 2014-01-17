Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7F639E00875
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 09:47:38 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 470DF529A9; Fri, 17 Jan 2014 17:47:38 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140117174738.470DF529A9@arago-project.org>
Date: Fri, 17 Jan 2014 17:47:38 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : am33x-cm3: clarify when initscripts are needed
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
X-List-Received-Date: Fri, 17 Jan 2014 17:47:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: c27ca998e27e7cbf4ea758ee89c6fdce0dd2ac6a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c27ca998e27e7cbf4ea758ee89c6fdce0dd2ac6a

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Fri Jan 17 11:40:20 2014 -0600

am33x-cm3: clarify when initscripts are needed

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ti/am33x-cm3_git.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
index 75b6c73..1e99595 100644
--- a/recipes-bsp/ti/am33x-cm3_git.bb
+++ b/recipes-bsp/ti/am33x-cm3_git.bb
@@ -13,6 +13,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRCREV = "40cb75b9dd9ba15c6de1c15cbb7cce8f1a6588b8"
 BRANCH ?= "master"
 
+# This init script is only used for older kernels that do not support
+# hotplug of the firmware.  Newer kernels do not require the initscript
+# package.
 INITSCRIPT_NAME = "am335x-pm-firmware-load"
 INITSCRIPT_PARAMS = "defaults 96"
 


