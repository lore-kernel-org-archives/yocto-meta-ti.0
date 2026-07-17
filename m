Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AA9C44516
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:08:39 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13028.1784293716238695757
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Jul 2026 06:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Gi1GGAxh;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=bkTzkxgx;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66HCKL712493602;
	Fri, 17 Jul 2026 08:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=TgHvB1gzCiHXadx1zkjZPeA5RFwCAxoig2bUiV3VT
	B8=; b=Gi1GGAxhgUUmHt6xR3aXjDwLaPim1qKuUbuETPbZq6kKbXB08S+QcPvXs
	Bp2/RyYSOSok2Te6+Z1TS0Fcx+i/dootiUdHX65qgRdoR+zfN2CldzYMsbCY4yoD
	n0PwF09A0e2xKZlYqZgqVSN6y0PmVq0VCuP9U4fKNjb/Y+4TgWD+c/rg+/XIO1Mb
	mRbsaznfQEYlJA6UYrfiLHW+PICsIf1Ubix5Uw1Wu3tKSRSyshdHm4437Yx/RZ1D
	G4u7cb5jBR7IGqb0im1c/NHbhFhliqgSDZsvKj4MzMn9KV4TCSn39VrLyQeZaCtE
	kTHSjSdrcGrlVbOvBTHmk7RqZcAsA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012005.outbound.protection.outlook.com [40.107.200.5])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ffks30duw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 08:08:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RdSvE4Bi+FMAxr4r3n2ZDg1AEftJ2xc2NOxWSxwhaIcFlDrDZXyXh8fARM2QStQhTX7PFY6WP82Uu4wvdTBrUIOmjPGI///Ew1JMaEy3Wp7PkBf3j1Thbd2MGukVqB9gzsBjFFi/y7L8AAdGzXit0IVe181ah72Isb6ExiBesAWdykKBqp4dXtcW3UdZC/p/BBiTQ7FV/Wds63JjGl6LuLYotVeoYBga1E8p55elUnWQUlG+cTM0KLaReyfJRNCiiYsVLa8MEljCdI0UlFPzL7mynN5TAy/1yz53Seoe03r/O+8OifrfU7yGlPQqRqUQwuz1AvcZq4rzhbKDsS00Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgHvB1gzCiHXadx1zkjZPeA5RFwCAxoig2bUiV3VTB8=;
 b=vpJhE55bMz+L7XZ+6av6NfEVvomNl87jz+2B41mfNJMWL1zFrk+spEJ5jwHcSxV6TIvIkrUflJYXTm0ScDdvNWoJhWmFq/ZQfklPUTatGKot9dnp00RYkskmuP5Io4Uo42Larok22tuPwDBAZx1BUlUXfJzNXQERmYV3ZUlrBTQprtkBauSVmTr3qg15fwqk4/+fp1eMk6NDzxq/NP8vPbxsHgcx9ldtM0stIs3sfSXniYaXGR/3dkDJG+ypsKJydwERT3zSR73G0jGh/M0OUIqEjzSDmszlFCElhsAMINyvJhqFqtMCfuoCARpoNO3OuNtvaPsAIV6wTF86H9qpow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=prevas.dk smtp.mailfrom=list.ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=list.ti.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgHvB1gzCiHXadx1zkjZPeA5RFwCAxoig2bUiV3VTB8=;
 b=bkTzkxgxL3H8Jxxk+ejhMPVu6mWjhT1TPond9Hf6BqAgVa0bxyFtD8VSxaJOAlBR01az5w2BtnsI2nJeBz8lERGvjGMJL4MxTWidqZx8CrAL0ThVeCECrsFlmSRT5IC4VWEP+p/e/DPw1Ewhvily2Z0Ca2gZThshEIyJyCA3zBT7WsxKs/YxE7NRGgiXxILYW2jAyTfn+qdUEMRK6IatMupmQ4C3W7WWIwlbSmEnHbbMvbULezGj6PbBsBN0/1mlhGySscER7GgjcTUyPVx5UpvbemlrQ2LAuzBEslU90LZyBKJdTU+pJNIqTQo+tBKfaWOMqtRWhWD8CYhIdrHl3A==
Received: from BN9PR03CA0578.namprd03.prod.outlook.com (2603:10b6:408:10d::13)
 by SA1PR10MB6390.namprd10.prod.outlook.com (2603:10b6:806:256::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 13:08:29 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:10d:cafe::91) by BN9PR03CA0578.outlook.office365.com
 (2603:10b6:408:10d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 13:08:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 13:08:26 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 08:08:23 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 08:08:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 17 Jul 2026 08:08:23 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66HD8N1M3254436;
	Fri, 17 Jul 2026 08:08:23 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 73278138B64; Fri, 17 Jul 2026 08:08:23 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Rasmus Villemoes <ravi@prevas.dk>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [PATCH] mesa-pvr: correct INSANE_SKIP for mesa-megadriver
Date: Fri, 17 Jul 2026 08:08:23 -0500
Message-ID: <20260717130823.2324802-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260717124847.2123825-1-ravi@prevas.dk>
References: <20260717124847.2123825-1-ravi@prevas.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|SA1PR10MB6390:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b3a4c78-953b-4b67-80ea-08dee4047d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	pqLtrMblII4CvSxcmeEBizJDkuomp+rFMxT+2XKTEG/tmVAZqSXLCZsLlAkGsPbx4uoPS8wPPDWCLm9IKYRVU93Rmqoc4BU9Mu9bE98ebZIb4vVgRE+YwJksSqa/uZqVQSeDRloseThrm0yV+MoBogLXStb1m2POQb4AW0WVAbrpo0xptDutpxwJIFtQfodM1vI8rR/mvsntBaCkJ4ywqOWtIMN8yQb0MQdQfxyOf+762EOJIcxmSYoZAAtPbPgUkZVAHmCaTPe7X/hjBdq4pxB3ZCelIJ975r+Rg65v6Qcr5Tb09YNWKkMmMR8Js2sAyFyNnlWTzgPEA+FbNqTOhkRb/A47Fclvgdih8fQsLXTUvM+MzDdnvFlYANLqy0pHlteDpTsPm9PUPq5o78S1/a3DrtG/KotH21P0rnC+r9ENFuFyjwQFGJQuNocAXK2uVdcjIaNEXCC89lol5DUn/GbJBXwDjvi4dgxGoEHCl6Pt/GzMSLVCpdpif1uo56JU/X5zSXgGVEoyL7UarT7ivlDekpawb7jiLoq1wxRngorB1pYRvuI21wpTy6xm6umek1K1ukIgxnoMHLMV/gzFxNv60sMz3gMR9VfcnUY3+/7duBzbIhIhEqMY+YiYsUPcez6nU6xDS/lH//jG2VpfGMOvGuRFZ+kjU7ojtGR1qjrGvsxAOCyuxlaCSelF4PAbx/1Ur3C7NbbcJS01SJxZJA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	NYkDvQZ7H4VItY3UecG0MHkkCMMTq4WTf2YBCGVzXOvvsXm9bhHUDHBfJoWLsYUaPujFwaFVwWN0jAMaK0Za4psxhNqQnJtLXjfS4lZWIUMyMBcyRwWdCxURkzJOzdYHWQZfybPzUqWSispAshNoHn8A3zS3Q7GCLwhATwjM/hp5iCQsg3siY2BUIrAqPINGvidLhMYMpm03PdJ4kwHEWG022zzt4YwRsnz1qHKLuSlYlylRfbWdeYjTr5KCzxhmneTXqhNHHLp3D1uLrYh8kBoUC6BQrdSOHDuTIB8dWCZR2w9grF77Rc/bGfCTL8nDtpedY0MA+97HYV72e2kmknz2E+8joSGBBztutMViu8XXttr80a1tSWo6SpNih30K/jHPm8uYMG3gU5SPB0CfU598G+bXSn3BHM+5vodPs7wXXNutEW08tEPVVmQjm7md
X-Exchange-RoutingPolicyChecked: 
	a+HJCNLSlwDALTFAP1njDY4T8UQ0+vfNIsl+357L7xde1uCACJ33eLo7wPEfjjUQh8Pm8O4wjs2QfmkMQTrvUVySLRy003lDoZCOaA3nL9QwFVQQwct07wImbULVpEuUeuDdekTvZGRJRXeekvgGz9ZA7ftKl8I/YMvrYNLEh5dkRufTOxL6cxOOxvZMI0zs6us6A6s3JLqSWGtwws2YJxkvR7Xk85pi9NuH0RXkOtOuArGSLkLS7qf3Ciu2mZ8Hmg+3p0n4JOcSs9EFWMzoPXvgAyEYdfvE2FWt6a3N/RuG5HihOyQnP8fvEzwQ5SglFVxHgfjAlM3x+OpKJA7nDA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 13:08:26.9823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3a4c78-953b-4b67-80ea-08dee4047d93
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6390
X-Authority-Analysis: v=2.4 cv=e9Y2j6p/ c=1 sm=1 tr=0 ts=6a5a2953 cx=c_pps
 a=Mu8XLVeRokUZEw2RBKxlnQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=QDX7R3trCYtZQZCtdsAA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEzMyBTYWx0ZWRfX2SujL7p3uAMn
 VaRBalgfxO/rE01BFqsmi6JwQBEZA0h+vH/uGzPmq8JtYSMDz2rowXEm1DSHnkZDNwTX8MYfUxj
 2WsMG1sFowCHge+UzlWSgFVAd3guMeiIskHMmvI1kSQcHf1kXd7l93R+NmDf+MqPDC1t0MKVskX
 vdxEZ6eK6WPD8UpEeCNLfVk4ctE3/8f2Ev0ET0so4mbiargwCqAcHeoB6oyB+Gang+LvIF9kxCB
 JH3liLWaMW/hgEwjx199+I5YJZqyJ+A3wQJ+RNY0Gic/i68QQVGzwNKU7DokFQ1qxpPQA0Br89U
 iQKCBB8FSIO8UWG+N9C7GcgKSKmBneXiMgQLLXU9T0RzlcJ+08UEMb+x1L/6qJbRnqNDdVzrkcT
 bR4MXV84xd5q35lv93dfaZzqIoxy6/uERC0MIlojteCy6WVV3NMFtff81+Smm9QZvhI+DZ/2kjX
 YKF09TodhRE/gD4Mhqg==
X-Proofpoint-GUID: tsVu8GCq2FgXgno5goh7DSxYEU7buDAL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEzMyBTYWx0ZWRfX+R/CJPKcpRxs
 hNRri10POOc4B9+ujpPC8/XG3CSN5Q2UYqksBLUumNRG1ZQdEBVn5OvLLmfyeP01GhALRyVzEXo
 +4aSbgRW8YOcnJ951n89hyrUj5E5vxY=
X-Proofpoint-ORIG-GUID: tsVu8GCq2FgXgno5goh7DSxYEU7buDAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170133
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 Jul 2026 13:08:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20160

meta-ti / na / 20260717124847.2123825-1-ravi

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [PATCH] mesa-pvr: correct INSANE_SKIP for mesa-megadriver
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:43
            Subject: [PATCH] mesa-pvr: correct INSANE_SKIP for mesa-megadriver
    
    WARN: Commit message does not include file/recipe name: mesa-pvr: correct INSANE_SKIP for mesa-megadriver. (COMMIT-MESSAGE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [PATCH] mesa-pvr: correct INSANE_SKIP for mesa-megadriver
- Submitter: From: Rasmus Villemoes <ravi@prevas.dk>
- Date: Date: Fri, 17 Jul 2026 14:48:47 +0200
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a291efa408b21134a86fa9d228db103b580b9db9

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: XXX: Temp update to ti-linux-fw branch and SRCREV
- Commit SHA: ba3ac1c0a1753bfc6dcecc132bf7de38851673aa

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed




