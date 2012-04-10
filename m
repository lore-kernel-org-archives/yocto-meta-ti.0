Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B94E5E01363
	for <meta-ti@yoctoproject.org>; Tue, 10 Apr 2012 06:17:20 -0700 (PDT)
Received: from localhost.localdomain (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id D320B4B0088
	for <meta-ti@yoctoproject.org>; Tue, 10 Apr 2012 15:17:14 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: meta-ti@yoctoproject.org
Date: Tue, 10 Apr 2012 15:17:13 +0200
Message-Id: <1334063833-9235-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
Subject: [PATCH] u-boot-git: add COMPATIBLE_MACHINE
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
X-List-Received-Date: Tue, 10 Apr 2012 13:17:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

so that an other BSP layer can also provide a u-boot_git recipe

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-bsp/u-boot/u-boot_git.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_git.bb b/recipes-bsp/u-boot/u-boot_git.bb
index 2b32ab8..3901608 100644
--- a/recipes-bsp/u-boot/u-boot_git.bb
+++ b/recipes-bsp/u-boot/u-boot_git.bb
@@ -7,6 +7,8 @@ DEFAULT_PREFERENCE_ti816x = "-1"
 
 FILESPATHPKG =. "u-boot-git:"
 
+COMPATIBLE_MACHINE = "(beagleboard|pandaboard|hawkboard|am3517-evm|am37x-evm|omapl138|omap3evm|omap3-touchbook)"
+
 # ~ TI PSP v2009.11_OMAPPSP_03.00.01.06 (+ couple of commits)
 SRC_URI_omap3evm = "git://arago-project.org/git/projects/u-boot-omap3.git;protocol=git \
     file://0001-omap3evm-Change-default-console-serial-port-from.patch \
-- 
1.7.7.6


