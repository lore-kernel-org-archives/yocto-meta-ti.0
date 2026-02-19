Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A62A5C531C9
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 19:52:16 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23012.1771530727069505738
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Feb 2026 11:52:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=sJ3HfQ2G;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.2, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gnv8HF572ljM1bAORw6oLAZwwt7eXeuxVeCLp187Lhcct6XNxnxscJEFqkjRnwvR8wTIcCYbFJdKebr9rpS1TtwNRKW6XuHsVic1MJqba0cnkxni8DDEtiO+PD95rFVt2M1I6ZFQPH07lfA5R9wvr9wWHFC4wqI18FWkH6XgEavA8xMD+MsBuBgbFHjJaL0b3bmMp0TXcZqAhZ+9lbnd4Ijtd9ZHeM4+20J2R7exovYLXyaTfVY3MVxSHdhXkDlyqS2fzB0x+V9S4aWQBENQENa4vQIc9fElPcl3e+SBRbhKOZshd9tcNNNm0RbgyvogjPsyw5odL90dJDr22oyxyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtY1yaHjK9C/doTb1cE9BD5PzLx7iQKmEVK8D+TpW4I=;
 b=Q0PGLx89kpWrQ4TRWx5GCDjJN1jnE0RozaymQ6LCP3Xin1/ikVR/c62wkPG88x7y5T2fv6aE5tkbBL/F+rK8+Vlhq03SWFFCgGj5bGz8keYdXo/71Clo8b8WothtSVb9ePOxLMFXk9JBKDChCSqZvS1673RYGaCLKdU8Zbln3fI0TAKtW+5VMa/30tKa1IuB6CD0cAybvwNGJC85QYCMpEcyLxSsVsiazxlHsJX2FMy5ZXRPJH37ayMlzH3ELM/paRntqL8zFq1jw/wlg00sGwyUvfKZcNbLJn3YyL/AHYwFL3PC+wg4eZ/ZecoQ1pwWC++xlNdRbSWQ22wAVWUYmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtY1yaHjK9C/doTb1cE9BD5PzLx7iQKmEVK8D+TpW4I=;
 b=sJ3HfQ2GuccxprC8UDTrwglPZUQaPSokyNzdr6mxYFffM42iuDvFvJk9G8JgBXbmHgpUGJbHQ3hp/Sj5MXGYIT6A5vUnAPnuXx4Vl0g4V6IDgRV2QFMYEezaFNYk9cbiD0X3q7uROi6yZy6dK16z4fY/9Qwcofyij5D2k99iCEY=
Received: from BL1PR13CA0062.namprd13.prod.outlook.com (2603:10b6:208:2b8::7)
 by SA1PR10MB7698.namprd10.prod.outlook.com (2603:10b6:806:38f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 19:52:05 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:2b8:cafe::ba) by BL1PR13CA0062.outlook.office365.com
 (2603:10b6:208:2b8::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Thu,
 19 Feb 2026 19:52:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 19:52:04 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 13:52:04 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 13:52:03 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Feb 2026 13:52:03 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61JJq3uw3120275;
	Thu, 19 Feb 2026 13:52:03 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vtA4B-0000000HI7Q-3GTD;
	Thu, 19 Feb 2026 13:52:03 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] conf: j722s: Add usbdfu tie-test-builds config
Date: Thu, 19 Feb 2026 13:52:03 -0600
Message-ID: <20260219195203.4121217-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|SA1PR10MB7698:EE_
X-MS-Office365-Filtering-Correlation-Id: 03612adc-e3bf-44e7-a22f-08de6ff05b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8ID/FuHeDyU2v3grK1xZZPQenE51KQKbyJBrkQ8pMfNZ6DIn/dvxH26/4o9b?=
 =?us-ascii?Q?CYfNTeozUT4iXM9qUn4TDwSni7518KMITgBLyDojGX82tz0N4JER2tsI9BSr?=
 =?us-ascii?Q?n8eWCyBO1Fxr5cICwxGbCkKs9UFRubpK6ij+Zjs1C6iF5Zz0dQ6q7ySDgkkC?=
 =?us-ascii?Q?RSLRLIsYO98Ar116NCzAYZr5I6flHMLqk1YGMHnx8wyx1/hW3aUh+CMS7kp+?=
 =?us-ascii?Q?7WWC7qfT5eYDiPC2/ohTkTDq4dgaWTBxPg0R0bJEBeqT+CjWtG4K0aeRJEvk?=
 =?us-ascii?Q?qjNj6PXoAjrKdQOyqihiuTUBQLOf1YCpe7YHyf5fWWWrRJiIb/uIdf3aGaPq?=
 =?us-ascii?Q?L4w6ElbJItPj3nh1Sq5saGyEMkKOx8Z6ELD1jP6GL4gOm7pk0ksZF54rHSCU?=
 =?us-ascii?Q?uz+xl7Ev09Ny83qzB9MgPp9mHMLi8vXxXbNIUYvfU/OLgvW9pEepLdFsyKjR?=
 =?us-ascii?Q?Dy9nAPq+d6e63S6QpyxlpARzSEomCBp0ThpGXCSdRLpedU4QCRyChZK7xT8t?=
 =?us-ascii?Q?QaaK10GGk2s6+rcXZic+g60lrlUd43q3Db55M7/LbStAqzZq6rAF51tnSzl3?=
 =?us-ascii?Q?FuUZs8JckrDrLN31fqpnQH6lEcZ5Z5Mmfb74P0spWXyqCxUNLNByTFwMjvcK?=
 =?us-ascii?Q?xV9xGEljcaJleEx9faFT2LXAumnXlFOLq+iAyM9Vtrx6ezDeCxgHblTxjsh+?=
 =?us-ascii?Q?ZHOWUe+owhpTJy78bnnpzIzRbGeB4AXpKc8BdbxpjgaQ2hJKubz2VofJD/qi?=
 =?us-ascii?Q?ORgYh+K+eYM4agmrHp/53jAbBkjcsFrMHeeV+RAhjzjsx9tH1SXY4Bso7hbB?=
 =?us-ascii?Q?as0dtAbhbQrRbd+RZiK6joAGrzkrtwcY18V0fQ4lfwLeceP2JEAdQVFPTPws?=
 =?us-ascii?Q?Coo4w6AWKqNT45+z6Hwgi3dcXnxxsiTx+ttfTxDCnnX5U9HmBpKVils19CgM?=
 =?us-ascii?Q?x2SqHHOFZkgQ6GM5stEmJJdPDRFzdUkK2qxSkaB5k27jIwVBvy/iMZvUVS02?=
 =?us-ascii?Q?ScifkwhKj3j8dPRHESOTT619NjxWO8Uu6VqjD10S456ffETrefC7jP+FI52C?=
 =?us-ascii?Q?hVTysTyn7BavUuuaE9nelXrJaSpnlgq4xUu2khSJuy14inOvQogDHppdsBog?=
 =?us-ascii?Q?hjPhQkuDAavRc9nD8ViRE+TenR2rqnvyXzd5A8XndA3BBYoefs2iHIfyeOgO?=
 =?us-ascii?Q?L6nYaMjaps/jFKXu9VruTtan9kbxORRpj+2Gy6l4xGwulOzg4RgjajPXLVbf?=
 =?us-ascii?Q?Z1J9WW2InIKFiuv5EmQ+smYh6bagcsa4DLTBTRXXifZpBiCHOAjqRcoq0Rrf?=
 =?us-ascii?Q?ubfdRxQz2/qMlNf8UqmKJonyfM7ti1cHlqn2FFVlumWXvFAbvz172PTgwszE?=
 =?us-ascii?Q?Wq6TTblLRINVbU/FzzngQgQ4O7NhPeFa8hVTBlF6ILtWLLdISpAj1uOR7oRC?=
 =?us-ascii?Q?8q+DW9jB4XdUHW9N0HDJ/6tEW5UYX5ZjOcM+JUL6Qt2oPKwAJcAfHGGFjNVG?=
 =?us-ascii?Q?nQBqCSaBKcwmU0TFXyT8bH1qLE3/Z1+L18COhEE90s2TIFo0o7qo9f6AfxJP?=
 =?us-ascii?Q?Nj0+9GhlfjiJx6Vbr5BGu410nyJ4VTO+X/XtabP+izxhzlVYqc2oe94bSkw9?=
 =?us-ascii?Q?DoDWkRVaW76dVJklJyEiphCtf7lu15qsq8OLc8mtKrE5D85LtUsLTEq4BNbZ?=
 =?us-ascii?Q?0eMIAw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+vuFM++xl/Xm3XcNozrhHhgldLPD6s7lwIdIpm6EztYGJmb0FmVxtjSFLFCq81ORE8xkn6jdpGHNfXu+MPPrHlrlxZw6GhhyOQ1tVxbR6hbCcBWqDX9+OtAtigyIVLMkOXLEnmpQKfYpZB1CFwXUQEj4+Kgw5PpFXa90ouX5Zh+9d+L5jJbjOtsyl5qux7an7M16GcE/AKjOC7NdwYVMBzx28PTOINNp/Y0ccELGhO+AuiNLs99nxVn7YEzXE85Gue2REYZnT0d6mDSLmtrUuz1qA673TX86VuMq04l3tLZK7U3h9dkmky3oSZTaX9HxVWvaQosZMuDihOjHQ/HyucbcHu2pJ/KzMxc7YFlIGPKxHX8Y/QRgedVnMFXl2q2b9j/bKnhT6Ev2gFjqnntRNAbiAZtc3Vwn52VutX91CmXn0OpnVmTGzgp8mDVlmKKC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:52:04.5248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03612adc-e3bf-44e7-a22f-08de6ff05b37
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7698
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Feb 2026 19:52:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19552

Using the new UBOOT_CONFIG flow, enable a mode where additional uboot
configurations can be built along side the main config.  In this case,
turning on USBDFU for a board for testing purposes.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf b/meta-ti-bsp/con=
f/machine/j722s-evm-k3r5.conf
index fcdf3e8a..5df4edfe 100644
--- a/meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf
@@ -5,3 +5,11 @@
 require conf/machine/include/k3r5.inc
=20
 UBOOT_MACHINE =3D "j722s_evm_r5_defconfig"
+UBOOT_MACHINE:tie-test-builds =3D ""
+
+UBOOT_CONFIG =3D "main"
+UBOOT_CONFIG:prepend:tie-test-builds =3D "usbdfu "
+UBOOT_CONFIG[main] =3D "j722s_evm_r5_defconfig"
+UBOOT_CONFIG[usbdfu] =3D "j722s_evm_r5_defconfig"
+
+UBOOT_CONFIG_FRAGMENTS[usbdfu] =3D "am62x_r5_usbdfu.config"
--=20
2.43.0


