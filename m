Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119C9C61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 15:14:25 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3002.1787930054695324325
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 08:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=f9TcfuT1;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=ltxKrTP8;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDOvC41782580;
	Fri, 28 Aug 2026 10:14:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=3TeCxbvQsLjpLqwx9X9jqSclvZ+V3Ls2jaZcxCMYi
	nE=; b=f9TcfuT1bNQ6d7EkjcCDlpAlct9ozK7FE3BAH3WnaK8vkluxwfIwzl4+a
	ie3IgKI8E264WpcW/k3UOni1NcQDyvHx0vMgEBsXZ/fHc4nuFKuPVr52136xjhVV
	V1TEzylZdj6XzrAKaq+oskCq+afY/9zcjrAOrc9tzunIAo29iOQ+dq+E3FbAijug
	nQfBcr8Y7ZXcBZHT5kW7Ca7r9FeZHv9G2y4EHsPnnY5Tv1Hw6i//mAe2tB44bF8z
	YJfc55c/7vXYsRDG64ktD2OpZH8PC06VIBojnjhPLFEgwEafLL9/Wmxc86tjaf9U
	CRsPufI8sEu/EkyAlsNQ9IaKFocRQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010042.outbound.protection.outlook.com [52.101.56.42])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gb24q3ywf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 10:14:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amfgUTa71z03x0IFoz8S5hzwScN1OJje87sunMNp9XSznXQg9DMAAP8qsjlPkJ+HaV859Ur99T2ZKVRhJ14qT0Gm1822PvcyQSSx9gBlnDVR/+MLCWAKfPMYs6pEmSatJJjiSoloWqy/CKnLU9PQU9QoWBhgpXDV98l0iu2/GSDg4p1+TlyX8Y4ZtC9pY2ixJ/eDCd1ts37n5ip8pznoq2Z8MLw5z/d7PCB3XE6h4B2BhuLiwfTjOZzs9tb7/96yP4aGH/a7fQ1k95WdRMTYSndyZVUs1T1PWTjOyJm6nHnHyQkIhkUJKLO9bTe88eHdHr1wSDFWSPN7mFKIRO+MKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TeCxbvQsLjpLqwx9X9jqSclvZ+V3Ls2jaZcxCMYinE=;
 b=dVKk4+MRI7tuhqfwIgJs/2MB9N5lTI8k6PjNw72Xn5VEJo8aV6R4QpMD8vvz8demkuJ3OttJOpGRA8IS7cZclwzJOWN6AVQlDHIqzyw6/Xac+4EKi5wWGfGnyQrpRywaBA8IMmtHpyPIFSkddAs6uQX6vcXSfgm/0Joa9olNuZJlGBAWU1Hjeqv1ON176n6HT+a4vQ18hX1ybVWurYW/oZpYTTFXmYJ1XEqPajBMNWxSgdJR99mFmw4cHwZbKyPqY2IitFStev5LXUU4byA3sHkwvlTYCkyiM0UEb185eNMDl1J3PQp3DlCDHAWlznKjPoBgtiP7iQQA9D3w57XyRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TeCxbvQsLjpLqwx9X9jqSclvZ+V3Ls2jaZcxCMYinE=;
 b=ltxKrTP89RGgxppwL8MgUYWa+jlybC9loOz7feQ6Dfo4tkaCZ+50bp3sjVCIcW3w0dMMRlwhMnicU4+DsJhfMkVZgKIqRvbTxXgsS1/hIB2YpABwt3CUGwGW4xXPlG+yGRPGHVuF3yaEo8bTbRZY9a0i1ojW6p+SKrYt7tltdet269evtjO9g7yBd9yYvV4cIw/AGK2yRcIrMPwRad+Eca1azRrf5lLXblxUZRx688pu8ERiQrlfGjC2O1uDMHLFay1xtChlb2LkCDZpXgynceFhxNLZ/9Y16245by40qMhZe7MDJse1tO3zqoYBC1ujJCcJp743SrWEHadz5XqZrQ==
Received: from DS7PR03CA0010.namprd03.prod.outlook.com (2603:10b6:5:3b8::15)
 by DM6PR10MB4201.namprd10.prod.outlook.com (2603:10b6:5:216::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Fri, 28 Aug
 2026 15:14:08 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:3b8:cafe::49) by DS7PR03CA0010.outlook.office365.com
 (2603:10b6:5:3b8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Fri,
 28 Aug 2026 15:14:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 15:14:08 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 10:13:53 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 10:13:53 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 10:13:53 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67SFDrw81154372;
	Fri, 28 Aug 2026 10:13:53 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7C8DD9ACF4; Fri, 28 Aug 2026 10:13:53 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
CC: <reatmon@ti.com>, <afd@ti.com>, <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>, <s-kapoor@ti.com>, <p-gupta5@ti.com>,
        <u-kumar1@ti.com>
Subject: Re: [PATCH v2] ti-vendor-kernel-headers: add recipe for TI-only dma-heap.h ioctl
Date: Fri, 28 Aug 2026 10:13:53 -0500
Message-ID: <20260828151353.872520-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260828145221.1301539-1-gehariprasath@ti.com>
References: <20260828145221.1301539-1-gehariprasath@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|DM6PR10MB4201:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ce27380-58ed-482b-cb0c-08df051701ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	haCmfu+yurJBK+oNLNgi5nnI59GYdbmKy20depAwpvqZNTy7DGMLYaSNTz36ItBaGqSaV07Bs/Oq/pJUzdFkXgJNnPDxlFxUx6aA6CNgjJfZA8+yR0FGdcfxonYWxYCsWJ875LTEGvbCYKvokdr6iY5yW1N/d3rhimPBOgV5RdafZSvB2N7tpYLY2NG5ZPrjuBRs9zhrEtbCrcC0MXs1+tNCMIKZ2Mku+oscskvbTFcCk+WymAOaa7VStziG5VRqxGCf38fYs+S2wa+LPHNYu1f4UvUSPFCjIUI4bEmauOUZA32xTqmLepCrlLtffFJEsPt6ofIIxXq9/KhRK0mCy/kzuyq1cV0tTrWE57aVs/+xMqqr9H/dUz6SL9Fi33Ct8ZN2J7nUT/88uo5T3HgtUPVcDdyivXZk9SFARYzM7fK/l5jYn3r28PDoHzHFPEFe9DstjEKWXaZrfGm6qxWI4Nebradqil7Ch+UVcxse0bRz8l6+ckw1bUsnQ9X6w0DlKtC/1/agb0GzJ8YVpplZHUIc8S9tlKv3RUNDiMw8ukqxrv3bnOGCCZA+G2jpNY6yYZ7CR4n60pYGApGFHz+Y9Jnd9G1//g+TexlgX80m6KlSKHjqPNSjgHyFvFX9hpfRWfA7eZAY7vCcHowoTgIXsA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	W8SHX3bZsUElVQD+Wo9qQVdGb+P3BEc+hc/4pQeyWwpXPEsR7gtL6KD5R8frcccN8XU9LGGM4dUJa4nY42LE/YhCrxCJLNJ+Bku+I9ys2ME8WB54i8tmr6sn97+MTWDHj29HzC8FeOR5ja6mjiq+jqna3OCJyKcTRmZ7dqyuiDk5co1n9/CTPWnFrYSh0shGmXfMRPi/KF3t2Lrcwqsz9Mm6KL9dx/NTkaC7hYe0BRvDLncZKK15677hMiu28a9NdLtyPbeaMXRxWMvcDZSWqCDia/8wwjfKrt0iWNopT2bip931U3Msn+J9zew9XHGWmvlwbPLipUs1+ZifNhMgt9Mq2/UQP7EQKutiBG07np6Hciwux3cJFMIcaiLEfPEBq2tF2NLxIWk6zPN+oGmfszOS6QAAfmlB8ewVN1/xViq/RZEm25uf+TS2fhV1oA9k
X-Exchange-RoutingPolicyChecked: 
	RJQzfN6rjJnt0FjLYGfJZ8eSyrykB7xDnckwJ7kUNfU2SZZLsvSNoU+kHuHPMhr7gHJFC+OwZU3sn8s5cYqljNeDRaxsHeO1WH0R4hlEBYqrCNUCJF5GDpg36TDDlKpg2NpTr1nQzRIkFZY0/hu5p/eXFslkOStjXscWY2ODzvzIFebYemBCozCEKCNsOEnbHKbfz02CjfNeblRgJ/aGKfts70+/qU4htIkPMS9ozdhNHgqwwMSpqcPjoVKp4MItSA6JQpei0KG17/EbRqTKGW2rGZLxYOQ0HpSckY5b8k51jkRQmUZ2mAGLbSEMPxCqbsIUzA6iSwbGdSyY3QGQ5g==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:14:08.3679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce27380-58ed-482b-cb0c-08df051701ed
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4201
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEzMiBTYWx0ZWRfX7kPmRMCR8sZs
 VyCO0MIO2fvvkMwhDOmsFPJ4WpolR1Q2ToTBBDJQo71DtDxHrmU5JWkarLOzK8whsGkNoxdI0WE
 9ybRsyn8EQU96+LxmpNQPvABcHkWdKbfudyusCwVdXFhnbuq2LUZg0m23h+ive2rrqtDFO59zSz
 cPL+ZFnFmKtaFQnzqiq1iRanMfSYYTuyW6AViFBK/Yk7q7AT0F1Fbv0m+GkwjC6qdNVRFGIxO6h
 HpFuSYEJi6XGHFEkGd2XPiGXEvPTsEg8nkh9heaGiX0iAjsVszUg0Cg1kkEvgZ0NZqvNedlOmgJ
 quJFpanaPcQZKm5KiBXqGxOlT4Q9V0Sfk6iwHPGV0sX7pNsnjdeKuN0wBUpp1YiYDuq947YUryt
 M9yzx1GftCj4hKJ43c3f7dvqWuivhvQdhwJHfdtk7UfGZK5CebyXyGPjjznROlevwxRQ4mUXaXo
 GhXoT/cpMgUQzrm5SOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEzMiBTYWx0ZWRfXyXqfC7fDU6hi
 1IviScTqdjWSD6s4ErM8WmGKC6zEo0AJJcWLg6+F34LTXgZElk/zJbDm9qzrPt45bCdFuZHgM96
 i6IvCAERYIgft1geuSZgGFWw9h6bZ0g=
X-Proofpoint-ORIG-GUID: eVT8C2adYkpa36W8LtDKAKxIsullfnSi
X-Proofpoint-GUID: eVT8C2adYkpa36W8LtDKAKxIsullfnSi
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6a91a5c4 cx=c_pps
 a=cLTib2BoJD1e+Gs0wkBYAA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=ef_xxL1EtnS6UrlDfdMA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280132
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Aug 2026 15:14:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20304

meta-ti / na / 20260828145221.1301539-1-gehariprasath

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [PATCH v2] ti-vendor-kernel-headers: add recipe for TI-only dma-heap.h ioctl
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:87
            Subject: [PATCH v2] ti-vendor-kernel-headers: add recipe for TI-only dma-heap.h ioctl
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [PATCH v2] ti-vendor-kernel-headers: add recipe for TI-only dma-heap.h ioctl
- Submitter: From: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
- Date: Date: Fri, 28 Aug 2026 20:22:21 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 976446b70c12c223eb76a6ce2fa98b93d333785f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: 4359f764bdd9c496fd7b4f2c1319bdc646a87b35

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




