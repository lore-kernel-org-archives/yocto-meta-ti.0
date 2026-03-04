Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FF5EFCE50
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 23:00:36 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31635.1772665228828962750
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 15:00:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A8B4740BD4;
	Wed,  4 Mar 2026 23:00:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TYHOxarJe9EE; Wed,  4 Mar 2026 23:00:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2A69940BA7;
	Wed,  4 Mar 2026 23:00:19 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 451C9179692; Wed,  4 Mar 2026 18:00:18 -0500 (EST)
Date: Wed, 4 Mar 2026 18:00:18 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: s-tripathi1@ti.com
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com, rs@ti.com,
	jcormier@criticallink.com, praneeth@ti.com, kamlesh@ti.com,
	vishalm@ti.com, k-malarvizhi@ti.com
Subject: Re: [meta-ti][master][PATCH v3 0/3] Add LUKS encryption with fTPM
 support
Message-ID: <20260304230018.GJ11121@denix.org>
References: <20260304193824.2495898-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304193824.2495898-1-s-tripathi1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Mar 2026 23:00:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19647

I'd like to request extra time to review this, as I'm a bit sicvk this week 
and this seems like a very major change I'm not very sure about... Please 
don't merge.


On Thu, Mar 05, 2026 at 01:08:21AM +0530, Shiva Tripathi via lists.yoctoproject.org wrote:
> This patch series adds LUKS full disk encryption support using firmware TPM
> (fTPM) for TI K3 platforms. The implementation provides hardware-backed
> encryption with keys sealed by TPM running in OP-TEE and stored in eMMC RPMB.
> 
> Background:
> TI K3 platforms do not have integrated discrete TPM hardware. To provide
> TPM 2.0 functionality, this implementation uses firmware TPM (fTPM) - a
> Trusted Application running in OP-TEE secure world. The fTPM provides
> standard TPM 2.0 interfaces while leveraging ARM TrustZone for isolation
> and eMMC RPMB (Replay Protected Memory Block) for secure persistent storage.
> 
> Key features:
> - Conditional builds: Only enabled via MACHINE_FEATURES += "luks-encryption"
> - No impact on default SDK builds
> - In-place encryption on first boot
> - TPM persistent handle for key storage (0x81080001)
> - Secure key storage in eMMC RPMB via OP-TEE
> - Security model similar to CIP Core
> 
> Use case:
> This is designed for K3 platforms requiring secure boot and encrypted
> storage, such as industrial automation, automotive, and IoT gateways where
> discrete TPM chips are cost-prohibitive but security requirements demand
> hardware-backed encryption.
> 
> Testing:
> - Tested on AM62x platform with kernel 6.18
> - First boot: Successful in-place LUKS encryption
> - Subsequent boots: Successful TPM unsealing and boot
> 
> The series is structured as follows:
> 1. Kernel configuration for LUKS and crypto support
> 2. Encrypted boot initramfs infrastructure
> 3. Machine configuration support
> 
> ---
> Changes in v3:
>  - remove separate sdimage.wks for encrypted boot, default works
>  - update encrypted-boot-common.inc to use existing hook for adding TI_CORE_INITRAMFS_ENABLED dependency on luks-encryption flag
>  - add logic to verify if partition has enough space for LUKS header before starting encryption
> 
> Changes in v2:
> - changes to use existing ti-core-initramfs instead of adding separate
> - cleanup in previous init script as per comments in v1
> - /usr/bin/busybox logs updated to echo, mesg, info
> - WORKDIR changed to UNPACKDIR
> - Link to v1: https://lore.kernel.org/all/20260302144647.1705408-1-s-tripathi1@ti.com/
> 
> 
> Shiva Tripathi (3):
>   linux-ti-staging: Add LUKS encryption config
>   initramfs: Add LUKS encryption module with fTPM
>   machine: Add encrypted boot configuration
> 
>  .../machine/include/encrypted-boot-common.inc |  16 +
>  .../linux/linux-ti-staging-6.18/luks-ftpm.cfg |  28 ++
>  .../linux/linux-ti-staging_6.18.bb            |   9 +
>  .../initramfs-module-luks-ftpm/luksftpm       | 341 ++++++++++++++++++
>  .../initramfs-module-luks-ftpm_1.0.bb         |  41 +++
>  .../packagegroup-ti-core-initramfs.bb         |   1 +
>  6 files changed, 436 insertions(+)
>  create mode 100644 meta-ti-bsp/conf/machine/include/encrypted-boot-common.inc
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm/luksftpm
>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm_1.0.bb
> 
> -- 
> 2.34.1

