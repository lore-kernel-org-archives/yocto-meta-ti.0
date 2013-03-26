Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83D4DE014E4
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 17:42:27 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 34C4952A56; Tue, 26 Mar 2013 00:42:27 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326004227.34C4952A56@arago-project.org>
Date: Tue, 26 Mar 2013 00:42:27 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: add new recipe for TI unified staging tree
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
X-List-Received-Date: Tue, 26 Mar 2013 00:42:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 8a3f7083835f0d45d33d602f18a14dc336fd7f06
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8a3f7083835f0d45d33d602f18a14dc336fd7f06

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 18 17:57:45 2013 -0400

u-boot-ti-staging: add new recipe for TI unified staging tree

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
new file mode 100644
index 0000000..866cf14
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
@@ -0,0 +1,13 @@
+require u-boot-ti.inc
+
+DESCRIPTION = "u-boot bootloader for TI devices"
+
+PR = "r1"
+
+SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
+
+BRANCH ?= "ti-u-boot-2013.01.01"
+
+SRCREV = "2309e3268c52c844f8924711b4fd7a9693f5b747"
+
+SPL_BINARY = "MLO"


