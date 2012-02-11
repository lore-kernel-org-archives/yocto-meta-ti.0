Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD4ECE013A2
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2012 18:33:36 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 8BC1352A78; Sat, 11 Feb 2012 02:33:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120211023330.8BC1352A78@arago-project.org>
Date: Sat, 11 Feb 2012 02:33:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : beaglebone-getting-started: update to latest git
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
Commit: e58c65aca39d3688f3455c31309a54bd3e2ddc56
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e58c65aca39d3688f3455c31309a54bd3e2ddc56

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Feb  9 20:21:19 2012 +0100

beaglebone-getting-started: update to latest git

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-misc/payload/beaglebone-getting-started.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-misc/payload/beaglebone-getting-started.bb b/recipes-misc/payload/beaglebone-getting-started.bb
index 142da90..b135176 100644
--- a/recipes-misc/payload/beaglebone-getting-started.bb
+++ b/recipes-misc/payload/beaglebone-getting-started.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "BeagleBone Getting Started Guide"
 
-PR = "r16"
+PR = "r17"
 
 inherit allarch
 
 LICENSE = "GPLv2+ & MIT & PD & others"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=603591dea023c3c75b48e07cb47ce639"
 
-SRCREV = "a698888220634a1b549bc2f2e6b33aa03709cb19"
+SRCREV = "5b93037d0504ab194709cf8b6dc3890fefe19fd9"
 SRC_URI = "git://github.com/jadonk/beaglebone-getting-started.git"
 
 S = "${WORKDIR}/git"


