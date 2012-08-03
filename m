Return-Path: <robert@linuxdevelopment.de>
Received: from moutng.kundenserver.de (moutng.kundenserver.de [212.227.17.10])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0889DE0141D
	for <meta-ti@yoctoproject.org>; Fri,  3 Aug 2012 03:42:54 -0700 (PDT)
Received: from localhost.localdomain
	(host-62-245-185-194.customer.m-online.net [93.104.205.194])
	by mrelayeu.kundenserver.de (node=mreu0) with ESMTP (Nemesis)
	id 0MWvXU-1TKOvR0CPs-00W0Rl; Fri, 03 Aug 2012 12:42:53 +0200
From: Robert Woerle <robert@linuxdevelopment.de>
To: meta-ti@yoctoproject.org
Date: Fri,  3 Aug 2012 12:42:49 +0200
Message-Id: <1343990569-24683-1-git-send-email-robert@linuxdevelopment.de>
X-Mailer: git-send-email 1.7.9.5
X-Provags-ID: V02:K0:wdTzDLLObAkimapFnHkzH8+EyNLqCgi/F4P2td9Qxwa
	fbgnOTh+93p51XD5VfMZgM9NWPOcdKi27EW9m4NsOkBWbtNQku
	uWoc+/ZiePGW9qD3yvZZ2uuUi5lVHYz28dz7wdCNccb6sKLU4l
	hAkJ4Zw3wv51HQsMgA891Rk39xKANaM+AgLvMzcYt7JXkKQ8XK
	SFpV+znSMzDYhC6dVzln+wzS3d3+0evfvO0/uJl9bTc39Hbql8
	hwZiyZJateNxN83od/0yZerOyOzrxCBrNUTcSY9WdyVcAjutZA
	49HcUC10+djbvK05Kx5GVR/beakUkUYo5AhcrtK+i9AHOJg2vc
	k9E0YrfAru8hKgYPQ200nhZIUddhvvaYuB5jiTQPaxpiB/HcZv
	b6oIkABBV49IdyoSz2+eSDYap6z5gTcMwY1zZctLxJP0Vbvv2Y 5Sf3B
X-Mailman-Approved-At: Wed, 08 Aug 2012 10:05:47 -0700
Cc: Robert Woerle <robert@linuxdevelopment.de>
Subject: [PATCH] fix oe warning about wrong use of proto instead of protocol
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
X-List-Received-Date: Fri, 03 Aug 2012 10:42:55 -0000

Signed-off-by: Robert Woerle <robert@linuxdevelopment.de>
---
 recipes-ti/dmai/ti-dmai.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.7.9.5


