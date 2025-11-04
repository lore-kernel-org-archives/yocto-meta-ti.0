Return-Path: <s-joshi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CE8CCFA00
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 08:29:41 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13359.1762244970815230006
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Nov 2025 00:29:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=wx3wnUCo;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.34, mailfrom: s-joshi@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szlL162zJxepgwkcB4G4CSgwnvoO3kTpdcM+3UwgUYELy1NXh20n9kevuGorIf0lBlOFBCeDRgiUprwTC8vuMy3ipf2DL2dr2nccAexNlTF1xucotYhyAJfOAaLKz2gBWStvc+yeQvsXvDiJWh87sww5ZWUhSwL3U9xqrAaIZoFrSy+0nyEBKitfhsu/mgrnte3avI78fNnfNMeRBlG6aQFIgN4lUp70Cs97gWZnOKW201Y+vnNHd/VGpCALaBS6ocJLJd4lTbScUECh4W8xiud1wExBYy33SzuZtlT17MllTFMKGkFR3+v2ny4DHVRNPgSv3wpCgc5Q9Du7kZMZ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLp3Dxv7mNJDO2iHn7O2tCqeYer/JNq1Sqg0RR7/3Sg=;
 b=d4rorfGO47trY4HDcBMGN9XMkkCiIHTDf2nODeIaEdlFSfRCHyX+BZBcVYuMqI+0zELqUX3oiWDkl37nsDgJpzhEg8o9K1ZRC4MzTW15j5dBoPP5eig0RJFtVTBFA3UxI78iVwahStMaqfmYKmaeZw8NHor5esNBDlW5q2xRvSNKm2k/whoPPVBSnlzdcsQIkWDphc3p2P0TTp6Nh2skylTeIkXzV7rj4oqVtgX02gLP4z3ilOlKnSA7t6Ub0VEPb1dvg7BfDcEF8ska3hCC595/MpRP7ibvKyn6mGRgCiucsyKccQBm25jHPb+oT1hWtL3ePmmLbHHYoNwKdKyKBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLp3Dxv7mNJDO2iHn7O2tCqeYer/JNq1Sqg0RR7/3Sg=;
 b=wx3wnUCo0Mk6+N60i6z/263rgsZR1dXghsv55rOWAwU6x5kc0Hi8Jxl/4HOzRFuR+3dYEbQDijirNBJKnwyyILroEd9iQGQjtvwFOC+vBAWPIg9jCHevjVs3UKjNdx8AHvugPio6wnL23g72yw/dBCPOkaOwjcKrWsMtIKeH8FU=
Received: from BN9PR03CA0725.namprd03.prod.outlook.com (2603:10b6:408:110::10)
 by IA1PR10MB7142.namprd10.prod.outlook.com (2603:10b6:208:3f4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 08:29:26 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:110:cafe::f7) by BN9PR03CA0725.outlook.office365.com
 (2603:10b6:408:110::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Tue,
 4 Nov 2025 08:29:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:29:26 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 02:28:34 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 02:28:34 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 4 Nov 2025 02:28:34 -0600
Received: from localhost (ula0507357.dhcp.ti.com [172.24.233.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A48SXak1647242;
	Tue, 4 Nov 2025 02:28:33 -0600
From: Suhaas Joshi <s-joshi@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <kamlesh@ti.com>
Subject: [meta-ti][scarthgap][PATCH v2] meta-ti-bsp: optee: Add flags to enable RPMB and PKCS#11
Date: Tue, 4 Nov 2025 13:57:59 +0530
Message-ID: <20251104082759.711246-1-s-joshi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|IA1PR10MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: f15fac01-01ec-4926-2f82-08de1b7c43ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|34020700016|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kZ0jE+NSO9mMFCFHAE2lHuV37JOToSRRK3UKKndbb9FKgtSAJNPiLU3Jm9K6?=
 =?us-ascii?Q?SJ6EBtD0pr1UfyIQTLxChBHfmw0unpuNRRHZmeQPiZ59Go8uatsm7n82ZW/g?=
 =?us-ascii?Q?+iUk6p31ZEzSK6j+Iel+g9QJAWZQg4JDSu9dBJUtggss3J0Mx2O6c4h8TMF2?=
 =?us-ascii?Q?P8VpdWfULP8dSYqX2/H7CA2c5DeaiT/O0kK5wmue5UsJxxji2xmbynymxCx4?=
 =?us-ascii?Q?wwS0cOlKESQXIeTo5YTT3gNORWQyEoIkS08iSFnV78sFWIfgh8KA+9VUTBpP?=
 =?us-ascii?Q?b1Kr/JUZYzv2sTT2zakJiZ7sKh2rNp+oajB590VJIPbO9gC63doG9cS8ZcFP?=
 =?us-ascii?Q?r9rcMdK0PuKp+wuQjaWzg7ly7WvWzblXfl5o3N0AxN778eOwS7sjE/HWh7N7?=
 =?us-ascii?Q?BAbga888eb/cG36MwvgXivbuiSB/J064VX5zltpXxFx9PqRRfsOu5jKiiX0y?=
 =?us-ascii?Q?ASpapQ+svQeP4QvAvZtB+pHUauACKp40fExAt7pJkcGbSiE5McoNrWJ1dkoO?=
 =?us-ascii?Q?lL3niw2u1j6+SacaEUyOLpemqmfqeLXkZQfGf2cEVIXSjN/ACy8Mqb5XnUAS?=
 =?us-ascii?Q?v/QSD9hmImOSF1SV3loG0pYqFmxT7KoAf8qf0xGaC3g81aAuQzx7Q0GlgPoJ?=
 =?us-ascii?Q?CXGGcZhvDABjUwWFn63vm/G+XMnUZQOzqsoDmdpMNJrz4ve9n72LFTORx/v3?=
 =?us-ascii?Q?e0CqB3IlEJPsf5yeGRysTT6JRyYhX8Z+mJUI4yYsxkmEByIKp1o9mXHQkYsZ?=
 =?us-ascii?Q?LOHUS5CMz7X8fCNhffBxj6b+Min/4bchbyUpPaEFnsIHNauRmix2DTwa/L6c?=
 =?us-ascii?Q?NdjxnFKCq9j1o/tXTCGsZKXp5h0j+6yOCKZzDYKZfyF/aweTFciApVy9H/0V?=
 =?us-ascii?Q?16KOc+S4QkyHQzYctZCknlHb1lpyYx2gtQfYX18B178tLbHKE1+mYdBL80dW?=
 =?us-ascii?Q?eXR16j4K9RtIA7YG7BEiWWbMSKT/Wxbddnixi9S/W7TURLf8mk4IL4EPPI9p?=
 =?us-ascii?Q?wgrvFfRtdS+mdONTk5NwmxsvMi86zDEgJAbFOTCd+TTOqBk7D9/Wa9u5cG2I?=
 =?us-ascii?Q?qgkefPFTN6LofoVu3h4TExwxWFWaVkKqWLNMSCyZu4vC+uv99ndHuzeFPoG7?=
 =?us-ascii?Q?NvVbr8JcXcXCZc7zFCPCZa/w5llxUaUDNrhnVEwmNXq7Yg+alwhZfPAZRMx3?=
 =?us-ascii?Q?PhFz5PHnnVi3x/pRzXAR3HF4AU4Izorro0XcY3XBz6FXGyiAv26WEEUc606Z?=
 =?us-ascii?Q?r/Nynd8Y1D5B3Vq/d73vNMUw7T2PILm50YtogruN5+A8hWqnu6TfEH/tWQI2?=
 =?us-ascii?Q?+T1AhD8kNqwP8FxwgUn0G5yGfX0IJp+iCWGQ8Yf79TDfwsH3NZ82LvjWkXZb?=
 =?us-ascii?Q?R3mqGgEOH9LTRPaVlWZ1mUye4+9zIo2BaqopPU9LQS/CtldSudYXsQuRp6tT?=
 =?us-ascii?Q?YnAGrxp4Gva5yC7Qqtvodbfk5CdgHwgY3brn7s+VlCl6lJv/1cX51Apo2hXV?=
 =?us-ascii?Q?WLa2TbLPasIliG1W47sCcmHbiN4RM4sbQJ8EFX70YcBzxVTCwC4UIoEqdO9T?=
 =?us-ascii?Q?Y2gI6YVAhw4GIMhbU6A=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(34020700016)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:29:26.1612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f15fac01-01ec-4926-2f82-08de1b7c43ef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7142
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Nov 2025 08:29:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19223

RPMB is a secure storage mechanism used to store data in a separate
partition of compliant storage devices such as eMMC, NVME etc. It is
provided by TEE's, including OP-TEE.

Add the following build options to optee_os:
    * CFG_REE_FS=3Dn -> disables the default REE_FS, this is so that
      RPMB can be be demonstrated
    * CFG_RPMB_FS=3Dy -> enables the RPMB feature
    * CFG_RPMB_WRITE_KEY=3Dy -> generates and automatically writes the RPMB
      key if not already written (see NOTE below).
    * CFG_PKCS11_TA=3Dy -> enables PKCS#11 API support in form of a
      Trusted Application. This commit also copies this TA to the
      relevant location.

In optee_client, do the following:
    * Add RPMB_EMU=3D1 option. This is enabled by-default, but even so,
      enable it explicitly. This option makes tee-supplicant emulate
      RPMB instead of using the actual hardware. The actual hardware
      should be used consciously since the key, once written, cannot be
      re-programmed. But in the emulated flow, each reboot wipes the key
      off, since the "emulated RPMB" is just a portion of primary
      memory.
    * Copy libckteec library files to relevant locations.

NOTE:

CFG_RPMB_WRITE_KEY=3Dy sends the key in *plain text* to the normal Linux
world. This might be OK in development environments, but it is a huge
security risk in production! Therefore, this option must always be
disabled in production images.

RPMB_EMU=3D1 emulates RPMB, instead of using the real one. With
CFG_RPMB_WRITE_KEY=3Dy, it also prevents the key from being written to the
real device. This option, also, must be disabled (RPMB_EMU=3D0) in
production environment.

Both of these options are enabled for the purposes of demo'ing RPMB
examples only, but are unsuited for production.

Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
---
changes from v1:
- move "FILES-${PN}*" lines from .bbappend to .inc
- actually add RPMB_EMU=3D1 explicitly
- give a more elaborate explanation of CFG_RPMB_WRITE_KEY and RPMB_EMU
---
 .../optee/optee-client-ti-version.inc              |  3 +++
 .../recipes-security/optee/optee-client_%.bbappend | 14 ++++++++++++++
 .../optee/optee-os-ti-overrides.inc                | 10 ++++++----
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc=
 b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
index 289ca5b5..7e4505ff 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
@@ -1,2 +1,5 @@
 PV =3D "4.7.0+git"
 SRCREV =3D "23c112a6f05cc5e39bd4aaf52ad515cad532237d"
+
+FILES:${PN} +=3D "${libdir}/libckteec.so.0 ${libdir}/libckteec.so.0.1 ${li=
bdir}/libckteec.so.0.1.0"
+FILES:${PN}-dev +=3D "${libdir}/libckteec.so"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b/m=
eta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
index f193e78b..1727caa5 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
@@ -2,3 +2,17 @@ OPTEE_TI_VERSION =3D ""
 OPTEE_TI_VERSION:ti-soc =3D "${BPN}-ti-version.inc"
=20
 require ${OPTEE_TI_VERSION}
+
+EXTRA_OEMAKE:append:am62xx =3D " RPMB_EMU=3D1"
+EXTRA_OEMAKE:append:am62px =3D " RPMB_EMU=3D1"
+EXTRA_OEMAKE:append:am62ax =3D " RPMB_EMU=3D1"
+EXTRA_OEMAKE:append:am62dx =3D " RPMB_EMU=3D1"
+
+do_install:append() {
+   install -d ${D}${libdir}
+
+   install -m 0644 ${B}/libckteec/libckteec.so.0.1.0 ${D}${libdir}/
+   ln -v -sf libckteec.so.0.1.0 ${D}${libdir}/libckteec.so.0.1
+   ln -v -sf libckteec.so.0.1 ${D}${libdir}/libckteec.so.0
+   ln -v -sf libckteec.so.0 ${D}${libdir}/libckteec.so
+}
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b=
/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
index 61a74a06..0b940e5c 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
@@ -6,11 +6,11 @@ EXTRA_OEMAKE:remove =3D "CFG_MAP_EXT_DT_SECURE=3Dy"
 EXTRA_OEMAKE:append:k3 =3D " ${@ 'CFG_CONSOLE_UART=3D'+ d.getVar('OPTEE_K3=
_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 EXTRA_OEMAKE:append:k3 =3D " ${@ 'CFG_TZDRAM_START=3D'+ d.getVar('OPTEE_K3=
_TZDRAM_START') if d.getVar('OPTEE_K3_TZDRAM_START') else ''}"
=20
-EXTRA_OEMAKE:append:am62xx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
+EXTRA_OEMAKE:append:am62xx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1 CFG_REE_FS=3Dn=
 CFG_RPMB_FS=3Dy CFG_RPMB_WRITE_KEY=3Dy CFG_PKCS11_TA=3Dy"
 EXTRA_OEMAKE:append:am62lxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
-EXTRA_OEMAKE:append:am62pxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
-EXTRA_OEMAKE:append:am62axx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
-EXTRA_OEMAKE:append:am62dxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
+EXTRA_OEMAKE:append:am62pxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1 CFG_REE_FS=3D=
n CFG_RPMB_FS=3Dy CFG_RPMB_WRITE_KEY=3Dy CFG_PKCS11_TA=3Dy"
+EXTRA_OEMAKE:append:am62axx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1 CFG_REE_FS=3D=
n CFG_RPMB_FS=3Dy CFG_RPMB_WRITE_KEY=3Dy CFG_PKCS11_TA=3Dy"
+EXTRA_OEMAKE:append:am62dxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1 CFG_REE_FS=3D=
n CFG_RPMB_FS=3Dy CFG_RPMB_WRITE_KEY=3Dy CFG_PKCS11_TA=3Dy"
 EXTRA_OEMAKE:append:j722s =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
=20
 do_compile:append:k3() {
@@ -49,6 +49,8 @@ do_install:append() {
     install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || tr=
ue
     install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ || t=
rue
     install -m 644 ${B}/bl32.elf ${D}${nonarch_base_libdir}/firmware/ || t=
rue
+    install -d ${D}${nonarch_base_libdir}/optee_armtz
+    install -m 644 ${B}/ta/pkcs11/fd02c9da-306c-48c7-a49c-bbd827ae86ee.ta =
${D}${nonarch_base_libdir}/optee_armtz
 }
=20
 optee_deploy_legacyhs() {
--=20
2.34.1


