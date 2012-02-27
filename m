Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3D15E0074A
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2012 06:12:30 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9D11E52993; Mon, 27 Feb 2012 14:12:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120227141230.9D11E52993@arago-project.org>
Date: Mon, 27 Feb 2012 14:12:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : cloud9-image: ship connman-test as well to manipulate interfaces using the CLI
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
X-List-Received-Date: Mon, 27 Feb 2012 14:12:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 29b5e9cc8661e77333f376d508e7efcd1e355bfe
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=29b5e9cc8661e77333f376d508e7efcd1e355bfe

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Fri Feb 10 09:52:30 2012 +0100

cloud9-image: ship connman-test as well to manipulate interfaces using the CLI

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-misc/images/cloud9-image.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-misc/images/cloud9-image.bb b/recipes-misc/images/cloud9-image.bb
index 1a7e269..b8ef3d8 100644
--- a/recipes-misc/images/cloud9-image.bb
+++ b/recipes-misc/images/cloud9-image.bb
@@ -29,6 +29,7 @@ IMAGE_INSTALL += " \
 	mplayer2 \
 	tslib-tests tslib-calibrate \
 	iproute2 canutils \
+	connman-tests \
 "
 
 export IMAGE_BASENAME = "Cloud9-IDE"


