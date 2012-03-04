Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 157DFE00746
	for <meta-ti@yoctoproject.org>; Sat,  3 Mar 2012 21:48:41 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 2B53852A67; Sun,  4 Mar 2012 05:48:40 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120304054840.2B53852A67@arago-project.org>
Date: Sun,  4 Mar 2012 05:48:40 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : README: move meta-angstrom to optional layers
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
X-List-Received-Date: Sun, 04 Mar 2012 05:48:41 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: e31722adc42ef202ae273571ce19a7ac304e5eb6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e31722adc42ef202ae273571ce19a7ac304e5eb6

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Sat Mar  3 11:53:08 2012 +0100

README: move meta-angstrom to optional layers

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 README |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/README b/README
index 9bf6154..9c3e5ff 100644
--- a/README
+++ b/README
@@ -1,4 +1,4 @@
-This layer depends on:
+This layer hard depends on:
 
 URI: git://git.openembedded.org/openembedded-core
 branch: master
@@ -8,6 +8,8 @@ URI: git://git.openembedded.org/meta-openembedded
 branch: master
 revision: HEAD
 
+And optionally depends on:
+
 URI: git://git.angstrom-distribution.org/meta-angstrom
 branch: master
 revision: HEAD
@@ -24,8 +26,8 @@ Arago.
 Due to the above, it is now recommended to follow the instructions at
 http://www.angstrom-distribution.org/building-angstrom
 
-This will set it up for the OpenEmbedded-core layout instead of the
-old "Classic" OpenEmbedded-dev layout. You can optionally tweak
+This will set it up for the OpenEmbedded-core ('yocto') layout instead
+of the old "Classic" OpenEmbedded-dev layout. You can optionally tweak
 sources/layers.txt and conf/bblayers.conf to (de)select BSP layers.
 
 Send pull requests to meta-ti@yoctoproject.org


