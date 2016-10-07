Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8FDECE00CB5; Fri,  7 Oct 2016 15:52:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4C969E00A54
	for <meta-ti@yoctoproject.org>; Fri,  7 Oct 2016 15:52:26 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u97Mps7P027931;
	Fri, 7 Oct 2016 17:51:54 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u97MprPv025653;
	Fri, 7 Oct 2016 17:51:54 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 7 Oct 2016 17:51:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u97MpqQU020004;
	Fri, 7 Oct 2016 17:51:53 -0500
Date: Fri, 7 Oct 2016 18:51:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20161007225149.GQ12745@edge>
References: <1475878568-12740-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1475878568-12740-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-ti-staging: add lost patch for ti2016.04-rc4
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
X-List-Received-Date: Fri, 07 Oct 2016 22:52:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

NAK, will have to move the tag...


On Fri, Oct 07, 2016 at 06:16:08PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../fbdev-drm-omap-revert.patch                    | 52 ++++++++++++++++++++++
>  recipes-kernel/linux/linux-ti-staging_4.4.bb       |  4 +-
>  2 files changed, 55 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-kernel/linux/linux-ti-staging-4.4/fbdev-drm-omap-revert.patch
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging-4.4/fbdev-drm-omap-revert.patch b/recipes-kernel/linux/linux-ti-staging-4.4/fbdev-drm-omap-revert.patch
> new file mode 100644
> index 0000000..692228f
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-ti-staging-4.4/fbdev-drm-omap-revert.patch
> @@ -0,0 +1,52 @@
> +From patchwork Tue Oct  4 10:38:52 2016
> +Content-Type: text/plain; charset="utf-8"
> +MIME-Version: 1.0
> +Content-Transfer-Encoding: 7bit
> +Subject: [tiL4.4-AD] Revert "drm/omap: Create fbdev emulation only for the
> + first DRM connector"
> +Date: Tue, 04 Oct 2016 16:38:52 -0000
> +From: Peter Ujfalusi <peter.ujfalusi@ti.com>
> +X-Patchwork-Id: 26457
> +Message-Id: <20161004103852.22175-1-peter.ujfalusi@ti.com>
> +To: <tomi.valkeinen@ti.com>, <jsarha@ti.com>
> +Cc: <linux-patch-review@list.ti.com>
> +
> +This reverts commit 28847e82286dd1a95a2a48f63feb939f5c91d650.
> +
> +User space applications needs to be fixed to be able to handle this change,
> +which can take some time.
> +
> +Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> +
> +---
> +Hi,
> +
> +As per LCPD-8237:
> +
> +this revert needs to hit 2016.04 as user space is broken by the commit and they
> +need to be fixed.
> +
> +Regards,
> +Peter
> +
> + drivers/gpu/drm/omapdrm/omap_fbdev.c | 4 +---
> + 1 file changed, 1 insertion(+), 3 deletions(-)
> +
> +--
> +2.10.0
> +
> +diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +index 6c8c21c55cc2..9e62444235a2 100644
> +--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> ++++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +@@ -280,9 +280,7 @@ struct drm_fb_helper *omap_fbdev_init(struct drm_device *dev)
> + 		goto fail;
> + 	}
> +
> +-	drm_modeset_lock_all(dev);
> +-	ret = drm_fb_helper_add_one_connector(helper, priv->connectors[0]);
> +-	drm_modeset_unlock_all(dev);
> ++	ret = drm_fb_helper_single_add_all_connectors(helper);
> + 	if (ret)
> + 		goto fini;
> +
> diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
> index c3fe9bb..b23f292 100644
> --- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
> @@ -80,10 +80,12 @@ SRCREV = "aa23871a2a5a5f4aea6f9dff394c137ab4cab2a4"
>  PV = "4.4.23+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> -MACHINE_KERNEL_PR_append = "d"
> +MACHINE_KERNEL_PR_append = "e"
>  PR = "${MACHINE_KERNEL_PR}"
>  
>  KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
>  KERNEL_GIT_PROTOCOL = "git"
>  SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
>              file://defconfig"
> +
> +SRC_URI += "file://fbdev-drm-omap-revert.patch"
> -- 
> 2.7.4
> 

