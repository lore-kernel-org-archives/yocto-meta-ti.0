Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE32ECDE002
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 18:33:02 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14435.1782325982179550164
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 11:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=HwlqLNqX;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=gwSOg2Uu;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: afd@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65OF2a9O3073166;
	Wed, 24 Jun 2026 13:33:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=ulLuGV630NWLi
	r3MSP2dFevp7X9NXCd6gQGBXTa3Z3c=; b=HwlqLNqXfBkrOCinfZvtWUgdoLPI/
	wAZThR9p3wJKce3plxKPaJiK9ONy2PGif8yoeH7FmNW/QC4rfltBC6uLTkj0e+UX
	G8BBuR9htIA8uMflCPunesiyVSRtVo6TKUDEXziZw3iVFNEaU8eTRAROfW+T/lte
	+np4myr6XV9+RzBhWIAoJxq0sIdj49q1pbmfX7op4YTVFcYlfTB3OZaXTG4anWYR
	Y/ubNuWp5oN1N91aCVZHlNaid9e49Ae4iwS1+BLOoVNFkwSqD+I+UdEcJeqodNqk
	nIG38Boc1wI0HocRozKgUrVNo34F3fQKJb2hiaJnUfs8g9Nx9FgN5kIRQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013050.outbound.protection.outlook.com [40.93.201.50])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f0ecrtqm3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 13:33:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMQmhOQk4W6hbhbIT1pYluoYuyUS6wUKu39oSNiSdw/DkFb0BKa411AcDtiKodlyrv7sgY0XY+JOmb5O60S81m8Fe0c8bzHlbC+vtVhUp+sYhI1fo0s1UhyHGp5FC6DWdEQNYVAE8AvOXxXfwW6WVLtPuuDmIaBu1ljOrmZGBGY1U+7yQ0A+WTE6B6SVwWi+R/PgZIaEG8QahtdPxHryprRix0evLkSwJYbeFvT6lp+57UO0RxfczgoHinve7ShLHsACPFrDNYCnf6vFMyqCA7tgz9y5BsBgX2zxvA0q9U3nT7wh5SPofxV3u615llOy3sWL/W5R/YGKgdKwv3kw2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulLuGV630NWLir3MSP2dFevp7X9NXCd6gQGBXTa3Z3c=;
 b=JrQx526w3X7u7Rv4tdPiHLDVZFzjB1TPqL8PpGyf9B/n7tCRq9/j9OjpJsOomTrQDARSYbF+KiQsrMglmcqu/WelVmAl0yJo634AzoC2v3qldxpQSsDGZTn+oPr7r8qN06ip86ExTrrVszQd3pGcS9l2+QK9CJeh2dXxk0FlZ/Z0SRsa4kTBlvHo1hXjKV9Nx88mBh+b+5SogGtQkelyOAjlUV3K4lmf6k1+ZImdjL9w+o+/9BTs+s4gIfrUtCSBRGmDPcW0J1U8Xl2WhDNy9ALkAlZtvS68W+1ab/57/AVM4vWiK2rqR99SzQLxryoo0sHqQktFBCEp5N5V0K1DRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulLuGV630NWLir3MSP2dFevp7X9NXCd6gQGBXTa3Z3c=;
 b=gwSOg2Uu1evex/EMCGbdcn7KaHF6HVBGZdUzml/Px5dTCAJtFZP9DU90kM9oVtscsTZdR5JprNORosS2aa+lM35oj5MHbYxct+NtwRGj5wUUq15t2WXyLbHlaSxGd3K8a+NNpr4QplNOlt228LbZbqpmLYxMQbc4Uxk3XJz/XzY=
Received: from BN9P223CA0022.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::27)
 by SJ0PR10MB5765.namprd10.prod.outlook.com (2603:10b6:a03:3ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Wed, 24 Jun
 2026 18:32:57 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:408:10b:cafe::76) by BN9P223CA0022.outlook.office365.com
 (2603:10b6:408:10b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.15 via Frontend Transport; Wed,
 24 Jun 2026 18:32:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 18:32:57 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 13:32:55 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 13:32:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 24 Jun 2026 13:32:55 -0500
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65OIWt5l1600079;
	Wed, 24 Jun 2026 13:32:55 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/wrynose][PATCH 1/3] ti-librpmsg-dma: Move this recipe to its own directory
Date: Wed, 24 Jun 2026 13:32:51 -0500
Message-ID: <20260624183253.1130737-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|SJ0PR10MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: ce2e1433-6e3b-470d-d536-08ded21f033b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Jq0o0DoKh6/xbspJ1/k4NzyZqqtWuNjF08YWe8etQe69sf3QZ12DkYhclJ3O8d2LZeU/Uit+RJ+iKwHu95aplPixAAWMQZV3mL01UUURMCkhI+eaNMWLvMmqItNLbhQLZE/UxzAeDBYuWbJeERv/les0mRP58NkajxTLS5QvhdK1T5NEgT30ZYMz5w9iFUMAO1YmCl3Ep8Bp8Z+f9pHqxe7P3swwsuASrnHRugvmt7nwG/Bci/EKVSVOkVBll/pz7yBVHjD/9yUEQlml68b9DCsOdli6AzmZr26HgZfG8vUPKUvNgaelI8he9+sq/bBcbSRRxJ2h5cXP+sB/HGP0YlDZFKiDq252HeH6rJba0Lh0g8TpkFKsybrWeg8m+8cWrC52JxGCwnie4QH3QHIFBXwy7g/ZD0CSDyrTcLmNw/S7e1XFXqdXVJ0szd/ksM5DpHowx2vw9PXomVi0Qmwddqo/e/JBhT0G/LOorKofhAvV5qsqiySz9I4JPyrWGCft+sWQF0MirG4Bplv3o7Zf8El6NYxhfAA3BXIuv9DQSLCDfenUkit5/Izb6zXsK2jGkXnkDARZkWPFIFRr/j7oOa5U/ulth9Ozy+9YN/IFrsQjU3MAysZNfBqPvfQl7QoHtZekX/4jIIHYHLVpFTff4HFQnelwazL2P7RUnMcdNf/qsNbQ4pNLRaoVhyyHhkRY5jEEg3U8Hj/dSwi9m2dzGQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1MrOom//aS7WSWgHRBuVPvmfynbBGJ9hk5KAMEJoqfD6vpCjVmvA8Bot8zNVnhgekXpZ4cfXA41jVCXsKlUGIQ22IpDV3TjGoc8BNCVmdQgMtAwS9Ib9qPbtCtwYyjSWCzYWj1vXMN9bl47ZU3jnjJ2E33QE/lDjENN0CsZfGhHk+BqUMV/sgFyD/pwrhcH+0L1ugu0hHjhO4PvaDw2TlBrdagXxwIFI33sxPtZT63hHKQX9OL1TFaPN2Sz18Vk6m+rwpop9h8kBfrqZM441BId6Dxa5ot9+KrOh1P4651nkp+pp+QYcmgiXUYqUvbTTXyyAzVBh1J8m/Coa4e39I9S7wVHhVr4Jx0RnEZqIiSnRoRS0295iSPUULKrabprb11f19+lnhrdNvAm4atL5ObrtVZRT5AHLgAskEyHRQ508cdLU4zWiLPdJeXeK5ZPe
X-Exchange-RoutingPolicyChecked: 
	MzsLGM4Xu76X0rX6ekpVe2xljWU4Bx1aVNjbzEMi9RfFeJfSnpxUO07vJ5M37T9tQoLLzcjUkMoxxuRx62o/6XNkY/gXVxpw6904jvq9PPjwZgLqIwBu+7NfK+CbBNKAT3PbAJQufOzKOkj7NlOgO0oqNicyVtdBp3CkXPW10xBKt2nXDLRnbl+Xxy51SZ9oCuGZTGCwUjalbQJj/DwbrVJC5ADQVNrbelCDF5YnLqrFTUPyQKkzcGmoSHWDKeaDKIaPluP1ZyxfwRD5xoZQiUgc8rQZzUkwrFNA9rXgQuH90DqYYruEiwc/PxCufzfLEyZkBV8LGAvfEk19ZC3NJw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 18:32:57.1978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2e1433-6e3b-470d-d536-08ded21f033b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5765
X-Proofpoint-GUID: FcYz5N9qQDUOiMFD5Nt1i41cvSFOUznP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE1NCBTYWx0ZWRfXw5cUdpQm0RcY
 MQQPMkE+PKgBma6B20oVzOpSDNQGPdvt08vbceOMPxuyAet0l4XhU6AOxLCtlNIIl/fg7bP4LXM
 GaL/8FK77a+EAalVRIw6SvJgcrPQEIY=
X-Proofpoint-ORIG-GUID: FcYz5N9qQDUOiMFD5Nt1i41cvSFOUznP
X-Authority-Analysis: v=2.4 cv=eekNubEH c=1 sm=1 tr=0 ts=6a3c22dc cx=c_pps
 a=IN6nX5sQGDwae/9PVKyrlQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=ko44mf4cv-ZifQkKgn8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE1NCBTYWx0ZWRfX0OpQKM6HTEqD
 0JsRRCSM7VlREmU94dtCNR7r82XaRuri+7qauJsVjup/xqVaOpfTxVHZ2SNjcxhB4uw0JGtSYOk
 xRnAVae4GSMJezGRF1K01ekvrYOzvoVTsbXgPuiX2U9FCOlwXEG8SWHNJqD6NuEqMpqs6LNsZ2C
 L9f0Rm9+ZfJB2wh9qgCNoDsEmeBKmxkB3aFsr2ZGtUV/TJzSrEqMEQ4/mvRGXSjD/no/+yUaXMO
 SzNOiCTHEQWeAC5i9PEIBrQS6XxbDNVkwNHak1qg3+xgw7X/+9ggNMKA4KVftI7aDrYvfwV0GKL
 O0thdP0jYy5BdCQGHN7vX06HIoIiSFEvBjpXFuhpwZsJCYm1wGUe8Ln0ywpWCJk9b75ppNZ2I63
 vlBt4nzRRwRSqi8b/iJ6i9ZqYKZahLQ0CfITyBlrPAV4oK0aeVuefO7SrlIs7iGRMhw7lAo9E20
 mBRcUqyHoTKEIs5Z/DA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240154
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jun 2026 18:33:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20066

Keeping all IPC related recipes in one "ipc" directory is not very well
organized. Like most other recipes give this one its own directory.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-ti/{ipc => ti-librpmsg-dma}/ti-librpmsg-dma_1.0.bb    | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-ti-bsp/recipes-ti/{ipc => ti-librpmsg-dma}/ti-librpmsg-dma_1.0.bb (100%)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bsp/recipes-ti/ti-librpmsg-dma/ti-librpmsg-dma_1.0.bb
similarity index 100%
rename from meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
rename to meta-ti-bsp/recipes-ti/ti-librpmsg-dma/ti-librpmsg-dma_1.0.bb
-- 
2.39.2


