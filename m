Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109CECCFA07
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 09:28:15 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5577.1762334886134843465
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Nov 2025 01:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=wxbCUkRq;
 spf=pass (domain: list.ti.com, ip: 40.93.194.45, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIcKYP4aVXFutqiBiEsegAxz47MmmzfCZGjBmriGPxHn4J9QBnN5ovhFpWn6CrUx5T3maSOwdt9ugRua8szBGUTcKb3TbSjF005lJiLvSOS6kdnrpQ/G6jrqBo2+yNKvAjhM5kdwWXJ4R38bswGC1foS19PCLWyrwV70atagWsEM8rLwdUkDOJwMY+8Kfh1dlE71wVBIda+pT8B2Ee5mxBD68WuhpBWIQxUb+9VyksjKl/qd7fD5KI611t2Zs4Hy42wjVf2MxRfvcNUwR7mhxwPxyFEt/UGd5d3NT+MhZhabdoZ7QVkpZHUAAQXAEICdP+aC7v2V1sPjH+9MkfOaZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjZRuAvMOKTj8VvpHjfGzCdKkOJQulXABuF0Pozi7v4=;
 b=fos2OuAPGjhRlINvmTM1+koTGbufRVGsAPxKN5USK/NU51zPhcRAlf6IrLr/k40+QvMQwbqUcm1IFCN/up/2FD3ySeXZp3TT3QPa2erERFVuyzWC+Rvut9mEnCvQI4QV4HgGZQLpUaI/nO+LDsuh2VN8/QVBzvIl+zlH9w5bGU5mtTfMUCS8BrfzmA3J27cOKnTDOYfDNKk1mXq0fPJez4PjIdcil4H1nYVWS7O8WvVawglWOTvPp5fX47S6WAvtw3tT+izCb0LcGOrG3v8WZ2zr1qv5vraJbiQ04YWgaq8DmWraFWxFc/hDJEgtweFOJRzjbtdHqc3E0bpqqe+LuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjZRuAvMOKTj8VvpHjfGzCdKkOJQulXABuF0Pozi7v4=;
 b=wxbCUkRqZCSPofsmHCxoizCQCKwd2O+5NdyEAhVMRS+WdO6XeJA4oQqZrRlnH/7xp2ov0y80KPnCB1f51CmzAoWnnTDXqrjvwl2MqVXbv0wg9kRIkxProsxL9tQzCtzFj0U9VqTiPLAFDiTFdNa6UcYtVy7lQg6hrNjkf7rB3aUldyqJsfttGB6wUDsVXBe6eWlLbY64Y+Aw/1SpNs5HfsAuaWYuox8+q1yEuW18sEPI4I8bLju8kgsMEN0Q0xm2/sH0PI3khBxklpkKkwmiNFZk1d945Ku3L9OmYoJljqXecNK/2tO/drIehm7Fcr2WFBRkF1FTitVKsceoUaN7Gg==
Received: from DS7PR03CA0057.namprd03.prod.outlook.com (2603:10b6:5:3b5::32)
 by SA1PR10MB7596.namprd10.prod.outlook.com (2603:10b6:806:389::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 09:28:02 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:5:3b5:cafe::ff) by DS7PR03CA0057.outlook.office365.com
 (2603:10b6:5:3b5::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Wed,
 5 Nov 2025 09:28:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 09:28:01 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 03:27:58 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 03:27:57 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 03:27:57 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A59RvEx4013133;
	Wed, 5 Nov 2025 03:27:57 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id AECB02A6C; Wed,  5 Nov 2025 03:27:57 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Vishnu Singh <v-singh1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
	<reatmon@ti.com>, <afd@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>,
	<j-sahu@ti.com>
Subject: Re: [master/scarthgap][PATCH v3] recipes-bsp: Add TI PCM6240 ADC firmware recipe
Date: Wed, 5 Nov 2025 03:27:57 -0600
Message-ID: <20251105092757.1987544-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251105092315.2050534-1-p-bhagat@ti.com>
References: <20251105092315.2050534-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|SA1PR10MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: 87477ed0-c2bb-4b42-31a1-08de1c4d9de0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|34020700016|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fIgmXv0yPxU3n37RWBbBLo2avsrmCV418C0EkVJFXEEdFjKOlO0xKgLgO06F?=
 =?us-ascii?Q?U/BMJgCVlJaobDlEMekKUv4792qovZ5uVrd20eprPetWD+FuDUDU5A/fO82L?=
 =?us-ascii?Q?gNVEQCmJGsJuhITAd9d5ccYtlNdGgY7bEhlFXZQnYzKy4CZbso/Md3r3Z9sW?=
 =?us-ascii?Q?Txi/5PI2vBcZszNX9htrv0KOviHGNiYwiZXwoJD+JEHc7/uGkNttfh6SIJRe?=
 =?us-ascii?Q?MameS8YPk4w7Am1NZFeREI+oT4yXmZ6LbVPqMTynmYnvrDbGEwGfHr8XW2ad?=
 =?us-ascii?Q?aaCbcLgSkQxtmRfMC6EJw6bO8zZq92FqJ2WR6kIjMIMJ2pLrls+m4aQDjzkc?=
 =?us-ascii?Q?IuJs30UJjWtX085TZEZV+psY482HX+f61jN0pXYlXGkkJfBoRIosslNB5dll?=
 =?us-ascii?Q?XpT/JysOEcW8+6onzrLUbSQvc3k0emp1nYTm15osaiUHDEvCoeZW56tXSI4p?=
 =?us-ascii?Q?OMd4w10q5FK0wM2Sfr3tVMy6PvR1CctidNQTKZ+mXoz7/HX1C5YYC6P1K8kU?=
 =?us-ascii?Q?5lghCwQRaQiQ9FfQ5GYZPwN1bfk1lJqJw36YfSi3jaZbz0vlLpKqYB2xb93W?=
 =?us-ascii?Q?sxSzk4jRbNIfg83u1LEFCsBP/7U3HDidjxbgHqkbe5HU76Erl+eG2+py1PPy?=
 =?us-ascii?Q?5UoHiS9k4WerGS83kVqXY6Iv7URdWUaao0mTTipxES4GW/CAZzns8Smy399S?=
 =?us-ascii?Q?4OXjt5I7TNSZZ0Gf64C0+rIm/woXoxP0p7ezm/z0j55h6MiGEwidYdiD1/8I?=
 =?us-ascii?Q?5kG5TctoWJeJx1lfNuHEO3NXooD5tzqc3RGzngtLu5ntK8aguF5Bj9DgK+DU?=
 =?us-ascii?Q?voBaE1fRAS5Sd1zqXbItV5aoei8t9A6X69LXCfg0wY47oQ0p+63AopZlmB0U?=
 =?us-ascii?Q?Nrh+KQSnWeuSXywlcreNsqeLI7+Dhk8jFQJRv5O6OD03FgLks07BdfDo51h1?=
 =?us-ascii?Q?PFw3jm5Cj1nMaAPVBtn2npv5wt+hbJCdmJMzCWi/Hhwv1CroTLVu0HUP3MBJ?=
 =?us-ascii?Q?ePdxf3XSmJ4qnc7v1Nc8p7cLnY7POG4VdKC8Gyyj5sYLDDSn6ItGrINJESje?=
 =?us-ascii?Q?+/o6MFlTI0dg470Z9g7XbWgRrrWVMThgowHJe6U4hqZgXmTQ4KkD9Pi828Jb?=
 =?us-ascii?Q?i4GuNuXgAAxl/rkP0V7tBXTTTLJE/KlHTyseF3062y+DmRTZVrwB06EMrCz+?=
 =?us-ascii?Q?H3bfDYdQQt3ctL01ck3L4iAx26Jwp20Xd2MFKyV19BU73W3/YVOPSeTZHUQ4?=
 =?us-ascii?Q?MMsTCgnfIxK+q75z90f7ZbhnFmqivhshDb0caGrfEVz63wDs3Fpx0frNtgrs?=
 =?us-ascii?Q?jnCIlk6NNL3ATsrDKDgLFHTDuHTQ0M0fuUi7v9jtGL4ghDqySpKCj1lhGe9z?=
 =?us-ascii?Q?q6W+YoKJ+n8nQzDsWhrzay1BQk23dIMXdfwfCOlm7ZEzd4KUr8At/DZORwAJ?=
 =?us-ascii?Q?0NsutzayVp1N0bQauuMgHe8LbO22nDVU7iFlmvjWeRvmHeEphG3KWakMheUv?=
 =?us-ascii?Q?/zmG+os2aWu1f8PhvN1tooC21MNoZmJGI4AGFmEX7hRrHxchHDNQ1MELRxNc?=
 =?us-ascii?Q?vt5Mimu/+7Oppai8/nk=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(34020700016)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 09:28:01.9638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87477ed0-c2bb-4b42-31a1-08de1c4d9de0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7596
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Nov 2025 09:28:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19232

meta-ti / na / 20251105092315.2050534-1-p-bhagat

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
WARN - [master/scarthgap][PATCH v3] recipes-bsp: Add TI PCM6240 ADC firmwar=
e recipe
    WARN: Commit message does not include file/recipe name: recipes-bsp: Ad=
d TI PCM6240 ADC firmware recipe. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: recip=
es-bsp: Add TI PCM6240 ADC firmware recipe.
              recipes-bsp: (COMMIT-MESSAGE-3)
        patch



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [master/scarthgap][PATCH v3] recipes-bsp: Add TI PCM6240 AD=
C firmware recipe
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
From: Vishnu Singh <v-singh1@ti.com>
- Date: Date: Wed, 5 Nov 2025 14:53:15 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 05c1d402c276d571747aece7f84443e04=
6411e1a

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202510310100
- Commit SHA: 39b81fac904906007772dba3100fa92da28a3c91

Patches
----------------------------------------
All patches applied

scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [master/scarthgap][PATCH v3] recipes-bsp: Add TI PCM6240 AD=
C firmware recipe
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
From: Vishnu Singh <v-singh1@ti.com>
- Date: Date: Wed, 5 Nov 2025 14:53:15 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 05c1d402c276d571747aece7f84443e04=
6411e1a

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202510291355
- Commit SHA: f7cd5f92135bd53a843b188bce559ec894425766

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS

scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS




