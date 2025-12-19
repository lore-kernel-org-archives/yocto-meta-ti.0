Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1921D78793
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 15:52:00 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19797.1766159514995893971
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Dec 2025 07:51:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ItJr5zvG;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.70, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHrN312ni4+qwrwkJkrtZjeyo1YV8RZSr97FXGo0951ENKAFMQk0QAgkJetQBeK74vLLFFMdutxKOzK9ABXW2MYU9SkzU0ZH38AnDcm6vyLRdgz7xM7sWUPJhNMSr6KJX0VPDUOlzKyxH10rmgzThe3H1iptWFRxsz3G1L83Uwpy9AdZvPvIbHyRnbJ/7JsfukxHurPbupc076+Mwlds8WrdA3YXG3Kj7L/fyRkYMQ01amKFslk6+WxLXx9rbwxe+GCZzt5loTin7RNlX48VnsT7C7rcnEcyOooRSjS57s7Wc3SWwambws09UpscCKfVqyFTCJIizSwy4swlM7Y6ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XOwNI3dI3hWXJ24VA9dPXe6g60xY0BXL2H/VjOxyjA=;
 b=jKVTkGbGACcSQnYiXlZoO5b5yb6y9qsIrIZHFwKouNdEN0i+HGvGGIVgfztG4PAp6GUaw7b53GFHjAishm1Ji4LvkvDXv5iKTNTWK7PVVN0Yq9T+ukVBvgCFTqzgmWlWMYOAw7Q0v+ALpc80j1JMx2ZPQ4vSMMzRI7QfVZPiSfd3qpCV13gGvaCAF/MuEMc2c3kdgQOoI/iOYgh8Yr9Uwb4q4md8TB05nIutuCG3q66bI9CQvkuhyAPNYGWJLn+5+IadBKkGLsFmURs7xXQbTw0UzE8h7Xv+mZBbvrgcv+P/nj6lx/ye9uzOGk/9lvNZ8osKxWf5fDBH/X1+oTfjNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XOwNI3dI3hWXJ24VA9dPXe6g60xY0BXL2H/VjOxyjA=;
 b=ItJr5zvGrXSLsMLts7SSmE25abP0Yghxn/QJWl/zi22f+qfayJJVRX018pyfeDgkKIUEKjXDdmLcq/hKvU5qnCQZyv9GbdzVoQozdn+3/tvQTnsqQ8B3RmSBwRUIIKOUGUGQG2qmJ6IBzFkQ0NJU7q2GdJelqMSLhw2J6KF/lxI=
Received: from MW4PR04CA0116.namprd04.prod.outlook.com (2603:10b6:303:83::31)
 by SA2PR10MB4780.namprd10.prod.outlook.com (2603:10b6:806:118::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 15:51:52 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:303:83:cafe::9e) by MW4PR04CA0116.outlook.office365.com
 (2603:10b6:303:83::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Fri,
 19 Dec 2025 15:51:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 15:51:49 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 09:51:45 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 09:51:44 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 09:51:44 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJFpiiN1162803;
	Fri, 19 Dec 2025 09:51:44 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vWclc-00000000g5l-288A;
	Fri, 19 Dec 2025 09:51:44 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot: Update trusted-firmware-a locations
Date: Fri, 19 Dec 2025 09:51:44 -0600
Message-ID: <20251219155144.161794-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|SA2PR10MB4780:EE_
X-MS-Office365-Filtering-Correlation-Id: a1955c30-ea6a-4e4a-37fb-08de3f16856b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DH1CZcUkL7ukf6YrFlE8ewzsUgaYuxn4Z7wqbCJdQwVUBQKSe3ERuAj5lVz4?=
 =?us-ascii?Q?NtG4ZR2JPj+aAKCxXsnRUvY8XkjMWlf0veAL87z91vFyryH7zySlsgTiR2ed?=
 =?us-ascii?Q?fPL5UWa8sV6pR2VU9ENuvHdRm7+NR/KZd+7Cwcj+FFrff4EsNktLQuFnqcxW?=
 =?us-ascii?Q?5SnCwoZvwsfNz20C77FF19AjeyCqmef0hgyY4kKNiIIqfn3MUYY0zc1aiXYl?=
 =?us-ascii?Q?W6lyDpSLP07XRbd/NG062qIJVFA8O+Z7KE34hdbuKwlhlPEQYoxgsfWWYcGP?=
 =?us-ascii?Q?xc5kK4NmV2ST47qc7SuikyBJWvDYnO6DNOBc9yJjthGXVW3iT1YIH3dzqpjk?=
 =?us-ascii?Q?c0QT4I2DGnmOqAM6+Urzfvou9IHT4en4ib0zoA1woUl+5OcSUxfCpqKbe4jb?=
 =?us-ascii?Q?rM0QmXUPykOm8pc9H9zQRJal5FPvdEOA9lslOJZMUjEQmhF8HyRT9BILOf8m?=
 =?us-ascii?Q?teu0uCZUjrkntJTIP1X6fMn2MsccEuXkQzlqR1n2pHjts7EMIv+H//ocb2WT?=
 =?us-ascii?Q?6o85Pv41nobCTRHrIRiIUkATcRWtQ1OptiS/hFZBo4qANw7dVh9sdL39LB8A?=
 =?us-ascii?Q?GmApRPcOgdJTrfUSWzcpImboUQHpS1olulMH56dMt7aoAi199oTWKlptFlso?=
 =?us-ascii?Q?b5N77xqX6af5fkNA3klsHugzlCTLnI+xIGy3VX+z8cH+tCvLJM8f5yopFG9A?=
 =?us-ascii?Q?Ldnv2CEP54zZ2fNOTXS9+rrICHrsiXfv+saSSREeG1+EonXLSpjM53kJyoRW?=
 =?us-ascii?Q?SyEcJRtzRsXemFdkQMKo9dlkJ40OciRTtc7H1ElqWL1k87ya7OUply1/AYQn?=
 =?us-ascii?Q?iyOBY8D9kZ8LARvrYH2OVytJvmZyK4LvyHUi8SxdwHX7vKexq5zGcWFrQqeA?=
 =?us-ascii?Q?sacoe9+4RI4KVmFuZZs1sE9pD0tLR49kGIKYR5SsaqwKs4sr920PVZAOJnMV?=
 =?us-ascii?Q?fuFZn8n8Smzioh6quG7VXlHI4yVqpYCBRyJAL7vVQR+R5wp8G/ujfbrGFlyZ?=
 =?us-ascii?Q?1wQEDL3Bwtcn8dT8Ai/HA7Y6ciRArppbisU1iBKGVoVY1Su0p0sczXSE7vR+?=
 =?us-ascii?Q?TIsKYML1MikOu6Lm+CZEQsyRR5seIzhZNk7nsCbm3xZZuy5GXd38FViKNOAl?=
 =?us-ascii?Q?21INL9WhDeQuJ1ZzcEBUQBrazcE6rz7IZBxudSEOxuXCqlT0Xy1B7R3/pTjk?=
 =?us-ascii?Q?TEGvl5iEEt1VhHAB3BOnduESrmDbylJgFv4ceGVpFOGodL/Gr6StPovrnKym?=
 =?us-ascii?Q?RKC0F28TGPTG6/X30arzJ+ykdx+cfqsA1r8aeTM7HUwTwyowG2BxMsdy8SLv?=
 =?us-ascii?Q?SiRVS9aI+4IDtwSaRnFuCeOn/jC9yiw+tIhzw3suEeGjYOkPSwqBb6ev0oKW?=
 =?us-ascii?Q?ub87jsJ8iZ34JQHBqTIDKZcJAyPl0RZAcKoVdcPvZnS6OBwE7C2Rfpnmhg1R?=
 =?us-ascii?Q?xNj+l6qOEL9dnjiviN2oZNQMhbQIsQ+l+QMZifj+7mS/Up5FU56B1ErLejS4?=
 =?us-ascii?Q?UN9Y8sim/m56Q9F7dgO5uooI5ymOB5GJPpCFb/m5jQtP+P8GdFLO/spjbTWt?=
 =?us-ascii?Q?EtKXQC4y5gfKjb3zXJE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:51:49.2189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1955c30-ea6a-4e4a-37fb-08de3f16856b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4780
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 19 Dec 2025 15:52:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19376

A recent change in meta-arm installs all of files into a
trusted-firmware-a directory.  We need that added to the paths for the
PACKAGECONFIG settings so that u-boot can compile.

Take this opportunity to also break all of the firmware paths into
separate variables in case we need to override one of them in the future.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/rec=
ipes-bsp/u-boot/u-boot-ti.inc
index 277ec7fe..92ec5ca8 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -64,10 +64,18 @@ PLAT_SFX:am62dxx =3D "am62dxx"
 PLAT_SFX:am62lxx =3D "am62lxx"
 PLAT_SFX:am62pxx =3D "am62pxx"
=20
-PACKAGECONFIG[ap-trusted-rom] =3D "BL1=3D${STAGING_DIR_HOST}/firmware/bl1.=
bin,,trusted-firmware-a"
-PACKAGECONFIG[atf] =3D "BL31=3D${STAGING_DIR_HOST}/firmware/bl31.bin,,trus=
ted-firmware-a"
-PACKAGECONFIG[optee] =3D "TEE=3D${STAGING_DIR_HOST}${nonarch_base_libdir}/=
firmware/bl32.bin,,optee-os"
-PACKAGECONFIG[dm] =3D "TI_DM=3D${STAGING_DIR_HOST}${nonarch_base_libdir}/f=
irmware/ti-dm/${PLAT_SFX}/${DM_FIRMWARE},,ti-dm-fw"
+ATF_BL1_PATH =3D "${STAGING_DIR_HOST}/firmware/trusted-firmware-a/bl1.bin"
+
+ATF_BL31_PATH =3D "${STAGING_DIR_HOST}/firmware/trusted-firmware-a/bl31.bi=
n"
+
+OPTEE_BL32_PATH =3D "${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/bl=
32.bin"
+
+TI_DM_PATH =3D "${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/ti-dm/$=
{PLAT_SFX}/${DM_FIRMWARE}"
+
+PACKAGECONFIG[ap-trusted-rom] =3D "BL1=3D${ATF_BL1_PATH},,trusted-firmware=
-a"
+PACKAGECONFIG[atf] =3D "BL31=3D${ATF_BL31_PATH},,trusted-firmware-a"
+PACKAGECONFIG[optee] =3D "TEE=3D${OPTEE_BL32_PATH},,optee-os"
+PACKAGECONFIG[dm] =3D "TI_DM=3D${TI_DM_PATH},,ti-dm-fw"
=20
 PACKAGECONFIG:append:aarch64 =3D " atf optee"
 PACKAGECONFIG:append:j721e =3D " dm"
--=20
2.43.0


