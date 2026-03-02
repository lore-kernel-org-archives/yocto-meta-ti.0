Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE7DEB3640
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 22:40:52 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4962.1772491248114176895
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 14:40:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=TirMbkYC;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.24, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rfcU2hfJ0rBDFRwk5Q5DZ6BMxK3J4SLJrWi0gEnIt2Wuyn+0uBRMP3rKyfzIRsKns33FtdLc3K0F1Dhh/ooj8HiHwCtxlCg6vyZnkNVjDolfkFAoUfGoPRglMhOcEIAVrw+WOgwn7pNcCq/T/xfKwxGOlqMT9Ks2Jte/i6WCx/cK5NU5G2z6z0oLjlBkXTvWsv8HthRtYhW9n0IzcHPH3Pj5WcNcmeKj3x0Hu5MHk5Zfsob2q5VCJVEVDhy/DOjopzCJJ/ubHuTvqwHgaqrNb4MpgDOvA02n2r+SkmSX6rkfttjAXWTjV0uJTOes2SjRB1qW1y9VPp2SR1M1vBDJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yriukQu9r/vEBmXRkrqq9AQ8/Ch224vcpPNMYIoS8o=;
 b=X7Eb2CvtZq/La4xY5P9z8kEeFqbjfiI6tTmWNmnacVkc3PHERcp/QOPy/Uu0+/P1dwogRFyI8woXFliEwOVjt0uTOndO9qFhoc0TGWBlAJe8kdh4GLOYBdwwC5ErQl5peERBqia9kANGrwh6+OCDFVc8uJMlbRh7sWNPOj2ngaeSKXLd8g2TPcUpa7o3VCSlyZ1ksIXYBQFgln4L0eoZ8fxV/JeF6+/OwiJfIJ2tv0O2uQIY3YUknW8tMh6XwqB5F2jcOR8omiazpgmsUqWuTvHulH/I6ABsHe1nDMHnYA6jeFdGc/eREmB7Y9+ZH3yoR89SBFxD7/udb1qhPoGRAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yriukQu9r/vEBmXRkrqq9AQ8/Ch224vcpPNMYIoS8o=;
 b=TirMbkYCcP9KR7SBs5eMyL1vC22+btdsa2Nv7DvXNi+uXoqzU/2WFcAovNnMjxyDDrJhjNcBX1SskY07vuOu5seLHm9TyupKMTEe6svK1wXeol4MacVQEI8m0PhBUu8HQNRvLuumx7S+wUDfbyzQXeWG+7ljQcAN1gUAPmpVd+Q=
Received: from BN9PR03CA0635.namprd03.prod.outlook.com (2603:10b6:408:13b::10)
 by IA3PR10MB8164.namprd10.prod.outlook.com (2603:10b6:208:514::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 22:40:43 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:13b:cafe::dd) by BN9PR03CA0635.outlook.office365.com
 (2603:10b6:408:13b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 22:40:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Mon, 2 Mar 2026 22:40:43 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 16:40:42 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 16:40:41 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 16:40:41 -0600
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622Mefm61042830;
	Mon, 2 Mar 2026 16:40:41 -0600
Message-ID: <823f1750-cb5a-46c8-9281-9b9a46b8e257@ti.com>
Date: Mon, 2 Mar 2026 16:40:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH 2/3] initramfs: Add encrypted boot
 support with fTPM
To: Randolph Sapp <rs@ti.com>, <s-tripathi1@ti.com>,
	<meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>,
	<k-malarvizhi@ti.com>
References: <20260302144647.1705408-1-s-tripathi1@ti.com>
 <20260302144647.1705408-3-s-tripathi1@ti.com>
 <DGSNMFG7CJMI.369LJBMXN2VSL@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <DGSNMFG7CJMI.369LJBMXN2VSL@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|IA3PR10MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: f2238901-5eca-487b-485e-08de78acbcfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|34020700016|1800799024|82310400026|7142099003;
X-Microsoft-Antispam-Message-Info: 
	QEpGQ20U5cpIr4S3T749GQbYoUdIHHUecl53HzW9TmLoGnP6qEfNYdot8y/dQv38altqsr2xmg83WeF5g1fcEdGXcdzR5NiVGpF+clJfmiWq2hRSH7dqd5dGVIoliFqMesgfht1zo5lbpz1/X+KAG3enZreXwFJNGvLx3ddct4K3WllAid5D8706g3WTRFQ+5HosBrHkmOg7ca0XbDjpUU81NQaoxyl1ufBwj9KkD6xS6lG1RwXgJj6yFtyZjlnC0ltcP1iNKc/QH40XZOF7VrgihshyHWR6W82VnWRbNg5ngm5ipU1QNbCWWDlILgsyMpPvnJMouyqZWekEvKeQdD3SQedQGQA5Hk3zQEfFbaSc66fD2cPHAgH3Inol+qE09WOALbIgwIJZhuJGjKh/qv2+avEufJyLhKzbeL0d0c/zQdRX/nKwGvafBpg9ZnDZ5bcROOK7DYDIe6Z5RhXVexIk1PF33SSc6kuHYaenhBhtvM2SPVDbVE1SGxxgCY3WdexGaT661/gkLVLBXx9ckxZk3w3Ls451en3RezBCpBjWGciaMr/X00RicD/FObpnD7FS/CgshRni8qKdyWT1j/UXXl+ohRZ7gdILgwJf7kPU6oTvNNXARZxHen5iVOkvO2EyaMoBQkyNJd87gBvVTj7FINJwxCrkQNIy4mnYcx7k4MpUXHXXP00MbG6q9iQmaozllTMYF9Izu7FwA8qDW6+mLgIrqdCufmJbtM/8UFvv1qQezQLZgmFtNSfwgduHQaLfuEKkwvtw96aKSFpXV0VlQp6JafEV8D2wWSduGqWDobBYY/D6Pwy2OGVtP7gqOx+V2zKF5ewvUmVZL9cMqg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(34020700016)(1800799024)(82310400026)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SXXkeGjfHj8Cvawu8TE0+lnm0GHk8Hp241eXbACRs5x2apkU2Lnnn4/845FnY8ou6KoF+/CWxz1juu2cRogOJxdIbjhnxP5+B80Kk275pb9FTZiWDnOIit8DfFLi5cepw+slRGRfj4tZg9jTRFaJiDSLkHFortbQoEn+s8BoLkg4LcAeC4+0s1ZwQ1VKE9ZUagqXh1Vzzsb27QIE8fojxtDNuvQVHI53rljV/XjquTkY73XgNmDb8gBho57kuCm7Zia9MlSonsEdn/vmwpFpDzqdYFJnInbVKa4sXODX+WqWwHKYn+2E1xYah9BN49cvlh6Edub/5XacQVyNrUzbLJqqnfYEeobedv9KpvTxMN/ZFftPdyh21rH44zIZ2nlslzN4pq61dVX+PykBwNpCPuSgcFZ6oPZOuWpsghux5FxwJRk3Qyr6tiTYkO6zsu2J
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 22:40:43.2356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2238901-5eca-487b-485e-08de78acbcfc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8164
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Mar 2026 22:40:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19633



On 3/2/2026 4:36 PM, Randolph Sapp wrote:
> On Mon Mar 2, 2026 at 8:46 AM CST, Shiva Tripathi via lists.yoctoproject.org wrote:
>> Add ti-encrypted-boot-initramfs for LUKS encryption with TPM-sealed
>> keys. This provides full disk encryption using dm-crypt with keys
>> sealed by firmware TPM (fTPM) running in OP-TEE and stored in eMMC RPMB.
>>
>> The initramfs includes:
>> - Custom init script for in-place LUKS encryption on first boot
>> - TPM key sealing/unsealing using persistent handle 0x81080001
>> - Support for cryptsetup, tpm2-tools, and OP-TEE client
>> - Automatic filesystem resize after encryption
>>
>> ti-encrypted-boot-initramfs builds when MACHINE_FEATURES contains
>> 'luks-encryption'.
>>
>> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
>> ---
>>   .../initramfs-ti-encrypted-init/files/init    | 324 ++++++++++++++++++
>>   .../initramfs-ti-encrypted-init_1.0.bb        |  30 ++
>>   .../initramfs/ti-encrypted-boot-initramfs.bb  |  50 +++
>>   3 files changed, 404 insertions(+)
>>   create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init/files/init
>>   create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init_1.0.bb
>>   create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-encrypted-boot-initramfs.bb
>>
>> diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init/files/init b/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init/files/init
>> new file mode 100644
>> index 00000000..6675b6ed
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init/files/init
>> @@ -0,0 +1,324 @@
>> +#!/usr/bin/busybox sh
>> +# TI SDK initramfs init script with LUKS2 + fTPM encryption support
>> +
>> +# Mount essential filesystems
>> +/usr/bin/busybox echo "Initializing system..."
>> +/usr/bin/busybox mount -t proc proc /proc
>> +/usr/bin/busybox mount -t sysfs sysfs /sys
>> +/usr/bin/busybox mount -t devtmpfs devtmpfs /dev
>> +
>> +# Configuration
>> +BOOT_DEV="/dev/mmcblk1p1"           # Boot partition (FAT, unencrypted)
>> +ROOT_DEV="/dev/mmcblk1p2"           # Root partition (will be encrypted)
>> +CRYPT_NAME="root_crypt"
>> +CRYPT_DEV="/dev/mapper/${CRYPT_NAME}"
>> +BOOT_MNT="/boot_part"
>> +TPM_PRIMARY_CTX="/tmp/tpm_primary.ctx"
>> +TPM_KEY_PRIV="/tmp/tpm_key.priv"
>> +TPM_KEY_PUB="/tmp/tpm_key.pub"
>> +TPM_KEY_CTX="/tmp/tpm_key.ctx"
>> +TPM2_HANDLE="0x81080001"            # TPM persistent handle for LUKS key
>> +ENCRYPTION_MARKER="${BOOT_MNT}/.encryption_in_progress"
>> +
>> +# Wait for MMC device to appear (up to 10 seconds)
>> +/usr/bin/busybox echo "Waiting for storage device..."
>> +for i in 1 2 3 4 5 6 7 8 9 10; do
>> +    if [ -b "${ROOT_DEV}" ]; then
>> +        break
>> +    fi
>> +    /usr/bin/busybox sleep 1
>> +done
>> +
>> +# Check if root device exists
>> +if [ ! -b "${ROOT_DEV}" ]; then
>> +    /usr/bin/busybox echo "ERROR: Storage device not found!"
>> +    /usr/bin/busybox sh
>> +fi
>> +
>> +# Mount boot partition
>> +/usr/bin/busybox echo "Mounting boot partition..."
>> +/usr/bin/busybox mkdir -p "${BOOT_MNT}"
>> +if ! /usr/bin/busybox mount "${BOOT_DEV}" "${BOOT_MNT}"; then
>> +    /usr/bin/busybox echo "ERROR: Failed to mount boot partition!"
>> +    /usr/bin/busybox echo "Attempting standard boot..."
>> +    /usr/bin/busybox mkdir -p /newroot
>> +    /usr/bin/busybox mount "${ROOT_DEV}" /newroot
>> +    exec /usr/sbin/switch_root /newroot /sbin/init
>> +fi
> 
> The main boot path should be the error path here, not an arbitrary duplication
> of logic.
> 
>> +
>> +# Initialize fTPM in OP-TEE
>> +/usr/bin/busybox echo "Initializing secure hardware(fTPM)..."
>> +
>> +# Start TEE supplicant (required for fTPM TA to work)
>> +if [ -x /usr/sbin/tee-supplicant ]; then
>> +    /usr/sbin/tee-supplicant -d &
>> +    TEE_SUPPLICANT_PID=$!
>> +    /usr/bin/busybox sleep 5
>> +else
>> +    /usr/bin/busybox echo "Warning: Trusted execution environment not available"
>> +fi
>> +
>> +# Load fTPM kernel module
>> +if ! /sbin/modprobe tpm_ftpm_tee; then
>> +    /usr/bin/busybox echo "Warning: TPM module failed to load"
>> +fi
>> +
>> +# Wait for TPM device (up to 10 seconds)
>> +for i in 1 2 3 4 5 6 7 8 9 10; do
>> +    if [ -c /dev/tpmrm0 ]; then
>> +        break
>> +    fi
>> +    /usr/bin/busybox sleep 1
>> +done
> 
> This should be a function who's exit code is use in the below script directly
> instead of rechecking if the device is present.
> 
>> +
>> +# Check if TPM is available
>> +TPM_AVAILABLE=0
>> +if [ -c /dev/tpmrm0 ]; then
>> +    TPM_AVAILABLE=1
>> +    export TPM2TOOLS_TCTI="device:/dev/tpmrm0"
>> +else
>> +    /usr/bin/busybox echo "Warning: fTPM not available - encryption will be skipped"
>> +    if [ -n "${TEE_SUPPLICANT_PID}" ]; then
>> +        /usr/bin/busybox kill "${TEE_SUPPLICANT_PID}" 2>/dev/null
>> +    fi
>> +fi
>> +
>> +# Function: Generate 32-byte random key using TPM RNG
>> +generate_random_key() {
>> +    if [ $TPM_AVAILABLE -eq 1 ]; then
>> +        /usr/bin/tpm2_getrandom --hex 32
>> +    else
>> +        /usr/bin/busybox echo "ERROR: TPM not available for key generation"
>> +        return 1
>> +    fi
>> +}
> 
> This should probably be reported to the user, or at least they should be told
> how to access it during runtime.
> 
>> +
>> +# Function: Seal data with TPM and store in persistent handle
>> +tpm_seal_key() {
>> +    local KEY_DATA="$1"
>> +
>> +    if [ $TPM_AVAILABLE -eq 0 ]; then
>> +        /usr/bin/busybox echo "ERROR: TPM not available for sealing"
>> +        return 1
>> +    fi
>> +
>> +    # Create primary key in owner hierarchy
>> +    /usr/bin/tpm2_createprimary -C o -c "${TPM_PRIMARY_CTX}" -Q || return 1
>> +
>> +    # Create sealed object
>> +    /usr/bin/busybox echo -n "${KEY_DATA}" | \
>> +        /usr/bin/tpm2_create -C "${TPM_PRIMARY_CTX}" \
>> +        -u "${TPM_KEY_PUB}" -r "${TPM_KEY_PRIV}" \
>> +        -i- -Q || return 1
>> +
>> +    # Load sealed object into TPM
>> +    /usr/bin/tpm2_load -C "${TPM_PRIMARY_CTX}" \
>> +        -u "${TPM_KEY_PUB}" -r "${TPM_KEY_PRIV}" \
>> +        -c "${TPM_KEY_CTX}" -Q || return 1
>> +
>> +    # Make key persistent at handle (stored in TPM NV RAM - RPMB)
>> +    /usr/bin/tpm2_evictcontrol -C o -c "${TPM_KEY_CTX}" "${TPM2_HANDLE}" || return 1
>> +
>> +    return 0
>> +}
>> +
>> +# Function: Unseal data from TPM persistent handle
>> +tpm_unseal_key() {
>> +    if [ $TPM_AVAILABLE -eq 0 ]; then
>> +        /usr/bin/busybox echo "ERROR: TPM not available for unsealing" >&2
>> +        return 1
>> +    fi
>> +
>> +    # Check if persistent handle exists
>> +    if ! /usr/bin/tpm2_getcap handles-persistent | grep -q "${TPM2_HANDLE}"; then
>> +        /usr/bin/busybox echo "ERROR: TPM persistent handle not found" >&2
>> +        return 1
>> +    fi
>> +
>> +    # Unseal key directly from persistent handle
>> +    /usr/bin/tpm2_unseal -c "${TPM2_HANDLE}" || return 1
>> +
>> +    return 0
>> +}
>> +
>> +# Function: Perform in-place LUKS encryption (first boot)
>> +encrypt_root_filesystem() {
>> +    /usr/bin/busybox echo "=========================================="
>> +    /usr/bin/busybox echo "First boot: Encrypting root filesystem"
>> +    /usr/bin/busybox echo "=========================================="
>> +
>> +    # Set marker to track encryption progress
>> +    /usr/bin/busybox touch "${ENCRYPTION_MARKER}"
>> +    /usr/bin/busybox sync
>> +
>> +    # Generate random encryption key using TPM RNG
>> +    /usr/bin/busybox echo "Generating encryption key..."
>> +    LUKS_KEY=$(generate_random_key)
>> +
>> +    if [ -z "${LUKS_KEY}" ]; then
>> +        /usr/bin/busybox echo "ERROR: Failed to generate encryption key"
>> +        /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
>> +        return 1
>> +    fi
>> +
>> +    # Seal key with TPM before encryption starts
>> +    /usr/bin/busybox echo "Securing key with TPM..."
>> +    if ! tpm_seal_key "${LUKS_KEY}"; then
>> +        /usr/bin/busybox echo "ERROR: Failed to secure key"
>> +        /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
>> +        return 1
>> +    fi
>> +
>> +    # Filesystem check before encryption
>> +    /usr/bin/busybox echo "Checking filesystem integrity..."
>> +    /usr/sbin/e2fsck -f -y "${ROOT_DEV}"
>> +    E2FSCK_RET=$?
>> +    if [ ${E2FSCK_RET} -ge 4 ]; then
>> +        /usr/bin/busybox echo "ERROR: Filesystem check failed"
>> +        /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
>> +        return 1
>> +    fi
>> +
>> +    # Shrink filesystem before encryption to leave room for LUKS header
>> +    /usr/bin/busybox echo "Preparing filesystem for encryption..."
>> +    /usr/sbin/resize2fs "${ROOT_DEV}" 368M || {
> 
> Arbitrary size here, prone to failure in the future. Look into the "-M" option
> instead.
> 
>> +        /usr/bin/busybox echo "ERROR: Failed to prepare filesystem"
>> +        /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
>> +        return 1
>> +    }
>> +
>> +    # Perform in-place encryption
>> +    /usr/bin/busybox echo "=========================================="
>> +    /usr/bin/busybox echo "Encrypting filesystem..."
>> +    /usr/bin/busybox echo "This will take several minutes."
>> +    /usr/bin/busybox echo "DO NOT POWER OFF THE DEVICE!"
>> +    /usr/bin/busybox echo "=========================================="
>> +
>> +    /usr/bin/busybox echo -n "${LUKS_KEY}" | \
>> +        /usr/sbin/cryptsetup reencrypt --encrypt \
>> +        --type luks2 \
>> +        --cipher aes-xts-plain64 \
>> +        --key-size 256 \
>> +        --hash sha256 \
>> +        --reduce-device-size 32M \
>> +        --key-file - \
>> +        "${ROOT_DEV}" || {
>> +        /usr/bin/busybox echo "ERROR: Encryption failed"
>> +        /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
>> +        return 1
>> +    }
> 
> This should only work on partitions that already contain a LUKS header. The LUKS
> header is placed in sector 0 of the block device. resize2fs doesn't support
> changing the starting position of the filesystem so you will always corrupt the
> existing filesystem. It may still be recoverable, but that's not the point. This
> is a bad idea.
> 
> Additionally, the partition should be overwritten with randomized data before
> use to make sure unused blocks look indistinguishable from later encrypted data.
> This is not something that can be done using an initramfs without external
> storage.
> 
>> +
>> +    /usr/bin/busybox echo "=========================================="
>> +    /usr/bin/busybox echo "Encryption completed successfully!"
>> +    /usr/bin/busybox echo "=========================================="
>> +
>> +    # Remove encryption marker
>> +    /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
>> +    /usr/bin/busybox sync
>> +
>> +    # Unlock the newly encrypted device
>> +    /usr/bin/busybox echo "Activating encrypted filesystem..."
>> +    /usr/bin/busybox echo -n "${LUKS_KEY}" | \
>> +        /usr/sbin/cryptsetup luksOpen "${ROOT_DEV}" "${CRYPT_NAME}" --key-file - || {
>> +        /usr/bin/busybox echo "ERROR: Failed to activate encrypted filesystem"
>> +        return 1
>> +    }
>> +
>> +    # Resize filesystem to fit the encrypted device
>> +    /usr/bin/busybox echo "Optimizing filesystem..."
>> +    /usr/sbin/resize2fs -f "${CRYPT_DEV}" || {
>> +        /usr/bin/busybox echo "ERROR: Failed to optimize filesystem"
>> +        return 1
>> +    }
>> +
>> +    # Verify filesystem after resize
>> +    /usr/sbin/e2fsck -f -y "${CRYPT_DEV}" || {
>> +        /usr/bin/busybox echo "WARNING: Filesystem verification had issues, but continuing"
>> +    }
>> +    return 0
>> +}
>> +
>> +# Function: Unlock encrypted root filesystem (subsequent boots)
>> +unlock_encrypted_root() {
>> +    /usr/bin/busybox echo "Unlocking encrypted filesystem..."
>> +
>> +    # Unseal key from TPM persistent handle
>> +    LUKS_KEY=$(tpm_unseal_key)
>> +
>> +    if [ -z "${LUKS_KEY}" ]; then
>> +        /usr/bin/busybox echo "ERROR: Failed to retrieve encryption key from TPM"
>> +        /usr/bin/busybox echo "Attempting passphrase fallback..."
>> +
>> +        # Try to unlock with passphrase (interactive)
>> +        /usr/sbin/cryptsetup luksOpen "${ROOT_DEV}" "${CRYPT_NAME}" || {
>> +            /usr/bin/busybox echo "ERROR: Failed to unlock encrypted filesystem"
>> +            /usr/bin/busybox sh
>> +        }
>> +    else
>> +        # Unlock with unsealed key
>> +        /usr/bin/busybox echo -n "${LUKS_KEY}" | \
>> +            /usr/sbin/cryptsetup luksOpen "${ROOT_DEV}" "${CRYPT_NAME}" --key-file - || {
>> +            /usr/bin/busybox echo "ERROR: Failed to unlock with TPM key"
>> +            /usr/bin/busybox sh
>> +        }
>> +    fi
>> +
>> +    /usr/bin/busybox echo "Encrypted filesystem unlocked"
>> +}
>> +
>> +# Main boot logic
>> +/usr/bin/busybox echo "Checking filesystem encryption status..."
>> +
>> +# Check if device is LUKS encrypted
>> +if /usr/sbin/cryptsetup isLuks "${ROOT_DEV}"; then
>> +    /usr/bin/busybox echo "Filesystem is encrypted"
>> +    unlock_encrypted_root
>> +    MOUNT_DEV="${CRYPT_DEV}"
>> +else
>> +    /usr/bin/busybox echo "Filesystem is not encrypted"
>> +
>> +    # Check if encryption is enabled and TPM is available
>> +    if [ $TPM_AVAILABLE -eq 1 ]; then
>> +        # Check for encryption marker (resume interrupted encryption)
>> +        if [ -f "${ENCRYPTION_MARKER}" ]; then
>> +            /usr/bin/busybox echo "Resuming interrupted encryption..."
>> +            if ! encrypt_root_filesystem; then
>> +                /usr/bin/busybox echo "ERROR: Failed to resume encryption"
>> +                /usr/bin/busybox echo "Booting without encryption..."
>> +                MOUNT_DEV="${ROOT_DEV}"
>> +            else
>> +                MOUNT_DEV="${CRYPT_DEV}"
>> +            fi
>> +        else
>> +            # First boot - perform encryption
>> +            if encrypt_root_filesystem; then
>> +                MOUNT_DEV="${CRYPT_DEV}"
>> +            else
>> +                /usr/bin/busybox echo "ERROR: Encryption failed - booting without encryption"
>> +                MOUNT_DEV="${ROOT_DEV}"
>> +            fi
>> +        fi
>> +    else
>> +        /usr/bin/busybox echo "TPM not available - skipping encryption"
>> +        MOUNT_DEV="${ROOT_DEV}"
>> +    fi
>> +fi
>> +
>> +# Unmount boot partition before switching root
>> +/usr/bin/busybox umount "${BOOT_MNT}"
>> +
>> +# Mount root filesystem (encrypted or unencrypted)
>> +/usr/bin/busybox echo "Mounting root filesystem..."
>> +/usr/bin/busybox mkdir -p /newroot
>> +/usr/bin/busybox mount "${MOUNT_DEV}" /newroot || {
>> +    /usr/bin/busybox echo "ERROR: Failed to mount root filesystem!"
>> +    /usr/bin/busybox sh
>> +}
>> +
>> +/usr/bin/busybox echo "Boot complete"
>> +
>> +# Clean up tmpfs
>> +/usr/bin/busybox rm -f "${TPM_PRIMARY_CTX}" "${TPM_KEY_PUB}" "${TPM_KEY_PRIV}" "${TPM_KEY_CTX}"
>> +
>> +# Switch to real root
>> +exec /usr/sbin/switch_root /newroot /sbin/init
> 
> In general I think this effort is misguided. An initrd is not a replacement for
> live image install. We should not be dramatically changing the running system as
> part of the first boot.

100% agree.  This is something that should be done at build time as part 
of the image creation.


>> diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init_1.0.bb b/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init_1.0.bb
>> new file mode 100644
>> index 00000000..7da878f7
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init_1.0.bb
>> @@ -0,0 +1,30 @@
>> +SUMMARY = "TI encrypted boot initramfs init script"
>> +DESCRIPTION = "Custom /init script for encrypted boot with fTPM + LUKS support"
>> +
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>> +
>> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/files:"
>> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>> +
>> +SRC_URI = "file://init"
>> +
>> +S = "${WORKDIR}/sources"
>> +UNPACKDIR = "${WORKDIR}"
>> +
>> +# This recipe must run in the initramfs context
>> +inherit allarch
>> +
>> +do_install() {
>> +    # Install /init script to root of initramfs
>> +    install -m 0755 ${UNPACKDIR}/init ${D}/init
>> +}
>> +
>> +# Package the /init file
>> +FILES:${PN} = "/init"
>> +
>> +# Runtime dependencies
>> +RDEPENDS:${PN} = "busybox cryptsetup tpm2-tools tpm2-tss optee-client e2fsprogs-e2fsck e2fsprogs-resize2fs util-linux-blkid"
>> +
>> +# This package must be included in initramfs
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-encrypted-boot-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-encrypted-boot-initramfs.bb
>> new file mode 100644
>> index 00000000..314499db
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-ti/initramfs/ti-encrypted-boot-initramfs.bb
>> @@ -0,0 +1,50 @@
>> +SUMMARY = "TI encrypted boot initramfs image"
>> +
>> +DESCRIPTION = "Minimal initramfs image with dm-crypt/fTPM support for encrypted root filesystem. \
>> +This initramfs provides LUKS encryption with TPM-sealed keys stored in RPMB."
>> +
>> +LICENSE = "MIT"
>> +
>> +# Only build this when luks-encryption feature is enabled
>> +COMPATIBLE_MACHINE = "null"
>> +COMPATIBLE_MACHINE:k3 = "${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', '.*', 'null', d)}"
>> +
>> +INITRAMFS_FSTYPES = "cpio.gz"
>> +
>> +IMAGE_NAME = "ti-encrypted-boot-initramfs"
>> +
>> +export IMAGE_BASENAME = "${IMAGE_NAME}"
>> +
>> +# Install our custom init script and dependencies
>> +PACKAGE_INSTALL = "\
>> +    initramfs-ti-encrypted-init \
>> +    busybox \
>> +    base-passwd \
>> +    kmod \
>> +    cryptsetup \
>> +    tpm2-tools \
>> +    tpm2-tss \
>> +    libtss2-tcti-device \
>> +    optee-client \
>> +    util-linux-blkid \
>> +    e2fsprogs-e2fsck \
>> +    e2fsprogs-resize2fs \
>> +    kernel-module-tpm-ftpm-tee \
>> +    ${ROOTFS_BOOTSTRAP_INSTALL} \
>> +"
>> +
>> +# Ensure the initramfs only contains the bare minimum
>> +IMAGE_FEATURES = ""
>> +IMAGE_LINGUAS = ""
>> +
>> +# Exclude kernel image from initramfs
>> +PACKAGE_EXCLUDE = "kernel-image-*"
>> +
>> +IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
>> +IMAGE_NAME_SUFFIX ?= ""
>> +IMAGE_ROOTFS_SIZE = "16384"
>> +IMAGE_ROOTFS_EXTRA_SPACE = "0"
>> +
>> +BAD_RECOMMENDATIONS += "busybox-syslog"
>> +
>> +inherit image
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

