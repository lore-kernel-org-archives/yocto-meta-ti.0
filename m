Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B9FCCFA07
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 09:23:35 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5647.1762334609197392479
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Nov 2025 01:23:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=xKIbfV5o;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.59, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2408VObiaKpByy3eRwS8ZpgF6pYB5b+a8xvCwVBD/ON08K3EwG2+mN/vOmPmROmoE6x8umcfavL5dpynLwaELcvboePR1ng8+99ASNceLuW+TrizUwKQ82GAiOveomgeuePsoubk++7IdF7VK7lmU5qWJQUtZh9ygoLMOloY81Rnf8Twl1XD1YaJBrmTVTLGHS1Brz42RRJRnmSc9g21CReW558VvmwhfED1PcXYflBc+zLgD/G+gA7JNb6x/gPvEO82ET23k7epKjVBzJdO1+pUs15h2BBGkSmfS2bnKZ/99TDHM3QBykyvvfQOsOQV4wK8aCbwGDTofKJ70FVmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3AU32UsJrMNiV91n/H/3mIRBTzlDsX/qduuMprlPGw=;
 b=fjmqQafSSGk5W7O8A1f3J24pK+/OAqVA6KNBahgdYj1I5WZEUfm+ZnN8Fhyit4hFVNcB0glUVQeH9hLx5ka79WywyBKPIIfO32k25hoG5yNo+PcPs12AuDL/pBOYB94INyLHg836K7IrMcrcfmVujvILbua0f+mUhzqhtyYrDWMGZjmiWt0GTBU5PWEHSA44+zGJDys8NVQGC61cuDEWyRijX9xS7vxQTKeK0/5CuUoTs3PpvDiTsYDK2gwaG4C/5Us+0/PHmUsfB2ltlK4jC2EyF9aG15Mg6O8Pyg4x13Joce2CuaQKk2Im/DIs6z/ygq0Dq6GMkGbUcqIpXCiVNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3AU32UsJrMNiV91n/H/3mIRBTzlDsX/qduuMprlPGw=;
 b=xKIbfV5obWI6spwc+NXo/AXIw4dwEIAyVnnNkx9V+TuPPgUVwPrTxRIrBlV7A3CNGbepa8XLyEKwo2P/mCy6OhyXSZZW1m/FhKy3eBugsr0HG8tT1J6UIyoYH7zvNNkCkl5BNrFddrVJNu6DiLsDanwKVTRRU021g8IPqAC3xAY=
Received: from BN9PR03CA0766.namprd03.prod.outlook.com (2603:10b6:408:13a::21)
 by DM4PR10MB5968.namprd10.prod.outlook.com (2603:10b6:8:aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 09:23:26 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:13a:cafe::43) by BN9PR03CA0766.outlook.office365.com
 (2603:10b6:408:13a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Wed,
 5 Nov 2025 09:23:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 09:23:25 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 03:23:20 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 03:23:19 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 03:23:19 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A59NIaD3481935;
	Wed, 5 Nov 2025 03:23:19 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
	<reatmon@ti.com>
CC: <afd@ti.com>, <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>,
	<j-sahu@ti.com>
Subject: [master/scarthgap][PATCH v3] recipes-bsp: Add TI PCM6240 ADC firmware recipe
Date: Wed, 5 Nov 2025 14:53:15 +0530
Message-ID: <20251105092315.2050534-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|DM4PR10MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a23c58c-e8ef-4096-5e31-08de1c4cf900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lNC8QR0t5RVwDFZlyOX0S4CrOfUuaMlWWXnFPp7+Rq0uTho1Yr940gfeY4Jy?=
 =?us-ascii?Q?hQSlOPl7ejox91rRqahYyEwozjGwsZdYy8usQrJTFcBdx4jZiB5//qHDCd74?=
 =?us-ascii?Q?tFTNSmk1HzgGZCuP6ilJNvgL31y6V3bfWQl7diU9eSRErdx69KJNjIc4Pmmi?=
 =?us-ascii?Q?kJ5HBscSIlcbO078FhyJl1YG/lTuxjjOFa4OfPadbjNIlyM2CDa6HOkmaWGW?=
 =?us-ascii?Q?IpJhWnTpgM78Pqi2fC6AGEYCnhw7IQzeBdI2KELq7wrO+1Z58fJwAmywAJFd?=
 =?us-ascii?Q?Lz2ShiIA2ShcUw4KZzAt9QFtgStdjaa7A/6WwE3aah2ZKKIGtNPWlPOGgSS4?=
 =?us-ascii?Q?aEIuJcIZsl2YeSb2/l/RvrxPeN+sOkn62WjcSmTf+bDmFRWt2DvkJvuiO9Tf?=
 =?us-ascii?Q?RzTWEborCPd9cR4Ip4bDUQLzdKasQKKl0IYuMlL8ExSBSW69lBoh5RK+YVWf?=
 =?us-ascii?Q?/ebZoIF01kcVql82MTzuBgAxcIsRo/7VcXf/RcWz/67XDQxo7pfdIelI62vN?=
 =?us-ascii?Q?05tkgT88lqHZV8u2jGz/QR+iA1RNQRjEQyZcgxk1tu0qJZF4qVqjhoPhz2ob?=
 =?us-ascii?Q?sfnOEctyc6GmzLwdaG3J9iUzwYQ2fm2gPLFj7h47DaogNrLc3WlCnEmpawkF?=
 =?us-ascii?Q?E5E1bPqgz2wzxXEP88eK4yjG4O2mMxlKMTliHxJD906h/kkQz/r3OFF1CmhT?=
 =?us-ascii?Q?4pcPFzYUFX4+7qE6cCaIKH8HgaKZ3Xl0BsRTbP4laMd9+HsvcsEzfh8qBmMw?=
 =?us-ascii?Q?fzwYfKc2P5Y5CBP6E2AG0uSxqkfMdk4wQ1Kyxf0rBfNfMLsigZ9xPiUCx3K5?=
 =?us-ascii?Q?BJb+5CVGFv7lhFf6moRfziAXnRyVHlTYO3kPd4kgaCmONGEzQIadCvF2arNx?=
 =?us-ascii?Q?yb5iJGr55xa3d3DTzcnq5XfnKljUkWi+XlTtTRR2cN0ch8mVibZf4jHds8+v?=
 =?us-ascii?Q?LkxDFCKQo+MVGeJvEx2AIiWU1AXS/174XGyhjJvRK2A4Ycj1hJ8hnrq3rwvD?=
 =?us-ascii?Q?cKKh/e6MRhOpKHCTSgXMCOoB0iuqW68oJpD2T9pZVrL2BeIWrMGTqr4CfZas?=
 =?us-ascii?Q?29XpVpSWzJZBt1Sh+QFb22prBJaa3O/fXAmXSgQOdZnQkeJLniziAtMhZD0y?=
 =?us-ascii?Q?jNwx8kWIu6hWSyhtbKs7MQErWOyOyi5B0+LVzA5XKlqBSsuBtyczdJQwXDCl?=
 =?us-ascii?Q?1bONJib7m6B/SjfxVSL8/6ODU4GAVAZVeIvrbj2w+q0ebyRM+PHLru4XcApr?=
 =?us-ascii?Q?9fp8jEqBZ4G6+QKYjoHNj/D5UrqYgXoPJlfAZI6/LECuyra5YCw/CYhy1wfl?=
 =?us-ascii?Q?rrh8r9pyOJXgQe+LbrsFpR4ygFufRQiI5RcfmG5XYLCWRrBnd9NEXMu+K/qR?=
 =?us-ascii?Q?zEr3GVHx/LMSYAcCq8fRW68cYwzQ6Wjj3cPSIAGUW9CA1wf7lPZmqQgmm/H7?=
 =?us-ascii?Q?6X4/MvSe1bLGEmk3WGUcwshpdZhVCCcxqDb3sZNW2jRLImDdWDe/UTYEvDD6?=
 =?us-ascii?Q?RRyt1DXbMuj0Y0ZWAR2KETyiX+v0jMT7/gpvQr+NT36x4W/hml58jLDIpdyA?=
 =?us-ascii?Q?1ZQOvtvLiddobIuCBa0=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 09:23:25.2611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a23c58c-e8ef-4096-5e31-08de1c4cf900
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5968
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Nov 2025 09:23:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19231

From: Vishnu Singh <v-singh1@ti.com>

Add PCM6240 ADC firmware recipe for am62dxx-evm to support 2 PCM6240
ADC's, each supporting 4 channel recording.

Signed-off-by: Vishnu Singh <v-singh1@ti.com>
Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
Change log
	v2->v3:
		- Update name of firmware (1dev->2dev).
	v1->v2:
		- Update name of firmware.

v2-https://lists.yoctoproject.org/g/meta-ti/topic/master_scarthgap_patch_v2=
/116131783
v1-https://lists.yoctoproject.org/g/meta-ti/topic/master_scarthgap_patch/11=
6114242

Boot logs
https://gist.github.com/v-singh1/3de6d9061bdafb9ae908de4c532929c8

 meta-ti-bsp/conf/machine/am62dxx-evm.conf         |  2 +-
 meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb    | 15 +++++++++++++++
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc       |  1 +
 3 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb

diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/m=
achine/am62dxx-evm.conf
index 663f8ceb..e10bbc62 100644
--- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
@@ -16,4 +16,4 @@ FIT_CONF_DEFAULT_DTB =3D "k3-am62d2-evm.dtb"
=20
 UBOOT_MACHINE =3D "am62dx_evm_a53_defconfig"
=20
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "ti-dac-fw"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "ti-dac-fw ti-adc-fw"
diff --git a/meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb b/meta-ti-bsp/r=
ecipes-bsp/ti-adc-fw/ti-adc-fw.bb
new file mode 100644
index 00000000..ad025483
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb
@@ -0,0 +1,15 @@
+DESCRIPTION =3D "TI ADC PCM6240 config prebuild binary firmware"
+
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
+PV =3D "${PCM6240_FW_VERSION}"
+PR =3D "${INC_PR}.0"
+
+COMPATIBLE_MACHINE =3D "am62dxx"
+
+PCM6240_2DEV =3D "pcm6240-2dev-reg.bin"
+
+do_install() {
+	install -d ${D}${nonarch_base_libdir}/firmware
+	install -m 0644 ${S}/ti/pcm6240/${PCM6240_2DEV} ${D}${nonarch_base_libdir=
}/firmware/
+}
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 3e8f0f10..e17f53e4 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -20,6 +20,7 @@ TI_HSM_DEMO_FW_VERSION =3D "11.00.09"
 TAD5212_FW_VERSION =3D "1.0.0.0"
 TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
+PCM6240_FW_VERSION =3D "1.0.0.0"
=20
 TI_LINUX_FW_SRCREV ?=3D "3c8ad7386e818cb42cce6ed4ce2aa1e76d7c688f"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
--=20
2.34.1


