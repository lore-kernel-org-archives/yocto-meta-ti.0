Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ADD15E004D2
	for <meta-ti@yoctoproject.org>; Mon, 20 Feb 2012 18:30:14 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 551EB52AC0; Tue, 21 Feb 2012 02:30:14 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120221023014.551EB52AC0@arago-project.org>
Date: Tue, 21 Feb 2012 02:30:14 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Tom Rini : u-boot git: Update omap3-touchbook for u-boot-fw-utils change
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
X-List-Received-Date: Tue, 21 Feb 2012 02:30:14 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 1471bbad1740635ea55b3cfeb0e942de2fa272be
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1471bbad1740635ea55b3cfeb0e942de2fa272be

Author: Tom Rini <trini@ti.com>
Date:   Mon Feb 13 11:40:28 2012 -0700

u-boot git: Update omap3-touchbook for u-boot-fw-utils change

Signed-off-by: Tom Rini <trini@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot_git.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_git.bb b/recipes-bsp/u-boot/u-boot_git.bb
index 5abb6f5..2b32ab8 100644
--- a/recipes-bsp/u-boot/u-boot_git.bb
+++ b/recipes-bsp/u-boot/u-boot_git.bb
@@ -1,5 +1,5 @@
 require u-boot.inc
-PR ="r67"
+PR ="r68"
 
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_ti814x = "-1"
@@ -57,3 +57,5 @@ PV_hawkboard               = "2009.08+gitr${SRCREV}"
 
 
 S = "${WORKDIR}/git"
+
+RRECOMMENDS_${PN}_omap3-touchbook = "u-boot-fw-utils"


