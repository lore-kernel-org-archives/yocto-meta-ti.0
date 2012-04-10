Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0E9DE013A8
	for <meta-ti@yoctoproject.org>; Tue, 10 Apr 2012 13:00:50 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id EF7C152AA3; Tue, 10 Apr 2012 20:00:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120410200049.EF7C152AA3@arago-project.org>
Date: Tue, 10 Apr 2012 20:00:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : cloud9-image: add rsync
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
X-List-Received-Date: Tue, 10 Apr 2012 20:00:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d2886e63551b314b23160f2c2cf12346391ae0fa
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d2886e63551b314b23160f2c2cf12346391ae0fa

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Mon Apr  9 18:06:44 2012 +0200

cloud9-image: add rsync

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-misc/images/cloud9-image.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-misc/images/cloud9-image.bb b/recipes-misc/images/cloud9-image.bb
index b8ef3d8..c29d1cb 100644
--- a/recipes-misc/images/cloud9-image.bb
+++ b/recipes-misc/images/cloud9-image.bb
@@ -30,6 +30,7 @@ IMAGE_INSTALL += " \
 	tslib-tests tslib-calibrate \
 	iproute2 canutils \
 	connman-tests \
+	rsync \
 "
 
 export IMAGE_BASENAME = "Cloud9-IDE"


