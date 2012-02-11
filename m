Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6C54BE003E5
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2012 18:33:31 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id B74FE52A7E; Sat, 11 Feb 2012 02:33:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120211023330.B74FE52A7E@arago-project.org>
Date: Sat, 11 Feb 2012 02:33:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : cloud9-image: include CAN support
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
X-List-Received-Date: Sat, 11 Feb 2012 02:33:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 9c197d70799ab721501e4d8a5be11746f7867843
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9c197d70799ab721501e4d8a5be11746f7867843

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Feb  9 20:21:21 2012 +0100

cloud9-image: include CAN support

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-misc/images/cloud9-image.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-misc/images/cloud9-image.bb b/recipes-misc/images/cloud9-image.bb
index 65ce4e0..1a7e269 100644
--- a/recipes-misc/images/cloud9-image.bb
+++ b/recipes-misc/images/cloud9-image.bb
@@ -28,6 +28,7 @@ IMAGE_INSTALL += " \
 	nodejs-dev \
 	mplayer2 \
 	tslib-tests tslib-calibrate \
+	iproute2 canutils \
 "
 
 export IMAGE_BASENAME = "Cloud9-IDE"


