Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32F7109E522
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 21:55:53 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34556.1774475747246115794
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Mar 2026 14:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=HQRdB/tx;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.49, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHxzHsWmETd2KURV4KwqGKj1RKK57Lr2q8yQE+kXIYeVS0UwZS+4XYqu75MPfh0iSYg3cZDk9ZfSE7oRruS4/muePJyoUucB2BUzgGV/lktmTZxWjngrtBOduhaAhrEQWpSPBmZP4Azpp3WTEVws0GAkw1fY1j5LVV7371RhqtRyWuACwVvIBQPT7h6pEghFnc+Iqa5j973XZqTRYXVg6Lpr7XfJYuJYAllbK6q0deiyiAyLAoiPf6aqAS86gL7zeyiPiSF6Ru7R0Mkzq4WEVY7CikpsUwMNEcVzae30q9/S6dWym1oC+pncqdDKAD6ANyo5ndDAwzbm1JDN2jeE7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXhSIm1lQQK6Zt3GCKtEOcfbQw6q//JbZyF4CGnbEeU=;
 b=bQvzHDqpXCFKVK9AuXMrSeFvrcDyJ9XbGhJe4w0XMORJIACHDueW87T1UIrf85DcQd9KNhMYp9QtjvvlAAVP5TLv2Mylqi+npMsmsFjB0vydqSQjhZ1WZ0d5GNNfMb1JBCZmnfmVolj19i5KfIrXrkKpbqxBk7Pyv7AIfqZfXgQ9JO1rzZzmvBmbVHJDEbwCQawxtjCSr/Bhgzn6UvhZyuB6nccwpAMjZBsJDKPwWEdyg6tUYjim+UwLdlo3pxHGlst3NyGLLtlqQigL8LOc3qMd6PK0/qYFlub/N1asOmrEesMnY4x2g1E+tSOPGEwrVRzXUKWz5h1B1VvLLZpftg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXhSIm1lQQK6Zt3GCKtEOcfbQw6q//JbZyF4CGnbEeU=;
 b=HQRdB/txcuTs9xY8HvGRWSlELSMvxjTpikoqhs373wJjpZgvOdvWYbeIsEv0o4qqnrhgXDhJea/Vt2iW0Wf5TAVj6yApnsVKqcV7JV8oFlBTiXY3Aa8BmmqHDQLfMDzk6ilCJ845XlFE2sLX2TEWT5F/V5XAqdesSx8TzMfNU5c=
Received: from BL1PR13CA0401.namprd13.prod.outlook.com (2603:10b6:208:2c2::16)
 by CY8PR10MB7380.namprd10.prod.outlook.com (2603:10b6:930:97::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 21:55:44 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::a5) by BL1PR13CA0401.outlook.office365.com
 (2603:10b6:208:2c2::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21 via Frontend Transport; Wed,
 25 Mar 2026 21:55:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 21:55:43 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 16:55:42 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 16:55:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 16:55:42 -0500
Received: from [10.249.32.33] ([10.249.32.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62PLtgf31011387;
	Wed, 25 Mar 2026 16:55:42 -0500
Message-ID: <e69c7725-0769-45d5-94e8-59975b383a15@ti.com>
Date: Wed, 25 Mar 2026 16:55:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v8 2/3] initramfs-module-luks-ftpm: Add
 fTPM support
To: Shiva Tripathi <s-tripathi1@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <rs@ti.com>, <jcormier@criticallink.com>, <praneeth@ti.com>,
	<kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>, <denis@denix.org>,
	<vigneshr@ti.com>, <afd@ti.com>
References: <20260319165833.137342-1-s-tripathi1@ti.com>
 <20260319165833.137342-3-s-tripathi1@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260319165833.137342-3-s-tripathi1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|CY8PR10MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ed51ad4-eba0-4312-5c9b-08de8ab9432f
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	u2nl2M3/6ZTBGdS/ijw2pKjuq56JYpe6sIqdYwcyaZq6n8SGi3GDElA8FX2zPyyi5oQmr8Oj6q2ZRC5Z21E3S2Q8Cr/4vV49GMKHQZ/PMIU+YYoqzMzJSV5jiVKmbCeuDQpOtXp1eZb6hO9mXE3o9y+D4DK0bC59mD4/aDSxkTthTDmZ6LggoZb2gVT5BSn8s5FBuSoOHrKGOfJ0IaSFVmzGX8p9j0bVxw804cdo3T1Byd+NCrK161tb20gq3q7FdkM95nZ90P/awMEt4K5dTa1YReBzJuVnOGXR4a7ppGnyED1GXdFIe2WLF1MVzftojXtnAEl2HiRrfRJpXwftcDMOm8ksigBYbTiiYBUzOGlhyYgILulzT5AJPvXLYdrmcw4K8CvFvo2qncNCYnL9a5YVfkF7NPUZcbuw298ruJLjRqzq1wMGjl8/Zd5aCd6f66XnLL8NyccM2DjnhO2TCNeKNpSwadl5fAud8LkjxoIYMaYbHCClYcPYuojifNRJPIrmli356J5QGyxbI/5qWIGXEJndnUr2NWeUNokzB+EVt2TD6lSq+hVEadfhWamV7Sb3rRR4DurimohTnX5SwHiOJbADrRV3Etfg36d/kIIQCEz7E/PNqOgNnYvBq+ZdWgAPGtlff9Av9PtuSNz6vgxnLtLoXGej7QEaTEwFhB/gXlwv87ICs4OKU2YuYRdJBwqY1q3R6QdDs+CxIU0yOGqJs057B9n6V1v7APOFj+MqAbrsvhfynUL83cNwqdKveX31WkioS25O0q1obGlV/A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	DYudo+EhOFr8m2w1Vv+Su1Paq8Kb6zEsVyReMAlFqdGBjDVdcksgLp87vYjOMN7MH3eyj3ptHSPV76VpV2XjaXXka3OeQtwzPsJ2U6twF3rYFCdSH71eCe50RRsKQ3g7mAYxmLGYb5LEIaYFBZ4uO3NfuwAmSDRiyfsCFn4Papu9VujZiqPyNd7oYWMv0ns9ra06rtW8kw6ss9WlWaXHQL5B9rOX7Dit4K0IT+ebFzATfpXt6ySoWV41M/KS6z2TvWyrLtb4gUsYqwsqxezXHH2o/KncyylELo+7FlU0OdJNSfS4G2WNyOq6XTq83e3T7hyI8e/j8SS5xcosw7U91gDoxash2OkUMbXRyXqfAVD+zct8eiJvGNl0I6pbxyoPa5NUt2pxvclxew8xTWLLFHG0KUS4Dkvc4BCd9tBB9a8vaaHldfLYq7uVgV8JF0n+
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 21:55:43.2731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed51ad4-eba0-4312-5c9b-08de8ab9432f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7380
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Mar 2026 21:55:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19816



On 3/19/2026 11:58 AM, Shiva Tripathi wrote:
> Add initramfs module to dynamic-layers/tpm-layer providing LUKS2 full
> disk encryption with TPM-sealed keys for TI K3 platforms. Keys are
> sealed by firmware TPM (fTPM) running in OP-TEE and stored in eMMC
> RPMB.
> 
> Features:
> - First-boot in-place encryption with tpm2_getrandom key generation
> - TPM-sealed key storage via persistent handle 0x81080001
> - Automatic unlock on subsequent boots
> - Space verification ensuring 32MB available for LUKS header
> 
> The module is built only when meta-tpm layer is present and gets
> included in initramfs only when DISTRO_FEATURES='luks' and
> MACHINE_FEATURES='optee-ftpm'
> 
> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
> ---
>   .../initramfs-module-luks-ftpm/luksftpm       | 341 ++++++++++++++++++
>   .../initramfs-module-luks-ftpm_1.0.bb         |  43 +++
>   .../packagegroup-ti-core-initramfs.bbappend   |   3 +
>   3 files changed, 387 insertions(+)
>   create mode 100644 meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/initramfs-module-luks-ftpm/luksftpm
>   create mode 100644 meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/initramfs-module-luks-ftpm_1.0.bb
>   create mode 100644 meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bbappend
> 
> diff --git a/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/initramfs-module-luks-ftpm/luksftpm b/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/initramfs-module-luks-ftpm/luksftpm
> new file mode 100644
> index 00000000..5e3aedc4
> --- /dev/null
> +++ b/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/initramfs-module-luks-ftpm/luksftpm
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
> diff --git a/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/initramfs-module-luks-ftpm_1.0.bb b/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/initramfs-module-luks-ftpm_1.0.bb
> new file mode 100644
> index 00000000..b2a41d08
> --- /dev/null
> +++ b/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/initramfs-module-luks-ftpm_1.0.bb
> @@ -0,0 +1,43 @@
> +SUMMARY = "initramfs support for LUKS encryption with fTPM"
> +DESCRIPTION = "Provides LUKS2 full disk encryption using firmware TPM (fTPM) for key management on TI K3 platforms"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +# Only build for platforms with optee-ftpm support
> +COMPATIBLE_MACHINE = "null"
> +COMPATIBLE_MACHINE:k3 = "${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', '.*', 'null', d)}"
> +
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI = "file://luksftpm"
> +
> +S = "${UNPACKDIR}"
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
> diff --git a/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bbappend b/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bbappend
> new file mode 100644
> index 00000000..52c82389
> --- /dev/null
> +++ b/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bbappend
> @@ -0,0 +1,3 @@
> +LUKS_ENCRYPTION ?= "${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', 'initramfs-module-luks-ftpm', '', d)}"
> +
> +RDEPENDS:${PN}:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'luks', '${LUKS_ENCRYPTION}', '', d)}"

We are missing another setting that should be in the dynamic layer. 
With the above we are adding a bunch of new packages into the initramfs 
and we are now running into the INITRAMFS_MAXSIZE check.

I created:
meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/ti-core-initramfs.bbappend

With:
INITRAMFS_MAXSIZE = "200000"

And that finished the build successfully.  So I think we need a V9 to 
include this change as well.



-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

