Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 64C7DE00C75; Fri,  7 Oct 2016 15:16:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07045E00C71
	for <meta-ti@yoctoproject.org>; Fri,  7 Oct 2016 15:16:11 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D9D0120918;
	Fri,  7 Oct 2016 22:16:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id mSl7JvH2CVIl; Fri,  7 Oct 2016 22:16:10 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BB429208E7;
	Fri,  7 Oct 2016 22:16:09 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id C516316216E;
	Fri,  7 Oct 2016 18:16:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri,  7 Oct 2016 18:16:08 -0400
Message-Id: <1475878568-12740-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] linux-ti-staging: add lost patch for ti2016.04-rc4
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
X-List-Received-Date: Fri, 07 Oct 2016 22:16:15 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../fbdev-drm-omap-revert.patch                    | 52 ++++++++++++++++++++++
 recipes-kernel/linux/linux-ti-staging_4.4.bb       |  4 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-ti-staging-4.4/fbdev-drm-omap-revert.patch

diff --git a/recipes-kernel/linux/linux-ti-staging-4.4/fbdev-drm-omap-revert.patch b/recipes-kernel/linux/linux-ti-staging-4.4/fbdev-drm-omap-revert.patch
new file mode 100644
index 0000000..692228f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.4/fbdev-drm-omap-revert.patch
@@ -0,0 +1,52 @@
+From patchwork Tue Oct  4 10:38:52 2016
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: [tiL4.4-AD] Revert "drm/omap: Create fbdev emulation only for the
+ first DRM connector"
+Date: Tue, 04 Oct 2016 16:38:52 -0000
+From: Peter Ujfalusi <peter.ujfalusi@ti.com>
+X-Patchwork-Id: 26457
+Message-Id: <20161004103852.22175-1-peter.ujfalusi@ti.com>
+To: <tomi.valkeinen@ti.com>, <jsarha@ti.com>
+Cc: <linux-patch-review@list.ti.com>
+
+This reverts commit 28847e82286dd1a95a2a48f63feb939f5c91d650.
+
+User space applications needs to be fixed to be able to handle this change,
+which can take some time.
+
+Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
+
+---
+Hi,
+
+As per LCPD-8237:
+
+this revert needs to hit 2016.04 as user space is broken by the commit and they
+need to be fixed.
+
+Regards,
+Peter
+
+ drivers/gpu/drm/omapdrm/omap_fbdev.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+--
+2.10.0
+
+diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
+index 6c8c21c55cc2..9e62444235a2 100644
+--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
++++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
+@@ -280,9 +280,7 @@ struct drm_fb_helper *omap_fbdev_init(struct drm_device *dev)
+ 		goto fail;
+ 	}
+
+-	drm_modeset_lock_all(dev);
+-	ret = drm_fb_helper_add_one_connector(helper, priv->connectors[0]);
+-	drm_modeset_unlock_all(dev);
++	ret = drm_fb_helper_single_add_all_connectors(helper);
+ 	if (ret)
+ 		goto fini;
+
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index c3fe9bb..b23f292 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -80,10 +80,12 @@ SRCREV = "aa23871a2a5a5f4aea6f9dff394c137ab4cab2a4"
 PV = "4.4.23+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "d"
+MACHINE_KERNEL_PR_append = "e"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
             file://defconfig"
+
+SRC_URI += "file://fbdev-drm-omap-revert.patch"
-- 
2.7.4


