Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6AEC7E006E6
	for <meta-ti@yoctoproject.org>; Fri, 22 Nov 2013 06:58:47 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAMEwltZ027874
	for <meta-ti@yoctoproject.org>; Fri, 22 Nov 2013 08:58:47 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAMEwlm5023595
	for <meta-ti@yoctoproject.org>; Fri, 22 Nov 2013 08:58:47 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 22 Nov 2013 08:58:46 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAMEwfgY019338;
	Fri, 22 Nov 2013 08:58:45 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 22 Nov 2013 10:00:46 -0600
Message-ID: <1385136047-15830-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1385136047-15830-1-git-send-email-fcooper@ti.com>
References: <1385136047-15830-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] linux-ti-staging_3.12: Pull in commit that includes SGX DT patches
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
X-List-Received-Date: Fri, 22 Nov 2013 14:58:47 -0000
Content-Type: text/plain

* Update the kernel git tree to use the latest commit.
* The latest commit pulls in necessary patches to add SGX DT entry for AM43x and
  AM335x.
* These patches are required to properly support the latest Graphics SDK.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_3.12.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 3abc2f4..ebdefa8 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -31,11 +31,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.12.y"
 
-SRCREV = "6a59302de4852678ccde5008ce531075c9b683d9"
+SRCREV = "95cb8e7d94bdbc6cd26b6d2ab074343a8dd81b7a"
 PV = "3.12"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
-- 
1.7.0.4


