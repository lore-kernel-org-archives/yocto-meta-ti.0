Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93738D26D9B
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 09:43:52 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29659.1768211030372614436
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 01:43:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=GFl8INPm;
 spf=pass (domain: list.ti.com, ip: 40.93.196.33, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kkx19oPbGEBiNYJFqoFDgJk2OJTczCdEMghnHPn99mTayttpKG92vgiIMow++31jmxIfIbI1zlBHirlqmSYx+nJxoiJ75JqIB2e5zP8JrtCym9IE+QKqPL7g+ANADqyKvpm/6W5GObBvBbWyPCc06NzTBJqSgDdG0QdyjRO0lBfXbGUuLW9eZDSMfouuERwEq7goZ5kmLzSJJwKYbhoD/a/xpPryjajtc5xc2sE6mxM/4o0PGGfJ0mwobK6+evfu6GywxbELvCDjG16ZHJLDrltOQjM7juyUKQ605nZsVI+IPPqjIVsUbcmtjgDFdLYFb87phL1/sDbuEmzQH5EIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGtcGJ/89vbnseqfDQJPVmUMyU36VNy+fyPYt24hBeE=;
 b=HDtKtEhtVs96iXLOGc09wBo8Bh82UBiz/Uj0dsODQMh2L+TVt0xwSBBBtYNpNeQVQ0VetjurYGkWSeAb15lRAb5Nro6nx+pblTXzS1S0l0frvzpZRk/qYDDWdM3DxOb+RZ5ET+ON9RzkQlNaKxk6knOzKUtmttZVuEdX859sRZNcQe5Aiv8eice0O2PlhmJfF+St/QfkKUO9PAhJ8HZEntcpUf5rGngSs6fWVp4a9D6GsNJp3O7b+0GaBmOr4pQCj1x7SrvgX2n2DHH2CYf5lTDK/4bd0rFmp8XfR79SpHjvGuSmg7l54EI5Y7TOoXaIxRvUP4E8+Apaq0ypVCVNkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGtcGJ/89vbnseqfDQJPVmUMyU36VNy+fyPYt24hBeE=;
 b=GFl8INPmpXMn70321cbhNlcg0CeNgKDYsl3cmAVscePunFu17WdX2oKD0nrHEjilk7CAcPzlQQ35hacnwyUkDEedIqewqbQFLkr4WB7qbNhWdr+2iXFqwCZnzVNe/XQjSSijtZvSc94oCnf+D4VOVwnrk4aPbUoXI1F6wYIUxxaji37QvPvD+OjtylV12ydjrG+ZRyApx5wEHELWnyUTJ2wkCSXdQhHVHcnGQ6cEQc4pyJtTTkUUg8fXn8N6UqVb94WWgsA6CWM45CdEbCih8XryhAfsFXAgUNbNWnqgJFqT8r21LNRT+dPMji3jiV/bG1NXf6ejqQHX34RgpAYHLQ==
Received: from DM6PR07CA0091.namprd07.prod.outlook.com (2603:10b6:5:337::24)
 by LV2PR10MB997776.namprd10.prod.outlook.com (2603:10b6:408:378::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 09:43:48 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:337:cafe::7c) by DM6PR07CA0091.outlook.office365.com
 (2603:10b6:5:337::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 09:43:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 09:43:47 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 03:43:47 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 03:43:47 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 12 Jan 2026 03:43:47 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60C9hlXW799760;
	Mon, 12 Jan 2026 03:43:47 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1CA469ACF4; Mon, 12 Jan 2026 03:43:47 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <a-limaye@ti.com>,
	<gehariprasath@ti.com>, <nm@ti.com>, <denys@konsulko.com>
Subject: Re: [PATCH] initramfs: Add dt_to_config script to initramfs
Date: Mon, 12 Jan 2026 03:43:47 -0600
Message-ID: <20260112094347.517266-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260112093125.73038-1-m-shah@ti.com>
References: <20260112093125.73038-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|LV2PR10MB997776:EE_
X-MS-Office365-Filtering-Correlation-Id: bbfc829d-7014-4af6-d20e-08de51bf15c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|34020700016|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?68DcWMjVp0PGcqgFIZnU2vsTYAAY2zIXmiUyYYDj6lazwcWVgtgQdyRmTWdH?=
 =?us-ascii?Q?DTZ9m7EBvsu+64F7Ca/rMBgaQ55knDal33KNPJseH1xlOLQJ8ubIuWxbpsKa?=
 =?us-ascii?Q?B6WtsOWuGxieDG7dDfob8+GcINad4oUjNTUYmulcyFIT5fXFUU0JkVpQVQ4w?=
 =?us-ascii?Q?u+a2sslq+oVYUUVTP4xcOn4s8BBuVXzyZBktZZFuAypCaYX1BgU/KBSr3dHI?=
 =?us-ascii?Q?hleZ+QcTzb3Kzx4faBQlq/IEt8N4u9AtnQwAHbx5j3x3np5woqw70GZkPCzk?=
 =?us-ascii?Q?FPdz1lIpyzlSlrdh2vcViYjSvo/EERSg1QLkcPb28xC4NdKZ3cJy3UGeaclK?=
 =?us-ascii?Q?eruwcbz+e0bmZdRM0bnHE/6O3i/DIUqfTrGbPsSPFCVG35+NzRxCSh5GCBD6?=
 =?us-ascii?Q?qvIvz+8KLRFUe9pGsG3TQew6g/L42clm5B9i5s4a7lP1LqGZtmVPKjEuK8NU?=
 =?us-ascii?Q?ymfDgyl6oAHT5ru3lHg0JhKCgjIycg+RSjDVrY0hCgPPHDT9WAl4BEDge5ee?=
 =?us-ascii?Q?y9RCBofoRNDhAKy678WO7DjIjmHIDqCIM0WffnU/Nrb9eBtYFXJOyVWYfTvq?=
 =?us-ascii?Q?n0wlxGpNqVwp+JTMjVLyVdskM+sqIaltbgdX97M4JTdxOSIVXMGgl5GsX2Yz?=
 =?us-ascii?Q?PjQVQAXQNFT2a8ohJpeaTOMVctYTRmysabcFLB++c1V8IuC4O6nYZ+gQQPz9?=
 =?us-ascii?Q?MVbnsiMcPn1JpL0vqfr0lnv4j/FRMpDlF87tpu/7vWVYFtfxrCVmQzXrgTkE?=
 =?us-ascii?Q?97uHaSV6LAdiNi37J5fHNKdSPVbE7Aszafsa7X7BtDHDVzRbyHzht0LH6NTx?=
 =?us-ascii?Q?v7f4SnX+Y8RnJWoyFopELLcJ4kF/5NbER3fH8MBVN5FXx7aOP3LIQ41RRdA+?=
 =?us-ascii?Q?CSJJyUMKaUq/e5bZqC7ks6mHtn+NClpcVUWZSNJLi3H7hHdKAPV6yubEF+zv?=
 =?us-ascii?Q?BUC5Ib4Ds4nIcq9Fl83qsHVqSsD+2WOgEEfQtEsArj34xUp1DArzXBfm4Xga?=
 =?us-ascii?Q?UbeAFDn9mY2NjkTvXmBZlLLvfK3nTnyWDrlrM4aP9c/U6iGKaKoXdqQewGzH?=
 =?us-ascii?Q?WluvGKkGGU0nJ3XVLj8N8vW2V3gLh1/axcEj89nbe782paJ/Mo9bGi7RXb8f?=
 =?us-ascii?Q?c9Qaew4W8n2DuOKpPXGr8GpgWVeDnDQWb+njk3QOrbrVd/pAlnEQXX2MMZ2Z?=
 =?us-ascii?Q?a2vMgmFzOmgtya9XPNf1lvwyCVrjdjEff9ADuKGc/Atya8Wr+1pDa+MEP/2B?=
 =?us-ascii?Q?2Xdo5rHCRJt6Nc5Cfcy2ro6aFI2BeOiaSXDVyxqI6RnPoimEWLaF7BpXnnT2?=
 =?us-ascii?Q?gToLwQe5lUbC8JGT0++834A9x4947iHT8RwtuZSyiECv3Tsnrlod57sC/Pj2?=
 =?us-ascii?Q?112b3TFdkbP6x4xrNNgnft7n76Ly0Agb2fmUlesNDmBRZiCZpwRblLbtJWvM?=
 =?us-ascii?Q?n+umaZWN2j+UAI163QRIfRjXYvfDEsGRbyKfxRPP3VAeML0zxJbumzXsgUog?=
 =?us-ascii?Q?5qxt2E5JulDyHIZmxkIRDB2CFytCKhO75Jd+S5b8bcwZeIbE+Xtd6b6aZfs0?=
 =?us-ascii?Q?x5/s3APtx6/dds/Kfek=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(34020700016)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 09:43:47.8225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbfc829d-7014-4af6-d20e-08de51bf15c8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR10MB997776
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Jan 2026 09:43:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19405

meta-ti / na / 20260112093125.73038-1-m-shah

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
WARN - [PATCH] initramfs: Add dt_to_config script to initramfs
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:68
            Subject: [PATCH] initramfs: Add dt_to_config script to initramf=
s
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [PATCH] initramfs: Add dt_to_config script to initramfs
- Submitter: From: Moteen Shah <m-shah@ti.com>
- Date: Date: Mon, 12 Jan 2026 15:01:25 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 8aa7ae7d5f9b64cfd687e896178cb8de8=
6a4869a

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202601091234
- Commit SHA: 6f50a74c52ddf4365d0001441c2738a48b38f0a2

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



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




