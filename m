Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3058FEFB6B
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 17:07:36 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.162400.1772463752226354415
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 07:02:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=uP7U6UYa;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.8, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DR4wcTaidOkiYln3IkWuGjPBYqw+8z2yeQs+97C/uY0JoHlb4thfmSTcxmpT8B+sKXqGUJNKx7ooQYQ2x4scjhNyMSSGM3jyJ++TCfYzRWzTuvfrg5AFdOyCzrL4MgcsUj8RduEV0DYRbVMVDE4CiVPRHTWlDpAWf/Z4e/rnuCGDWBe8Nh+r1BbSxRvoRbY52aiJe5UlDIpdUW2AS/Xwyc2k6/JSpZEX4EBKTQwMzwUBve40LMhWzY1ihVuGI+wpxpY8Sfli711NUfJJWprk4WPQQ3zh0if7tdbJJqG7qlSgej3MJMj/hcRLPPs5Riyv4hDTTraab2ZV8bZ/gWyk0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/cKW8Tr1LDFQetvPjGqBb+HKbzwr8QMp9DTa9ke3cA=;
 b=UJFYyQeHA2HVHb64aj+3jU2Wg5iFzi818qBFL+jzDZc5oDuqlev/4nwkthBFJUPoeJL3quNN3tIBXK0WG01gOAx6gNACmvadVMZ7QsycNaXuQASHQhxfQAMrH/IsNgE+yXQYsKpYXLQ9wp+vG7Eypqw7Q0ChRIL+bCSl91X2T0/8uoxO+86psxE/i5DsR3/GhPlRojUn1xRU4d6fPj6HhvUN7I88l21ug2naGr8pqprjvxR9QlbV7zBDuURChGsa7JbpHcrnlqI5QmXk1CQEXFEd0x7CrIpxYN/ofOKHuyBnqOfhCYoziFFYcn9CM/M/vEgWP9XI3JNchkgfM7dIHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/cKW8Tr1LDFQetvPjGqBb+HKbzwr8QMp9DTa9ke3cA=;
 b=uP7U6UYa6qGFuPTFlk67N8JSP6KY1bM4ZLH8zI2ykJvi0FLOAB3e1raXPJNB+0EFKbKgRNkMMafVOWRaO8UFHnjML4JAk6IGNn6pA/Umw0NiBOCJllWTMizzhpkoslLhpRtNng1tkV3d34DV1KTYBSe2F0pAx+htdH95cYsUNdw=
Received: from BL1PR13CA0260.namprd13.prod.outlook.com (2603:10b6:208:2ba::25)
 by DM6PR10MB4204.namprd10.prod.outlook.com (2603:10b6:5:221::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Mon, 2 Mar
 2026 14:47:33 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:208:2ba:cafe::e9) by BL1PR13CA0260.outlook.office365.com
 (2603:10b6:208:2ba::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Mon,
 2 Mar 2026 14:47:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 14:47:33 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 08:47:29 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 08:47:29 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 08:47:29 -0600
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622ElE73454549;
	Mon, 2 Mar 2026 08:47:27 -0600
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>,
	<k-malarvizhi@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH 3/3] conf: Add encrypted boot machine config and WIC file
Date: Mon, 2 Mar 2026 20:16:47 +0530
Message-ID: <20260302144647.1705408-4-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302144647.1705408-1-s-tripathi1@ti.com>
References: <20260302144647.1705408-1-s-tripathi1@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|DM6PR10MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: fc529a06-3b3a-4fab-7bed-08de786aa33d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: FXJW7n7maCNENaabqzW5iT5dMWxJ/e5hYOy1DYL5Be8AR0QdsL83u9kyJ+hLV7Baq+cG5ckaVhlWlBB8FpOCeGaeIGL1fiTMKogVmat3qgijIUvvlV8mzXgYGw+y9Q7JVJiZsO+YMnjbHJr77CxsVLIiILcaVthpiPFu98Cv7LhngwUxX8aoKZ02PyKp0baE/P4mKFV7Xef3uFuFovLki3Bcr/Aq9C2gqL2uuX4n+pMABvJuzvGM5a+9Mq8mg6kWhMBpvgmn0LcsEuEyCeUSUYP/nX1/XGO2kSsHQVobbGS71jH4cNYG0dVudgN45KQfEjgD1pvXhXNrqc7v5Unwvq5F/l56tzzCZKENeyxidnt7x8T+IVGVOnh0MJHwMgC5FF4m0SoN3CAWUXP3rLhJCZwZ66xlLP+IHfEjzA7EA2Rm4NfPJjg6EAwvuLQCukr4644C8xt3vi7GAF5WXB3pVk/DDDQZSzC4ZB4hEA4wWhqLY/YIRDYTxKoS4W1vTWvYSuSa+j/M4SGYtw0X2H6uAFHfINtqN1k1j4LOTPVJBZ1OEzZ8/JHNlqBaYWRIIyxlqf210JpY3rOCzzJirjeWpYF4fFgVsY5SEZJoWFGtHSMCsVVA6rOvLpxZU7kOts6A9HZryVmXA/ciYeyVNfrBZeo9LtkHFCTwgXOXEsIDcNLf7YRHqQhVwCd0tJTGxkW/ndzV5rh455WvgTvQeK46c9tHA5pPrFc4wn2+/Wb/4E6wiM/gfRnPPWAe/tAS88W7GP1lsMk1V8Wn6Gu85IiSsa9VlrKxjrAZrme2e0Bk8bBcQkRMo8ZqJ3kMQvxaULgw/hYRHS9Bq1FMOFVhDeIaRA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Aa2HZRBIq5UO97uHrbVmSjXeBXs/0EJnxWnnMctsWtW9g3iytJizF+Sx1k/c4L99zkCp/q7DdVrSQn0vQzEFnNBrBRhD3HRi9U3EBR4YcLdT6AOFBMgJcogPiUoeVHbwfigUtgrf5/499ROTj3VWAwQK+iYHgSg6poYIZCNdzF9Q0YDIMRZqwRwr6k43xHTEUjP2XPjnReMb0up2bHudFy9s4gH36N4U2MYArmTl6GcOG24njxUqKeUhNWOZQ22CVgNebBtgCTFpPWqpmcMGt0cvN6MUZNn+Aj0PhEQ2F4wMvCz5AbyIxu+DefgpfzRtk2E/NOWrMPODjjV24pNioxoqsU1NR9ElaZMCuGRrRWEV5RgAyJv7uvyKyNFgqnM3AXlyi/4pOWjt1nP5YLK2aIwkg6qHHlfakxhmbROm/nZ/pyOF3l+l94wdss8NL6iF
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:47:33.2600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc529a06-3b3a-4fab-7bed-08de786aa33d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4204
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Mar 2026 17:07:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19627

Add machine include file for encrypted boot deployment and WIC file
for encrypted disk image creation.

encrypted-boot-common.inc provides:
- Conditional initramfs deployment to rootfs /boot/
- Build dependency on ti-encrypted-boot-initramfs
- Only activates when MACHINE_FEATURES contains 'luks-encryption'

sdimage-2part-encryption.wks provides:
- 128M boot partition (VFAT, unencrypted)
- 400M root partition (ext4, sized for LUKS header overhead)

To use encrypted boot in a custom image:
MACHINE_FEATURES +=3D "luks-encryption"
INITRAMFS_IMAGE =3D "ti-encrypted-boot-initramfs"
WKS_FILE =3D "sdimage-2part-encryption.wks"

Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
---
 .../machine/include/encrypted-boot-common.inc | 38 +++++++++++++++++++
 meta-ti-bsp/wic/sdimage-2part-encryption.wks  |  6 +++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/include/encrypted-boot-common.=
inc
 create mode 100644 meta-ti-bsp/wic/sdimage-2part-encryption.wks

diff --git a/meta-ti-bsp/conf/machine/include/encrypted-boot-common.inc b/m=
eta-ti-bsp/conf/machine/include/encrypted-boot-common.inc
new file mode 100644
index 00000000..231c357c
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/encrypted-boot-common.inc
@@ -0,0 +1,38 @@
+# Common logic for encrypted boot with TPM-sealed LUKS keys
+#
+# This include file provides functionality to deploy ti-encrypted-boot-ini=
tramfs
+# into the root filesystem for encrypted boot scenarios.
+#
+# To use this in your custom image, add to your image bbappend:
+#   require conf/machine/include/encrypted-boot-common.inc
+#
+# This will activate when MACHINE_FEATURES contains 'luks-encryption'
+
+# Install uncompressed initramfs.cpio to rootfs /boot/
+install_initramfs() {
+    # Try with .rootfs suffix first (older Yocto versions)
+    if [ -e ${DEPLOY_DIR_IMAGE}/ti-encrypted-boot-initramfs-${MACHINE}.roo=
tfs.cpio.gz ]; then
+        install -d ${IMAGE_ROOTFS}/boot
+        gunzip -c ${DEPLOY_DIR_IMAGE}/ti-encrypted-boot-initramfs-${MACHIN=
E}.rootfs.cpio.gz > ${IMAGE_ROOTFS}/boot/initramfs.cpio
+        # Also deploy to deploy directory for IMAGE_BOOT_FILES
+        gunzip -c ${DEPLOY_DIR_IMAGE}/ti-encrypted-boot-initramfs-${MACHIN=
E}.rootfs.cpio.gz > ${DEPLOY_DIR_IMAGE}/initramfs.cpio
+    # Try without .rootfs suffix (newer Yocto versions)
+    elif [ -e ${DEPLOY_DIR_IMAGE}/ti-encrypted-boot-initramfs-${MACHINE}.c=
pio.gz ]; then
+        install -d ${IMAGE_ROOTFS}/boot
+        gunzip -c ${DEPLOY_DIR_IMAGE}/ti-encrypted-boot-initramfs-${MACHIN=
E}.cpio.gz > ${IMAGE_ROOTFS}/boot/initramfs.cpio
+        # Also deploy to deploy directory for IMAGE_BOOT_FILES
+        gunzip -c ${DEPLOY_DIR_IMAGE}/ti-encrypted-boot-initramfs-${MACHIN=
E}.cpio.gz > ${DEPLOY_DIR_IMAGE}/initramfs.cpio
+    else
+        bbwarn "Could not find ti-encrypted-boot-initramfs-${MACHINE}.cpio=
.gz for deployment"
+    fi
+}
+
+# Only process initramfs for encrypted builds
+ROOTFS_POSTPROCESS_COMMAND:append =3D " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', 'install_i=
nitramfs;', '', d)} \
+"
+
+# Ensure ti-encrypted-boot-initramfs is built before we try to install it =
(only for encrypted builds)
+do_rootfs[depends] +=3D " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', 'ti-encryp=
ted-boot-initramfs:do_image_complete', '', d)} \
+"
diff --git a/meta-ti-bsp/wic/sdimage-2part-encryption.wks b/meta-ti-bsp/wic=
/sdimage-2part-encryption.wks
new file mode 100644
index 00000000..3a1de8d7
--- /dev/null
+++ b/meta-ti-bsp/wic/sdimage-2part-encryption.wks
@@ -0,0 +1,6 @@
+# WIC file for LUKS encryption with fTPM
+# Larger root partition to accommodate LUKS header (32MB) + growth room
+
+part --source bootimg-partition --fstype=3Dvfat --label boot --active --al=
ign 1024 --use-uuid --fixed-size 128M
+part / --source rootfs --fstype=3Dext4 --label root --align 1024 --use-uui=
d --fixed-size 400M
+
--=20
2.34.1


