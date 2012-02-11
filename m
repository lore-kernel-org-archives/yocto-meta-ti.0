Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD4BCE0136C
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2012 18:33:36 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 4D7D0529C1; Sat, 11 Feb 2012 02:33:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120211023330.4D7D0529C1@arago-project.org>
Date: Sat, 11 Feb 2012 02:33:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Tom Rini : beagleboard: Add fw_env.config
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
X-List-Received-Date: Sat, 11 Feb 2012 02:33:36 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c4ca936b97c2839b9f34e5badd19d6388c28da2d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c4ca936b97c2839b9f34e5badd19d6388c28da2d

Author: Tom Rini <trini@ti.com>
Date:   Fri Feb  3 15:59:34 2012 -0700

beagleboard: Add fw_env.config

This adds a fw_env.config file that is valid for BeagleBoard's
with NAND for U-Boot environment.

Signed-off-by: Tom Rini <trini@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../u-boot/u-boot/beagleboard/fw_env.config        |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot/beagleboard/fw_env.config b/recipes-bsp/u-boot/u-boot/beagleboard/fw_env.config
new file mode 100644
index 0000000..ba8147a
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/beagleboard/fw_env.config
@@ -0,0 +1 @@
+/dev/mtd5 0x0 0x20000 0x20000


