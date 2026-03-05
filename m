Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9F1F3D33E
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 17:23:04 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49678.1772731374149086421
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 09:22:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=wDc+MVdg;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.57.34, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FL0yz2DtzR+X6o5nh9vcNuoxpbNXGK1rastFLFMjr7ewSGKXOkRiTOIU+XQ4r6uflgeR9VwOi5SvTsMeidZ8Mq52ef5Ze113T9ALxUS2RDb/fi+qe6OGWVqt9MdoqWITapfKhGYrh6XiqhmA0UamNJYGDkbNnMBz0pWTqNAaNkSs/mVa+Cbj1l86liB+t85drQdwxVTuo5EOKaGO/BsVmZzDcIIafwzMzDPcm078dKhGJZozsvys6hX09gZzQJipjSXtQHTrMZ/OCC572dhW5G383NY6yqyz4NcDaZfgjzKFtIotR/uMzpkposkeD6ME5l1jq4f7yAAF7PFGOGKklA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yGmiLxBZFmZ41oyr9qOr6WwTstIqAwjdLBRfbs/y00=;
 b=RCbcnu8igDwj2Kd1sBW0aUARTZ1nwl51fLa2SPo9bRSCmFcMiGY0oHLMaWaHeynQ8OFfc87tFSVPssIOwmz1FuUIGA2P/vSx1jCHFuKGGez4uFblYw97vohzyCBnCjl4DxQ9wA9TqhiX9A0wFz7gqgxjRsSvE+Te+1LJpuGqr/0gWR1yHNq87mJYog8QFX3IIKK12oGU4RbEju22MMk1Lm7pNshCjCNGfMjPKTrtV9bo1FqASfXH/dErTvUDkE0XViSOiC9Qn62V8SiQTAMrPTsgfOmdXg9C3SNH1um83FpK1ThyhnipuVUXHB+1plAqIsGpshn/WSBIo1/PS6g2PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yGmiLxBZFmZ41oyr9qOr6WwTstIqAwjdLBRfbs/y00=;
 b=wDc+MVdgisJZhDKuu0XDZePkbH9YuTLCMVHpu/JhGkGUYlLpygTpQzV4ZUK9+PkzbeMcg9XLZqq/lcvvf9Tff2y6dBJbxnfXVkRs4OGMa9o2I1xQl5mgwGi/E9TvDVgYUk6TooggYlBFt2CZfloAhMOku3PWDi3RdPlWV40pWwc=
Received: from MN2PR06CA0022.namprd06.prod.outlook.com (2603:10b6:208:23d::27)
 by SA3PR10MB6971.namprd10.prod.outlook.com (2603:10b6:806:311::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 17:22:51 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::d7) by MN2PR06CA0022.outlook.office365.com
 (2603:10b6:208:23d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 17:22:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 17:22:50 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:22:14 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:22:14 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 11:22:14 -0600
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625HMAFJ2251582;
	Thu, 5 Mar 2026 11:22:11 -0600
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v4 2/3] initramfs: Add LUKS encryption module with fTPM
Date: Thu, 5 Mar 2026 22:52:06 +0530
Message-ID: <20260305172206.3684409-1-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|SA3PR10MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: 39bbdeed-bf2d-4174-dc00-08de7adbd413
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|82310400026|36860700016|376014|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 
	8T8ex4Lr34sanoidByDdBWAhe+MDeWrg0yWkFioXMYRYp42Ai/QwozdNz9gKbChF6fg+aN0zmTLVJxXf7Nrf6VuyrVap2yP/oLcc+lM50uWOhwXtH5c8E7zA2NcscIAoroR7NR7iKVjmm7OUyHXSi/u5HPOiny6qnHuwZ9FfL/f2tjyoUGA71GTiMm7l7btVZuXvBbwWIrzX3YV+nZt5/iREMhyutDknR3M4ZfjkhEzew+U8Bg7hVj+gh40cn+51ew6FyhM32fLyiz3d4Cnao1ePmiZCKcpsumzPkId10geFaOzz7kGKPDp194Nai3F+dH5Mavgt1/AXyTxRFikYswdJ0mGI7MQTKlgBbEi/f4uAea3H6+ClsKwrbyXbzJFKJKpCpqLr1TKuL3/IMczMa07qhluVfdXKxEb3TRdOeYprEopza2QdEVX3k7clOlKYfuieSDAqYT4n8/CsKJa7OCJofAFvr1egdee5mVKY8RNwrOroDswUfsjMS29k53IbQ54Jo3wYODbJKOaLw0CJtlccJxQRVc+49LHaQ1hCglGo+CvGL+Ullc3lc9smRZfbNtadPzRUky/mXM6kLmpb39R8pAwsfhOWvBOnF1z7c0/N1eFL7wme7LnwCFcSIFhxpDGUmNGSd7lRpMVN3Xwd38w8VWNi1NfHPVK2C2e98E9g1F5LurYWrv1u/OYNFPGYGQreQkImjN9TFJIZEgaR2G11T2kxwjRw+Q63Fpe/39K8wZeiQMJRnkxn6O6Ob4LbUSEQmrWfj6x4sVGZTyh4yg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(36860700016)(376014)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8fY4WTo1WgbW8mBexXfLCrcj/yEowR8Vzb8OlVufocfYkSGdtT+hfuy0A7Yh6fxAreUClahKHYItZCDoRVfP0V4IkJyckpc6StRxPMnwNk5kHTt66N6KBROZqQhMN2Kdy8OBXbDHgE9QI0Uz6KPB/PtkiiZuIT4qNlOVUjqKyl92GGDonlzLa2Q+zo5pvy1knPDM0vSsB7eBzluz90WYuA7GznnFB7s/t8CL614xsBT3Yu+joJrXAA1KZUiRwLd+EHUi0mhpn5MOy4OSz92MdbSJ/0C+slZS0FmK273kJxU5VP83SUWNuCiRGrcBdBwJ2986b4I37l4bVPbVIqXpAAeXBOnoNVqaAmo0PV6ushXBZ/ZOQNUK/zmDAzIiSKgTlkdk75ATNkOyAylceOk5PmkX7SyhrvzxcPpjDevXDlixBNo1+NFcbPzBjpKMdGmh
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 17:22:50.6501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39bbdeed-bf2d-4174-dc00-08de7adbd413
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6971
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Mar 2026 17:23:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19656

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


