Return-Path: <s-joshi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74026CD5BC1
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 10:42:27 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20772.1763030538266718877
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 02:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Af3cRaAi;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.8, mailfrom: s-joshi@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+ss8Dnz68Nq0BQesVv0X6W0GvcYBMnRzU5eFnsDJdvbSX5O+Ekd6g6/fnRZahMkQxM3L39CA2yWeN5mmgriZXuf4znTOA8nSWhmjnmomZFD2AXhYfW3og2IQy6h8LWH3MphaF75oTquKdcPjL9Qq27iqC4838+QWnXDmHbmgI1jZeX8GtMR7rozQGU8QcrbXyDABIUxYTn+utJwfxGm3UkOZ6Ww725n4quYysB0AG5IASTVc0gYbmTzVvudNmb2GhR1dlkXhWby03d9sgN0yWuV/Fs/y+iz7ZSbY1rHqOVE9uP2aRQrcWL/COdvoGlDs9uBtIIm0zyWlfKMr+iAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WdoTd9NkTANstnUDRvz6iAMElUdDf1YxBuv1QSJbb4=;
 b=qKpm8eICjI31rXPeV1j1M4ye7RTAZ4xwBGQ53mbTUDW8dW8CJebYZaRGiY5Gb4HwDgOPhD7iIwOt+IoQAVu5Oxz2lSlPsnRjHkvMWCYCrWOTl4naRcz5bmfe6kXP5cpQ4YcBBx+BoisHA/jL7npBkgO2z5vmz0/LkFetdprEQYU2Vc90T64mPwF+jxeJX9Nf7kRGHf0nFEwZORqejlugcmUQmdBWkZb6fUe0DUCne0Fo2RpplVoMwdCsmcJ0dwVNRur8ItlPYzgRjxXsTeMDIYP6G/vUxV+Dn/vvLQTal4qjfQa0Ulx3EIskeMJyjR4IFXYcF1d3eIr5zF7EX9TqkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WdoTd9NkTANstnUDRvz6iAMElUdDf1YxBuv1QSJbb4=;
 b=Af3cRaAimZiiEMgMwVI3XubSpQJGFqSnuKU8HzeZVrodneTZoud9BrtXHxRk+TizZFmiEsJzECO5hfaMEA8w6DV+k+GAsF051K+o9KUOM8jaiAACngTD8Uwx2sw+bi0Nl/S3cnb9aWc+P0AQqX8zGr44qI1lMaqbs0+0oJqnd9w=
Received: from SJ0PR05CA0106.namprd05.prod.outlook.com (2603:10b6:a03:334::21)
 by IA3PR10MB8066.namprd10.prod.outlook.com (2603:10b6:208:50b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 10:42:14 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:a03:334:cafe::23) by SJ0PR05CA0106.outlook.office365.com
 (2603:10b6:a03:334::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.5 via Frontend Transport; Thu,
 13 Nov 2025 10:42:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 10:42:13 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 04:42:10 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 04:42:10 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 04:42:10 -0600
Received: from localhost (ula0507357.dhcp.ti.com [172.24.233.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ADAg86k093855;
	Thu, 13 Nov 2025 04:42:09 -0600
From: Suhaas Joshi <s-joshi@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <kamlesh@ti.com>
Subject: [meta-ti][scarthgap][PATCH v3] meta-ti-bsp: optee: Enable PKCS#11 with REE_FS
Date: Thu, 13 Nov 2025 16:11:56 +0530
Message-ID: <20251113104156.1436579-1-s-joshi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|IA3PR10MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: a0a8740b-9c05-4191-f44d-08de22a14ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pLeOVIA4Lt70fZYAJQS63ySzaFwlEc5rIFB93NBcQ2BgYAwTVUAg/yjGj0pB?=
 =?us-ascii?Q?u/5VxdJhU34JaI4j1+L8QoG0Lhp2IhxnWNUKOi82JBv1bE1rvjE3hgb8Pyrh?=
 =?us-ascii?Q?PDaz1vT+12/xa7Ou8uhOw9R63bqqF5YlgCymHAN+vveFx3WrHpjnD9k2Z4JZ?=
 =?us-ascii?Q?9mj+0TquQuIRXZGMrR/ozA3trDEwxWD1ssk7iWIRK6O6BkCXvxC0LyfNG5Su?=
 =?us-ascii?Q?E0Dtyu5qOcFEhpS6ZxgNQruQ+ma/W7ESbVd3JElCjbm7Bk4qBb54d5BVZsC/?=
 =?us-ascii?Q?qDnLSn2ou2FaiEyhT89gb4WVdYovmhhvCSVfvIfLXSpkyXdHFjTmeDv630XZ?=
 =?us-ascii?Q?niWN5NWQwaxFBBPl/GKzgL1swPtJMHpCOPAJXXo1ETTzfpkatSUqpm9kTb/p?=
 =?us-ascii?Q?7IIj+sDKYK8EuaN0zccpRwY8Bx65WyajiD/F9QbpUSB5YOSxgpS5dEvVoX3T?=
 =?us-ascii?Q?7OPKE1yR/QBx2fVRYarIeLqXZO+0luVlUBIoqfu/GYo/XNda3C9oZS38VpI6?=
 =?us-ascii?Q?9KYe+S47bZgVARp7nf+lEG/B4JEFY4EE1r9y9kINfbda2pSkeD841JHlzqz7?=
 =?us-ascii?Q?qxC8ZWVlsSpwcftSc2hySymhuHAl7hKQCYb3XDLA2JDePz/bkS3+unGgbmMS?=
 =?us-ascii?Q?ceMx2mSue0C5VxbQFIA2BBTaPI4nZCCmaZNBCCrN1H8JIgaGv1dx8YC04lJ7?=
 =?us-ascii?Q?vrGHNXG7D9I7eWNGW2O5F4+PZ0y6dGx/MGJTsMirNMC/zSd3Ynl+mZTYkon1?=
 =?us-ascii?Q?nQzhSlU6tFA/3oddwbs30b8evBNM38tvTmsUxLQQJkRJQ8+w0fQ5h/MQUZ2j?=
 =?us-ascii?Q?01QPvrURRQQEU1JyVotMkHV2BOtMV8FWzUKwkDXlJvBjiq/bXPKNal6aA12N?=
 =?us-ascii?Q?xviqwCE6ctZOEz1UNSbEt8u2sa+gzCoVPxwvBYE0akWGtgIbINMd+MWUuvle?=
 =?us-ascii?Q?Xt1STvrfS3EZ1KLNXbwjOeKksZ/RkvIG6Pex/OgtWgXHnhpmP/umHJfurb1j?=
 =?us-ascii?Q?/UXvOA9VLEn2VftwooYEW9kNM/pgMDDeeEwfxVt7hD7fWa15mEUZznRA4hfk?=
 =?us-ascii?Q?gn7WMxV+2lbDJN20Z/gMkQGgvFbXJjxODYOkhpj7MQpqqwMJPpqh0Rq73j5z?=
 =?us-ascii?Q?b314yFNpdqlXikb+IhEkksAOw6CIhqdZeBCHdcWtb8RsyCUQQWxeiOT4wB/T?=
 =?us-ascii?Q?TJUtovVsGhCLhoqdhCHBDJ/oA/aF2252Q5DrH0beeXf61TuHsFN2C7Qx+8ba?=
 =?us-ascii?Q?9mzTfh2QH+z9QhZXRcBIwVl40QGCCcsOoHzmRgSjTH4HenMJ3eP8/IoYyYXN?=
 =?us-ascii?Q?LEKP4IuuppxvwXWZ1V4OPM1SWrmoq+tA6MUJqYtEIFo8KW+U2G6t4bwnCjOG?=
 =?us-ascii?Q?+WxspvFIenkRZTVLHsXWhpT6v19MCiz52BP/NvjluK3O6ZMzI8rkm7hcuMf7?=
 =?us-ascii?Q?txEphmjNd6EnlUrSlp+Tsyd0wKu83KvfOzUSulXKv9+R37OlZ03BWQ1Zlsch?=
 =?us-ascii?Q?pZsj/FWyVGOsxNG65ujlnYsC6M5y0G1RCfEo?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 10:42:13.6884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a8740b-9c05-4191-f44d-08de22a14ea2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8066
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Nov 2025 10:42:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19266

PKCS#11 is a standard that defines an interface for applications to
interact with security modules, including OP-TEE's PKCS#11 TA.

Enable PKCS#11 with REE_FS. CFG_REE_FS=3Dy is set by default, but set it
explicitly for clarity.

Further, copy libckteec library files to the filesystem. These files are
required by pkcs11-tool to interact with the TA.

Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
---
v2 -> v3:
* As Andrew suggested: RPMB with CFG_RPMB_WRITE_KEY already enabled is a ri=
sk.
  Therefore, instead of enabling RPMB, enable only PKCS#11 to work with REE=
_FS.
  This allows users to try PKCS#11 and run OPTEE secure storage examples,
  with REE_FS.
* By Denys' and Ryan's suggestions, move extra logic away from .bbappend to
  optee-client-ti-overrides.inc file.
* Link to v2:
  https://lore.kernel.org/yocto-meta-ti/8ad8d349-0841-497a-91a3-340ec08a3ea=
5@ti.com/T/#t
---
 .../optee/optee-client-ti-overrides.inc          | 10 ++++++++++
 .../optee/optee-client_%.bbappend                |  5 +++++
 .../optee/optee-os-ti-overrides.inc              | 16 ++++++++++++----
 3 files changed, 27 insertions(+), 4 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-security/optee/optee-client-ti-over=
rides.inc

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.i=
nc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
new file mode 100644
index 00000000..1ac1684e
--- /dev/null
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
@@ -0,0 +1,10 @@
+do_install:append:am62axx:am62dxx:am62pxx:am62xx() {
+    install -d ${D}${libdir}
+
+    install -m 0644 ${B}/libckteec/libckteec.so.0.1.0 ${D}${libdir}/
+    ln -v -sf libckteec.so.0.1.0 ${D}${libdir}/libckteec.so.0
+    ln -v -sf libckteec.so.0 ${D}${libdir}/libckteec.so
+}
+
+FILES:${PN}:am62axx:am62dxx:am62pxx:am62xx +=3D " ${libdir}/libckteec.so.0=
 ${libdir}/libckteec.so.0.1.0"
+FILES:${PN}-dev:am62axx:am62dxx:am62pxx:am62xx +=3D " ${libdir}/libckteec.=
so"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b/m=
eta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
index f193e78b..0cee127f 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
@@ -2,3 +2,8 @@ OPTEE_TI_VERSION =3D ""
 OPTEE_TI_VERSION:ti-soc =3D "${BPN}-ti-version.inc"
=20
 require ${OPTEE_TI_VERSION}
+
+OPTEE_TI_OVERRIDES =3D ""
+OPTEE_TI_OVERRIDES:ti-soc =3D "${BPN}-ti-overrides.inc"
+
+require ${OPTEE_TI_OVERRIDES}
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b=
/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
index 61a74a06..ece8c50d 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
@@ -6,11 +6,11 @@ EXTRA_OEMAKE:remove =3D "CFG_MAP_EXT_DT_SECURE=3Dy"
 EXTRA_OEMAKE:append:k3 =3D " ${@ 'CFG_CONSOLE_UART=3D'+ d.getVar('OPTEE_K3=
_USART') if d.getVar('OPTEE_K3_USART') else ''}"
 EXTRA_OEMAKE:append:k3 =3D " ${@ 'CFG_TZDRAM_START=3D'+ d.getVar('OPTEE_K3=
_TZDRAM_START') if d.getVar('OPTEE_K3_TZDRAM_START') else ''}"
=20
-EXTRA_OEMAKE:append:am62xx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
+EXTRA_OEMAKE:append:am62xx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1 CFG_REE_FS=3Dy=
 CFG_PKCS11_TA=3Dy"
 EXTRA_OEMAKE:append:am62lxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
-EXTRA_OEMAKE:append:am62pxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
-EXTRA_OEMAKE:append:am62axx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
-EXTRA_OEMAKE:append:am62dxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
+EXTRA_OEMAKE:append:am62pxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1 CFG_REE_FS=3D=
y CFG_PKCS11_TA=3Dy"
+EXTRA_OEMAKE:append:am62axx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1 CFG_REE_FS=3D=
y CFG_PKCS11_TA=3Dy"
+EXTRA_OEMAKE:append:am62dxx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1 CFG_REE_FS=3D=
y CFG_PKCS11_TA=3Dy"
 EXTRA_OEMAKE:append:j722s =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
=20
 do_compile:append:k3() {
@@ -49,6 +49,14 @@ do_install:append() {
     install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || tr=
ue
     install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ || t=
rue
     install -m 644 ${B}/bl32.elf ${D}${nonarch_base_libdir}/firmware/ || t=
rue
+
+    case "${MACHINE}" in
+        am62pxx-evm|am62xx-evm|am62axx-evm|am62dxx-evm)
+
+        install -d ${D}${nonarch_base_libdir}/optee_armtz
+        install -m 644 ${B}/ta/pkcs11/fd02c9da-306c-48c7-a49c-bbd827ae86ee=
.ta ${D}${nonarch_base_libdir}/optee_armtz
+        ;;
+    esac
 }
=20
 optee_deploy_legacyhs() {
--=20
2.34.1


