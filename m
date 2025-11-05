Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7BFCCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 08:50:54 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5218.1762332651468617486
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Nov 2025 00:50:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=PU6Az8du;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.63, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PH3j/zlKx8eaC+HATWlfC42lasKFZhJ8vuY9GDZiB7/gWKDLGAo63VeUSb+SbLHIQMx6sNB8l9EZtLlLVpVPYdf0pmxrVu5HMzRY0X0hzlksqcGbbh1plYOLomBgJxu/AMAwh/RUkt/RKjKN60GTzsX7D7CRpM6xBELFkj6orsrpbDCPUgkwh8HPaoq6RuafUyBVDQToszeLDcn5wj8V8dmUagX3//wL5W+9v8ZsU+swc0BfaN0aejhxh/xrCPVpSg+ne50iiW2bgQWaKUsM2kDFZa9U10+4RbxWzjmnjv9m1cAIkpAJqD8NUJ3kZnYcpR9iJ3z1zbTMBh0+Q6ygdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAjFQjXunsIFBIoy1QoAfdeSFkKU0L7Tqy6mgXgqk0w=;
 b=do4UGkGXPPCdAalFKvQcQPdx7YOjrOBQ02853nRk+r+VbTWToP/Aqo0tIV8niDJg/bJ6AlZuBVC/oykdH/zGQlKYrb1X9qAndVgI8qtVUlBMCZiOixFtorPm++IkEsG99/d6QAk4prVK+fVu0/U9UPLci5mfdlgaggTFeeQl+0U2fEYon+1jRoSGyi1dvppRn4Y1CikA0KBiFnrmprT4NLnwNRWA3Rhu2BLZGR8LmxZ0XbBSSbtgHXg4Kh6y9yGo4yTVYnrAyW9HrWr4tVbegSaxEjBggb+XFW0pXg+i63n72qpm0PovS44iJ9e+FOmt6Y0gC1Xm9njqf89UTDtJQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAjFQjXunsIFBIoy1QoAfdeSFkKU0L7Tqy6mgXgqk0w=;
 b=PU6Az8du5KXS83iC5IJMW+ZP2alk4nelX0EuQYW/egBUoFOd0C5AH+XWVjvj0LzQtP1v1S8FkEzPbk8X4CcAddt1YoDF2lTvRP8tu82TxLQ1hLjSyDrap8l0CRzqtonGgrOdMTP1FiBRqNdSPANryYSKf8Tv2vvJh5FtfAQDnqs=
Received: from PH1PEPF00013304.namprd07.prod.outlook.com (2603:10b6:518:1::16)
 by LV3PR10MB7746.namprd10.prod.outlook.com (2603:10b6:408:1bb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 08:50:48 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2a01:111:f403:f912::5) by PH1PEPF00013304.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.8 via Frontend Transport; Wed, 5
 Nov 2025 08:50:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 08:50:46 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 02:50:42 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 02:50:41 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 02:50:41 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A58oeuf3434440;
	Wed, 5 Nov 2025 02:50:41 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
	<reatmon@ti.com>
CC: <afd@ti.com>, <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>,
	<j-sahu@ti.com>
Subject: [master/scarthgap][PATCH v2] recipes-bsp: Add TI PCM6240 ADC firmware recipe
Date: Wed, 5 Nov 2025 14:20:21 +0530
Message-ID: <20251105085021.2030969-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|LV3PR10MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: da80d45c-8695-4c7d-8488-08de1c48699c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|34020700016|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?N2vAO10XCLMe1XtDoHaYPixxMe63EhmG2fhdQTO3pQHzC6GNuMp7MPlRXXZO?=
 =?us-ascii?Q?sOXp5vh1RHomtPYc2mHPqSbad0zGkemxdzm7CGIYNDJTCV1YcMXhT4q5Z9jy?=
 =?us-ascii?Q?2IcDL+BoNOu/7ofg5pHMynATSBTOZo4p0l1WpVbOvfKMXPpF1sFUr2LphBZx?=
 =?us-ascii?Q?AgoV6u9Wgui5CRf4RyYQXKWTKwa159GtesOwmOPOx9BSKu8GwtlD6UMBPkPt?=
 =?us-ascii?Q?s7s7p22thd0uT8HXNZjiHx/cRXbf52KqD29fSeN5wZtBxm+9feKokFUlpDRK?=
 =?us-ascii?Q?7zE2khMShwtkoSq9Jc0XFcEndiXxIQD00G3foSDvzsGuRfDs9hmQNmf8e0ZB?=
 =?us-ascii?Q?I9vgjQp5nFSv0/QvkT1NYrPBDGc3RLp3hmY502XxlcHcSyOPr0wI3YohYi2c?=
 =?us-ascii?Q?UqdH/mTjUWyv63V2Fo58GjTtK28YCAfFRuH1gI3QNvcas9NYmBtCL/CAsjew?=
 =?us-ascii?Q?gxurWTlf32G9Y0jz4LaF/G65fvZ5esoV38liMqG9ACaoJ1xdg6HRvhbQe+A/?=
 =?us-ascii?Q?Lnr1GeZh1TaIEhrPvQvybdUQwVx7SO0RDastCfWj9laN+u4lJK5X5hhl4WKe?=
 =?us-ascii?Q?BrRT0uoW09rkhruiDeaoBzTg/AMH1D80JT/A+pmMsytPgXOVHgCPC8cVhD8x?=
 =?us-ascii?Q?MY68pWnO2BjEFMVVMCHLv+DMnraABE8RuKrVdjSrD7EcU7ITwZgoOPkWC9tz?=
 =?us-ascii?Q?AN7ZzY7gao/6xaGTOKNKeHfupowUQ8dbAL/JdA0K563BEdPRx1Q78IZ6ZugR?=
 =?us-ascii?Q?Pp5LRvJ64/QzrvJx5hYgItag/+rYHZ2LkumCNgbW/BFQc791MmWnsItWLqJe?=
 =?us-ascii?Q?TK+ESz+eQ12kquTEF8bIeZVSuMqOP/o+9PHWkAadFdS2M8ZBw5qg292XR6QQ?=
 =?us-ascii?Q?CMtw+453StKpqaQrPU+RHetaXKCNXQFzfTh6E/OFhRY8yMcVrEfSHhuY52EL?=
 =?us-ascii?Q?2B8YfAF4Mvz5POhc8XZUA8jCILAXtLsYUZ9Ai2/azvlVJh2Y0gNgmBnyFhZa?=
 =?us-ascii?Q?ToUp1apRl7k4pv2VwCQXY/kzOKxph/nS/ApAR67s8FsERAKEbxwB6bvB5pTa?=
 =?us-ascii?Q?OEU+0lvpjMX9mbAngvXYZYWdgahuQRoIFiBpkmjW2Q5VDOc4ekh7E5mSVKsM?=
 =?us-ascii?Q?aQQ2+xg0zkTo+/u8gmR3a5aaAKjpKgMgb2kSAGRbBuVrfG2I1VnHjuQ6TSir?=
 =?us-ascii?Q?5Oip1rvubqcXhN3W7hwD6ZdJgcsv9g4Wj4OgauDsOAFk6Jakzggjv6ST4I0p?=
 =?us-ascii?Q?+KF/5WvHE/gexLu7pOC//uB3CEi0YdtQlwWEtM6rVwq7GQS7+vQokHvfiV2i?=
 =?us-ascii?Q?5qIdOzEf7tcjE8tWNEWR3CKBtekDnKiTWQgHIxmjcqzIrI66gYx+buKj9aPo?=
 =?us-ascii?Q?4TsBvJ5fsVfjdDlTAOWMG5FDj3N47SIgS4IcxlPmZEfPqW06S6QYhwMcpLh5?=
 =?us-ascii?Q?3pHU6iX5K5q0csdWl0nXMF+oR0JKGZyo8b1JcfHgCXSDCETREdK2JzywLM4i?=
 =?us-ascii?Q?4jCU4QBomTV8JwU2qj4zX23Vl0761dWHABk/GweMs37pQu3fw2Bf5wN96E0G?=
 =?us-ascii?Q?H3HMRAgPj08y6PN35OE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 08:50:46.7969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da80d45c-8695-4c7d-8488-08de1c48699c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7746
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Nov 2025 08:50:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19229

From: Vishnu Singh <v-singh1@ti.com>

Add PCM6240 ADC firmware recipe for am62dxx-evm to support 2 PCM6240
ADC's, each supporting 4 channel recording.

Signed-off-by: Vishnu Singh <v-singh1@ti.com>
Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
Change log
	v1->v2:
		- Update name of firmware.

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
index 00000000..9f37d995
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
+PCM6240_2DEV =3D "pcm6240-1dev-reg.bin"
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


