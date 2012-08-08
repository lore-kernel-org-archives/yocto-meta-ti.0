Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DE9FE013EB
	for <meta-ti@yoctoproject.org>; Tue,  7 Aug 2012 19:59:31 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id E124E52A90; Wed,  8 Aug 2012 02:59:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120808025930.E124E52A90@arago-project.org>
Date: Wed,  8 Aug 2012 02:59:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVyIHRpLWRtYWkuaW5jOiBmaXggJ3Byb3RvPScgLXdhcm5pbmcgb24gcmVjaXBlIHBhcnNpbmc=?=
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
X-List-Received-Date: Wed, 08 Aug 2012 02:59:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 131d02fe360a39f3805a9281dd580e9f28d9ca53
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=131d02fe360a39f3805a9281dd580e9f28d9ca53

Author: Andreas Müller <schnitzeltony@googlemail.com>
Date:   Wed Aug  1 11:35:48 2012 +0200

ti-dmai.inc: fix 'proto='-warning on recipe parsing

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/dmai/ti-dmai.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/dmai/ti-dmai.inc b/recipes-ti/dmai/ti-dmai.inc
index 23481b7..58955b5 100644
--- a/recipes-ti/dmai/ti-dmai.inc
+++ b/recipes-ti/dmai/ti-dmai.inc
@@ -17,7 +17,7 @@ DMAIBRANCH           ?= "UNDEFINED_DMAIBRANCH"
 
 S = "${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/dmai_${PV}/dmai"
 
-SRC_URI = "svn://gforge.ti.com/svn/dmai/;module=${DMAIBRANCH};proto=https;user=anonymous;pswd='' \
+SRC_URI = "svn://gforge.ti.com/svn/dmai/;module=${DMAIBRANCH};protocol=https;user=anonymous;pswd='' \
 		file://loadmodules-ti-dmai-dm6446_al.sh \
 		file://loadmodules-ti-dmai-dm6467_al.sh \
 		file://loadmodules-ti-dmai-o3530_al.sh \


