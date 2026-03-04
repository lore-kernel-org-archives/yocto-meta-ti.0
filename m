Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8CCEFCE3D
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 19:39:00 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27169.1772653137534472146
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 11:38:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=JQ7Crk/i;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.6, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2erbYN+XGFqsJN2oCoXdQdJ5DohKNxYDB4ob9wW4/NExUnZQncX6/huxMw5xlDAw8gOr+BaNhqe27XSBv1OPV0xcVvci+ukk4dXKPLjWh9qdEufLBZ8t5Frcwj6xBPc2OSoNxe/rSDlTIBQzOlZIjESh72AqKoSY/wtcCU1Uvq2O30DmaDapgWdp2GhcyTuw57Ozc3suvdJuMlpJZW3Dx6iAtsjY0K2AcOqAQt1HkEAbufepVNx5Ku7yigvBIjKXi5WNF9k77Sm73FPLZJKVf8l6Bh8qdiwXak34LDovlgPYkc12D9ihsf7+A8zKuHAe1G/WbvVWIPFlUF5JQh5zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yGmiLxBZFmZ41oyr9qOr6WwTstIqAwjdLBRfbs/y00=;
 b=kBNtRTIDQJq1lHCYqNOqDZHMJRTkpVx5k6aP14kMAnR/X2vR9eUTWVzSb52F4yXuFGA1KpLww9CFsLjSga5D2WzMFdj43UvdkUDQFd3TDgI0jRN5Tc3vFU7p0XHo5Q1FDfZkrF513bumpBxNtXVO8+lR4wr6huQqM4/yATXIZcDuw/vWTCRLRTr5DtkM6cL75DUmZZV0YaO9TkufYppVUV7+glinSApK9BzvMZDZw60J3eT1C3Q67UoLmcse6DqN/hdtX3zxH9ZJPKHUnFkD/Eu9brRy7CO9EnYmzzXeiO37ysFIvB76nKyoqF+1m5Z3CFbPsIeiY2ApQRyy0HLHaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=criticallink.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yGmiLxBZFmZ41oyr9qOr6WwTstIqAwjdLBRfbs/y00=;
 b=JQ7Crk/itoR8qzitzIOO1Fby63dlTJpYVboLOBi+lCsu+ITWMEEJfkfGv1Xv2FkjSxrUdVdNQMPveRIuX0ACjRf6uZ+qjzMaoSWM6fokt7UJsFSceXHSw9Vse0H/4VXsRbAldE0p0IRv4lFbr5ys+UrXnXEc57HGOy3AJAcbbXY=
Received: from BY3PR04CA0017.namprd04.prod.outlook.com (2603:10b6:a03:217::22)
 by BN0PR10MB5094.namprd10.prod.outlook.com (2603:10b6:408:129::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 19:38:55 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::d9) by BY3PR04CA0017.outlook.office365.com
 (2603:10b6:a03:217::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 19:38:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Wed, 4 Mar 2026 19:38:53 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 13:38:52 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 13:38:51 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 13:38:51 -0600
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 624JcaZL956747;
	Wed, 4 Mar 2026 13:38:49 -0600
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v3 2/3] initramfs: Add LUKS encryption module with fTPM
Date: Thu, 5 Mar 2026 01:08:23 +0530
Message-ID: <20260304193824.2495898-3-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304193824.2495898-1-s-tripathi1@ti.com>
References: <20260304193824.2495898-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|BN0PR10MB5094:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e01f931-1288-4231-dc28-08de7a25ab16
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|34020700016|1800799024|82310400026|7142099003;
X-Microsoft-Antispam-Message-Info: 
	a7x8gLsFiQoS96201hfPcsE8yNJ42OrmnNWH1G9/qxzVPDyiy3+m9MsU3Dvv6UxRQResDu+g1dhXJ/imxazLAoiQvJYdpoX53yHydyxREbr5EtjWvj5OHUr3yo7QAliLOyR+sNDtszsi7E2osFbl3NNyBYxlV/Asvbq8iT3pHwkk4iYgQIp/qq6MZ0Udeys5NL3fXvKtpdZalrKjxUNdsUhKPfUsUHuDE1vXnYm+V4jO+9A1zGcaJOMrQrG+1lNpti+vT0wpBgtMrlByCPE5/Sp4k8qriERkx2X9lj8Tex2caxAgn8fEFMotQKgcGXnx2EIkn01QWxTt9QlRLdOlTynrXAFgoNj2yYEkPhkEkxstQhnM8WdqF6+L+sDViihTk5XwdChe1bn/qKU6vy6Bn8R6OoZr2Ejc7GDoBlG8dGB58tppq0iU0kE/yqoeFbY1DHvHcMaUHY91olhhvpu/+lJAVHIVt6eA5QxSGLXr70lfVXrt7ETuRPdEG/EYL1DYmyjdZ63icpeUWPrUuw+8V2wjgW1a72uocANAY+PHV1bbsC06ViDbcuKfjXnR1E8Rporh9D9qaTakPaJrj8OmR/1F6GbN6JquxnAdFVlyByL/Rk3u+ZmkfIZ5D25KJyVdkGFFmL8wzMpYXmSra/tUVFgwZqFOsBb210fOeIgMfp+bphRKpLoVsNkrhoG2bRng95RNloGN3bon1eYXEm1Yjq4Rt3R2rAWY44bfsF4REA3dsj0LYHb6HNUiIs9OETbYb+VwQDwEKNtnpjczFL1h/Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(34020700016)(1800799024)(82310400026)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sG6JOZGSC5pAlJKQwOE6ZIF7d5AGGjHFfDW6zkNP0hEZjrghebNkyqODOzxPIq1jTwImEcs2rJZV9AeZUlbaFgEsEds04AfHiD8ZNzrMKhrg3Ewa/SSEJxVCTzKKiodLVyYmz7nnbjhWxnRDhgetaut756XC4Da97Jav23hie93BIY6AeweImIxqFZPJGwsaPfVDUL6h/WRdMOktwC0F4oWtyI27izlUR/zzQoIsOtk7jTGwyvnFfBv7Wf8GLTST65ajh7eDIcnquJ8WNvTgqiLOaX4ZwivySTNHYSAU6N3kFKAQSmzuZ87lxaxNMUl1dYjBlYLEKnwIh7GEnYporwJSvztWWC+jxlWI48D0tGrFL/N2zMMwSKK9nahbNyjHy9ZlGgqS+2N4/qcjDjRWBMDp+ol6jcDlki4u8BJQazjkReb0uwIPdPU/3uGr/sO0
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:38:53.4691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e01f931-1288-4231-dc28-08de7a25ab16
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5094
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Mar 2026 19:39:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19643

Add initramfs-module-luks-ftpm providing LUKS2 full disk encryption
with TPM-sealed keys for TI K3 platforms. Keys are sealed by firmware
TPM (fTPM) running in OP-TEE and stored in eMMC RPMB.

Features:
- First-boot in-place encryption with tpm2_getrandom key generation
- TPM-sealed key storage via persistent handle 0x81080001
- Automatic unlock on subsequent boots
- Space verification ensuring 32MB available for LUKS header

Update packagegroup-ti-core-initramfs to conditionally include the
module when MACHINE_FEATURES contains 'luks-encryption'.

Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
---
 .../initramfs-module-luks-ftpm/luksftpm       | 341 ++++++++++++++++++
 .../initramfs-module-luks-ftpm_1.0.bb         |  41 +++
 .../packagegroup-ti-core-initramfs.bb         |   1 +
 3 files changed, 383 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-=
ftpm/luksftpm
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-=
ftpm_1.0.bb

diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm/lu=
ksftpm b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm/luksft=
pm
new file mode 100644
index 00000000..5e3aedc4
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm/luksftpm
@@ -0,0 +1,341 @@
+#!/bin/sh
+# initramfs-framework module for LUKS encryption with fTPM support
+
+# Configuration
+BOOT_DEV=3D"/dev/mmcblk1p1"           # Boot partition (FAT, unencrypted)
+ROOT_DEV=3D"/dev/mmcblk1p2"           # Root partition (will be encrypted)
+CRYPT_NAME=3D"root_crypt"
+CRYPT_DEV=3D"/dev/mapper/${CRYPT_NAME}"
+BOOT_MNT=3D"/boot_part"
+TPM_PRIMARY_CTX=3D"/tmp/tpm_primary.ctx"
+TPM_KEY_PRIV=3D"/tmp/tpm_key.priv"
+TPM_KEY_PUB=3D"/tmp/tpm_key.pub"
+TPM_KEY_CTX=3D"/tmp/tpm_key.ctx"
+TPM2_HANDLE=3D"0x81080001"            # TPM persistent handle for LUKS key
+ENCRYPTION_MARKER=3D"${BOOT_MNT}/.encryption_in_progress"
+
+# Wait for MMC device to appear
+wait_for_device() {
+    local device=3D"$1"
+    local timeout=3D"${2:-10}"
+
+    msg "Waiting for storage device ${device}..."
+    for i in $(seq 1 ${timeout}); do
+        if [ -b "${device}" ]; then
+            return 0
+        fi
+        sleep 1
+    done
+    return 1
+}
+
+# Initialize fTPM and check availability
+init_ftpm() {
+    msg "Initializing secure hardware (fTPM)..."
+
+    # Start TEE supplicant (required for fTPM TA to work)
+    if [ -x /usr/sbin/tee-supplicant ]; then
+        /usr/sbin/tee-supplicant -d &
+        TEE_SUPPLICANT_PID=3D$!
+        sleep 5
+    else
+        info "Warning: Trusted execution environment not available"
+        return 1
+    fi
+
+    # Load fTPM kernel module
+    if ! /sbin/modprobe tpm_ftpm_tee; then
+        info "Warning: TPM module failed to load"
+        return 1
+    fi
+
+    # Wait for TPM device
+    for i in $(seq 1 10); do
+        if [ -c /dev/tpmrm0 ]; then
+            export TPM2TOOLS_TCTI=3D"device:/dev/tpmrm0"
+            return 0
+        fi
+        sleep 1
+    done
+
+    info "Warning: fTPM not available - encryption will be skipped"
+    return 1
+}
+
+# Generate 32-byte random key using TPM RNG
+generate_random_key() {
+    /usr/bin/tpm2_getrandom --hex 32
+}
+
+# Seal data with TPM and store in persistent handle
+tpm_seal_key() {
+    local KEY_DATA=3D"$1"
+
+    # Create primary key in owner hierarchy
+    /usr/bin/tpm2_createprimary -C o -c "${TPM_PRIMARY_CTX}" -Q || return =
1
+
+    # Create sealed object
+    echo -n "${KEY_DATA}" | \
+        /usr/bin/tpm2_create -C "${TPM_PRIMARY_CTX}" \
+        -u "${TPM_KEY_PUB}" -r "${TPM_KEY_PRIV}" \
+        -i- -Q || return 1
+
+    # Load sealed object into TPM
+    /usr/bin/tpm2_load -C "${TPM_PRIMARY_CTX}" \
+        -u "${TPM_KEY_PUB}" -r "${TPM_KEY_PRIV}" \
+        -c "${TPM_KEY_CTX}" -Q || return 1
+
+    # Make key persistent at handle (stored in TPM NV RAM - RPMB)
+    /usr/bin/tpm2_evictcontrol -C o -c "${TPM_KEY_CTX}" "${TPM2_HANDLE}" |=
| return 1
+
+    return 0
+}
+
+# Unseal data from TPM persistent handle
+tpm_unseal_key() {
+    # Check if persistent handle exists
+    if ! /usr/bin/tpm2_getcap handles-persistent | grep -q "${TPM2_HANDLE}=
"; then
+        debug "ERROR: TPM persistent handle not found"
+        return 1
+    fi
+
+    # Unseal key directly from persistent handle
+    /usr/bin/tpm2_unseal -c "${TPM2_HANDLE}" || return 1
+
+    return 0
+}
+
+# Perform in-place LUKS encryption (first boot)
+encrypt_root_filesystem() {
+    msg "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
+    msg "First boot: Encrypting root filesystem"
+    msg "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
+
+    # Set marker to track encryption progress
+    touch "${ENCRYPTION_MARKER}"
+    sync
+
+    # Generate random encryption key using TPM RNG
+    msg "Generating encryption key..."
+    LUKS_KEY=3D$(generate_random_key)
+
+    if [ -z "${LUKS_KEY}" ]; then
+        msg "ERROR: Failed to generate encryption key"
+        rm -f "${ENCRYPTION_MARKER}"
+        return 1
+    fi
+
+    # Seal key with TPM before encryption starts
+    msg "Securing key with TPM..."
+    if ! tpm_seal_key "${LUKS_KEY}"; then
+        msg "ERROR: Failed to secure key"
+        rm -f "${ENCRYPTION_MARKER}"
+        return 1
+    fi
+
+    # Filesystem check before encryption
+    msg "Checking filesystem integrity..."
+    /usr/sbin/e2fsck -f -y "${ROOT_DEV}"
+    E2FSCK_RET=3D$?
+    if [ ${E2FSCK_RET} -ge 4 ]; then
+        msg "ERROR: Filesystem check failed"
+        rm -f "${ENCRYPTION_MARKER}"
+        return 1
+    fi
+
+    # Shrink filesystem before encryption to leave room for LUKS header
+    msg "Preparing filesystem for encryption..."
+    /usr/sbin/resize2fs -M "${ROOT_DEV}" || {
+        msg "ERROR: Failed to prepare filesystem"
+        rm -f "${ENCRYPTION_MARKER}"
+        return 1
+    }
+
+    # Verify partition has sufficient space for LUKS header
+    msg "Verifying space for encryption..."
+    MIN_BLOCKS=3D$(/usr/sbin/resize2fs -P "${ROOT_DEV}" 2>&1 | awk '/[Mm]i=
nimum.*:/ {print $NF}')
+
+    # Get filesystem block size and device size
+    BLOCK_SIZE=3D$(/usr/sbin/tune2fs -l "${ROOT_DEV}" 2>/dev/null | awk '/=
^Block size:/ {print $NF}')
+    DEV_NAME=3D$(basename "${ROOT_DEV}")
+    PART_SECTORS=3D$(cat /sys/class/block/"${DEV_NAME}"/size 2>/dev/null)
+
+    if [ -z "${MIN_BLOCKS}" ] || [ -z "${BLOCK_SIZE}" ] || [ -z "${PART_SE=
CTORS}" ]; then
+        msg "ERROR: Unable to determine partition geometry"
+        rm -f "${ENCRYPTION_MARKER}"
+        return 1
+    fi
+
+    # Convert filesystem blocks to 512-byte sectors
+    MIN_SECTORS=3D$((MIN_BLOCKS * BLOCK_SIZE / 512))
+    LUKS_SECTORS=3D65536  # 32MB in 512-byte sectors
+
+    if [ $((PART_SECTORS - MIN_SECTORS)) -lt ${LUKS_SECTORS} ]; then
+        msg "ERROR: Insufficient space for LUKS header (need 32MB free)"
+        rm -f "${ENCRYPTION_MARKER}"
+        return 1
+    fi
+
+    # Perform in-place encryption
+    msg "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
+    msg "Encrypting filesystem..."
+    msg "This will take several minutes."
+    msg "DO NOT POWER OFF THE DEVICE!"
+    msg "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
+
+    echo -n "${LUKS_KEY}" | \
+        /usr/sbin/cryptsetup reencrypt --encrypt \
+        --type luks2 \
+        --cipher aes-xts-plain64 \
+        --key-size 256 \
+        --hash sha256 \
+        --reduce-device-size 32M \
+        --key-file - \
+        "${ROOT_DEV}" || {
+        msg "ERROR: Encryption failed"
+        rm -f "${ENCRYPTION_MARKER}"
+        return 1
+    }
+
+    msg "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
+    msg "Encryption completed successfully!"
+    msg "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
+
+    # Remove encryption marker
+    rm -f "${ENCRYPTION_MARKER}"
+    sync
+
+    # Unlock the newly encrypted device
+    msg "Activating encrypted filesystem..."
+    echo -n "${LUKS_KEY}" | \
+        /usr/sbin/cryptsetup luksOpen "${ROOT_DEV}" "${CRYPT_NAME}" --key-=
file - || {
+        msg "ERROR: Failed to activate encrypted filesystem"
+        return 1
+    }
+
+    # Resize filesystem to fit the encrypted device
+    msg "Optimizing filesystem..."
+    /usr/sbin/resize2fs -f "${CRYPT_DEV}" || {
+        msg "ERROR: Failed to optimize filesystem"
+        return 1
+    }
+
+    # Verify filesystem after resize
+    /usr/sbin/e2fsck -f -y "${CRYPT_DEV}" || {
+        info "WARNING: Filesystem verification had issues, but continuing"
+    }
+
+    return 0
+}
+
+# Unlock encrypted root filesystem (subsequent boots)
+unlock_encrypted_root() {
+    msg "Unlocking encrypted filesystem..."
+
+    # Unseal key from TPM persistent handle
+    LUKS_KEY=3D$(tpm_unseal_key)
+
+    if [ -z "${LUKS_KEY}" ]; then
+        msg "ERROR: Failed to retrieve encryption key from TPM"
+        msg "Attempting passphrase fallback..."
+
+        # Try to unlock with passphrase (interactive)
+        /usr/sbin/cryptsetup luksOpen "${ROOT_DEV}" "${CRYPT_NAME}" || {
+            fatal "ERROR: Failed to unlock encrypted filesystem"
+        }
+    else
+        # Unlock with unsealed key
+        echo -n "${LUKS_KEY}" | \
+            /usr/sbin/cryptsetup luksOpen "${ROOT_DEV}" "${CRYPT_NAME}" --=
key-file - || {
+            fatal "ERROR: Failed to unlock with TPM key"
+        }
+    fi
+
+    msg "Encrypted filesystem unlocked"
+}
+
+# Module enabled check
+luksftpm_enabled() {
+    # Always run this module - it handles both encrypted and unencrypted c=
ases
+    return 0
+}
+
+# Module main function
+luksftpm_run() {
+    # Wait for storage device
+    if ! wait_for_device "${ROOT_DEV}" 10; then
+        info "Storage device not found, skipping encryption module"
+        return 0
+    fi
+
+    # Mount boot partition
+    msg "Mounting boot partition..."
+    mkdir -p "${BOOT_MNT}"
+    if ! mount "${BOOT_DEV}" "${BOOT_MNT}"; then
+        info "ERROR: Failed to mount boot partition, attempting standard b=
oot..."
+        mkdir -p ${ROOTFS_DIR}
+        mount "${ROOT_DEV}" ${ROOTFS_DIR}
+        return 0
+    fi
+
+    # Initialize fTPM
+    TPM_AVAILABLE=3D0
+    if init_ftpm; then
+        TPM_AVAILABLE=3D1
+    fi
+
+    # Check filesystem encryption status
+    msg "Checking filesystem encryption status..."
+
+    MOUNT_DEV=3D"${ROOT_DEV}"
+
+    if /usr/sbin/cryptsetup isLuks "${ROOT_DEV}"; then
+        msg "Filesystem is encrypted"
+        unlock_encrypted_root
+        MOUNT_DEV=3D"${CRYPT_DEV}"
+    else
+        msg "Filesystem is not encrypted"
+
+        # Check if encryption is enabled and TPM is available
+        if [ $TPM_AVAILABLE -eq 1 ]; then
+            # Check for encryption marker (resume interrupted encryption)
+            if [ -f "${ENCRYPTION_MARKER}" ]; then
+                msg "Resuming interrupted encryption..."
+                if ! encrypt_root_filesystem; then
+                    msg "ERROR: Failed to resume encryption"
+                    msg "Booting without encryption..."
+                    MOUNT_DEV=3D"${ROOT_DEV}"
+                else
+                    MOUNT_DEV=3D"${CRYPT_DEV}"
+                fi
+            else
+                # First boot - perform encryption
+                if encrypt_root_filesystem; then
+                    MOUNT_DEV=3D"${CRYPT_DEV}"
+                else
+                    msg "ERROR: Encryption failed - booting without encryp=
tion"
+                    MOUNT_DEV=3D"${ROOT_DEV}"
+                fi
+            fi
+        else
+            msg "TPM not available - skipping encryption"
+            MOUNT_DEV=3D"${ROOT_DEV}"
+        fi
+    fi
+
+    # Unmount boot partition before switching root
+    umount "${BOOT_MNT}"
+
+    # Mount root filesystem to $ROOTFS_DIR (framework expects this)
+    msg "Mounting root filesystem..."
+    mkdir -p ${ROOTFS_DIR}
+    mount "${MOUNT_DEV}" ${ROOTFS_DIR} || {
+        fatal "ERROR: Failed to mount root filesystem!"
+    }
+
+    # Clean up tmpfs and sensitive variables
+    rm -f "${TPM_PRIMARY_CTX}" "${TPM_KEY_PUB}" "${TPM_KEY_PRIV}" "${TPM_K=
EY_CTX}"
+    unset LUKS_KEY TPM_AVAILABLE MOUNT_DEV TEE_SUPPLICANT_PID
+
+    msg "Boot complete"
+}
diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm_1.=
0.bb b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm_1.0.bb
new file mode 100644
index 00000000..c0a07bde
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-ftpm_1.0.bb
@@ -0,0 +1,41 @@
+SUMMARY =3D "initramfs support for LUKS encryption with fTPM"
+DESCRIPTION =3D "Provides LUKS2 full disk encryption using firmware TPM (f=
TPM) for key management on TI K3 platforms"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
+
+# Only build this when luks-encryption feature is enabled
+COMPATIBLE_MACHINE =3D "null"
+COMPATIBLE_MACHINE:k3 =3D "${@bb.utils.contains('MACHINE_FEATURES', 'luks-=
encryption', '.*', 'null', d)}"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+
+SRC_URI =3D "file://luksftpm"
+
+do_install() {
+    install -d ${D}/init.d
+    # Install as 85-luksftpm (runs after udev at 01, before rootfs at 90)
+    install -m 0755 ${UNPACKDIR}/luksftpm ${D}/init.d/85-luksftpm
+}
+
+FILES:${PN} =3D "/init.d/85-luksftpm"
+
+# Runtime dependencies
+RDEPENDS:${PN} =3D "\
+    initramfs-framework-base \
+    busybox \
+    kmod \
+    cryptsetup \
+    tpm2-tools \
+    tpm2-tss \
+    libtss2-tcti-device \
+    optee-client \
+    optee-ftpm \
+    e2fsprogs-e2fsck \
+    e2fsprogs-resize2fs \
+    e2fsprogs-tune2fs \
+    util-linux-blkid \
+    kernel-module-tpm-ftpm-tee \
+"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramf=
s.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
index a9eff847..9d8f0a47 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -22,4 +22,5 @@ RDEPENDS:${PN} +=3D "\
     initramfs-module-udev \
     initramfs-module-nfsrootfs \
     nfs-utils-mount \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', 'initramfs=
-module-luks-ftpm', '', d)} \
 "
--=20
2.34.1


