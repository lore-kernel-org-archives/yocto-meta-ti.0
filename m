Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0240E01353
	for <meta-ti@yoctoproject.org>; Tue,  7 Feb 2012 22:29:26 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id EA46052A9F; Wed,  8 Feb 2012 06:29:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120208062925.EA46052A9F@arago-project.org>
Date: Wed,  8 Feb 2012 06:29:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : cloud9-image: include systemd-analyze
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
Commit: a02281a08ace5c39428891270d2c6eb3c83be698
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a02281a08ace5c39428891270d2c6eb3c83be698

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Feb  7 16:16:42 2012 +0100

cloud9-image: include systemd-analyze

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

---

 recipes-misc/images/cloud9-image.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-misc/images/cloud9-image.bb b/recipes-misc/images/cloud9-image.bb
index 5d25493..65ce4e0 100644
--- a/recipes-misc/images/cloud9-image.bb
+++ b/recipes-misc/images/cloud9-image.bb
@@ -7,6 +7,7 @@ FATPAYLOAD = "${datadir}/beaglebone-getting-started/*"
 ROOTFSTYPE_beaglebone = "ext4"
 
 IMAGE_INSTALL += " \
+	systemd-analyze \
 	cloud9 \
 	task-sdk-target \
 	vim vim-vimrc \


