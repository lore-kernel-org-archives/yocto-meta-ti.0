Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCF0F5542B
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 23:13:47 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33802.1771974821141222149
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 15:13:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=uhROMuN8;
 spf=pass (domain: list.ti.com, ip: 52.101.52.26, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqDME5lfmdLixwHMMLTDB1km1A41d+LtQlX+Qjfb2EFRx8boSZhuzcPt1kMtW3My7wIlIHRH4WVM5OcnQAdJ5WWK0QX0NdnLc3fiET7Eliqtze7PpxnV6fl6Kl+2i0a7TfZCHcUhO/DuBZqDJZqHfFbD5enl/e1oa8TjNJGMJub3FgTJtBlRr2SLD0wDrBFr1SjW7ScND39kvfAqGNDKmkkpFRP7nNl2YG80izyygm0oSd9JGiIPAPK6SF7rY/dE5NrC+E1pIHlrbgOdtiDU27Ta+eI0LPwnVXk7tVJqPXjSBC1GeI6S3ZURpifN+Ys37zlyt3Ly2uI2mfzViySFlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxQwpsAb0usMPPddK1JlAS8G2TWRpyls2GZ5ZwLAivA=;
 b=zWHcr+HNv+U5GA5BUffWuFWJELxfzRyqYBhZJW5raR/BTIoqcKzPfIT8Stlh/C35AysCZI6lCNV89ZgiMgqasR+rxiA5giSBBWZwFgJHcmbfwegP8D/QZCp5tIZmeZrG7DMZCk1slENBHsTGjEZzY85QEIcBQK6Y6RqgfqKk4SmutPWyiewgLi8y0G31lQvxfeMJReLKFag4vh8mLH5RnvszrGt8HJb2CrlNPx9BP4z3Bp9SWG/bAv6MXoqr6vxgnWmZDEcgnmkBofqESUycKrf4ODOEuKFRj/lXeYH3vAzqpgolxtpV6HMrDAa6TS5GdHno9/PNBSURC8Fa6PMHhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxQwpsAb0usMPPddK1JlAS8G2TWRpyls2GZ5ZwLAivA=;
 b=uhROMuN8EM/i5K4Z0EmYOSdjYcWxAombcBGu25uTpfrvh+HjRXG4RGBLBLlKwxIdhL+4QxCHsMhZPW4Gh4fgEh1YPHX3UEE3HZmoM8CQummIJwNG95+EIk+ltTFETRYH/O1G+j1ffPGtrI61AuwEoZGdScReBqeya9ALewfiMHV0vEsOt7xcpr8EPg9hRWe/4z9xu1V7CZI1kGRlOPkXqzV6dKnvRdX1qe5iiw6tykkQHkqwL6NqvlId/wGavorybuDdOXEzE9uOb2eupBqjQMuSHtWwLy39H0j2OP22OtvK5YTWcx7/YTzUY45/Q87Qb89D9FJvJmdnBnY5O2Ztcw==
Received: from BL0PR02CA0084.namprd02.prod.outlook.com (2603:10b6:208:51::25)
 by LVUPR10MB997835.namprd10.prod.outlook.com (2603:10b6:408:3a2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 23:13:38 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:51:cafe::84) by BL0PR02CA0084.outlook.office365.com
 (2603:10b6:208:51::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 23:13:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 23:13:38 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 17:13:37 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 17:13:37 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 17:13:37 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61ONDbVb3071567;
	Tue, 24 Feb 2026 17:13:37 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 8ACEA2A5C; Tue, 24 Feb 2026 17:13:37 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] ti-rpmsg-char: Set DISABLE_STATIC = ""
Date: Tue, 24 Feb 2026 17:13:37 -0600
Message-ID: <20260224231337.4158363-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260224230156.1977027-1-reatmon@ti.com>
References: <20260224230156.1977027-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|LVUPR10MB997835:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d163a39-f026-4d37-0230-08de73fa57d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|34070700014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ekSyAt7qhMMkyvTP9xo3FqBEi8DMU/4mbesZ+g6+Z/t3rWEkxNg9gWXMdUsH?=
 =?us-ascii?Q?9tv1lBYEH1NCUv5AsQva5hr5rKxdi6EAEiUF42NmxV/QMzsVZf7ykB8O/eAp?=
 =?us-ascii?Q?q2YiBEeIcmX+HIK1jHz1jmE1Kmim+FAH/Loo9pH7hkdOtg65Z0w2iI9lQxEr?=
 =?us-ascii?Q?tLy2hsZnOzvgwJFdfy4+z57ptCAOnQXBtLNeNsHnQodeE1u+jV8ACF33eB0D?=
 =?us-ascii?Q?RicG9PuaBCEIqf5vHVVTsvkxX4TCGaVWEjbtxz+QNDgYIGeusULlQmd5CIUb?=
 =?us-ascii?Q?sDDDP2goqF15g5DFrgjz4UX2Nk6c0MgrtlqtdsuaNMETNQs/V1684JP7j9E8?=
 =?us-ascii?Q?VtmKq9ifOKTXEqrfdXHwds/I6kvSEVnLIDC+0Vcv2xqfrPo09+yUzk94/2i5?=
 =?us-ascii?Q?AY7EAnh7akqIY+xxg5fayaHjLgmX7o7wBWKyRNyKoBUjcoai84+083KcJ6UJ?=
 =?us-ascii?Q?ie5WWvP2HJmYEOxIUt1pVoyjt0tM/HR4Tz+yZWAGtbcySeJI72KJu9Z8e+yw?=
 =?us-ascii?Q?GTH6iKuxBcK/WIGw3FcnaKwx5pUBVpi+FgmdrIQRhsE0wEDlRAexUMqfKYfE?=
 =?us-ascii?Q?SP3tS1/orrDPtlAwY6630L216tTfAkT0xR5u0phDtaG9+soZISzfWv8OaUSx?=
 =?us-ascii?Q?9DDhgcqNKBs4Zqhqd5ZMBG6CzQe6+3HquWP4ApnzALI8i8kbTMno9Gm3TxfV?=
 =?us-ascii?Q?9pDWF+3i9fmcUjCAzpbetg8oO49PhqGseA1M/n4LKGhRfWrFRYmfWCAtDveC?=
 =?us-ascii?Q?PE0Gmzo7D8aY1C5bQuaHzlx6/q0wTdRJJDVgElTsjz1vN+e7MnGSOxlxPATi?=
 =?us-ascii?Q?Mg+Y1LPH03oZUlVyFgvbFUsvWP2QvszIF8YrfpmgOMXTgKu3ccMHuArYVoc4?=
 =?us-ascii?Q?h6dpcwNbkFa/BFD1vkVFUhgLVeDqhBit2kpBymhA6Ig4GeRA/zHh03zIGoi8?=
 =?us-ascii?Q?Sgu8bNLjukD4sWMIzwVhPiI5mlNebGOyJuEltrFQYPg5GTghyHNIL+nni8H6?=
 =?us-ascii?Q?ABSGE6l6/OBEQyVMUwVClZMw+89C6jth18rLeBa+OJDAp6wmeqbZ8ZxBWaLQ?=
 =?us-ascii?Q?2b7ST0wI3+yjidtWVs/EPZoavkRxAiyCQsErXmsBJ2uQq2uwCqeG+jKQccsa?=
 =?us-ascii?Q?YWXr88Wskgri2/h/bXoLJuM9u829c++vedf31/HNnRuSvo6gT7nXxsjfxMZC?=
 =?us-ascii?Q?bNuwR0OddXcLqaXhyAPeSmSBX5fQ09x4bR6y83OZVl2xXUrEy6nZq6FejQJt?=
 =?us-ascii?Q?4rB3Kc/bwg8e5yuikR11w+46pYSmqc4CwtM3iIJ8r0DLWx7fwI7e3s4BF9l4?=
 =?us-ascii?Q?6UufxXjC/+rhhoUZxVl0NctHTyXILjZXpfDcENUgZTBZpKRq+uD0QnMBHf9f?=
 =?us-ascii?Q?yBsoZYXm7dcZXN6Yl7TohUhb9zHHzt1GNxfAaJUgIwVosxhuZ/c/pX9c0FA0?=
 =?us-ascii?Q?qnU9qU+SR2hFzor2k4KnIQNIs6IFcKKYjqVDPn8kTIW9SKxnD48tebqfisM+?=
 =?us-ascii?Q?eRcThWn7TZIpy4Ao09Xlw/nfUdjjbsUxHdLADksDWQXbN7f7MJRwrFNpGJjs?=
 =?us-ascii?Q?DQm4cvn55aO/D7+To+cmEKzMcMUGPfvsZrgt20/1q4UdFt/KT/s5GBv9Wiz/?=
 =?us-ascii?Q?ZQpu7hlVaHqNx4/lmCfHpTgaAccP4nStA9X87xuR0rS/?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(34070700014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	a7v4y/6Y1T1OlU3y76jmq2o4BhUIcI4JEE+w49CiZm2vy500bJQ/I6JtgwQ90fJx1KjKMQEDnWNhAcE3pv20K03Xvq81EAtfrRIo4lklBGWcyoNbZ01x/5AkCCry9heeh7y+LWJtkyWRuiSnOPBgwCX1TrMv4l/lbVuqoorGXxU9BGApINOJbewxEPhzTKt9QDRTNRe81xcC6s3qR3gvL7MRkKPxzult7zmP72Z22mGO0wXzGRDNx1l9rfXdJMwI6BlwbavVg42ijFFwU12DOVM6NSN+hcDGRKdCTJRPpXok1v28y5Ma8kRLWTKIjKbirYeSAYLJs7uehU4GGVKkARyz3xclNrtOvrKSG5+gNBvR8wcAy8efB4jXFkr72tDAPI45zWVEcScEURBwp/IoXX1uTF0VLyfM+FVrW62ueCrxHJLvq8/B754UpQ1LjdfG
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 23:13:38.3972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d163a39-f026-4d37-0230-08de73fa57d1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR10MB997835
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Feb 2026 23:13:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19593

meta-ti / na / 20260224230156.1977027-1-reatmon

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
All patches passed



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
- Patch Series: [meta-ti][master][PATCH] ti-rpmsg-char: Set DISABLE_STATIC =
=3D ""
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 24 Feb 2026 17:01:56 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 47537d6591929afbf590aca6a3db30377=
51e2b70

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602240400
- Commit SHA: 0bbd8989d8351751c1e084dbfc48575694d1d346

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




