Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0C27E01370
	for <meta-ti@yoctoproject.org>; Tue,  7 Feb 2012 22:29:26 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id CE21152A9E; Wed,  8 Feb 2012 06:29:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120208062925.CE21152A9E@arago-project.org>
Date: Wed,  8 Feb 2012 06:29:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : cloud9-image: add tslib-tests to test touchscreens
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
X-List-Received-Date: Wed, 08 Feb 2012 06:29:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 08a78956183db95153202871a20977ddca26aa02
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=08a78956183db95153202871a20977ddca26aa02

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Feb  2 19:07:22 2012 +0100

cloud9-image: add tslib-tests to test touchscreens

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

---

 recipes-misc/images/cloud9-image.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-misc/images/cloud9-image.bb b/recipes-misc/images/cloud9-image.bb
index 087e88f..5d25493 100644
--- a/recipes-misc/images/cloud9-image.bb
+++ b/recipes-misc/images/cloud9-image.bb
@@ -26,6 +26,7 @@ IMAGE_INSTALL += " \
 	gdb gdbserver \
 	nodejs-dev \
 	mplayer2 \
+	tslib-tests tslib-calibrate \
 "
 
 export IMAGE_BASENAME = "Cloud9-IDE"


