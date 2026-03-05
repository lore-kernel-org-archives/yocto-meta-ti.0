Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA196F47CDB
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 21:12:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55114.1772745156365310807
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 13:12:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 745CB40C7B;
	Thu,  5 Mar 2026 21:12:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HSacFH7NNzWY; Thu,  5 Mar 2026 21:12:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CD11140A2F;
	Thu,  5 Mar 2026 21:12:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 247F61798B8; Thu,  5 Mar 2026 16:12:25 -0500 (EST)
Date: Thu, 5 Mar 2026 16:12:25 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Shiva Tripathi <s-tripathi1@ti.com>, meta-ti@lists.yoctoproject.org,
	rs@ti.com, jcormier@criticallink.com, praneeth@ti.com,
	kamlesh@ti.com, vishalm@ti.com, k-malarvizhi@ti.com,
	vigneshr@ti.com
Subject: Re: [meta-ti][master][PATCH v4 1/3] linux-ti-staging: Add LUKS
 encryption config
Message-ID: <20260305211225.GM11121@denix.org>
References: <20260305172148.3684377-1-s-tripathi1@ti.com>
 <525a7c96-f504-4ddc-81b6-709974825760@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <525a7c96-f504-4ddc-81b6-709974825760@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Mar 2026 21:12:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19662

On Thu, Mar 05, 2026 at 02:51:44PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 3/5/2026 11:21 AM, Shiva Tripathi wrote:
> >Add conditional kernel configuration fragment for LUKS encryption with
> >fTPM support. This enables dm-crypt and necessary crypto algorithms
> >when MACHINE_FEATURES contains 'luks-encryption'.
> >
> >Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
> >---
> >  .../linux/linux-ti-staging-6.18/luks-ftpm.cfg | 28 +++++++++++++++++++
> >  .../linux/linux-ti-staging_6.18.bb            |  9 ++++++
> >  2 files changed, 37 insertions(+)
> >  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
> >
> >diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
> >new file mode 100644
> >index 00000000..234cc087
> >--- /dev/null
> >+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
> >@@ -0,0 +1,28 @@
> >+# Device Mapper support
> >+CONFIG_MD=y
> >+CONFIG_BLK_DEV_DM=y
> >+CONFIG_DM_CRYPT=y
> >+
> >+# Crypto algorithms for LUKS
> >+CONFIG_CRYPTO_XTS=y
> >+CONFIG_CRYPTO_AES=y
> >+CONFIG_CRYPTO_AES_ARM64=y
> >+CONFIG_CRYPTO_AES_ARM64_CE=y
> >+CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
> >+CONFIG_CRYPTO_SHA256=y
> >+CONFIG_CRYPTO_SHA256_ARM64=y
> >+CONFIG_CRYPTO_SHA512=y
> >+CONFIG_CRYPTO_USER_API_HASH=y
> >+CONFIG_CRYPTO_USER_API_SKCIPHER=y
> >+
> >+# Additional crypto support for LUKS2
> >+CONFIG_CRYPTO_CBC=y
> >+CONFIG_CRYPTO_ECB=y
> >+CONFIG_CRYPTO_ESSIV=y
> >+CONFIG_CRYPTO_LRW=y
> >+CONFIG_CRYPTO_PCBC=y
> >+
> >+# TPM kernel modules needed for initramfs
> >+CONFIG_TCG_TIS_CORE=m
> >+CONFIG_TCG_CRB=m
> >+
> >diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
> >index 8e4ccd7d..69d6217f 100644
> >--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
> >+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
> >@@ -35,3 +35,12 @@ module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
> >  module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
> >  module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
> >  KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
> >+
> 
> After thinking about this a little more... I'm thinking that the
> luks-encryption is more of a DISTRO_FEATURE and not a
> MACHINE_FEATURE. "tpm" would be a MACHINE_FEATURE.

This was the first thought I had - it's a distro feature.


> And the best most correct thing to do would be to do some
> combination of the two.  I assume that only some of our boards have
> tpm support, right?

On the other hand, isn't fTPM a software-only implementation of TPM?


> So I would go through the effort to add that to all of the correct
> boards, and then change the logic to check both variables.  I'll
> reply on the other patches with those changes.
> 
> 
> >+# LUKS encryption with fTPM kernel configuration
> >+SRC_URI:append:k3 = " \
> >+    ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', 'file://luks-ftpm.cfg', '', d)} \
> 
> ${@bb.utils.contains('DISTRO_FEATURES', 'luks',
> 'file://luks-ftpm.cfg', '', d)}
> 
> 
> >+"
> >+KERNEL_CONFIG_FRAGMENTS:append:k3 = " \
> >+    ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', '${UNPACKDIR}/luks-ftpm.cfg', '', d)} \
> >+"
> >+
> 
> ${@bb.utils.contains('DISTRO_FEATURES', 'luks',
> '${UNPACKDIR}/luks-ftpm.cfg', '', d)}

