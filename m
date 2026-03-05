Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97F5F47CD7
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 20:51:58 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54639.1772743915763733907
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 12:51:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ec+acOU5;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.2, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fj0Qdk51hQqjZUw9FzmSMDsztBvGxfThsgWzeP5FQQ8DOKPx2Gc4+SbhvUmVEfzIJ4II5ewmlC+Jib99qzdqZwgJXhNgdLeN06vxGWAU3LvIA44nodSTDEDI7aJXPnSxVMI2oG7H1HyDg0G9DJU1ThK84s3jbZQue1Tbwq15ZjVqydU64kgN1/cb91C1wAn5KrYKS8qaKw34Eb+hv3cHb3SA80l3YW1VYjKYin/RGFpN/KqFJ2dcqf5pU+ney7gKxLXdt9SXRlbhBi4Hn8felwEJHlzp2BOqNOOjfOuZyjyJirjC+G36qjEHyrR9Fj31vHzjswrI5LsX40td1UCAlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wYIa0q5Q3rCK46Hd/+gZEbUYxNMJPniCUWGXfgHjns=;
 b=Hlrc2ecCkZGDkM7h08yEoINHUU3RO2N7+1zD5g4S5UhgNAoIj6U3t2Hs42J9aUKKvWMaaLcZbS0CeVtrIsXHo7Q350zSFjon4bEw51ngWl9pKqSVsTdUMKBEUzmPxPKnVyZmjIxnUG5gaD3vyC/G6eYEekKG+d9rPe2fvko3cO2kKpvm6PhGAbzYGA+1Sy6UUGUPj62qjGybyG/4ysZzGAhbAxLTz3S8uIUNxu750U1Hhu0ImuFCYDWJ0+c+ZMebtMCk0LJJ0C732R871cqxmvpQFIeYQVFwYU/9nvVTmkhGYNajy96Ldgqrm+a/O5/TlVIKSNt6YeXOu1Kis/rpLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wYIa0q5Q3rCK46Hd/+gZEbUYxNMJPniCUWGXfgHjns=;
 b=ec+acOU5ejzckjxsgZ2dB/QQQjAmFy2gbIK4MkcnRiEeM7IKovpMvGyXJA1pC4+6ymMGRg1/aUuZLZ5S824vis2QI7XOu3/oxO2nKpFNVChNbvkmIuwGEju47TtL8/C/qfbLL29EN0FqIF/M/Ves0/Mv/GcnCJdkpHJ4ilw/aqs=
Received: from BY5PR20CA0002.namprd20.prod.outlook.com (2603:10b6:a03:1f4::15)
 by CH5PR10MB997694.namprd10.prod.outlook.com (2603:10b6:610:2f1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 20:51:52 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::4d) by BY5PR20CA0002.outlook.office365.com
 (2603:10b6:a03:1f4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 20:51:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 20:51:51 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:51:47 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:51:47 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 14:51:47 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625KpiuR3018665;
	Thu, 5 Mar 2026 14:51:47 -0600
Message-ID: <0fd3296d-a013-403b-88e8-4c57643f3521@ti.com>
Date: Thu, 5 Mar 2026 14:51:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v4 2/3] initramfs: Add LUKS encryption
 module with fTPM
To: Shiva Tripathi <s-tripathi1@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <rs@ti.com>, <jcormier@criticallink.com>, <praneeth@ti.com>,
	<kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>, <denis@denix.org>,
	<vigneshr@ti.com>
References: <20260305172206.3684409-1-s-tripathi1@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260305172206.3684409-1-s-tripathi1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|CH5PR10MB997694:EE_
X-MS-Office365-Filtering-Correlation-Id: f84b744a-6008-4c5b-999d-08de7af90703
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|34020700016|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 
	Jk3AU0GfpBp+o41ICLeC6u14Fn/jBzj/0Buws78EEP6gqBmqfjSgE7t9HzNKHsMTTtl+rBO/i3jiLwNJnL1m8T2MLnKNUW4yuHYWt3fW0MM/FbgnmXhro3ZA5NT5qkrdGGEMTwgtfQyE7lBVv5/ci0LMoVi4csgV9xm7z6SF9/wHgJbY2/Gc/3MNIrdkSlLHBP1Z3/GzT8BETkidivFiLLlXeLZU74/s2aBB/ErO/jFK4vmo1BjH754SBnNAwf4yQJdw65aLmbmeFqmFkMHvIzvWNrvjtRjeQ0uqDWPieW3OrZloioyWUHNhOAblbBTd3Shx6fm/wIjbG6W/OfxZp20x53guSJeVW7YJ84h4ps0fsuzWvAwU6o68Bm4RS4xbm7ANRB79/2hDXW4fEc0tOG0ERCUQlytsWgz24VwEAvkMVYFxZfzI4DL4VvoTZhP8BTISoO/ZGkqF8OBIG8ObeDAjIGvofHoj8xwjy2cUnTegKz6wW6bFfdx5f7s3GYRv35HI7VhI4FkgZGIM85QZIlX7KAeydHWHIOcFgre+lnNgU18NiRBkOhAxjTZ6KS4/GOHswgaLP8OS9AqcSrZA4IO8kff+efsyFxo4y/VEOJNyht1TxmuW5FTMAic+hxMEsHwjluV3V/K3fXrnoO60f4xxkI/cmHfOhpM4BQPXOsRs0HlAosYvZUyEmH5dun2MxkJwkyDwHA5AolulQACcRX9zUUrUdkB6ePCxiaBkSYkEkV1Tj2AVJmxhdVrxK60G4yU5uvRfnwpRS+X6Mgo62Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(34020700016)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Jlgjr7YI7LjlzG67PKS10mhEty3ZU7Xru63t6PGhmBNBDISAKioAav3nfE9G6wLWfJxounL83tu9fEe1e+pnOFwmYAPBlrUh9cW5Eb8IhrhZrvReIlZYl4QX11w9V9I+yF3uWZ8YW/Ph2JL430bWSesnlegt3Zsgk7+0jMhSN+yvS6ABYKUGHskzeoXZKe5rgrYlgd4AYbtsh+XvLyf2lvfeyilZ37DoIJATQF9k5UeWb3F3T/ThBodB/Yn5FklxsVMdgrSfsfW9dE4XeCUJjD8XYM1CGISM///dsgnDD860p89DGrfU+L56VhD4du1Op06KvGmhJzvmfh/qEgNc8VMSUvIqQ1aQ9Im+zwxw5kktiUg06rD0v0KoUX95oZsnjG/2CREQ9UKefKSJwtT0iQnJ1w+lbyjeXVt69B4G2nfp+wGkgFeZkz17sDCGGzA2
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 20:51:51.5074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f84b744a-6008-4c5b-999d-08de7af90703
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR10MB997694
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Mar 2026 20:51:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19660


Follow on comments from first patch 1/3.   Start there...


On 3/5/2026 11:22 AM, Shiva Tripathi wrote:
> Add initramfs-module-luks-ftpm providing LUKS2 full disk encryption
> with TPM-sealed keys for TI K3 platforms. Keys are sealed by firmware
> TPM (fTPM) running in OP-TEE and stored in eMMC RPMB.
> 
> Features:
> - First-boot in-place encryption with tpm2_getrandom key generation
> - TPM-sealed key storage via persistent handle 0x81080001
> - Automatic unlock on subsequent boots
> - Space verification ensuring 32MB available for LUKS header
> 
> Update packagegroup-ti-core-initramfs to conditionally include the
> module when MACHINE_FEATURES contains 'luks-encryption'.
> 
> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
> ---
>   .../initramfs-module-luks-ftpm/luksftpm       | 341 ++++++++++++++++++
>   .../initramfs-module-luks-ftpm_1.0.bb         |  41 +++
>   .../packagegroup-ti-core-initramfs.bb         |   1 +
>   3 files changed, 383 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm/luksftpm
>   create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm_1.0.bb
> 
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm/luksftpm b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm/luksftpm
> new file mode 100644
> index 00000000..5e3aedc4
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm/luksftpm
> @@ -0,0 +1,341 @@
> +#!/bin/sh
> +# initramfs-framework module for LUKS encryption with fTPM support
> +
> +# Configuration
> +BOOT_DEV="/dev/mmcblk1p1"           # Boot partition (FAT, unencrypted)
> +ROOT_DEV="/dev/mmcblk1p2"           # Root partition (will be encrypted)
> +CRYPT_NAME="root_crypt"
> +CRYPT_DEV="/dev/mapper/${CRYPT_NAME}"
> +BOOT_MNT="/boot_part"
> +TPM_PRIMARY_CTX="/tmp/tpm_primary.ctx"
> +TPM_KEY_PRIV="/tmp/tpm_key.priv"
> +TPM_KEY_PUB="/tmp/tpm_key.pub"
> +TPM_KEY_CTX="/tmp/tpm_key.ctx"
> +TPM2_HANDLE="0x81080001"            # TPM persistent handle for LUKS key
> +ENCRYPTION_MARKER="${BOOT_MNT}/.encryption_in_progress"
> +
> +# Wait for MMC device to appear
> +wait_for_device() {
> +    local device="$1"
> +    local timeout="${2:-10}"
> +
> +    msg "Waiting for storage device ${device}..."
> +    for i in $(seq 1 ${timeout}); do
> +        if [ -b "${device}" ]; then
> +            return 0
> +        fi
> +        sleep 1
> +    done
> +    return 1
> +}
> +
> +# Initialize fTPM and check availability
> +init_ftpm() {
> +    msg "Initializing secure hardware (fTPM)..."
> +
> +    # Start TEE supplicant (required for fTPM TA to work)
> +    if [ -x /usr/sbin/tee-supplicant ]; then
> +        /usr/sbin/tee-supplicant -d &
> +        TEE_SUPPLICANT_PID=$!
> +        sleep 5
> +    else
> +        info "Warning: Trusted execution environment not available"
> +        return 1
> +    fi
> +
> +    # Load fTPM kernel module
> +    if ! /sbin/modprobe tpm_ftpm_tee; then
> +        info "Warning: TPM module failed to load"
> +        return 1
> +    fi
> +
> +    # Wait for TPM device
> +    for i in $(seq 1 10); do
> +        if [ -c /dev/tpmrm0 ]; then
> +            export TPM2TOOLS_TCTI="device:/dev/tpmrm0"
> +            return 0
> +        fi
> +        sleep 1
> +    done
> +
> +    info "Warning: fTPM not available - encryption will be skipped"
> +    return 1
> +}
> +
> +# Generate 32-byte random key using TPM RNG
> +generate_random_key() {
> +    /usr/bin/tpm2_getrandom --hex 32
> +}
> +
> +# Seal data with TPM and store in persistent handle
> +tpm_seal_key() {
> +    local KEY_DATA="$1"
> +
> +    # Create primary key in owner hierarchy
> +    /usr/bin/tpm2_createprimary -C o -c "${TPM_PRIMARY_CTX}" -Q || return 1
> +
> +    # Create sealed object
> +    echo -n "${KEY_DATA}" | \
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
> +    /usr/bin/tpm2_evictcontrol -C o -c "${TPM_KEY_CTX}" "${TPM2_HANDLE}" || return 1
> +
> +    return 0
> +}
> +
> +# Unseal data from TPM persistent handle
> +tpm_unseal_key() {
> +    # Check if persistent handle exists
> +    if ! /usr/bin/tpm2_getcap handles-persistent | grep -q "${TPM2_HANDLE}"; then
> +        debug "ERROR: TPM persistent handle not found"
> +        return 1
> +    fi
> +
> +    # Unseal key directly from persistent handle
> +    /usr/bin/tpm2_unseal -c "${TPM2_HANDLE}" || return 1
> +
> +    return 0
> +}
> +
> +# Perform in-place LUKS encryption (first boot)
> +encrypt_root_filesystem() {
> +    msg "=========================================="
> +    msg "First boot: Encrypting root filesystem"
> +    msg "=========================================="
> +
> +    # Set marker to track encryption progress
> +    touch "${ENCRYPTION_MARKER}"
> +    sync
> +
> +    # Generate random encryption key using TPM RNG
> +    msg "Generating encryption key..."
> +    LUKS_KEY=$(generate_random_key)
> +
> +    if [ -z "${LUKS_KEY}" ]; then
> +        msg "ERROR: Failed to generate encryption key"
> +        rm -f "${ENCRYPTION_MARKER}"
> +        return 1
> +    fi
> +
> +    # Seal key with TPM before encryption starts
> +    msg "Securing key with TPM..."
> +    if ! tpm_seal_key "${LUKS_KEY}"; then
> +        msg "ERROR: Failed to secure key"
> +        rm -f "${ENCRYPTION_MARKER}"
> +        return 1
> +    fi
> +
> +    # Filesystem check before encryption
> +    msg "Checking filesystem integrity..."
> +    /usr/sbin/e2fsck -f -y "${ROOT_DEV}"
> +    E2FSCK_RET=$?
> +    if [ ${E2FSCK_RET} -ge 4 ]; then
> +        msg "ERROR: Filesystem check failed"
> +        rm -f "${ENCRYPTION_MARKER}"
> +        return 1
> +    fi
> +
> +    # Shrink filesystem before encryption to leave room for LUKS header
> +    msg "Preparing filesystem for encryption..."
> +    /usr/sbin/resize2fs -M "${ROOT_DEV}" || {
> +        msg "ERROR: Failed to prepare filesystem"
> +        rm -f "${ENCRYPTION_MARKER}"
> +        return 1
> +    }
> +
> +    # Verify partition has sufficient space for LUKS header
> +    msg "Verifying space for encryption..."
> +    MIN_BLOCKS=$(/usr/sbin/resize2fs -P "${ROOT_DEV}" 2>&1 | awk '/[Mm]inimum.*:/ {print $NF}')
> +
> +    # Get filesystem block size and device size
> +    BLOCK_SIZE=$(/usr/sbin/tune2fs -l "${ROOT_DEV}" 2>/dev/null | awk '/^Block size:/ {print $NF}')
> +    DEV_NAME=$(basename "${ROOT_DEV}")
> +    PART_SECTORS=$(cat /sys/class/block/"${DEV_NAME}"/size 2>/dev/null)
> +
> +    if [ -z "${MIN_BLOCKS}" ] || [ -z "${BLOCK_SIZE}" ] || [ -z "${PART_SECTORS}" ]; then
> +        msg "ERROR: Unable to determine partition geometry"
> +        rm -f "${ENCRYPTION_MARKER}"
> +        return 1
> +    fi
> +
> +    # Convert filesystem blocks to 512-byte sectors
> +    MIN_SECTORS=$((MIN_BLOCKS * BLOCK_SIZE / 512))
> +    LUKS_SECTORS=65536  # 32MB in 512-byte sectors
> +
> +    if [ $((PART_SECTORS - MIN_SECTORS)) -lt ${LUKS_SECTORS} ]; then
> +        msg "ERROR: Insufficient space for LUKS header (need 32MB free)"
> +        rm -f "${ENCRYPTION_MARKER}"
> +        return 1
> +    fi
> +
> +    # Perform in-place encryption
> +    msg "=========================================="
> +    msg "Encrypting filesystem..."
> +    msg "This will take several minutes."
> +    msg "DO NOT POWER OFF THE DEVICE!"
> +    msg "=========================================="
> +
> +    echo -n "${LUKS_KEY}" | \
> +        /usr/sbin/cryptsetup reencrypt --encrypt \
> +        --type luks2 \
> +        --cipher aes-xts-plain64 \
> +        --key-size 256 \
> +        --hash sha256 \
> +        --reduce-device-size 32M \
> +        --key-file - \
> +        "${ROOT_DEV}" || {
> +        msg "ERROR: Encryption failed"
> +        rm -f "${ENCRYPTION_MARKER}"
> +        return 1
> +    }
> +
> +    msg "=========================================="
> +    msg "Encryption completed successfully!"
> +    msg "=========================================="
> +
> +    # Remove encryption marker
> +    rm -f "${ENCRYPTION_MARKER}"
> +    sync
> +
> +    # Unlock the newly encrypted device
> +    msg "Activating encrypted filesystem..."
> +    echo -n "${LUKS_KEY}" | \
> +        /usr/sbin/cryptsetup luksOpen "${ROOT_DEV}" "${CRYPT_NAME}" --key-file - || {
> +        msg "ERROR: Failed to activate encrypted filesystem"
> +        return 1
> +    }
> +
> +    # Resize filesystem to fit the encrypted device
> +    msg "Optimizing filesystem..."
> +    /usr/sbin/resize2fs -f "${CRYPT_DEV}" || {
> +        msg "ERROR: Failed to optimize filesystem"
> +        return 1
> +    }
> +
> +    # Verify filesystem after resize
> +    /usr/sbin/e2fsck -f -y "${CRYPT_DEV}" || {
> +        info "WARNING: Filesystem verification had issues, but continuing"
> +    }
> +
> +    return 0
> +}
> +
> +# Unlock encrypted root filesystem (subsequent boots)
> +unlock_encrypted_root() {
> +    msg "Unlocking encrypted filesystem..."
> +
> +    # Unseal key from TPM persistent handle
> +    LUKS_KEY=$(tpm_unseal_key)
> +
> +    if [ -z "${LUKS_KEY}" ]; then
> +        msg "ERROR: Failed to retrieve encryption key from TPM"
> +        msg "Attempting passphrase fallback..."
> +
> +        # Try to unlock with passphrase (interactive)
> +        /usr/sbin/cryptsetup luksOpen "${ROOT_DEV}" "${CRYPT_NAME}" || {
> +            fatal "ERROR: Failed to unlock encrypted filesystem"
> +        }
> +    else
> +        # Unlock with unsealed key
> +        echo -n "${LUKS_KEY}" | \
> +            /usr/sbin/cryptsetup luksOpen "${ROOT_DEV}" "${CRYPT_NAME}" --key-file - || {
> +            fatal "ERROR: Failed to unlock with TPM key"
> +        }
> +    fi
> +
> +    msg "Encrypted filesystem unlocked"
> +}
> +
> +# Module enabled check
> +luksftpm_enabled() {
> +    # Always run this module - it handles both encrypted and unencrypted cases
> +    return 0
> +}
> +
> +# Module main function
> +luksftpm_run() {
> +    # Wait for storage device
> +    if ! wait_for_device "${ROOT_DEV}" 10; then
> +        info "Storage device not found, skipping encryption module"
> +        return 0
> +    fi
> +
> +    # Mount boot partition
> +    msg "Mounting boot partition..."
> +    mkdir -p "${BOOT_MNT}"
> +    if ! mount "${BOOT_DEV}" "${BOOT_MNT}"; then
> +        info "ERROR: Failed to mount boot partition, attempting standard boot..."
> +        mkdir -p ${ROOTFS_DIR}
> +        mount "${ROOT_DEV}" ${ROOTFS_DIR}
> +        return 0
> +    fi
> +
> +    # Initialize fTPM
> +    TPM_AVAILABLE=0
> +    if init_ftpm; then
> +        TPM_AVAILABLE=1
> +    fi
> +
> +    # Check filesystem encryption status
> +    msg "Checking filesystem encryption status..."
> +
> +    MOUNT_DEV="${ROOT_DEV}"
> +
> +    if /usr/sbin/cryptsetup isLuks "${ROOT_DEV}"; then
> +        msg "Filesystem is encrypted"
> +        unlock_encrypted_root
> +        MOUNT_DEV="${CRYPT_DEV}"
> +    else
> +        msg "Filesystem is not encrypted"
> +
> +        # Check if encryption is enabled and TPM is available
> +        if [ $TPM_AVAILABLE -eq 1 ]; then
> +            # Check for encryption marker (resume interrupted encryption)
> +            if [ -f "${ENCRYPTION_MARKER}" ]; then
> +                msg "Resuming interrupted encryption..."
> +                if ! encrypt_root_filesystem; then
> +                    msg "ERROR: Failed to resume encryption"
> +                    msg "Booting without encryption..."
> +                    MOUNT_DEV="${ROOT_DEV}"
> +                else
> +                    MOUNT_DEV="${CRYPT_DEV}"
> +                fi
> +            else
> +                # First boot - perform encryption
> +                if encrypt_root_filesystem; then
> +                    MOUNT_DEV="${CRYPT_DEV}"
> +                else
> +                    msg "ERROR: Encryption failed - booting without encryption"
> +                    MOUNT_DEV="${ROOT_DEV}"
> +                fi
> +            fi
> +        else
> +            msg "TPM not available - skipping encryption"
> +            MOUNT_DEV="${ROOT_DEV}"
> +        fi
> +    fi
> +
> +    # Unmount boot partition before switching root
> +    umount "${BOOT_MNT}"
> +
> +    # Mount root filesystem to $ROOTFS_DIR (framework expects this)
> +    msg "Mounting root filesystem..."
> +    mkdir -p ${ROOTFS_DIR}
> +    mount "${MOUNT_DEV}" ${ROOTFS_DIR} || {
> +        fatal "ERROR: Failed to mount root filesystem!"
> +    }
> +
> +    # Clean up tmpfs and sensitive variables
> +    rm -f "${TPM_PRIMARY_CTX}" "${TPM_KEY_PUB}" "${TPM_KEY_PRIV}" "${TPM_KEY_CTX}"
> +    unset LUKS_KEY TPM_AVAILABLE MOUNT_DEV TEE_SUPPLICANT_PID
> +
> +    msg "Boot complete"
> +}
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm_1.0.bb b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm_1.0.bb
> new file mode 100644
> index 00000000..c0a07bde
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm_1.0.bb
> @@ -0,0 +1,41 @@
> +SUMMARY = "initramfs support for LUKS encryption with fTPM"
> +DESCRIPTION = "Provides LUKS2 full disk encryption using firmware TPM (fTPM) for key management on TI K3 platforms"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +# Only build this when luks-encryption feature is enabled
> +COMPATIBLE_MACHINE = "null"
> +COMPATIBLE_MACHINE:k3 = "${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', '.*', 'null', d)}"

COMPATIBLE_MACHINE:k3 = "${@bb.utils.contains('MACHINE_FEATURES', 'tpm', 
'.*', 'null', d)}"


> +
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI = "file://luksftpm"
> +
> +do_install() {
> +    install -d ${D}/init.d
> +    # Install as 85-luksftpm (runs after udev at 01, before rootfs at 90)
> +    install -m 0755 ${UNPACKDIR}/luksftpm ${D}/init.d/85-luksftpm
> +}
> +
> +FILES:${PN} = "/init.d/85-luksftpm"
> +
> +# Runtime dependencies
> +RDEPENDS:${PN} = "\
> +    initramfs-framework-base \
> +    busybox \
> +    kmod \
> +    cryptsetup \
> +    tpm2-tools \
> +    tpm2-tss \
> +    libtss2-tcti-device \
> +    optee-client \
> +    optee-ftpm \
> +    e2fsprogs-e2fsck \
> +    e2fsprogs-resize2fs \
> +    e2fsprogs-tune2fs \
> +    util-linux-blkid \
> +    kernel-module-tpm-ftpm-tee \
> +"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"




And for this patch, move the below change into patch 3/3 where we are 
making ti-core-initramfs changes.


> diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> index a9eff847..9d8f0a47 100644
> --- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> +++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> @@ -22,4 +22,5 @@ RDEPENDS:${PN} += "\
>       initramfs-module-udev \
>       initramfs-module-nfsrootfs \
>       nfs-utils-mount \
> +    ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', 'initramfs-module-luks-ftpm', '', d)} \
>   "

For this create a variable:

LUKS_ENCRYPTION ?= "${@bb.utils.contains('MACHINE_FEATURES', 'tpm', 
'initramfs-module-luks-ftpm', '', d)}"

And then in the RDPENDS:

${@bb.utils.contains('DISTRO_FEATURES', 'luks', '${LUKS_ENCRYPTION}', 
'', d)}

That way we are gating on both variables to make 100% sure that the 
hardware and requested distro feature align.




-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

