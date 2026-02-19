Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FFEC531BC
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 19:52:06 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23010.1771530720032817992
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Feb 2026 11:52:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=mafOpGGa;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.3, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrfHBlpVffJxzQjiJolDpn1USoBwK2fOGCZNFIblNpuvu+fFx4lKqHKnl1/4TMjZQ8SbLpbG2/WHhmLjzysLcU33YtFcxSA2uqYcDy60Dqa90+BOiCOFBBwEkIFe21E2Wb/j3pr4FvwIyhMSHMIhgUUW6LpC6JoM9WW13QdaHbRaGL5rTbTs8eEB5kapW+Ew/IdBdoc9Civ5tyoh/tMYs2pNTm0PbasZCf9dTyxwfCD933lqdo7bN9sraiGZOb63lDw485MxWyuFduTL7IDLNLMvyxPvAC8lMsES2kYqcG51n1S+IBZxvN7inUKw2eWHSiF9tScnDWYBlzPz03oOfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytGPpur2Jjcu/wdiP+qIlY1nqlqqzz6hdn3zExzuW8o=;
 b=qoFtULR8rXdUCB5qA0YL3OMC3JxEzX3ttJ7cXlo090Ajxx3sVC8SKG+1TYYx9BAYSL07ujXZeiWR/sqsGpgpVfx6SjuCEhNIZn81+1GxhHE9/pXOLl3Cx3YwniZOCI1vJNg5eGucu19H/lAJT5yx24AImSHbP9iSTkvLpPyc7YOeMTVmbHHiwprvnHdBljzxwtdaevjbFqLq2zw7mShJE6BwaTHBoxVwQ8hIz0i1t/RvevpDNAHY50CMlTOd4dlre4V9D7FUap5g2/bRfCj5Yrauy7lrnnO0MDIs+6uJL95ZSsl28qs1Uk8FaopUgQoI7U4Po3KAc7zVPNdOhQB2HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytGPpur2Jjcu/wdiP+qIlY1nqlqqzz6hdn3zExzuW8o=;
 b=mafOpGGaITzwBZv5JcMpC7px+DauMWPu4AP0iVaJ6nUdjG1C2NV49W9WrpgZJY9/8eVqQJxAwv+cRb7HPDJjMlmr4I5gRFej9lqwlM4rzETAsTIQooxPGp86GqX334KGhPsMJErsABQ4oQPCLdjQGStZjLvvNrkGhLxF7j4EtXs=
Received: from BN0PR04CA0140.namprd04.prod.outlook.com (2603:10b6:408:ed::25)
 by LV8PR10MB7774.namprd10.prod.outlook.com (2603:10b6:408:1e8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 19:51:55 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:408:ed:cafe::ae) by BN0PR04CA0140.outlook.office365.com
 (2603:10b6:408:ed::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Thu,
 19 Feb 2026 19:51:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 19:51:55 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 13:51:54 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 13:51:54 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Feb 2026 13:51:54 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61JJpsFm3119997;
	Thu, 19 Feb 2026 13:51:54 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vtA42-0000000HI6M-1Fii;
	Thu, 19 Feb 2026 13:51:54 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] conf: am64: Add ECDSA key signing
Date: Thu, 19 Feb 2026 13:51:54 -0600
Message-ID: <20260219195154.4121151-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|LV8PR10MB7774:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d14477b-4072-43d8-7ebf-08de6ff0559c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BxqDyCuaQqmPQawcyTi2DInbroI9Q6C2SCRHhxZTb66dtjW0z2FT740ierUh?=
 =?us-ascii?Q?rXpMVd7Ql+U1mhNw8jjTJym4kSDfJX5DwBfCbmnMT5/eh6UUgH7HTAZhtTJk?=
 =?us-ascii?Q?wgd6IOPyLhmeFcbhME6z99tn57Idjs/KannqzR1vcWSn95+Ftq76UjKJTKuq?=
 =?us-ascii?Q?2LE3Uu/W7yz9jfTpI7Zq1MpIE9antpk5QrfQMmqAfDpUqiJQ8hSbB03ICCoW?=
 =?us-ascii?Q?kWBxStCyqCp4qsU/qmtkErSocOlhQiSlrBqmlTyrPUNoenKhDn5C3hj3grc0?=
 =?us-ascii?Q?a38qnTpEvhxjLTGFkorACpKzEUb5xXb+vHF9Dqq97z81zTIi4av4y78DmteH?=
 =?us-ascii?Q?CNPfWaNB/GJVFkmSvpREzXoIBkw8jnv7H2io2U095DWnb9bs7jLydRaQ8msy?=
 =?us-ascii?Q?Kt/xQ8wZjwTPIXkIFts6jyS8bjDtYnu/JYgBS9HBAviUw70HD2Olpq6lO7E4?=
 =?us-ascii?Q?Gny/G4gICJuIrVzJwzAjETqOChiUd/NOkH3X6Go4a0qoGtB/F6T2I6GJ7ksJ?=
 =?us-ascii?Q?HPcIFr2PxivKRX8021hqNrXfJrd8nZFUKyNAVUZnkoBwLmorWaIKRliyGaW5?=
 =?us-ascii?Q?SqBbpoeVYVa2iHosLGhWOmgiyUgA8BQiVXP/0HJM4D7gK8WsV+2RTwm15Ekr?=
 =?us-ascii?Q?6Dks+bsy5rzVbDcESLHAzEV/f0HIs2ElVeY91pkJkU/De0az0BhrPFggP8om?=
 =?us-ascii?Q?th/gPyz69tv5NNuo66OSNRX7dqeO64y4bcPP5bG6JTBtyQZ2FaiAi6q15InQ?=
 =?us-ascii?Q?d4qfgt+iVZFHVg76I5Xb6zSwUJ4MKx1vZVe5AIFnxQmfyUAYf35v1rF+Ip1S?=
 =?us-ascii?Q?rvXpYIbNSONeDUco/7w6AFnUHup03UoQWMwYsAEu5bTlENgtMULGQpyuOqwa?=
 =?us-ascii?Q?Zp+WcSB1ftqVHGJU22fv1/xcuzmVa07VoUZ6II8pfXs2xAfXBI/iH+YLteNy?=
 =?us-ascii?Q?GeaDTt/Sw5tFRD/9Dk8hxNqItJRO/Si/UQ1YrT33uXrk91ErtZwanwtDCFvq?=
 =?us-ascii?Q?+OwgVveei8OhJitoSSUVZ/gQloeFqNeDs8nPWQ4r9ebmDbGA2xHzI98IXuYX?=
 =?us-ascii?Q?oAaJtvddqFJvjOx+J5G4IJ8mAKLL/XRMHwkgnyg29H5fhTcrRzAx/61R/vhd?=
 =?us-ascii?Q?FL1nJ5ZtyB1GmYmG1ytsCUO3Y2RnPqOOdgV/E77v50lCEmXW8RHEn9L9zw6R?=
 =?us-ascii?Q?vAv+ROHM7iV5ZKchVBNKuZDk7GbiwtxmyuUzxWA0KX+HlPKoMI6CBb2KPWC2?=
 =?us-ascii?Q?o0lvkNj6LZIzl8Z6HjCqPQ6L0urdgIEgWwh3bLGHzPuYYg833zcWhbHs4xdU?=
 =?us-ascii?Q?lsxPIhQhglpy/jIU+q1FSMu1iBlmedig1sFogFqx53d/fZxRKKYjEEwtNPGc?=
 =?us-ascii?Q?/BrXQaQy2/t7rzvrwC6vN+OIGhvW78Fnpe+1jr2M31uub2X7GZ2D7xM6iGTh?=
 =?us-ascii?Q?sOBkFjTWB9QWi24p7qa3+aVVlpEd9xEtBZjICMFP/WNlV49V15aWif/RPqFc?=
 =?us-ascii?Q?Pn49tGrRgTMD+Ai2bopuuXeak+OOlt1TDuecBG3JWAPRn4kmqANLlYHmGddH?=
 =?us-ascii?Q?HDwTjGi4UStxGIab1foC9XJ6A2jZPf9JMTErKD8NQI9J5KV+8BWDOLwiugUt?=
 =?us-ascii?Q?dI693a1ri6YcVq3x2qo32pMIotdeIx2gTOaSZoKhnE/SlOodZbgIftBA+vyn?=
 =?us-ascii?Q?9PWaag=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SzJ9z2boooOwSQMIEiR2hjhb07+xmLtsrXtKk3mBFD0FBjO1wrau5nbX2u6v8KQU7rIuFoxw/ryx7erzjjwqjh+EAus8+iawNhFeI6BRS78lqAMty3DNhHcwv1GG61c0cbm8D4WB8FMTkOVQZMNXOOjMnGHqXjIyQDnFosjJtSq/T3TwBSbsrSnQFZKYPHPtfLJmsiXQGjLXLrEplzs5AlhIZbHlLoSDWtieOGMGFiU6awldrd3FKBlmbLF7w2gxqTQuORJqRUsw5awZtIZ8IxRsLqZwlfB48IxtMJwcRh6mNt7ciqel+OkJnI6IihtbnmQ4yA08HWMYEiWeBnAC3GQ0wnx66276ILRgJXbEJcVb823bRusxVu0iKY47VsIPcRfwdJpqulohJ/grGLjab3ui7I5v/fLIFEur/W0pRHYVrP1dTvCURy7ArGz+0GRn
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:51:55.1224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d14477b-4072-43d8-7ebf-08de6ff0559c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7774
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Feb 2026 19:52:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19550

Add support for signing the u-boot files with an ECDSA key.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf | 14 +++++++++++++-
 meta-ti-bsp/conf/machine/am64xx-evm.conf      | 19 ++++++++++++++++++-
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf b/meta-ti-bsp/co=
nf/machine/am64xx-evm-k3r5.conf
index 4b97adaf..8e3ff61b 100644
--- a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
@@ -4,4 +4,16 @@
=20
 require conf/machine/include/k3r5.inc
=20
-UBOOT_MACHINE =3D "am64x_evm_r5_defconfig"
+UBOOT_MACHINE =3D ""
+
+UBOOT_ECDSA_SIGN_CONFIG ?=3D "ecdsa"
+UBOOT_ECDSA_SIGN_CONFIG:bsp-ti-6_6 =3D ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-next =3D ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-mainline =3D ""
+
+UBOOT_CONFIG =3D "${UBOOT_ECDSA_SIGN_CONFIG} main"
+
+UBOOT_CONFIG[main] =3D "am64x_evm_r5_defconfig"
+UBOOT_CONFIG[ecdsa] =3D "am64x_evm_r5_defconfig"
+
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] =3D "${TI_SIGN_WITH_ECDSA_KEY}"
diff --git a/meta-ti-bsp/conf/machine/am64xx-evm.conf b/meta-ti-bsp/conf/ma=
chine/am64xx-evm.conf
index c6ba2a87..4dc2adb3 100644
--- a/meta-ti-bsp/conf/machine/am64xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am64xx-evm.conf
@@ -4,4 +4,21 @@
=20
 require conf/machine/include/am64xx.inc
=20
-UBOOT_MACHINE =3D "am64x_evm_a53_defconfig"
+UBOOT_ECDSA_SIGN_CONFIG ?=3D "ecdsa"
+UBOOT_ECDSA_SIGN_CONFIG:bsp-ti-6_6 =3D ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-next =3D ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-mainline =3D ""
+
+ECDSA_BOOT_FILES ?=3D "tiboot3.bin-ecdsa tiboot3-*-evm.bin-ecdsa tispl.bin=
-ecdsa u-boot.img-ecdsa"
+ECDSA_BOOT_FILES:bsp-ti-6_6 =3D ""
+ECDSA_BOOT_FILES:bsp-next =3D ""
+ECDSA_BOOT_FILES:bsp-mainline =3D ""
+
+UBOOT_MACHINE =3D ""
+UBOOT_CONFIG =3D "${UBOOT_ECDSA_SIGN_CONFIG} main"
+UBOOT_CONFIG[main] =3D "am64x_evm_a53_defconfig"
+UBOOT_CONFIG[ecdsa] =3D "am64x_evm_a53_defconfig"
+
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] =3D "${TI_SIGN_WITH_ECDSA_KEY}"
+
+IMAGE_BOOT_FILES +=3D "${ECDSA_BOOT_FILES}"
--=20
2.43.0


