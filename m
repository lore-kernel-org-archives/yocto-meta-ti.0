Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C901090238
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 14:55:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13166.1773932139333450954
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 07:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6E03240C79;
	Thu, 19 Mar 2026 14:55:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M22kh4HsFWax; Thu, 19 Mar 2026 14:55:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C313E40A30;
	Thu, 19 Mar 2026 14:55:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2E60117A6CE; Thu, 19 Mar 2026 10:55:27 -0400 (EDT)
Date: Thu, 19 Mar 2026 10:55:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Shiva Tripathi <s-tripathi1@ti.com>, meta-ti@lists.yoctoproject.org,
	rs@ti.com, jcormier@criticallink.com, praneeth@ti.com,
	kamlesh@ti.com, vishalm@ti.com, k-malarvizhi@ti.com,
	vigneshr@ti.com, afd@ti.com
Subject: Re: [meta-ti][master][PATCH v7 3/3] conf: Enable dynamic security
 layer for LUKS
Message-ID: <20260319145527.GP11121@denix.org>
References: <20260319103533.2431033-1-s-tripathi1@ti.com>
 <20260319103533.2431033-4-s-tripathi1@ti.com>
 <d9e195a7-5735-410c-be03-734eff2a7497@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9e195a7-5735-410c-be03-734eff2a7497@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 14:55:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19779

On Thu, Mar 19, 2026 at 08:59:24AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 3/19/2026 5:35 AM, Shiva Tripathi wrote:
> >Register dynamic-layers/security in layer.conf with BBFILES_DYNAMIC
> >for both 'security' and 'tpm-layer' collections to conditionally
> >build LUKS encryption support when meta-security/meta-tpm layers
> >are present.
> >
> >Add meta-security to LAYERRECOMMENDS to document the optional
> >dependency for LUKS functionality.
> >
> >Update ti-core-initramfs.inc to auto-enable initramfs generation
> >when DISTRO_FEATURES contains 'luks'.
> >
> >Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
> >---
> >  meta-ti-bsp/conf/layer.conf                            | 5 +++++
> >  meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc | 2 +-
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> >
> >diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> >index f78da573..36d05b5a 100644
> >--- a/meta-ti-bsp/conf/layer.conf
> >+++ b/meta-ti-bsp/conf/layer.conf
> >@@ -20,10 +20,15 @@ LAYERDEPENDS_meta-ti-bsp = " \
> >  LAYERRECOMMENDS_meta-ti-bsp = " \
> >      openembedded-layer \
> >+    meta-security \
> >  "
> 
> The layer should be same as below:  security and tpm-layer  I was
> just using meta-security as a placeholder.

Yeah, it's quite unfortunate that layer's collection name could be different 
from layer's directory name. Some maintainers keep them the same (e.g. 
meta-ti-bsp), but some make them different (e.g. meta-security -> security 
and meta-tpm -> tpm-layer). It could be rather confusing...


> >  BBFILES_DYNAMIC += " \
> >      openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recipes*/*/*.bbappend \
> >+    security:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bb \
> >+    security:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bbappend \
> >+    tpm-layer:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bb \
> >+    tpm-layer:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bbappend \

Moreover - is there really a need to set up security top level layer here? If 
only TPM tools are needed, then just tpm-layer should be enough, even when it 
comes from within meta-security git repository.

E.g., we set up openembedded-layer here, but that's not meta-openembedded top 
level, but instead meta-oe sub-layer inside meta-openembedded. There are 
sub-layers in there, which are not needed for meta-ti-bsp dependency. Same 
thought goes to tpm-layer.


> >  "
> >  SIGGEN_EXCLUDERECIPES_ABISAFE += " \
> >diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> >index 9d3cc612..15c05e04 100644
> >--- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> >+++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> >@@ -5,7 +5,7 @@
> >  #   TI_CORE_INITRAMFS_ENABLED = "0"
> >  #
> >  #------------------------------------------------------------------------------
> >-TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') else '0'}"
> >+TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.utils.contains('DISTRO_FEATURES', 'luks', True, False, d) else '0'}"
> >  TI_CORE_INITRAMFS_KERNEL_MODULES ?= ""
> >  TI_CORE_INITRAMFS_EXTRA_INSTALL ?= ""

