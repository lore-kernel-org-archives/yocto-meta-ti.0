Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0177BE0174E
	for <meta-ti@yoctoproject.org>; Tue,  5 Nov 2013 10:36:28 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 5621952A14; Tue,  5 Nov 2013 18:36:27 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131105183627.5621952A14@arago-project.org>
Date: Tue,  5 Nov 2013 18:36:27 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : layer.conf: prepend instead of append to sort before oe-core in BBPATH
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
X-List-Received-Date: Tue, 05 Nov 2013 18:36:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 35234fa93748f72d1309ee3904400e02807ba890
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=35234fa93748f72d1309ee3904400e02807ba890

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Nov  4 15:00:32 2013 -0500

layer.conf: prepend instead of append to sort before oe-core in BBPATH

This helps avoid bblayers.conf ordering issues, when temporarily overriding
files from oe-core in meta-ti.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/layer.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index faa4ac0..e39bd85 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -1,5 +1,5 @@
 # We have a conf and classes directory, append to BBPATH
-BBPATH .= ":${LAYERDIR}"
+BBPATH =. "${LAYERDIR}:"
 
 # We have a recipes directory, add to BBFILES
 BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"


