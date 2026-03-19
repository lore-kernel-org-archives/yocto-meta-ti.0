Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7A91088E5E
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 17:31:23 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1853.1773941478951414174
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 10:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3B89A40C79;
	Thu, 19 Mar 2026 17:31:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TaNcfjuMc7nK; Thu, 19 Mar 2026 17:31:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8C67D406B9;
	Thu, 19 Mar 2026 17:31:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DF2F117A6FB; Thu, 19 Mar 2026 13:31:06 -0400 (EDT)
Date: Thu, 19 Mar 2026 13:31:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: s-tripathi1@ti.com
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com, rs@ti.com,
	jcormier@criticallink.com, praneeth@ti.com, kamlesh@ti.com,
	vishalm@ti.com, k-malarvizhi@ti.com, vigneshr@ti.com, afd@ti.com
Subject: Re: [meta-ti][master][PATCH v8 0/3] Add LUKS encryption with fTPM
 support
Message-ID: <20260319173106.GQ11121@denix.org>
References: <20260319165833.137342-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319165833.137342-1-s-tripathi1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 17:31:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19787

Thanks for addressing all the comments - this now looks reasonable to me.


On Thu, Mar 19, 2026 at 10:28:30PM +0530, Shiva Tripathi via lists.yoctoproject.org wrote:
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
> - Conditional builds: Enabled via DISTRO_FEATURES += "luks" with MACHINE_FEATURES as 'optee-ftpm'
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
> 2. LUKS encryption initramfs module with fTPM key management
> 3. Dynamic layer registration and initramfs configuration
> 
> ---
> Changes in v8:
> - Update 'meta-security' to 'tpm-layer' collection name in LAYERRECOMMENDS
> - Only register 'tpm-layer' in BBFILES_DYNAMIC (removed 'security' collection)
> - Rename dynamic-layers/security/ to dynamic-layers/tpm-layer/ to match collection
> - Add S = "${UNPACKDIR}" to initramfs-module-luks-ftpm recipe to fix build warning
> - Link to v7: https://lore.kernel.org/all/20260319103533.2431033-1-s-tripathi1@ti.com/
> 
> Changes in v7:
> - Added 'tpm-layer' collection registration to BBFILES_DYNAMIC for TPM packages
> - Added meta-security to LAYERRECOMMENDS
> - Link to v6: https://lore.kernel.org/all/20260318145732.2115521-1-s-tripathi1@ti.com/
> 
> Changes in v6:
> - Moved initramfs-module-luks-ftpm to dynamic-layers/security/
> - Added BBFILES_DYNAMIC registration for 'security' layer in layer.conf
> - Eliminates hard dependency on meta-security layer
> - Packagegroup LUKS logic moved from base .bb to dynamic-layers bbappend
> - Link to v5: https://lore.kernel.org/all/20260306163735.1316257-1-s-tripathi1@ti.com/
> 
> Changes in v5:
> - change from MACHINE_FEATURES 'luks-encryption' to DISTRO_FEATURES 'luks'
> - implement dual gating using existing MACHINE_FEATURES 'optee-ftpm'
> - optimize kernel config - remove unnecessary CBC, ECB, ESSIV, LRW, PCBC, SHA256_ARM64
> - packagegroup-ti-core-initramfs.bb changes moved to patch 3 from patch2
> - Link to v4: https://lore.kernel.org/all/20260305172115.3684326-1-s-tripathi1@ti.com/
> 
> Changes in v4:
> - remove encrypted-boot-common.inc and use existing ti-core-initramfs.inc
> - Link to v3: https://lore.kernel.org/all/20260304193824.2495898-1-s-tripathi1@ti.com/
> 
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
> Shiva Tripathi (3):
>   linux-ti-staging: Add LUKS encryption config
>   initramfs-module-luks-ftpm: Add fTPM support
>   conf: Enable dynamic tpm-layer support for LUKS
> 
>  meta-ti-bsp/conf/layer.conf                   |   3 +
>  .../machine/include/ti-core-initramfs.inc     |   2 +-
>  .../initramfs-module-luks-ftpm/luksftpm       | 341 ++++++++++++++++++
>  .../initramfs-module-luks-ftpm_1.0.bb         |  43 +++
>  .../packagegroup-ti-core-initramfs.bbappend   |   3 +
>  .../linux/linux-ti-staging-6.18/luks-ftpm.cfg |  22 ++
>  .../linux/linux-ti-staging_6.18.bb            |   8 +
>  7 files changed, 421 insertions(+), 1 deletion(-)
>  create mode 100644 meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/initramfs-module-luks-ftpm/luksftpm
>  create mode 100644 meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/initramfs-module-luks-ftpm_1.0.bb
>  create mode 100644 meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bbappend
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
> 
> -- 
> 2.34.1

