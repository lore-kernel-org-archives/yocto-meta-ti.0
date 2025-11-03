Return-Path: <s-joshi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A96CFCCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 05:41:17 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14257.1762148469241220880
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 02 Nov 2025 21:41:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=al3lOWjJ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.41, mailfrom: s-joshi@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYZwS/ZVG76WCKvw3JhG2Av1uZeumJ3W1GkBCMMEc85oSLmubF8NBTipynHQ5oSAqp52V5ZJ6jFYmf2Cqnwkqr9hFa0VlmtYWZux3AwP4PKJMzPrmOiQGHnhSr0+e7dS/iFL8VFcAhZIPoV/lNtHu/zWh6uXH4baSGrX4bv8NoZvpsKu0+O9RTWtH6YhMIfx2QDJX8WVqp+Lg9JKUJKMAIGCiiqlNFusFrNao+WU/hnuY4xLhIimGSR5HJC9/oeM2ujSU8Z/5Eo8Pddgbq26crDYHr82M7ArsAbg0gIR/Q8Uhubc7v5KkibMNQHNJcaRSH/m43wu16GLjdecdIEXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpDP3oU1HMjtStsRRg7QAMff9ou2eVA7Qn4nVu60fEw=;
 b=bAeET935Pv9HZv34YJmRBDFyBHIn+jslO+mBLqFHQNA1gNFBO3IFB/5W4S5+idk8hjgTs1G57fWrkJSMEpY1SfO7/3eILIi7NasyBNB6FTYwyz81ZHoh0whtxKytI9I0QpvsZMEFojn0kQ3ZqWfZMeajqBzBbQJW7et5ThFitQsw4mT7T5ANK40DGyb0Dr9KtpnNem66n55ES4weAvJ7HkGh06DUlUmhm8dQq+lZw2BtAhXVyyc8CLam6j/jK4dOPdJxNSEfyVtS6Z8ILgqwxrBsWFOk2ZQ2QREdKKK3f4Ske4gzQz90ukqMnYx/2ZZkEJ/oiyR4w0suQmXPmlHu7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpDP3oU1HMjtStsRRg7QAMff9ou2eVA7Qn4nVu60fEw=;
 b=al3lOWjJHFLjZL5BX8uoVuA/L/e8OnjSmI7Kgey+8JwPlJ0NlCapHdBpYBragGUQELm9Eq05JqfuHtui3fIkAscRgekvMlE1Y83toMc6SYxTdOjOWsrqA53s6K5YioAjR8CY0KTJ/nwAAvdP1A0qNjtX9p8R1j0f+5aUhXQcz08=
Received: from BL6PEPF00013E06.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:7) by CY8PR10MB7194.namprd10.prod.outlook.com
 (2603:10b6:930:77::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 05:41:06 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2a01:111:f403:c803::1) by BL6PEPF00013E06.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 05:41:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.0 via Frontend Transport; Mon, 3 Nov 2025 05:41:04 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 2 Nov
 2025 23:41:02 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 2 Nov
 2025 23:41:01 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 2 Nov 2025 23:41:01 -0600
Received: from localhost (ula0507357.dhcp.ti.com [172.24.233.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A35f0EW3607686;
	Sun, 2 Nov 2025 23:41:01 -0600
From: Suhaas Joshi <s-joshi@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <kamlesh@ti.com>
Subject: [meta-ti][scarthgap][PATCH] meta-ti-bsp: optee: Add flags to enable RPMB and PKCS#11
Date: Mon, 3 Nov 2025 11:09:41 +0530
Message-ID: <20251103053940.555954-1-s-joshi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B070:EE_|CY8PR10MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: b5bcada8-4a24-4043-2c4b-08de1a9b949a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?usoizTkbPPxb9l5c8TSiS2glab1W8q+NZJgn6tIBdMuCUUWYab7LA0BPmtUs?=
 =?us-ascii?Q?sDNylMWWqpjtYxGzywJi5Gi7Ko1yYX6oWKojTo8jwIg6rO9vgkMzteVx9fwn?=
 =?us-ascii?Q?l3e06KMtPx6NqdSmlzuLHczMEg2F/T5lKk6407RtdJ1X7sXrjftQo7ULYdFF?=
 =?us-ascii?Q?7O1Re3Nw2k9x9I98Vt6O+dTiuzRL7cq/Yd99FWK+9bojfWfWRDGn50hg7xlb?=
 =?us-ascii?Q?hEO1QSfHtj6H5dEAf+VbSBcB9vjaBVyFDmfKpxUwAvu5FW3YQs5YhN1RRssy?=
 =?us-ascii?Q?Bstos9J+MqNhRLKUpcUH0qsxwbAgEbgAadUIqsSJaRIdOoH+nVBazsP2ZHAr?=
 =?us-ascii?Q?P5QPEkoCjjT157yqsMxvWfYQO4LLzHBE4xh41PNNTwzqydQzKnCrMTuty95Q?=
 =?us-ascii?Q?9YCi6iFfNRTSjgE1gA9r4Dk5Yyh6JcsncTSzrY21KSAnZ8nIqG2ZzM9/Vfu4?=
 =?us-ascii?Q?lwiZBfEWgjgGHVOPQDhgXzlEUfZAI5CoxbH7g6FkrE77oJ3U/mXlSFAWfdCY?=
 =?us-ascii?Q?TP/VZ7ZgHUjLRXKinpMRqQ7a879xBNK7jI7MjjOvaJMPfRnBWMI9ARO5P8pc?=
 =?us-ascii?Q?XvPrmVHiBDcIhmpBUiWuwjpUEbw9cPY2+tmNeoh1YaRbBJITIXof5DByeJs+?=
 =?us-ascii?Q?ZFpKNs1dwVYYwSFYmgfTc3XLGVYJc9XwgkzT2l2TGvo80N2GEyUSC+DYcC2r?=
 =?us-ascii?Q?uMC7KZdAZG6uuPpTI9Lad+8HXwHK9/n0IShbh0MmLT9Jmyx5JRzsJD8JGr7T?=
 =?us-ascii?Q?LXKevudBMAtc/qdFHBTcI9nssBGbHJDootXoRuPLIZnNPCbE+gE+4F5/8TaS?=
 =?us-ascii?Q?3cQEIQHG+tV3G7u8kk7yHhEyUTGoHpKAphI+VBwOnmNYkcUOf7r98JANrwBY?=
 =?us-ascii?Q?6Ye7j9LgOH62KAVR/ch1s0FRZ6Y5v4gqy7yf4AvrYewV1skfQYAVS8q8MG2h?=
 =?us-ascii?Q?NmWD0e6I1o+XlzdQYk5WMjga9iUZvHnLkXi+Fw/EC3mTwz0bNbmfth1ELhGK?=
 =?us-ascii?Q?XgnbcoGAqg90/4aesos7E693+oQpkzzGbDPCLoFDIMaDKfM55BvthRnq6Qd2?=
 =?us-ascii?Q?ogQzf4kNlLqclC3zM0tvtVenxVuc38PMB+k24LPaFJClKN4kYlm75kEz6KoD?=
 =?us-ascii?Q?+w1VpiKqLf2BXOfKvMuRDXRrwb7+yCm6HSws6DruroTAoDEyRHc89UG5F4SF?=
 =?us-ascii?Q?/PpHMf4lq6Vmgi/7MPLZheDoItpq5/zcx0Ndk7C/FA1Wwx45FRDSITh98eTt?=
 =?us-ascii?Q?sr61AhixvcXeBEUcd/6Zee46o81qF0r2rcpNP1yLoj/w6cO4ULb68nqY74tu?=
 =?us-ascii?Q?5OJp5hZ3ChoLS+bRVm+r8rK64HgJ+Qe431ar6AU3WOby20+vfXJtcctiY+oS?=
 =?us-ascii?Q?kCXfcCKspwyDFj43c3uuu3TNnMmfxpVw8APtO8Zw9OGOC3OrpEnn6qA/N9yX?=
 =?us-ascii?Q?tYu4FJPLaJiTeMlFqmsp52yJ2PJGrv1/FJDJaAsG5AeEB28InvC94Vgy4TGf?=
 =?us-ascii?Q?D5lC2+TZrq0X8jNig7WskJDmmgoOMGXFJZsumLqrucTyWd9vxY2L/BMu1Py4?=
 =?us-ascii?Q?dYWbjsc2KSP/qup0vT4=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 05:41:04.7422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5bcada8-4a24-4043-2c4b-08de1a9b949a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7194
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 03 Nov 2025 05:41:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19216

RPMB is a secure storage mechanism used to store data in a separate
partition of compliant storage devices such as eMMC, NVME etc. It is
provided by TEE's, including OP-TEE.

Add the following build options to optee_os:
    * CFG_REE_FS=3Dn -> disables the default REE_FS, this is so that
      RPMB can be be demonstrated
    * CFG_RPMB_FS=3Dy -> enables the RPMB feature
    * CFG_RPMB_WRITE_KEY=3Dy -> generates Auth Key during first access to
      storage device. Note: This needs to be turned off for production
      builds.
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

Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
---
 .../recipes-security/optee/optee-client_%.bbappend   | 12 ++++++++++++
 .../recipes-security/optee/optee-os-ti-overrides.inc | 10 ++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b/m=
eta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
index f193e78b..07db2955 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
@@ -2,3 +2,15 @@ OPTEE_TI_VERSION =3D ""
 OPTEE_TI_VERSION:ti-soc =3D "${BPN}-ti-version.inc"
=20
 require ${OPTEE_TI_VERSION}
+
+do_install:append() {
+   install -d ${D}${libdir}
+
+   install -m 0644 ${B}/libckteec/libckteec.so.0.1.0 ${D}${libdir}/
+   ln -v -sf libckteec.so.0.1.0 ${D}${libdir}/libckteec.so.0.1
+   ln -v -sf libckteec.so.0.1 ${D}${libdir}/libckteec.so.0
+   ln -v -sf libckteec.so.0 ${D}${libdir}/libckteec.so
+}
+
+FILES:${PN} +=3D "${libdir}/libckteec.so.0 ${libdir}/libckteec.so.0.1 ${li=
bdir}/libckteec.so.0.1.0"
+FILES:${PN}-dev +=3D "${libdir}/libckteec.so"
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


