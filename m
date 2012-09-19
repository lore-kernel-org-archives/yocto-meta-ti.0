Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 481F4E002AB
	for <meta-ti@yoctoproject.org>; Tue, 18 Sep 2012 17:03:27 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D349452A6D; Wed, 19 Sep 2012 00:03:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120919000326.D349452A6D@arago-project.org>
Date: Wed, 19 Sep 2012 00:03:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : layer.conf: lower layer priority from 10 to 6
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
X-List-Received-Date: Wed, 19 Sep 2012 00:03:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: cca43833635d1321e014d5025852100d05fd3e3f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=cca43833635d1321e014d5025852100d05fd3e3f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Sep 14 00:40:55 2012 -0400

layer.conf: lower layer priority from 10 to 6

Lowering layer priority from 10 to 6 aligns meta-ti with other BSP layers
and also allows distributions to override our recipes.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/layer.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 4afb4f3..faa4ac0 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -6,4 +6,4 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "meta-ti"
 BBFILE_PATTERN_meta-ti := "^${LAYERDIR}/"
-BBFILE_PRIORITY_meta-ti = "10"
+BBFILE_PRIORITY_meta-ti = "6"


