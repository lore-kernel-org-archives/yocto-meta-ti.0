Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02B7DE00843
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 08:18:44 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0HGIhOL008114
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 10:18:43 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0HGIhoc030141
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 10:18:43 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 17 Jan 2014 10:18:43 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0HGIbwi021359;
	Fri, 17 Jan 2014 10:18:41 -0600
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 17 Jan 2014 11:40:20 -0600
Message-ID: <1389980421-26720-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1389980421-26720-1-git-send-email-Chase.Maupin@ti.com>
References: <1389980421-26720-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] am33x-cm3: clarify when initscripts are needed
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
X-List-Received-Date: Fri, 17 Jan 2014 16:18:45 -0000
Content-Type: text/plain

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
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
 
-- 
1.7.0.4


