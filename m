Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA359108E1E3
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:36:46 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8073.1773916604579803329
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 03:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Zq2mgFmh;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.27, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wl1cl1lljjOnGNLY7TFK4IWr8Q5bN9OGQ0CLvUHZeZ8tQK98nApgg3PRG8BQ/5caxGfXpvDhm8WrBmw26qo2PsG6d5mukEI+X6uzm2QrLogvowefvGw2jx1aV/sz6W520DSqNp8MiUuGW4sskQNBJS0/S8vB5Jv3+oF6BezZxJbMLE7DUvHvyXmn6VS9AHp8XUg279UG0wz+QDxzPNAX7q8oi6Oy0BaBtHaLkIpYvNpefCL3YCcW8Tuv9MtRAm0mgYQf0c8AxyrgCfEf1HQa0LKuf2735FcbB+gVxTwyxhqykwRQfTpiJPZfhrTFXFO505mPQjfTznFYWC9Kz3PRUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eROquVKAnXpq37aqahgxFpV79DGr8tHtppcKfF5WxLo=;
 b=qceA54bOt8TecGWkO1uO5kieG4cwu+6dbLV0cBSaukh+HlrCCsmyjyGX1BL7CxD9WRT/S4uMHXSrHYW0qLkNga0TugY/wU0aH7kqYjz93uFkTKIy8vG6bXlu9uHdUb7UOT4GawlogVilhvNbFUqwQG8G+1bDuHdrX3JreQwDiMO0Nd3derad72KlxeMSGbV2TGnVYhiZ8Huw3UIzecplcwM6G076xl6T0oQV9L+bFCwyk5ozzFQzqMuhHJ2r5NTwhD2o8degAN8o/JBjaLlUMU5VhHO6RBi9/oqJPEMf0OXpEeF5nggcw/w129wDc2vdUlaXBvGdQC9JWP55vK9fYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eROquVKAnXpq37aqahgxFpV79DGr8tHtppcKfF5WxLo=;
 b=Zq2mgFmhnVS3iDfsaNDY4Dmc/gupHbdmrhF2zvmWDvn6wiPiaTQEX9lVGt9BVOM8Zq4O+Jp/1+wmpe1AaezfWZS42WEpwPztyGryklyRh9OSue+ezS5Ysp3WZspcZ9jUWJeNr8xuCTcV80K4FkFan4RwW2Eso+mJje4nL1JNtrA=
Received: from PH7P220CA0037.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::18)
 by LV8PR10MB7823.namprd10.prod.outlook.com (2603:10b6:408:1ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 10:36:41 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:510:32b:cafe::8a) by PH7P220CA0037.outlook.office365.com
 (2603:10b6:510:32b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Thu,
 19 Mar 2026 10:36:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 10:36:40 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 05:36:38 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 05:36:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 05:36:37 -0500
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JAaKos1950755;
	Thu, 19 Mar 2026 05:36:34 -0500
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>, <afd@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v7 2/3] initramfs-module-luks-ftpm: Add fTPM support
Date: Thu, 19 Mar 2026 16:05:32 +0530
Message-ID: <20260319103533.2431033-3-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319103533.2431033-1-s-tripathi1@ti.com>
References: <20260319103533.2431033-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|LV8PR10MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: 96c76511-2f52-4726-4915-08de85a367f9
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ZZstAO1tO8+Y+JR7eHT6aP9sSC4sX1iUw2uzYcWUzl01Nwgy0Ug2RrbenUDnXqljil3iDjrUeugOIamF004WpWej9sCRCFfjJ2fRI70IJSm2kB5am6CliJwuLbOYGyH8dCLMi4xIVPd7qwSzVGcjWnOXnycdpuCu0cuV3JMAbRD42HccvhjblzFP4NW/S9ee123n8ibubp5C6cqD4Q3zF/in4//kp1Dk51Ix9O7jNCfy87tmXCLxQmMLk2RBF4CYCS2pbtXmCZCjKqswjzmFUapmAJaBMBtsf4C6UXVxjzZKubdsA7WNPTtteulsdw84l27JQ0nIuIKZtFZUIrT64pPPjcpSD+8D3EgNnUKh3+CcziaU2U3jFs+l60Zd6v1Fs8DJHNmDKUL+01yZ7xHcn1q93Gjv3bH7K7vCSBOIjnlYylcxIP3t0X4ScfJ16NZR82OUNOge8Q8RWrxITDr2sGYqS02YFcerJlx7KceWfmVMd/AHac9aWrIGtz82FgHzxtWqbeBJG83aBI8NLfkx2WQq8nKA9n7O3/V0mlsUV3DHlfovFSvVXScZVMzTneV0KXQUXvm2kMF81C290f4D3JzBHwGgEGr2h3ZLDKlRxShP7OeQDKR2cmTzw3NnMOmeNw+Sf4JXBwb+WwiFH79J1Jv5Fn3lyRfdfiCUxL/pHVwT+fQ3Hvvad+CAhXuOSHGGKUlXD8vqbDKd8enN/vidH0YCo8CKUSYLa2IUI22rifZTSpI2Xh5BakOo0AGTZ1dXniUXGBsw0gPG/K5vHUWeHg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Dk2dbub/ztJCwHn+/SrgnOrBs1o9OHR03KM8fHXgmgEqRUNWRKm24s/OWZKW8/nBmxC64uASi+na7j4nNpHHEGYGFzKI2nvBXyXodEvRnG50ZI2SGVHsm9DSmzwopeW7g/QFG82BBu30U+KMp5fpy3SMK9rm0IrTpLpVXdRdY3JNX0B+B3UWY99AlqbvBomcUVAciiDovyRkKwgFFncWq37BnKz0EeuMRlqGOsuwM2OYAFJELkfCj3Sll5xN2VFjhbshAiDUDDvNxZt/AbNWDdVw67RUJ0J2cw0zskoGAQYfqL3DUGa/VkhZxbloynyFiFvWTA4bl/eFqdGNH0p6An2tsLXgB4DaxCmNdWez/nHUi3Dv8vHlEyiXHHt6fD7oSSk1TflUvB/Ob92vgEZYeTMg3+hgWGeZXxUL6LkONR1bqk2TELdFV/bgNEkyHYsa
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 10:36:40.2820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c76511-2f52-4726-4915-08de85a367f9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7823
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 10:36:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19775

Add initramfs module to dynamic-layers/security providing LUKS2 full
disk encryption with TPM-sealed keys for TI K3 platforms. Keys are
sealed by firmware TPM (fTPM) running in OP-TEE and stored in eMMC
RPMB.

Features:
- First-boot in-place encryption with tpm2_getrandom key generation
- TPM-sealed key storage via persistent handle 0x81080001
- Automatic unlock on subsequent boots
- Space verification ensuring 32MB available for LUKS header

The module is built only when meta-security layer is present and gets
included in initramfs only when DISTRO_FEATURES=3D'luks' and
MACHINE_FEATURES=3D'optee-ftpm'

Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
---
 .../initramfs-module-luks-ftpm/luksftpm       | 341 ++++++++++++++++++
 .../initramfs-module-luks-ftpm_1.0.bb         |  41 +++
 .../packagegroup-ti-core-initramfs.bbappend   |   3 +
 3 files changed, 385 insertions(+)
 create mode 100644 meta-ti-bsp/dynamic-layers/security/recipes-ti/initramf=
s/initramfs-module-luks-ftpm/luksftpm
 create mode 100644 meta-ti-bsp/dynamic-layers/security/recipes-ti/initramf=
s/initramfs-module-luks-ftpm_1.0.bb
 create mode 100644 meta-ti-bsp/dynamic-layers/security/recipes-ti/initramf=
s/packagegroup-ti-core-initramfs.bbappend

diff --git a/meta-ti-bsp/dynamic-layers/security/recipes-ti/initramfs/initr=
amfs-module-luks-ftpm/luksftpm b/meta-ti-bsp/dynamic-layers/security/recipe=
s-ti/initramfs/initramfs-module-luks-ftpm/luksftpm
new file mode 100644
index 00000000..5e3aedc4
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security/recipes-ti/initramfs/initramfs-mo=
dule-luks-ftpm/luksftpm
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
diff --git a/meta-ti-bsp/dynamic-layers/security/recipes-ti/initramfs/initr=
amfs-module-luks-ftpm_1.0.bb b/meta-ti-bsp/dynamic-layers/security/recipes-=
ti/initramfs/initramfs-module-luks-ftpm_1.0.bb
new file mode 100644
index 00000000..595ce1f1
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security/recipes-ti/initramfs/initramfs-mo=
dule-luks-ftpm_1.0.bb
@@ -0,0 +1,41 @@
+SUMMARY =3D "initramfs support for LUKS encryption with fTPM"
+DESCRIPTION =3D "Provides LUKS2 full disk encryption using firmware TPM (f=
TPM) for key management on TI K3 platforms"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
+
+# Only build for platforms with optee-ftpm support
+COMPATIBLE_MACHINE =3D "null"
+COMPATIBLE_MACHINE:k3 =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-ftpm', '.*', 'null', d)}"
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
diff --git a/meta-ti-bsp/dynamic-layers/security/recipes-ti/initramfs/packa=
gegroup-ti-core-initramfs.bbappend b/meta-ti-bsp/dynamic-layers/security/re=
cipes-ti/initramfs/packagegroup-ti-core-initramfs.bbappend
new file mode 100644
index 00000000..52c82389
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security/recipes-ti/initramfs/packagegroup=
-ti-core-initramfs.bbappend
@@ -0,0 +1,3 @@
+LUKS_ENCRYPTION ?=3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm=
', 'initramfs-module-luks-ftpm', '', d)}"
+
+RDEPENDS:${PN}:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'luks'=
, '${LUKS_ENCRYPTION}', '', d)}"
--=20
2.34.1


