Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C02EB3622
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 17:07:36 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.162585.1772463758733822625
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 07:02:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=RQ/6frNO;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.8, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppErXz9lb4GgkoapmJguA+H2/ho6lDpOlBMBANBbtCe+tuV8DsBEWs0cRaFdzLXsxoZG7Ddw3g7gIWIRUFZ9DmpVcVwoVqhg6Sndxbji2zQIAPmJBH5W7TF9CszVi6OfNjVSHBDzg4VffdEiIjawxbrPmNXG3pH76tZrykBIQksSjxVYfKiaXmbCroUwj4tsEER2j6QO0MTRgGDjcTRnghl0AUbAmthAXeMmmdMuGZgTxNabr01EO/AaE8KIvhUWOqE7Ww2Dgq9DWRYYC+SnIelStyEfPNxlxF76VYsIfX05TlY1YPh6AAifIMshMeS20awtQKr31USCchlpp0vI3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhrQC7HGBaIYXOkyurxZvqYu3VMPakYZjBMLZd9HsSo=;
 b=NO9qrlFvrNvbkYVOTknGzPn7C8hESTrzSSYkZNoNFoz80kmg6xJFahjrmfXiJ1bk6QRfR6k81WHgMJGC/Y5skBnUgE4WFh+2GbfFaL+JvFhc3ZW+RSydTplVmun2A/hli7TamDCJMat1u5iv+6qydliDIUvGG8rirwM60ROpvcTGFX5K+rlylmIyEykD3r787zl8644QuLc88MZPAfOWmzHjdufVP3miPGQaO5TdNYb/SM40FPAjjFb7WCZQAre/O61JDUyqQ6LprXtJmqq8FJhk6cxOGbnKbSIHnmbC0dTSMkprM/OJesrMxu/N3ZKuozXcwQ5w525Bfg7sZsUN5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhrQC7HGBaIYXOkyurxZvqYu3VMPakYZjBMLZd9HsSo=;
 b=RQ/6frNOTheix/5dTe8bH8IArUg8Kz4g6Th8DUpbjY2p+nPSC5+6UXzeSNZfpZdJhO1PsdVjGMfIUqUX28KKYpb3IG1FwZVXNKfQaaCbtuzbh+Vh2kgB8jAJ57wZTYx5zUjAS/qOJTn581KiMKuzG0mzGOUhLZWwBINjjMkkSmQ=
Received: from SJ0PR03CA0361.namprd03.prod.outlook.com (2603:10b6:a03:3a1::6)
 by DS0PR10MB997650.namprd10.prod.outlook.com (2603:10b6:8:313::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Mon, 2 Mar
 2026 14:47:37 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::da) by SJ0PR03CA0361.outlook.office365.com
 (2603:10b6:a03:3a1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 14:47:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 14:47:36 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 08:47:26 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 08:47:25 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 08:47:25 -0600
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622ElE72454549;
	Mon, 2 Mar 2026 08:47:23 -0600
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>,
	<k-malarvizhi@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH 2/3] initramfs: Add encrypted boot support with fTPM
Date: Mon, 2 Mar 2026 20:16:46 +0530
Message-ID: <20260302144647.1705408-3-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302144647.1705408-1-s-tripathi1@ti.com>
References: <20260302144647.1705408-1-s-tripathi1@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|DS0PR10MB997650:EE_
X-MS-Office365-Filtering-Correlation-Id: 740bb303-a1af-41c6-e2d3-08de786aa520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|34020700016|7142099003;
X-Microsoft-Antispam-Message-Info: 
	4ip4VefILDXOoN1uwScHCzrOyCeent/7hNAf1V3o5p9GZ7ifoXXGPL4IdkwmPlhzXkd8R5UEhey97jwsauWyJ0kv1QsqtNCacJImvC/S5F2VTQMlAGUKV8Tjp6+IrscGkr4YjCSNirTVvkz+Ngg2CUB7SuMTMdCH1lyHBKYla2qTlJSmQuARVI86qD64QhZDAkurR5BQ9um1+uiIQD6ZZTXckhFdYU6bDV6fBGtXx7BaOoLy1AWx2GEGpFithrSyggeFj3l/8HeRYZnnNjkrgz5hNhlyzeaH77jJyT+6O062+aODP3jEuGhesShV2hJWSK24fHTyn6Vp9HIfN2PqIe9litZ5JvF6cjSLg9qn137FCEacFeNJ9YbH8Lte1YVhxcf5jTF8Vbm5beSu+2K3/9NFQ+SI1GQfOcW0jisRPVI10yjYtpTaUZP4aSVo2OAUH4IObTqLtH7rxtlyVwN700/ry1dzdAAhC3NbvWE/HxBTDMBrAKukgokv1NrqOruXlZxJDEU4dkNBPHWZr4kMCszVVnsZhrRQSLl7eBlBztrijAqgCnzgtDaydDPS8fn3gD1GTy2xHYAsXl3pVgNVtpykIr1zTOwW0beZ8SDrmnHNHdBO1Yt67/O5r6ibqXwb40SasDJbrwI286+v3UP0CmvMyd7vJFC/xe7r/s1OKfxtKnRPtYyRx0c8IRoX/H67CNNzsJiqMoGjipbpC5Vhhc7mG5Th7EaVZ66LKT8l5Uyaa39IGd3A7VMTvo1zaS+2TOAp9iTCoXUXSQUfOFI9QI10jCsXkyauwFgSrLgHzMq1qTGCtCT9S50GcBMFnGA4eAidCirhyeGtU+p4bhoc9w==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(34020700016)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	clLiurQ+BAryJvPbmMiSQXwVeD3C79TD4ucLttuEmUiGau2q5PjLHbezCQGD2glhJVdem3cVPFyjhu7fDHGndkLWfvzlqPCbFwu3Bt0HoJUgK3r4has79HdMvFMoKJVrYAVh3xsH44AZ9Ez5kkEB32u/TJXToIfXKZTB9pbci4y5sTMDjHpq4RFc2w+vSfT1UKQXXtrp9uSdXLMrQLKxwtEkuf+MkJ4raowDrPtyLYVzet36UBEVIMPHwcbI+n2t0Sv7nA0bm0pmC2jh12Ua+ga5M6tW/3dRrluwba/T9BqhVsjUYxwLXitr2K5yGhg3o1X/7NVNphcDk+oWDEBG+fON3IfvoKRiYye30h7GW+Ko7NwAS0a4C9sRT8SHbuHy2BwKExR+Lc029UqWMARHsckEuuToMLP3hmz7SN8OPNhsEqy00TK2y00srRsa9OsS
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:47:36.4096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 740bb303-a1af-41c6-e2d3-08de786aa520
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997650
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Mar 2026 17:07:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19628

Add ti-encrypted-boot-initramfs for LUKS encryption with TPM-sealed
keys. This provides full disk encryption using dm-crypt with keys
sealed by firmware TPM (fTPM) running in OP-TEE and stored in eMMC RPMB.

The initramfs includes:
- Custom init script for in-place LUKS encryption on first boot
- TPM key sealing/unsealing using persistent handle 0x81080001
- Support for cryptsetup, tpm2-tools, and OP-TEE client
- Automatic filesystem resize after encryption

ti-encrypted-boot-initramfs builds when MACHINE_FEATURES contains
'luks-encryption'.

Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
---
 .../initramfs-ti-encrypted-init/files/init    | 324 ++++++++++++++++++
 .../initramfs-ti-encrypted-init_1.0.bb        |  30 ++
 .../initramfs/ti-encrypted-boot-initramfs.bb  |  50 +++
 3 files changed, 404 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted=
-init/files/init
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted=
-init_1.0.bb
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-encrypted-boot-init=
ramfs.bb

diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init/f=
iles/init b/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init/fi=
les/init
new file mode 100644
index 00000000..6675b6ed
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init/files/in=
it
@@ -0,0 +1,324 @@
+#!/usr/bin/busybox sh
+# TI SDK initramfs init script with LUKS2 + fTPM encryption support
+
+# Mount essential filesystems
+/usr/bin/busybox echo "Initializing system..."
+/usr/bin/busybox mount -t proc proc /proc
+/usr/bin/busybox mount -t sysfs sysfs /sys
+/usr/bin/busybox mount -t devtmpfs devtmpfs /dev
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
+# Wait for MMC device to appear (up to 10 seconds)
+/usr/bin/busybox echo "Waiting for storage device..."
+for i in 1 2 3 4 5 6 7 8 9 10; do
+    if [ -b "${ROOT_DEV}" ]; then
+        break
+    fi
+    /usr/bin/busybox sleep 1
+done
+
+# Check if root device exists
+if [ ! -b "${ROOT_DEV}" ]; then
+    /usr/bin/busybox echo "ERROR: Storage device not found!"
+    /usr/bin/busybox sh
+fi
+
+# Mount boot partition
+/usr/bin/busybox echo "Mounting boot partition..."
+/usr/bin/busybox mkdir -p "${BOOT_MNT}"
+if ! /usr/bin/busybox mount "${BOOT_DEV}" "${BOOT_MNT}"; then
+    /usr/bin/busybox echo "ERROR: Failed to mount boot partition!"
+    /usr/bin/busybox echo "Attempting standard boot..."
+    /usr/bin/busybox mkdir -p /newroot
+    /usr/bin/busybox mount "${ROOT_DEV}" /newroot
+    exec /usr/sbin/switch_root /newroot /sbin/init
+fi
+
+# Initialize fTPM in OP-TEE
+/usr/bin/busybox echo "Initializing secure hardware(fTPM)..."
+
+# Start TEE supplicant (required for fTPM TA to work)
+if [ -x /usr/sbin/tee-supplicant ]; then
+    /usr/sbin/tee-supplicant -d &
+    TEE_SUPPLICANT_PID=3D$!
+    /usr/bin/busybox sleep 5
+else
+    /usr/bin/busybox echo "Warning: Trusted execution environment not avai=
lable"
+fi
+
+# Load fTPM kernel module
+if ! /sbin/modprobe tpm_ftpm_tee; then
+    /usr/bin/busybox echo "Warning: TPM module failed to load"
+fi
+
+# Wait for TPM device (up to 10 seconds)
+for i in 1 2 3 4 5 6 7 8 9 10; do
+    if [ -c /dev/tpmrm0 ]; then
+        break
+    fi
+    /usr/bin/busybox sleep 1
+done
+
+# Check if TPM is available
+TPM_AVAILABLE=3D0
+if [ -c /dev/tpmrm0 ]; then
+    TPM_AVAILABLE=3D1
+    export TPM2TOOLS_TCTI=3D"device:/dev/tpmrm0"
+else
+    /usr/bin/busybox echo "Warning: fTPM not available - encryption will b=
e skipped"
+    if [ -n "${TEE_SUPPLICANT_PID}" ]; then
+        /usr/bin/busybox kill "${TEE_SUPPLICANT_PID}" 2>/dev/null
+    fi
+fi
+
+# Function: Generate 32-byte random key using TPM RNG
+generate_random_key() {
+    if [ $TPM_AVAILABLE -eq 1 ]; then
+        /usr/bin/tpm2_getrandom --hex 32
+    else
+        /usr/bin/busybox echo "ERROR: TPM not available for key generation=
"
+        return 1
+    fi
+}
+
+# Function: Seal data with TPM and store in persistent handle
+tpm_seal_key() {
+    local KEY_DATA=3D"$1"
+
+    if [ $TPM_AVAILABLE -eq 0 ]; then
+        /usr/bin/busybox echo "ERROR: TPM not available for sealing"
+        return 1
+    fi
+
+    # Create primary key in owner hierarchy
+    /usr/bin/tpm2_createprimary -C o -c "${TPM_PRIMARY_CTX}" -Q || return =
1
+
+    # Create sealed object
+    /usr/bin/busybox echo -n "${KEY_DATA}" | \
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
+# Function: Unseal data from TPM persistent handle
+tpm_unseal_key() {
+    if [ $TPM_AVAILABLE -eq 0 ]; then
+        /usr/bin/busybox echo "ERROR: TPM not available for unsealing" >&2
+        return 1
+    fi
+
+    # Check if persistent handle exists
+    if ! /usr/bin/tpm2_getcap handles-persistent | grep -q "${TPM2_HANDLE}=
"; then
+        /usr/bin/busybox echo "ERROR: TPM persistent handle not found" >&2
+        return 1
+    fi
+
+    # Unseal key directly from persistent handle
+    /usr/bin/tpm2_unseal -c "${TPM2_HANDLE}" || return 1
+
+    return 0
+}
+
+# Function: Perform in-place LUKS encryption (first boot)
+encrypt_root_filesystem() {
+    /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
+    /usr/bin/busybox echo "First boot: Encrypting root filesystem"
+    /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
+
+    # Set marker to track encryption progress
+    /usr/bin/busybox touch "${ENCRYPTION_MARKER}"
+    /usr/bin/busybox sync
+
+    # Generate random encryption key using TPM RNG
+    /usr/bin/busybox echo "Generating encryption key..."
+    LUKS_KEY=3D$(generate_random_key)
+
+    if [ -z "${LUKS_KEY}" ]; then
+        /usr/bin/busybox echo "ERROR: Failed to generate encryption key"
+        /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
+        return 1
+    fi
+
+    # Seal key with TPM before encryption starts
+    /usr/bin/busybox echo "Securing key with TPM..."
+    if ! tpm_seal_key "${LUKS_KEY}"; then
+        /usr/bin/busybox echo "ERROR: Failed to secure key"
+        /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
+        return 1
+    fi
+
+    # Filesystem check before encryption
+    /usr/bin/busybox echo "Checking filesystem integrity..."
+    /usr/sbin/e2fsck -f -y "${ROOT_DEV}"
+    E2FSCK_RET=3D$?
+    if [ ${E2FSCK_RET} -ge 4 ]; then
+        /usr/bin/busybox echo "ERROR: Filesystem check failed"
+        /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
+        return 1
+    fi
+
+    # Shrink filesystem before encryption to leave room for LUKS header
+    /usr/bin/busybox echo "Preparing filesystem for encryption..."
+    /usr/sbin/resize2fs "${ROOT_DEV}" 368M || {
+        /usr/bin/busybox echo "ERROR: Failed to prepare filesystem"
+        /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
+        return 1
+    }
+
+    # Perform in-place encryption
+    /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
+    /usr/bin/busybox echo "Encrypting filesystem..."
+    /usr/bin/busybox echo "This will take several minutes."
+    /usr/bin/busybox echo "DO NOT POWER OFF THE DEVICE!"
+    /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
+
+    /usr/bin/busybox echo -n "${LUKS_KEY}" | \
+        /usr/sbin/cryptsetup reencrypt --encrypt \
+        --type luks2 \
+        --cipher aes-xts-plain64 \
+        --key-size 256 \
+        --hash sha256 \
+        --reduce-device-size 32M \
+        --key-file - \
+        "${ROOT_DEV}" || {
+        /usr/bin/busybox echo "ERROR: Encryption failed"
+        /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
+        return 1
+    }
+
+    /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
+    /usr/bin/busybox echo "Encryption completed successfully!"
+    /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
+
+    # Remove encryption marker
+    /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
+    /usr/bin/busybox sync
+
+    # Unlock the newly encrypted device
+    /usr/bin/busybox echo "Activating encrypted filesystem..."
+    /usr/bin/busybox echo -n "${LUKS_KEY}" | \
+        /usr/sbin/cryptsetup luksOpen "${ROOT_DEV}" "${CRYPT_NAME}" --key-=
file - || {
+        /usr/bin/busybox echo "ERROR: Failed to activate encrypted filesys=
tem"
+        return 1
+    }
+
+    # Resize filesystem to fit the encrypted device
+    /usr/bin/busybox echo "Optimizing filesystem..."
+    /usr/sbin/resize2fs -f "${CRYPT_DEV}" || {
+        /usr/bin/busybox echo "ERROR: Failed to optimize filesystem"
+        return 1
+    }
+
+    # Verify filesystem after resize
+    /usr/sbin/e2fsck -f -y "${CRYPT_DEV}" || {
+        /usr/bin/busybox echo "WARNING: Filesystem verification had issues=
, but continuing"
+    }
+    return 0
+}
+
+# Function: Unlock encrypted root filesystem (subsequent boots)
+unlock_encrypted_root() {
+    /usr/bin/busybox echo "Unlocking encrypted filesystem..."
+
+    # Unseal key from TPM persistent handle
+    LUKS_KEY=3D$(tpm_unseal_key)
+
+    if [ -z "${LUKS_KEY}" ]; then
+        /usr/bin/busybox echo "ERROR: Failed to retrieve encryption key fr=
om TPM"
+        /usr/bin/busybox echo "Attempting passphrase fallback..."
+
+        # Try to unlock with passphrase (interactive)
+        /usr/sbin/cryptsetup luksOpen "${ROOT_DEV}" "${CRYPT_NAME}" || {
+            /usr/bin/busybox echo "ERROR: Failed to unlock encrypted files=
ystem"
+            /usr/bin/busybox sh
+        }
+    else
+        # Unlock with unsealed key
+        /usr/bin/busybox echo -n "${LUKS_KEY}" | \
+            /usr/sbin/cryptsetup luksOpen "${ROOT_DEV}" "${CRYPT_NAME}" --=
key-file - || {
+            /usr/bin/busybox echo "ERROR: Failed to unlock with TPM key"
+            /usr/bin/busybox sh
+        }
+    fi
+
+    /usr/bin/busybox echo "Encrypted filesystem unlocked"
+}
+
+# Main boot logic
+/usr/bin/busybox echo "Checking filesystem encryption status..."
+
+# Check if device is LUKS encrypted
+if /usr/sbin/cryptsetup isLuks "${ROOT_DEV}"; then
+    /usr/bin/busybox echo "Filesystem is encrypted"
+    unlock_encrypted_root
+    MOUNT_DEV=3D"${CRYPT_DEV}"
+else
+    /usr/bin/busybox echo "Filesystem is not encrypted"
+
+    # Check if encryption is enabled and TPM is available
+    if [ $TPM_AVAILABLE -eq 1 ]; then
+        # Check for encryption marker (resume interrupted encryption)
+        if [ -f "${ENCRYPTION_MARKER}" ]; then
+            /usr/bin/busybox echo "Resuming interrupted encryption..."
+            if ! encrypt_root_filesystem; then
+                /usr/bin/busybox echo "ERROR: Failed to resume encryption"
+                /usr/bin/busybox echo "Booting without encryption..."
+                MOUNT_DEV=3D"${ROOT_DEV}"
+            else
+                MOUNT_DEV=3D"${CRYPT_DEV}"
+            fi
+        else
+            # First boot - perform encryption
+            if encrypt_root_filesystem; then
+                MOUNT_DEV=3D"${CRYPT_DEV}"
+            else
+                /usr/bin/busybox echo "ERROR: Encryption failed - booting =
without encryption"
+                MOUNT_DEV=3D"${ROOT_DEV}"
+            fi
+        fi
+    else
+        /usr/bin/busybox echo "TPM not available - skipping encryption"
+        MOUNT_DEV=3D"${ROOT_DEV}"
+    fi
+fi
+
+# Unmount boot partition before switching root
+/usr/bin/busybox umount "${BOOT_MNT}"
+
+# Mount root filesystem (encrypted or unencrypted)
+/usr/bin/busybox echo "Mounting root filesystem..."
+/usr/bin/busybox mkdir -p /newroot
+/usr/bin/busybox mount "${MOUNT_DEV}" /newroot || {
+    /usr/bin/busybox echo "ERROR: Failed to mount root filesystem!"
+    /usr/bin/busybox sh
+}
+
+/usr/bin/busybox echo "Boot complete"
+
+# Clean up tmpfs
+/usr/bin/busybox rm -f "${TPM_PRIMARY_CTX}" "${TPM_KEY_PUB}" "${TPM_KEY_PR=
IV}" "${TPM_KEY_CTX}"
+
+# Switch to real root
+exec /usr/sbin/switch_root /newroot /sbin/init
diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init_1=
.0.bb b/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init_1.0.bb
new file mode 100644
index 00000000..7da878f7
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init_1.0.bb
@@ -0,0 +1,30 @@
+SUMMARY =3D "TI encrypted boot initramfs init script"
+DESCRIPTION =3D "Custom /init script for encrypted boot with fTPM + LUKS s=
upport"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}/files:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+
+SRC_URI =3D "file://init"
+
+S =3D "${WORKDIR}/sources"
+UNPACKDIR =3D "${WORKDIR}"
+
+# This recipe must run in the initramfs context
+inherit allarch
+
+do_install() {
+    # Install /init script to root of initramfs
+    install -m 0755 ${UNPACKDIR}/init ${D}/init
+}
+
+# Package the /init file
+FILES:${PN} =3D "/init"
+
+# Runtime dependencies
+RDEPENDS:${PN} =3D "busybox cryptsetup tpm2-tools tpm2-tss optee-client e2=
fsprogs-e2fsck e2fsprogs-resize2fs util-linux-blkid"
+
+# This package must be included in initramfs
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-encrypted-boot-initramfs.b=
b b/meta-ti-bsp/recipes-ti/initramfs/ti-encrypted-boot-initramfs.bb
new file mode 100644
index 00000000..314499db
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/ti-encrypted-boot-initramfs.bb
@@ -0,0 +1,50 @@
+SUMMARY =3D "TI encrypted boot initramfs image"
+
+DESCRIPTION =3D "Minimal initramfs image with dm-crypt/fTPM support for en=
crypted root filesystem. \
+This initramfs provides LUKS encryption with TPM-sealed keys stored in RPM=
B."
+
+LICENSE =3D "MIT"
+
+# Only build this when luks-encryption feature is enabled
+COMPATIBLE_MACHINE =3D "null"
+COMPATIBLE_MACHINE:k3 =3D "${@bb.utils.contains('MACHINE_FEATURES', 'luks-=
encryption', '.*', 'null', d)}"
+
+INITRAMFS_FSTYPES =3D "cpio.gz"
+
+IMAGE_NAME =3D "ti-encrypted-boot-initramfs"
+
+export IMAGE_BASENAME =3D "${IMAGE_NAME}"
+
+# Install our custom init script and dependencies
+PACKAGE_INSTALL =3D "\
+    initramfs-ti-encrypted-init \
+    busybox \
+    base-passwd \
+    kmod \
+    cryptsetup \
+    tpm2-tools \
+    tpm2-tss \
+    libtss2-tcti-device \
+    optee-client \
+    util-linux-blkid \
+    e2fsprogs-e2fsck \
+    e2fsprogs-resize2fs \
+    kernel-module-tpm-ftpm-tee \
+    ${ROOTFS_BOOTSTRAP_INSTALL} \
+"
+
+# Ensure the initramfs only contains the bare minimum
+IMAGE_FEATURES =3D ""
+IMAGE_LINGUAS =3D ""
+
+# Exclude kernel image from initramfs
+PACKAGE_EXCLUDE =3D "kernel-image-*"
+
+IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
+IMAGE_NAME_SUFFIX ?=3D ""
+IMAGE_ROOTFS_SIZE =3D "16384"
+IMAGE_ROOTFS_EXTRA_SPACE =3D "0"
+
+BAD_RECOMMENDATIONS +=3D "busybox-syslog"
+
+inherit image
--=20
2.34.1


