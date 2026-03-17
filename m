Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FECFEDA1C
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 19:52:43 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85229.1773777142805804799
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 12:52:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F049040C2A;
	Tue, 17 Mar 2026 19:52:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JexDwDXunow8; Tue, 17 Mar 2026 19:52:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5F37D40BEC;
	Tue, 17 Mar 2026 19:52:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BF13C17A439; Tue, 17 Mar 2026 15:52:10 -0400 (EDT)
Date: Tue, 17 Mar 2026 15:52:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: s-tripathi1@ti.com
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com, rs@ti.com,
	jcormier@criticallink.com, praneeth@ti.com, kamlesh@ti.com,
	vishalm@ti.com, k-malarvizhi@ti.com, vigneshr@ti.com, afd@ti.com
Subject: Re: [meta-ti][master][PATCH v5 0/3] Add LUKS encryption with fTPM
 support
Message-ID: <20260317195210.GB11121@denix.org>
References: <20260306163735.1316257-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306163735.1316257-1-s-tripathi1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 19:52:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19746

Sorry for the delay and thanks for waiting!

Below are some high-level questions and comments I've got reviewing your 
patches.


On Fri, Mar 06, 2026 at 10:07:32PM +0530, Shiva Tripathi via lists.yoctoproject.org wrote:
> This patch series adds LUKS full disk encryption support using firmware TPM
> (fTPM) for TI K3 platforms. The implementation provides hardware-backed
> encryption with keys sealed by TPM running in OP-TEE and stored in eMMC RPMB.

What are the HW requirements for this implementation?
Does it work on any K3 platform, even GP, or does it require an HS variant?
What about eMMC requirement?


> Background:
> TI K3 platforms do not have integrated discrete TPM hardware. To provide
> TPM 2.0 functionality, this implementation uses firmware TPM (fTPM) - a
> Trusted Application running in OP-TEE secure world. The fTPM provides
> standard TPM 2.0 interfaces while leveraging ARM TrustZone for isolation
> and eMMC RPMB (Replay Protected Memory Block) for secure persistent storage.
> 
> Key features:
> - Conditional builds: Enabled via DISTRO_FEATURES += "luks" with MACHINE_FEATURES as 'optee-ftpm'

Why is it being added to meta-ti? This seems heavily distro-specific, maybe 
even product-specific...

Moreover, there are run-time dependencies on TPM packages that are not in any 
of the layers that meta-ti depends on.

In order to enable this feature, you'd need to add a corresponding layer to 
bblayers.conf - should this at a minimum go into a dynamic-layer?


> - No impact on default SDK builds

Since this is disabled by default, this never gets built by the CI/CD and 
hence, there's no way to ensure future changes don't break this.
Arguably, there are other features that are not enabled by default 
(jailhouse, falcon), so it may be a moot point...


> - In-place encryption on first boot
> - TPM persistent handle for key storage (0x81080001)
> - Secure key storage in eMMC RPMB via OP-TEE
> - Security model similar to CIP Core
> 
> Use case:
> This is designed for K3 platforms requiring secure boot and encrypted

How are you protecting boot partition from getting tampered with?
Besides encrypting rootfs, are there any other Secure Boot steps taken to 
protect the boot flow from a MITM attack?


> storage, such as industrial automation, automotive, and IoT gateways where
> discrete TPM chips are cost-prohibitive but security requirements demand
> hardware-backed encryption.
> 
> Testing:
> - Tested on AM62x platform with kernel 6.18
> - First boot: Successful in-place LUKS encryption

Have you considered pre-encrypting the image during the build and then 
only changing the key, if needed, on the first boot?

How long does it take to encrypt the rootfs on the first boot? I would imagine 
it being very expensive operation to encrypt and overwrite the entire 
partition.

Also, have you considered binding the key to a PCR, so it is not easily 
extractable during a MITM attack?

Anyway, I'm guessing this is just a sample implementation of this one 
particular feature - encrypted rootfs - and not a complete Secure Boot ready 
for production...


> - Subsequent boots: Successful TPM unsealing and boot
> 
> The series is structured as follows:
> 1. Kernel configuration for LUKS and crypto support
> 2. LUKS encryption initramfs module with fTPM key management
> 3. Initramfs generation trigger and packagegroup with dual gating
> 
> ---
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
>   initramfs: Add LUKS encryption module with fTPM
>   ti-core-initramfs: Enable initramfs for LUKS encryption
> 
>  .../machine/include/ti-core-initramfs.inc     |   2 +-
>  .../linux/linux-ti-staging-6.18/luks-ftpm.cfg |  22 ++
>  .../linux/linux-ti-staging_6.18.bb            |   9 +
>  .../initramfs-module-luks-ftpm/luksftpm       | 341 ++++++++++++++++++
>  .../initramfs-module-luks-ftpm_1.0.bb         |  41 +++
>  .../packagegroup-ti-core-initramfs.bb         |   3 +
>  6 files changed, 417 insertions(+), 1 deletion(-)
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm/luksftpm
>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm_1.0.bb
> 
> -- 
> 2.34.1

