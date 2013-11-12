Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCCCEE01389
	for <meta-ti@yoctoproject.org>; Mon, 11 Nov 2013 21:53:19 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 663B252A7C; Tue, 12 Nov 2013 05:53:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131112055318.663B252A7C@arago-project.org>
Date: Tue, 12 Nov 2013 05:53:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : layer.conf: revert previous prepending to BBPATH change
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
X-List-Received-Date: Tue, 12 Nov 2013 05:53:23 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a22618208949997cf4b6082c83ad49ab2e570d9c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a22618208949997cf4b6082c83ad49ab2e570d9c

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Nov 12 00:45:55 2013 -0500

layer.conf: revert previous prepending to BBPATH change

This reverts commit 35234fa93748f72d1309ee3904400e02807ba890.

This was mainly needed for DTB fix that is specific to dylan branch and
is not required for master, plus it complicates life for other layers.

There is still a problem with Poky when manually adding layers and not
thinking about the correct order...

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/layer.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index e39bd85..faa4ac0 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -1,5 +1,5 @@
 # We have a conf and classes directory, append to BBPATH
-BBPATH =. "${LAYERDIR}:"
+BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
 BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"


