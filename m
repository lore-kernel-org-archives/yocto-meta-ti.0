Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7963106F30A
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 08:58:00 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43785.1774515472208615063
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 01:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=qI4E5r1b;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.67, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gi+dP2cLyOTs3erca9MWFgaIy8IlZ1HtKhd8kx3zCBS61hLifczqijI6za/IhMJeBOAnROLgUefk49H6MtL+FqNWzBWPRemQwiciPo9Rqrn5ByO5S3/XlEkew88Tw0lAX2IAB85FM9jmjLIdtNd0k6jIlCPY2KzbWHSHxfBWyrWHfbRYZJ1o1P3T7sel3mBSCQm4XPH3epB0oQuGpwn3T3Mp/+Mi4MJRlTu3hkAtomhu8j0bDBMEyWnR+GDiPMb7GS1ZHTEkJrhAF7hzGlCyXUovxmTVqPSEUMUfA0Rntj/qNDrgTvp3/VTZzqEURXTTGWrM2ybvGVIwaqbYRSKO7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXxDrbfrcGMAOS3HJpwax1mytl017kMKlb0ndlB6MzA=;
 b=letZ4MNW7MrqOpuRD/5NkV2ts1Q7NDnJntYQIOW9pt349sR7VBGB04aZnqEJs4c/7drTPFQWzXw8M/AZ2WAAlBWCKy6i40/IiAOyppkjsqelnicwwkBeZ6PM7Za345kcc0Q8K0EeB/BlPrA2zwkJ4iRfYqamzhIhu3mzRIqXdqDEFtYaptDrHM8C9mx+kN/jR8NaUUg9Vce76s0f8IlXC7A4XCUOfY06t3efumba/8en43a3zCPZtoHGhZglyREgwGWxTtyyEdqzF1zLWoi6livqae8id8UgPDig+KEav+OAfg1chWCbo++WpiNGeDy1+opNjkdx6XGiTwQKlCb/Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXxDrbfrcGMAOS3HJpwax1mytl017kMKlb0ndlB6MzA=;
 b=qI4E5r1bZzQPMOH0rRF0x4FbtANVEusCR2R0snJStiYeT8V5Vp0AWS2eKS0YRAz23nVITCD+VRvcVJoag6Wf4CNk6wQ3Tmju2HheO7hylX/SN337YMfR7DX+gBJjuVaLKwD90P0CoqMP4+xvFHfBC5Pwkn4EwibL9crlNxyzOeA=
Received: from MN2PR06CA0012.namprd06.prod.outlook.com (2603:10b6:208:23d::17)
 by DS7PR10MB7278.namprd10.prod.outlook.com (2603:10b6:8:d8::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Thu, 26 Mar 2026 08:57:49 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:208:23d:cafe::45) by MN2PR06CA0012.outlook.office365.com
 (2603:10b6:208:23d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.22 via Frontend Transport; Thu,
 26 Mar 2026 08:57:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 26 Mar 2026 08:57:47 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 03:57:47 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 03:57:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 03:57:47 -0500
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62Q8vDGY1858872;
	Thu, 26 Mar 2026 03:57:43 -0500
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>, <afd@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v9 2/3] initramfs-module-luks-ftpm: Add fTPM support
Date: Thu, 26 Mar 2026 14:26:22 +0530
Message-ID: <20260326085623.864201-3-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326085623.864201-1-s-tripathi1@ti.com>
References: <20260326085623.864201-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|DS7PR10MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f3a3d27-9089-4f91-96d7-08de8b15c0d5
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	sMjwcLZuUYPffapVw31m3Lg1deJvgsvypAfGG6qvJvB5AlNdUAQyJghWwdeq/xG3llqSFtYtPtBcciXn1HmssSzNtGqLD2TRJY781K8FjXHZR7PmuCEjtzxDviZlDoNHxS1WVW4rkqew4wyGMIM9j3X2FSAdHOVireKA1TNovlRKDUA1n4jNyLVTnP85xAWoKqxb0K/2qhznHyQY6Ga9uuEf2TbmU3jWIhgpY3yL14mrtZ5AFaaMKHfNyynQQadi5szeAiSpFr/iEMJkP9dZFLiknGj6eSYRVDAV2OzazblY2IzR57UJe16i0vUKc8zE6UrmR4zSaPeOjI2StWQsQ7XrpcJs0mLjtQ6hlHmRVCka2gTrZomMgcINbIIwq/Hq/x/Akat96uFpPp//OraCDPB0UzWK0g0PDw0pefuaeGELLHFOd7kh6a+6MAwPYneJxPfokTqasUS1Qcri7cNtXH0hr1OjuAAxGPqB3b78YBnz9hDVsj8s2AIg0j6Kx676nC396IpTVf6mm+NT+YbvDsEsjqf40JOJ21MWHaKhMu/YdFi0FlrBnyE/Wh9NRgugLU4j7aMKs2zvEVc/kwoecWIjl3GaQHoz2/gaI/XAd+U1msRNeFT7EQJw5mWkWv+hnSGAFeShG1otsk/58B1GThGIj1lQL/hXsTewuVeMn/zkrJXAPoF9lP2D4Xa6lKU7gPvWSwCmPu+/fPwttBkE/brY1/Wgy3a4sf7eCo4ARn6sw3VXbkI4hrTD8tc5EbPgYb3AqbqJCNAkmcvLxrkH8Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	AkrIP4zU7C2xjUoD98CC2UO0z4lE51fqhhL+WcqTSP5LgQn8svJP9dOjr2Jo6/czTwDM1IpAxnDuvlUje8SfsWIDUeqw6bkuzMei4vmFKZ9V8MY/usdIEeqTCALFp8wZ5iVsYgD4BFDyX7puA71N4zqDG8uBL3mzbZFBlSOW9flSU+gL9c/+mvHCW70lpbWeOL0619mZ7Lo2tgGQDD7671Krr5ius7RggGI+MyaYoTG5HXxhQ2nXCNsyQ260gQnviQQ46OIe/3amyLOgmlB+UnJPJkmHLFQLus9xkeqnqZR04Holw0VzggNqIF9o657BsaHcpu1e4I2m8TvXku/izUuGswFLIQaTvdBmzqLgN3EH6vTMX3rK1d7pbWMAxFKPrVBQYBbk3l+LzL0kLd/msEubejyh+VDZusFhrbRZpm6+xR86RCXAg/mPnal0SM/N
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 08:57:47.7823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3a3d27-9089-4f91-96d7-08de8b15c0d5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7278
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Mar 2026 08:58:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19821

Add initramfs module to dynamic-layers/tpm-layer providing LUKS2 full
disk encryption with TPM-sealed keys for TI K3 platforms. Keys are
sealed by firmware TPM (fTPM) running in OP-TEE and stored in eMMC
RPMB.

Features:
- First-boot in-place encryption with tpm2_getrandom key generation
- TPM-sealed key storage via persistent handle 0x81080001
- Automatic unlock on subsequent boots
- Space verification ensuring 32MB available for LUKS header

The module is built only when meta-tpm layer is present and gets
included in initramfs only when DISTRO_FEATURES=3D'luks' and
MACHINE_FEATURES=3D'optee-ftpm'

LUKS packages (cryptsetup, tpm2-tools, tpm2-tss, optee-ftpm,
e2fsprogs-*) significantly increase initramfs size beyond the default
131072 limit. Increase INITRAMFS_MAXSIZE to 200000 to accommodate
these packages.

Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
---
 .../initramfs-module-luks-ftpm/luksftpm       | 341 ++++++++++++++++++
 .../initramfs-module-luks-ftpm_1.0.bb         |  43 +++
 .../packagegroup-ti-core-initramfs.bbappend   |   3 +
 .../initramfs/ti-core-initramfs.bbappend      |   1 +
 4 files changed, 388 insertions(+)
 create mode 100644 meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initram=
fs/initramfs-module-luks-ftpm/luksftpm
 create mode 100644 meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initram=
fs/initramfs-module-luks-ftpm_1.0.bb
 create mode 100644 meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initram=
fs/packagegroup-ti-core-initramfs.bbappend
 create mode 100644 meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initram=
fs/ti-core-initramfs.bbappend

diff --git a/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/init=
ramfs-module-luks-ftpm/luksftpm b/meta-ti-bsp/dynamic-layers/tpm-layer/reci=
pes-ti/initramfs/initramfs-module-luks-ftpm/luksftpm
new file mode 100644
index 00000000..5e3aedc4
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/initramfs-m=
odule-luks-ftpm/luksftpm
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
diff --git a/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/init=
ramfs-module-luks-ftpm_1.0.bb b/meta-ti-bsp/dynamic-layers/tpm-layer/recipe=
s-ti/initramfs/initramfs-module-luks-ftpm_1.0.bb
new file mode 100644
index 00000000..b2a41d08
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/initramfs-m=
odule-luks-ftpm_1.0.bb
@@ -0,0 +1,43 @@
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
+S =3D "${UNPACKDIR}"
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
diff --git a/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/pack=
agegroup-ti-core-initramfs.bbappend b/meta-ti-bsp/dynamic-layers/tpm-layer/=
recipes-ti/initramfs/packagegroup-ti-core-initramfs.bbappend
new file mode 100644
index 00000000..52c82389
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/packagegrou=
p-ti-core-initramfs.bbappend
@@ -0,0 +1,3 @@
+LUKS_ENCRYPTION ?=3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm=
', 'initramfs-module-luks-ftpm', '', d)}"
+
+RDEPENDS:${PN}:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'luks'=
, '${LUKS_ENCRYPTION}', '', d)}"
diff --git a/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/ti-c=
ore-initramfs.bbappend b/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/in=
itramfs/ti-core-initramfs.bbappend
new file mode 100644
index 00000000..8901d0bf
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/ti-core-ini=
tramfs.bbappend
@@ -0,0 +1 @@
+INITRAMFS_MAXSIZE =3D "200000"
--=20
2.34.1


