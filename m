Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E1CEB363F
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 22:37:02 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4950.1772491015643114290
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 14:36:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=dMhS7TqY;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.15, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jvbrIOAoczNBIQXkRa18lxAf0MmijqOK6qVmUlX3/090zP55QteZ/mNR9xt0izMekyyzNEpaNOzQdecIrBfctLcf6Tzf1aEABNVX90nJp/5BnyDxQ5BYBaohiKYC4NGV8dtmb9rJoFzj1yCKMQNABPQwKpG7s4jyriIKrLIcYPvjwDMzQ4dJYko+x6dr4TjVAMOU5lstjwupFAdEmUOVmzJ3s9LvJSwAJZyfI4Y5UkriBA8+Y4QA5GT3X7u/ILgXvwS0vOwL/91iSJy7M4A84aL+5aYR8Orbd+h6d4eb6GXYy68a1PpG8TrsiDYxJLFTfut8vKt6G2a3FJRYMX9y+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAcVn2w+WveW96tzZyu7+BoUnwK0wVFMoW5VLekM598=;
 b=AbuvkCIopDURBpsF9jQxI13qs9FsY4qKfZy+FuphOAHKQh5/r8vumjXa7VserTYcq5E6N8WJGxSUHBIBJBTptPl2yiKQLOdLePw3L1AhuUc75E78rEU+Ul8EMbbVwk5YUoMUma4LqXYAOiplHg4h/yFtfcClibBVmL+TEIShkQO7F2/nXIzrjnsyb/0tz06rqJTiQwUpLtw/sHvHbmCvjAbFXS3poSOXMDBUkk62YejLPR0OqY6bYtryIm9jphhuuDWJ099ux/DsGstGnM8lpRBVQz6Rc2Cxm81916hdT961IZizT1MGBluYp37kH++bN5oG9DC2p99GBtVRDNcbtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAcVn2w+WveW96tzZyu7+BoUnwK0wVFMoW5VLekM598=;
 b=dMhS7TqY5VbpZaSiK8PEUq345GM9KN/U7op/ISkbYfa1FiEOZopV7CrcNKykI6epAGBWVPWZAYyDF9I6A/EjR793eswX+faMatvA+wu3XUQJv0/Pm8xVDJCsU/hP4D36QmpxP68vnDE2z0KSEZem+pXtgCOW5mhPaarWa1Ib0NY=
Received: from MN2PR15CA0040.namprd15.prod.outlook.com (2603:10b6:208:237::9)
 by CO1PR10MB4580.namprd10.prod.outlook.com (2603:10b6:303:98::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 22:36:51 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:237:cafe::40) by MN2PR15CA0040.outlook.office365.com
 (2603:10b6:208:237::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 22:36:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 22:36:49 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 16:36:47 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 16:36:47 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 16:36:47 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622Makq51531082;
	Mon, 2 Mar 2026 16:36:46 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 2 Mar 2026 16:36:46 -0600
Message-ID: <DGSNMFG7CJMI.369LJBMXN2VSL@ti.com>
From: Randolph Sapp <rs@ti.com>
To: <s-tripathi1@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>,
	<k-malarvizhi@ti.com>
Subject: Re: [meta-ti][master][PATCH 2/3] initramfs: Add encrypted boot
 support with fTPM
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260302144647.1705408-1-s-tripathi1@ti.com>
 <20260302144647.1705408-3-s-tripathi1@ti.com>
In-Reply-To: <20260302144647.1705408-3-s-tripathi1@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|CO1PR10MB4580:EE_
X-MS-Office365-Filtering-Correlation-Id: 66c03eb3-64ac-4dc3-7988-08de78ac319c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|34020700016|376014|7142099003;
X-Microsoft-Antispam-Message-Info: 
	ZgTNkZYHAWTBXlLGLEEWDWhTmXMrsrxyaxQrhRiTsHcAj4+2bl9NLq5P6VffB2cPrcIjzoDSd+FVje9og8yNvVH+k2fyNWXbPzL6TRdsYhWYsGg4LOnRIixVT9UyfrlIYfxTcTSMeuA+R6Krtye/XJQo5Zx6xrTJ1BNGMXCMZ26xibAqrZzrSAu1ba0DR+c4OuQUgc9ypGvS75Hcox6CmrNTsgKcTJkEw2W+CNGc9Kj2/6DRTMFgVPnxGITjapp6ghpMqqo/wOWNF6v4WLLO5+NuShAc5l8et0jHcmyun/4EeLgM0g8mqzMsF1M5zfyQCC8TLScQZ2686CHUaAtO9MKJJbiDTwgnhe5S5g8BdlDVw9WtSGGE/OJf+w76aVv3InsSTbPrrp66cuCXygueKZ9C/HCzL4tR3/WYTN1/6O/LGCDZLUvWTyvG0aXvzSazvvIM+ovtLhq8S18FXBvfdlOogKMJmbHElgcnbzmB+VKzZ76gITGQOVK70MuX7k7Ltovva57rKqT755eOX2g7MREs+i4R7XU4CSbVxjtmYqHEwILpGaj2sdyucvzYOt/RuyHraPDRbI2DiEDfZdvGyLWsdQvLtBSarhsZOScINiLquwTMcY/gFkd5Aksesi5CLZpmlr85ZM3h8MpoQFVBnRHvEVnwM7Lpi2FUjqZOnCLNnt7f0EmQ8x5olM9zQfWPewIzklcBfPMsQ/cdgNg/neDrVh2GxeOpT3Xz9XA5EC2RppBB9nBFnKWLCOrwvvzrQwM6gpVpLtHZA0r0COHbwm6fwPG+AB6EezpMT3BS4WWbxy7K/ydgUgVftxTfYFr4w4Lw4o+AJmMqGCRmPdFYsQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(34020700016)(376014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lT8FXGqhVUD7irQpC/DQFbuUCgq+ePxgR6CB6rz5S/cPUbkkBftbDk/nYOZvO0BIgFb0Tn1zq2uiTbr9S4/tw8YvqXA9igJmZSBv4upqFrnrZyeL/XDdEM561ldj/mAlVZsAUZ3B6/XszPcsW7LvGfpDCIGGV7cwpnw4iQxp40bM2PhKCVVXhP5tVBeqC/Oi5UDzyXf5Q1eocve9JfyiIoRtTe/Myfl6jFvddtfwEPapNr8C/jSO0427r5vyjt9szIMonc0rN/LxNiLt89fiqEi8bfG50rho7ogHzshs4HW6Ej43CO/Ncl5PZDEerTA61rVNu5ORou8r+ML39SdEZL3Q6ZjGxPrTdUO/m2tR+5a6Iwo+P/IJ/LHE0Imvpy9W+lhYMC22nN0hOIgOkRIdqQxVbao6S+UOcT2jcs/lhO8wydjpw4WQW7IHYHH/3s5b
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 22:36:49.4069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c03eb3-64ac-4dc3-7988-08de78ac319c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4580
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Mar 2026 22:37:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19632

On Mon Mar 2, 2026 at 8:46 AM CST, Shiva Tripathi via lists.yoctoproject.or=
g wrote:
> Add ti-encrypted-boot-initramfs for LUKS encryption with TPM-sealed
> keys. This provides full disk encryption using dm-crypt with keys
> sealed by firmware TPM (fTPM) running in OP-TEE and stored in eMMC RPMB.
>
> The initramfs includes:
> - Custom init script for in-place LUKS encryption on first boot
> - TPM key sealing/unsealing using persistent handle 0x81080001
> - Support for cryptsetup, tpm2-tools, and OP-TEE client
> - Automatic filesystem resize after encryption
>
> ti-encrypted-boot-initramfs builds when MACHINE_FEATURES contains
> 'luks-encryption'.
>
> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
> ---
>  .../initramfs-ti-encrypted-init/files/init    | 324 ++++++++++++++++++
>  .../initramfs-ti-encrypted-init_1.0.bb        |  30 ++
>  .../initramfs/ti-encrypted-boot-initramfs.bb  |  50 +++
>  3 files changed, 404 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypt=
ed-init/files/init
>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypt=
ed-init_1.0.bb
>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-encrypted-boot-in=
itramfs.bb
>
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init=
/files/init b/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init/=
files/init
> new file mode 100644
> index 00000000..6675b6ed
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init/files/=
init
> @@ -0,0 +1,324 @@
> +#!/usr/bin/busybox sh
> +# TI SDK initramfs init script with LUKS2 + fTPM encryption support
> +
> +# Mount essential filesystems
> +/usr/bin/busybox echo "Initializing system..."
> +/usr/bin/busybox mount -t proc proc /proc
> +/usr/bin/busybox mount -t sysfs sysfs /sys
> +/usr/bin/busybox mount -t devtmpfs devtmpfs /dev
> +
> +# Configuration
> +BOOT_DEV=3D"/dev/mmcblk1p1"           # Boot partition (FAT, unencrypted=
)
> +ROOT_DEV=3D"/dev/mmcblk1p2"           # Root partition (will be encrypte=
d)
> +CRYPT_NAME=3D"root_crypt"
> +CRYPT_DEV=3D"/dev/mapper/${CRYPT_NAME}"
> +BOOT_MNT=3D"/boot_part"
> +TPM_PRIMARY_CTX=3D"/tmp/tpm_primary.ctx"
> +TPM_KEY_PRIV=3D"/tmp/tpm_key.priv"
> +TPM_KEY_PUB=3D"/tmp/tpm_key.pub"
> +TPM_KEY_CTX=3D"/tmp/tpm_key.ctx"
> +TPM2_HANDLE=3D"0x81080001"            # TPM persistent handle for LUKS k=
ey
> +ENCRYPTION_MARKER=3D"${BOOT_MNT}/.encryption_in_progress"
> +
> +# Wait for MMC device to appear (up to 10 seconds)
> +/usr/bin/busybox echo "Waiting for storage device..."
> +for i in 1 2 3 4 5 6 7 8 9 10; do
> +    if [ -b "${ROOT_DEV}" ]; then
> +        break
> +    fi
> +    /usr/bin/busybox sleep 1
> +done
> +
> +# Check if root device exists
> +if [ ! -b "${ROOT_DEV}" ]; then
> +    /usr/bin/busybox echo "ERROR: Storage device not found!"
> +    /usr/bin/busybox sh
> +fi
> +
> +# Mount boot partition
> +/usr/bin/busybox echo "Mounting boot partition..."
> +/usr/bin/busybox mkdir -p "${BOOT_MNT}"
> +if ! /usr/bin/busybox mount "${BOOT_DEV}" "${BOOT_MNT}"; then
> +    /usr/bin/busybox echo "ERROR: Failed to mount boot partition!"
> +    /usr/bin/busybox echo "Attempting standard boot..."
> +    /usr/bin/busybox mkdir -p /newroot
> +    /usr/bin/busybox mount "${ROOT_DEV}" /newroot
> +    exec /usr/sbin/switch_root /newroot /sbin/init
> +fi

The main boot path should be the error path here, not an arbitrary duplicat=
ion
of logic.

> +
> +# Initialize fTPM in OP-TEE
> +/usr/bin/busybox echo "Initializing secure hardware(fTPM)..."
> +
> +# Start TEE supplicant (required for fTPM TA to work)
> +if [ -x /usr/sbin/tee-supplicant ]; then
> +    /usr/sbin/tee-supplicant -d &
> +    TEE_SUPPLICANT_PID=3D$!
> +    /usr/bin/busybox sleep 5
> +else
> +    /usr/bin/busybox echo "Warning: Trusted execution environment not av=
ailable"
> +fi
> +
> +# Load fTPM kernel module
> +if ! /sbin/modprobe tpm_ftpm_tee; then
> +    /usr/bin/busybox echo "Warning: TPM module failed to load"
> +fi
> +
> +# Wait for TPM device (up to 10 seconds)
> +for i in 1 2 3 4 5 6 7 8 9 10; do
> +    if [ -c /dev/tpmrm0 ]; then
> +        break
> +    fi
> +    /usr/bin/busybox sleep 1
> +done

This should be a function who's exit code is use in the below script direct=
ly
instead of rechecking if the device is present.

> +
> +# Check if TPM is available
> +TPM_AVAILABLE=3D0
> +if [ -c /dev/tpmrm0 ]; then
> +    TPM_AVAILABLE=3D1
> +    export TPM2TOOLS_TCTI=3D"device:/dev/tpmrm0"
> +else
> +    /usr/bin/busybox echo "Warning: fTPM not available - encryption will=
 be skipped"
> +    if [ -n "${TEE_SUPPLICANT_PID}" ]; then
> +        /usr/bin/busybox kill "${TEE_SUPPLICANT_PID}" 2>/dev/null
> +    fi
> +fi
> +
> +# Function: Generate 32-byte random key using TPM RNG
> +generate_random_key() {
> +    if [ $TPM_AVAILABLE -eq 1 ]; then
> +        /usr/bin/tpm2_getrandom --hex 32
> +    else
> +        /usr/bin/busybox echo "ERROR: TPM not available for key generati=
on"
> +        return 1
> +    fi
> +}

This should probably be reported to the user, or at least they should be to=
ld
how to access it during runtime.

> +
> +# Function: Seal data with TPM and store in persistent handle
> +tpm_seal_key() {
> +    local KEY_DATA=3D"$1"
> +
> +    if [ $TPM_AVAILABLE -eq 0 ]; then
> +        /usr/bin/busybox echo "ERROR: TPM not available for sealing"
> +        return 1
> +    fi
> +
> +    # Create primary key in owner hierarchy
> +    /usr/bin/tpm2_createprimary -C o -c "${TPM_PRIMARY_CTX}" -Q || retur=
n 1
> +
> +    # Create sealed object
> +    /usr/bin/busybox echo -n "${KEY_DATA}" | \
> +        /usr/bin/tpm2_create -C "${TPM_PRIMARY_CTX}" \
> +        -u "${TPM_KEY_PUB}" -r "${TPM_KEY_PRIV}" \
> +        -i- -Q || return 1
> +
> +    # Load sealed object into TPM
> +    /usr/bin/tpm2_load -C "${TPM_PRIMARY_CTX}" \
> +        -u "${TPM_KEY_PUB}" -r "${TPM_KEY_PRIV}" \
> +        -c "${TPM_KEY_CTX}" -Q || return 1
> +
> +    # Make key persistent at handle (stored in TPM NV RAM - RPMB)
> +    /usr/bin/tpm2_evictcontrol -C o -c "${TPM_KEY_CTX}" "${TPM2_HANDLE}"=
 || return 1
> +
> +    return 0
> +}
> +
> +# Function: Unseal data from TPM persistent handle
> +tpm_unseal_key() {
> +    if [ $TPM_AVAILABLE -eq 0 ]; then
> +        /usr/bin/busybox echo "ERROR: TPM not available for unsealing" >=
&2
> +        return 1
> +    fi
> +
> +    # Check if persistent handle exists
> +    if ! /usr/bin/tpm2_getcap handles-persistent | grep -q "${TPM2_HANDL=
E}"; then
> +        /usr/bin/busybox echo "ERROR: TPM persistent handle not found" >=
&2
> +        return 1
> +    fi
> +
> +    # Unseal key directly from persistent handle
> +    /usr/bin/tpm2_unseal -c "${TPM2_HANDLE}" || return 1
> +
> +    return 0
> +}
> +
> +# Function: Perform in-place LUKS encryption (first boot)
> +encrypt_root_filesystem() {
> +    /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
> +    /usr/bin/busybox echo "First boot: Encrypting root filesystem"
> +    /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
> +
> +    # Set marker to track encryption progress
> +    /usr/bin/busybox touch "${ENCRYPTION_MARKER}"
> +    /usr/bin/busybox sync
> +
> +    # Generate random encryption key using TPM RNG
> +    /usr/bin/busybox echo "Generating encryption key..."
> +    LUKS_KEY=3D$(generate_random_key)
> +
> +    if [ -z "${LUKS_KEY}" ]; then
> +        /usr/bin/busybox echo "ERROR: Failed to generate encryption key"
> +        /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
> +        return 1
> +    fi
> +
> +    # Seal key with TPM before encryption starts
> +    /usr/bin/busybox echo "Securing key with TPM..."
> +    if ! tpm_seal_key "${LUKS_KEY}"; then
> +        /usr/bin/busybox echo "ERROR: Failed to secure key"
> +        /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
> +        return 1
> +    fi
> +
> +    # Filesystem check before encryption
> +    /usr/bin/busybox echo "Checking filesystem integrity..."
> +    /usr/sbin/e2fsck -f -y "${ROOT_DEV}"
> +    E2FSCK_RET=3D$?
> +    if [ ${E2FSCK_RET} -ge 4 ]; then
> +        /usr/bin/busybox echo "ERROR: Filesystem check failed"
> +        /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
> +        return 1
> +    fi
> +
> +    # Shrink filesystem before encryption to leave room for LUKS header
> +    /usr/bin/busybox echo "Preparing filesystem for encryption..."
> +    /usr/sbin/resize2fs "${ROOT_DEV}" 368M || {

Arbitrary size here, prone to failure in the future. Look into the "-M" opt=
ion
instead.

> +        /usr/bin/busybox echo "ERROR: Failed to prepare filesystem"
> +        /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
> +        return 1
> +    }
> +
> +    # Perform in-place encryption
> +    /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
> +    /usr/bin/busybox echo "Encrypting filesystem..."
> +    /usr/bin/busybox echo "This will take several minutes."
> +    /usr/bin/busybox echo "DO NOT POWER OFF THE DEVICE!"
> +    /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
> +
> +    /usr/bin/busybox echo -n "${LUKS_KEY}" | \
> +        /usr/sbin/cryptsetup reencrypt --encrypt \
> +        --type luks2 \
> +        --cipher aes-xts-plain64 \
> +        --key-size 256 \
> +        --hash sha256 \
> +        --reduce-device-size 32M \
> +        --key-file - \
> +        "${ROOT_DEV}" || {
> +        /usr/bin/busybox echo "ERROR: Encryption failed"
> +        /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
> +        return 1
> +    }

This should only work on partitions that already contain a LUKS header. The=
 LUKS
header is placed in sector 0 of the block device. resize2fs doesn't support
changing the starting position of the filesystem so you will always corrupt=
 the
existing filesystem. It may still be recoverable, but that's not the point.=
 This
is a bad idea.

Additionally, the partition should be overwritten with randomized data befo=
re
use to make sure unused blocks look indistinguishable from later encrypted =
data.
This is not something that can be done using an initramfs without external
storage.

> +
> +    /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
> +    /usr/bin/busybox echo "Encryption completed successfully!"
> +    /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
> +
> +    # Remove encryption marker
> +    /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
> +    /usr/bin/busybox sync
> +
> +    # Unlock the newly encrypted device
> +    /usr/bin/busybox echo "Activating encrypted filesystem..."
> +    /usr/bin/busybox echo -n "${LUKS_KEY}" | \
> +        /usr/sbin/cryptsetup luksOpen "${ROOT_DEV}" "${CRYPT_NAME}" --ke=
y-file - || {
> +        /usr/bin/busybox echo "ERROR: Failed to activate encrypted files=
ystem"
> +        return 1
> +    }
> +
> +    # Resize filesystem to fit the encrypted device
> +    /usr/bin/busybox echo "Optimizing filesystem..."
> +    /usr/sbin/resize2fs -f "${CRYPT_DEV}" || {
> +        /usr/bin/busybox echo "ERROR: Failed to optimize filesystem"
> +        return 1
> +    }
> +
> +    # Verify filesystem after resize
> +    /usr/sbin/e2fsck -f -y "${CRYPT_DEV}" || {
> +        /usr/bin/busybox echo "WARNING: Filesystem verification had issu=
es, but continuing"
> +    }
> +    return 0
> +}
> +
> +# Function: Unlock encrypted root filesystem (subsequent boots)
> +unlock_encrypted_root() {
> +    /usr/bin/busybox echo "Unlocking encrypted filesystem..."
> +
> +    # Unseal key from TPM persistent handle
> +    LUKS_KEY=3D$(tpm_unseal_key)
> +
> +    if [ -z "${LUKS_KEY}" ]; then
> +        /usr/bin/busybox echo "ERROR: Failed to retrieve encryption key =
from TPM"
> +        /usr/bin/busybox echo "Attempting passphrase fallback..."
> +
> +        # Try to unlock with passphrase (interactive)
> +        /usr/sbin/cryptsetup luksOpen "${ROOT_DEV}" "${CRYPT_NAME}" || {
> +            /usr/bin/busybox echo "ERROR: Failed to unlock encrypted fil=
esystem"
> +            /usr/bin/busybox sh
> +        }
> +    else
> +        # Unlock with unsealed key
> +        /usr/bin/busybox echo -n "${LUKS_KEY}" | \
> +            /usr/sbin/cryptsetup luksOpen "${ROOT_DEV}" "${CRYPT_NAME}" =
--key-file - || {
> +            /usr/bin/busybox echo "ERROR: Failed to unlock with TPM key"
> +            /usr/bin/busybox sh
> +        }
> +    fi
> +
> +    /usr/bin/busybox echo "Encrypted filesystem unlocked"
> +}
> +
> +# Main boot logic
> +/usr/bin/busybox echo "Checking filesystem encryption status..."
> +
> +# Check if device is LUKS encrypted
> +if /usr/sbin/cryptsetup isLuks "${ROOT_DEV}"; then
> +    /usr/bin/busybox echo "Filesystem is encrypted"
> +    unlock_encrypted_root
> +    MOUNT_DEV=3D"${CRYPT_DEV}"
> +else
> +    /usr/bin/busybox echo "Filesystem is not encrypted"
> +
> +    # Check if encryption is enabled and TPM is available
> +    if [ $TPM_AVAILABLE -eq 1 ]; then
> +        # Check for encryption marker (resume interrupted encryption)
> +        if [ -f "${ENCRYPTION_MARKER}" ]; then
> +            /usr/bin/busybox echo "Resuming interrupted encryption..."
> +            if ! encrypt_root_filesystem; then
> +                /usr/bin/busybox echo "ERROR: Failed to resume encryptio=
n"
> +                /usr/bin/busybox echo "Booting without encryption..."
> +                MOUNT_DEV=3D"${ROOT_DEV}"
> +            else
> +                MOUNT_DEV=3D"${CRYPT_DEV}"
> +            fi
> +        else
> +            # First boot - perform encryption
> +            if encrypt_root_filesystem; then
> +                MOUNT_DEV=3D"${CRYPT_DEV}"
> +            else
> +                /usr/bin/busybox echo "ERROR: Encryption failed - bootin=
g without encryption"
> +                MOUNT_DEV=3D"${ROOT_DEV}"
> +            fi
> +        fi
> +    else
> +        /usr/bin/busybox echo "TPM not available - skipping encryption"
> +        MOUNT_DEV=3D"${ROOT_DEV}"
> +    fi
> +fi
> +
> +# Unmount boot partition before switching root
> +/usr/bin/busybox umount "${BOOT_MNT}"
> +
> +# Mount root filesystem (encrypted or unencrypted)
> +/usr/bin/busybox echo "Mounting root filesystem..."
> +/usr/bin/busybox mkdir -p /newroot
> +/usr/bin/busybox mount "${MOUNT_DEV}" /newroot || {
> +    /usr/bin/busybox echo "ERROR: Failed to mount root filesystem!"
> +    /usr/bin/busybox sh
> +}
> +
> +/usr/bin/busybox echo "Boot complete"
> +
> +# Clean up tmpfs
> +/usr/bin/busybox rm -f "${TPM_PRIMARY_CTX}" "${TPM_KEY_PUB}" "${TPM_KEY_=
PRIV}" "${TPM_KEY_CTX}"
> +
> +# Switch to real root
> +exec /usr/sbin/switch_root /newroot /sbin/init

In general I think this effort is misguided. An initrd is not a replacement=
 for
live image install. We should not be dramatically changing the running syst=
em as
part of the first boot.

> diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init=
_1.0.bb b/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init_1.0.=
bb
> new file mode 100644
> index 00000000..7da878f7
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init_1.0.bb
> @@ -0,0 +1,30 @@
> +SUMMARY =3D "TI encrypted boot initramfs init script"
> +DESCRIPTION =3D "Custom /init script for encrypted boot with fTPM + LUKS=
 support"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> +
> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}/files:"
> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
> +
> +SRC_URI =3D "file://init"
> +
> +S =3D "${WORKDIR}/sources"
> +UNPACKDIR =3D "${WORKDIR}"
> +
> +# This recipe must run in the initramfs context
> +inherit allarch
> +
> +do_install() {
> +    # Install /init script to root of initramfs
> +    install -m 0755 ${UNPACKDIR}/init ${D}/init
> +}
> +
> +# Package the /init file
> +FILES:${PN} =3D "/init"
> +
> +# Runtime dependencies
> +RDEPENDS:${PN} =3D "busybox cryptsetup tpm2-tools tpm2-tss optee-client =
e2fsprogs-e2fsck e2fsprogs-resize2fs util-linux-blkid"
> +
> +# This package must be included in initramfs
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-encrypted-boot-initramfs=
.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-encrypted-boot-initramfs.bb
> new file mode 100644
> index 00000000..314499db
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/initramfs/ti-encrypted-boot-initramfs.bb
> @@ -0,0 +1,50 @@
> +SUMMARY =3D "TI encrypted boot initramfs image"
> +
> +DESCRIPTION =3D "Minimal initramfs image with dm-crypt/fTPM support for =
encrypted root filesystem. \
> +This initramfs provides LUKS encryption with TPM-sealed keys stored in R=
PMB."
> +
> +LICENSE =3D "MIT"
> +
> +# Only build this when luks-encryption feature is enabled
> +COMPATIBLE_MACHINE =3D "null"
> +COMPATIBLE_MACHINE:k3 =3D "${@bb.utils.contains('MACHINE_FEATURES', 'luk=
s-encryption', '.*', 'null', d)}"
> +
> +INITRAMFS_FSTYPES =3D "cpio.gz"
> +
> +IMAGE_NAME =3D "ti-encrypted-boot-initramfs"
> +
> +export IMAGE_BASENAME =3D "${IMAGE_NAME}"
> +
> +# Install our custom init script and dependencies
> +PACKAGE_INSTALL =3D "\
> +    initramfs-ti-encrypted-init \
> +    busybox \
> +    base-passwd \
> +    kmod \
> +    cryptsetup \
> +    tpm2-tools \
> +    tpm2-tss \
> +    libtss2-tcti-device \
> +    optee-client \
> +    util-linux-blkid \
> +    e2fsprogs-e2fsck \
> +    e2fsprogs-resize2fs \
> +    kernel-module-tpm-ftpm-tee \
> +    ${ROOTFS_BOOTSTRAP_INSTALL} \
> +"
> +
> +# Ensure the initramfs only contains the bare minimum
> +IMAGE_FEATURES =3D ""
> +IMAGE_LINGUAS =3D ""
> +
> +# Exclude kernel image from initramfs
> +PACKAGE_EXCLUDE =3D "kernel-image-*"
> +
> +IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
> +IMAGE_NAME_SUFFIX ?=3D ""
> +IMAGE_ROOTFS_SIZE =3D "16384"
> +IMAGE_ROOTFS_EXTRA_SPACE =3D "0"
> +
> +BAD_RECOMMENDATIONS +=3D "busybox-syslog"
> +
> +inherit image


