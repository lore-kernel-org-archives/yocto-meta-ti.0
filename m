Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F108BCD3447
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:35:21 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6214.1762976119098492028
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 11:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=t/WlRlO/;
 spf=pass (domain: list.ti.com, ip: 40.93.194.16, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWlFFRo9NOdWAtJOu3lx6trgXtBn8FDO/oUVO1xh3o+D/BFZinRTeiIWTQ8+OZjIZ90NQiOIIhmzhfXWhfjd86gyaVNYo2KBe0OeAWDgZbgIqD00MxgDZMBUpRGkq2dU4YAIOnP8Indx/vuefJFflinnk3HX3yKmBhAWDWRBXpfqzMbbK9ziPpS6clQJWq+orZyyCvq+P/43AKwqqP1vzQo3thS7hS5N+6kK6TFacvMTIfN5Vyaz0/tYNJ6bGMzSsNYGkDB7h0lOQ6AwSSqgzPJXrV9yEhOurq7qCrNNPt3PIhvPZq1wbXA8L9c2OMDgzafqG1r83plmejq/zU85FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7isDthkFWNUuTWQqiLG2sd4792lvvGb/qSPNpKRCdxo=;
 b=m3ZKGDG2aVsg0ReZHlnn4tGoagLms2zXhDVHebLgC4fzJfP21TCiPBRisZJebSUrOLwMcZwELxNUKKGJZWVY7+zq/qhYcfTiN7NRrXa/npVPnT1GRGk/UT7fzA5xI2CpB0eRyt96KPM4va0gnjCdXE4NRD9BXYBty2T1ZOj+fZOwuRqrW4nWjHocuqvbuypgdLWye5pwvDP9/4S4RFqqII5APweTzJV2K+T5PfX/ddBXAPKYdsf6JKF3JsfF0daZGa+kOeg+f+LdKKKYbIFmk9vMVXWUIeYNx5MmIsLZgZ/eiMMiSuHDie3+IV2rDT7ZMwMmFjsWCgVeFMO516rIBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7isDthkFWNUuTWQqiLG2sd4792lvvGb/qSPNpKRCdxo=;
 b=t/WlRlO/bhXI9KZHUlGJaVhNkidiW6crXetEO/YvusFmZoSLIf/nWtB3F3pjN8XUGpOy+6ye6h/KPM5QEh0mvrARsci2a1ajoRUTXtJVYZD1i/2vfCWrs0uoTtK7U6ZZVlnBtEw2B86s5l12ZQ04TGtjgeP4iYPtJ2iNFpH2C3l52OrGWl/dUy2i6qumb4CzcAOLPN+qRrbYfriRxwz1+gmgZ7O9oQMf1a7h4+MA8OlYt5sPPVYgRF6P+H74TNpIcnPetf/Tt0MijXSZuLCl+Nbb6WDdYFB6iN9xAth5G48UmqgbTF65u5ZMfEgvj1FwwctMJOGqaMhePgnay61YEA==
Received: from BL1PR13CA0411.namprd13.prod.outlook.com (2603:10b6:208:2c2::26)
 by IA3PR10MB8188.namprd10.prod.outlook.com (2603:10b6:208:502::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 19:35:16 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::47) by BL1PR13CA0411.outlook.office365.com
 (2603:10b6:208:2c2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.6 via Frontend Transport; Wed,
 12 Nov 2025 19:35:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 19:35:15 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 13:35:12 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 13:35:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 13:35:12 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACJZCRX3195128;
	Wed, 12 Nov 2025 13:35:12 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0FB092A4C; Wed, 12 Nov 2025 13:35:12 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <rs@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH v2] ti-img-rogue-*: Migrate GPU driver version 24.2 -> 25.2
Date: Wed, 12 Nov 2025 13:35:12 -0600
Message-ID: <20251112193512.243769-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251112193005.3655764-1-a-christidis@ti.com>
References: <20251112193005.3655764-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|IA3PR10MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: b8b0aa81-19d8-4cd0-668f-08de22229ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Z5RrVyxkNchStKOgb18NLwuM5Hv6PrpTu6bvM/WjzwXxQbWazGK/XuKfsvoM?=
 =?us-ascii?Q?t3F2tu+wM5kJsHBF5+w+U0NUD6JPf8ZXqOPQLKxMHd8DQ3hN8v78ASNIh/wf?=
 =?us-ascii?Q?w/ci9yai9m5wS3DmALMZF0wdfuw4VbpzI9uzxLt2tgKWhmbp6XLUq+QDHezP?=
 =?us-ascii?Q?Trqx1wGl2mWkFA5xWQIMjgGBv49Y9+gXnfckVMfeqHEY/b2XlOisvbbAl1Ho?=
 =?us-ascii?Q?iTepz4ecM0lzcqtutdihvPJ2PEVJOMDCOBeSZbGs+qxX9RKaamgRPlNRLfEb?=
 =?us-ascii?Q?FlC9RBz4d4k3knfdeh16XXjL2JVAuEAHvm6s3N1l13ybVu2HDBtZCunwNR9w?=
 =?us-ascii?Q?kUVQRhNsPLZcG18rg22nCVZQ7/wi0ZeaTUNlzbtl5OraNdS85vJyiGTFZjEh?=
 =?us-ascii?Q?gDwf7i2U3VuR5El4GJx455VMzVI9BCnKyb+Ph1OWo+IydFaFNf5Why4HfAnS?=
 =?us-ascii?Q?5uWN2nJX1VBYL3u9TdCaSWXJTvb7hyYl7D0f3T3Jj+lYytjyh7ejx0CXyJE7?=
 =?us-ascii?Q?SmajFMnxY5sDpFj65XUCnGUFKbdYysUi5bLFfEJi0c0EFljUGPdyUSB49AhA?=
 =?us-ascii?Q?CFluNdlCFktgHLaE4Fz1qOzqGPyWeu28lKbLxNMBfUmdu7vgx6lbYUxe6Xfa?=
 =?us-ascii?Q?XG9Nv9iJBGwOs+Bt8UQRr8MNat4gILDYHjcwGvrBc3SOYRzhUXNkDmVK1Swd?=
 =?us-ascii?Q?Tg1M79h7QLJPsEg578oWZbMsenq2r13GyXb95az+Sepu+kU9K9USnv4Aj4fZ?=
 =?us-ascii?Q?6U8rFrQFGV77S//590DqBejtEpv6CCCxxO9Yz2h0vClmB6UJTEjbKynGQfpO?=
 =?us-ascii?Q?KFNBSVS6OfqITpSqBMwMaqru8WFUL9UI6He7+s8YB35hXX5a/d38RqzfeVqo?=
 =?us-ascii?Q?akdx95ZVL5q/OaN3ESqZ9PvxxpTfbjVYOhUuTOJn4CGX2PtRQqjGilQcbeSD?=
 =?us-ascii?Q?StGtyUqTE8dYaFmlLtlXyh2gkW0u+6LdDCyTQQQtrJdvK8Vry/+04R8V02xv?=
 =?us-ascii?Q?9BHGraOCawOx0Kc3uuyQ6DtU4ikzfRc4HAaEvntnGiiiE0vGbJeJlpaihWSd?=
 =?us-ascii?Q?33LTlcYyW9BJDPvyaxpe9bg2YDRtOo9YonDTtu3QCsFomM8CE3r+QvQXTwSI?=
 =?us-ascii?Q?tpFe71Br6M7zy1GYusFKTqc7jaGvvVB3mLmkKSVDj+yphFm0MdFgCFTVPewx?=
 =?us-ascii?Q?ErLWvF9gDd5hqBH/f28avMgLCjKKAQkCz2e1PhviAkuzISU/Hm9OXhzKUliB?=
 =?us-ascii?Q?I8/ACYb28W82kWEcBqbWJfPxG4bzW67d17bhe2hJy51vHMSbibLWfxSH+DqX?=
 =?us-ascii?Q?jDdYw15uMTnnoEsFRYUV2KRoUPERgg6lnRMkW3f2rVtafbPHrkIqr/O+b+9u?=
 =?us-ascii?Q?AQYXE2p7wk8P4wKmomfmFroCnLCYtugeRe83+sFiOAZLjrHCvyJKUsGyCGzo?=
 =?us-ascii?Q?7uCFeSd5YcSLzOcqkl3kVEGIsIdpcYHsDG6pcPKYYYDXOf9OBoevYKxCEfOx?=
 =?us-ascii?Q?7uDgEPJ/q0X/7vHr+8yRCLz68SFGjXL8IZkpueEOwfjSAtyXRdzChittWCb4?=
 =?us-ascii?Q?V7LlyiWIzOu4356SZrA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 19:35:15.4611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b0aa81-19d8-4cd0-668f-08de22229ad8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8188
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Nov 2025 19:35:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19254

meta-ti / na / 20251112193005.3655764-1-a-christidis

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
WARN - [meta-ti][scarthgap][PATCH v2] ti-img-rogue-*: Migrate GPU driver ve=
rsion 24.2 -> 25.2
    WARN: Commit message does not include file/recipe name: ti-img-rogue-*:=
 Migrate GPU driver version 24.2 -> 25.2. (COMMIT-MESSAGE-2)
        patch



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH v2] ti-img-rogue-*: Migrate GPU =
driver version 24.2 -> 25.2
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Wed, 12 Nov 2025 13:30:05 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ddd9eb795b8dbb2d05ccf6b519cb74dfb=
a2c3a64

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202511070802
- Commit SHA: 5b095d968eb225b72e44dc164683aa9157ec2b93

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS




