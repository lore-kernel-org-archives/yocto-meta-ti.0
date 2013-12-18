Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC898E007F7
	for <meta-ti@yoctoproject.org>; Tue, 17 Dec 2013 18:52:34 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id E9CBA52A4A; Wed, 18 Dec 2013 02:52:31 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131218025231.E9CBA52A4A@arago-project.org>
Date: Wed, 18 Dec 2013 02:52:31 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: update with am43x dtb relocation fix
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
X-List-Received-Date: Wed, 18 Dec 2013 02:52:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 3e172af0614a30bab075637039ea90468d362432
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3e172af0614a30bab075637039ea90468d362432

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Dec 17 20:26:22 2013 -0500

u-boot-ti-staging: update with am43x dtb relocation fix

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
index e0623fd..af17f96 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
@@ -5,14 +5,14 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 
 PV = "2013.10"
-PR = "r2+gitr${SRCPV}"
+PR = "r3+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2013.10"
 
 # Corresponds to ti2013.12.00 release
-SRCREV = "310aa487aa540609dc5e6a27dfa6c36067babf8c"
+SRCREV = "562aa886438ea60cda487565b548b71407eaca26"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"


