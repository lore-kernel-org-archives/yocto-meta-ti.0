Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD97CC43602
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 18:36:01 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52377.1782930954446697075
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 Jul 2026 11:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=DPYY5vSV;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=t18Ri/3G;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GpWuG061956;
	Wed, 1 Jul 2026 13:35:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ay/6U6Ml9PGypH5fWryjLeeiMCKz5veNGlI2PE8DE
	dg=; b=DPYY5vSVj9qS6vHWH4w2A+7KVxGHVico0vKK5CMHI3Vix18joViR5wOrI
	3R3Ebx2GnV29RTkjqra+nzG7oAvf2r96NA7jdwko6VUo2kHfZjca4gV+UgZbgb+R
	vc7Og1O6WsYuU2OSut5yEyhHlkv7eiABTQKzT9A6P1SH8PisknBiRCutCsq0PGTe
	JqigQ6m3bCeLG0RgpWKtjk56kgrIiiC2QkceurZuQv78vpx2qYstYY7nU0mxjt5Q
	jC0jsPI9zP4Dh/DD7l5Ml4BVitwGjFUEfHDOCmSUPrq8JfTPKUcz23mQklKUPFyP
	iCRdBr/bVHzsMuUjTksUXfcIh1cAg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013012.outbound.protection.outlook.com [40.93.196.12])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f51ve2sk2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 13:35:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TKlARYNatEElx5mRVV0JBBoitAZqUw0J3Ys8lJQdTSGAvgJBa+dfm6dhqnRiZfiG/eF+hYsCX0rXoR+EJAXDEftlC2jwT+Y8eHhhZBWtTy1bIj8C5lVovdmcWHnUebYwUXKF+TiSwnKvfDSYsTRazBGSfKZ3lPuo/PimY6lS/aaWBVAymXxDi7VJ7e1dK4R1t8yBYZZVn+Hv9hQ1kB1pHoKHIb2INWBDxt31IWcCj3xlD0RMFdkwJnRauigr463RhUsGMb1VGJGOu/6hK0iJFFDTYRu/yhy4z5n4fihrLzYVvVMVkke/l1H9pRAm37LfJNWIFwwrcGjP86GZe8I+dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ay/6U6Ml9PGypH5fWryjLeeiMCKz5veNGlI2PE8DEdg=;
 b=tHrwFj3T5eTMmNtSermh0CbkvV7oGgWsHBUv/vQGkEW9Vrsl4jJOjRPxfddUbuewbdevGjQX2iUzmZfLKx35OEiM9UGlLYC21/kUFKV8HYV4jOg7MTrAmE7ZOBGaLCi2KD52dHI+fIBA+BkZucOIXLkWG14tmhF3QLxgcL5vlbKD+TzH+h4AqoTTLZRHuJAyefFqSNl9r74H4AIibXQWHWiFAFKmREZkUuugu1yJn2DykM8jWISwe/ckoz2Emx80wda2DUj9CHzsH/gG7bcZ+wg7W3xIKNzNqUKFhU//sw7YunEXIs/munctJDXBgoC5fhY+/896vg5z1irSym42xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ay/6U6Ml9PGypH5fWryjLeeiMCKz5veNGlI2PE8DEdg=;
 b=t18Ri/3GFp21BSfMdNi8CQG/43+lFXd1oINuoQkSaVwMCzRt9OEH+hH716C0rWdC0ypK47xQI8NSzXPAs4bDy6KdiuKRNOVcEtH+t6H8KfqrP99BHVSyfonjYkWeoGU2mBE5jsfQ8MmxTS2Fksu230VjzqLuHtklKjtMvY/dAVdX+7mr4P/VMZLFII4CIO9aUWQEOTc3U/bgd+vG2xO0a9x+HfySkuPZiZrU3KF9HXaoYEz3QEDtQT/MrrfDt+8M8nY2rMa6tq+ILmlU1oVCGLfJUrizccvCp8fFy0/FxPN9Pb/ZUY1zrqzIVdZ8E2hqZ/VRHdeKSIAwjLwALuXqOw==
Received: from DS7PR05CA0062.namprd05.prod.outlook.com (2603:10b6:8:57::8) by
 DM4PR10MB6696.namprd10.prod.outlook.com (2603:10b6:8:110::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.8; Wed, 1 Jul 2026 18:35:44 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:8:57:cafe::4f) by DS7PR05CA0062.outlook.office365.com
 (2603:10b6:8:57::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 18:35:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 18:35:44 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 13:35:43 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 13:35:43 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 1 Jul 2026 13:35:43 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 661IZh8M1930460;
	Wed, 1 Jul 2026 13:35:43 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 42886D6F36; Wed,  1 Jul 2026 13:35:43 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <afd@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH v2] libsdl2: Build tests with dynamically linked library support
Date: Wed, 1 Jul 2026 13:35:43 -0500
Message-ID: <20260701183543.2811271-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260701182948.1604031-1-a-christidis@ti.com>
References: <20260701182948.1604031-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|DM4PR10MB6696:EE_
X-MS-Office365-Filtering-Correlation-Id: eeb3a077-2e28-472f-fa91-08ded79f8fd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|56012099006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	gwvQ5mh2HfiABlYQoaSrmQyfCIi8reO2xfGjd4cAqXY7e0pZVLXFOf9CS9nSX0rVgkz4PVg1IwzlcyoBuxUTvNiuQOIze/aUIrMk+XdrX43Xic2GF+RN5yqTgk5jfNHNk+L0f/9y3YIHR2HvUQg2RRLTAuvnQzLYTMPGojh3eb7ML6NfRvDCCXbuDbZWV+WPxn+WtbIKRH2naYX0J9Twxw+Xu7rXYf92lU2GcPfRwFbu4R0Acw5T8WOvI+aqT8hw5DhOtg77oKmr16SwyzFVX5pih1pRd/4CzOO4HcYZ6TTajrmUjXKlbf32wdB1zrh3+TApF+gwJXCefVbRb9oJKsnplryDdw2dNAJ/3g0q9iX6v/FbtMD+DpKJ/GWojxjlc2XQyJSfpNb6OfFdRBtRUILwYDuI9ky6K+d7dsHUFWuQ5CclTaR5HUckNJucV5yv3tWYCSAVy3Mi6u7ipavMuDSfADmWuFmxWJhLHmFFxkEVGedCpkB+tLheCnWQ25WMbnksPMVx1faF937Hi2IC39xpeIiZwglGYFoiLQIIpMtoaWZm9PLkdKEhvnDFRppthf/FBztVWiSnjaOIKvzl3DCJ+yt0YfGxNXreBo1aepkuN5xwwPLUnBaC7rZARpzpvvWUuezD1XD8EBrs7tJdOiPux3npFhrB3h6utrdgOV1I5QUw67u8NQxf/61XR2xlwmsafajjw4EMxa/iO5Iskg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(56012099006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PadpW5ygBvd3ah2/1UHMwSlgVi8OcARHIpLi/fo8loC/urvuoNGQGSatPFaXkNGoNt24TjMF7PkUi28PndX8jpkGgb8+gEoi63+RDFfMjXRT/ChEiG+PV/1lWT+NzcFn7A96JazffOzfQvElxdW65n35czC7Rbccl04TJPsZEJrhkLEk2S0idU3QU8jkj3J2HWU+KjugR89nJS/tR9I2ei7MYWINKXLyMdR1q075F5GZV46v7/gmQE4X3lmwUL78h+kwh9C4tYaql7adN2KCLMfa2MB2Y8BisRULUtuHQcIdR4NqeFzCwTUjT+lN1WiA9rTXCU1wQy8QBL91KTS4ox7nHYkGjGHqiNX99G+ucvz0Z05jZocYjStyj61G79zzsoBKEvBMF7Oft5cn7elYkUBNyY/UTeWXbI2ocRYobYJIje+ZXBLrvQp0B+VZH42V
X-Exchange-RoutingPolicyChecked: 
	O1PYQay8p4Qo0LzfyZA/XMSWevR0HliZk15kNSL0J15ce0RVn1WEAGdeCmY7kmGM2PeiYpigrD7PjktbX0FVKu7pwM3iUydvw2N0VuRLXDufY+EYJS2fNFLKWYRfokGNweqL+tNm4BdNLTH1XkRfxKEsmu5zMZzvOGP5kSPvi+gXwejQOKA8ltzKLoLpVIx3FhxPUq6/TuvecRpBtDOdxwLzdVH+jq7Ugp5bjch8x0zc7l6piyRXkNLAkG/t+GLKDfE4/rUs9uSJRu4zo4CGtzR0zZO7p8ICn2tUFQgpXTa3+jl8dVhUddPum1w4uzueVXduHjtzsYWWShi5ys/Ysg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 18:35:44.4930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb3a077-2e28-472f-fa91-08ded79f8fd3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6696
X-Proofpoint-ORIG-GUID: P0vTA-KHvdCFA4jCoeKG4-6hykIngUOH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE5OSBTYWx0ZWRfX1R6/8jBE24M5
 VHqc3JRPgNaon1gVihGx5QGhKT9EUyPfbbIt/DRBf4PxUWIlJbvAUxs7dWGQVHX0dex5kgzkSWw
 p0jeiOCtIEgy/YRTdal6BSebKOObwaUkJeNeWyY2dvjHfuNh4z/NXhtwbENT/VIoWW/ur4lr0RH
 0CssQhkgn3A56xD+Qfc3Mp1rTiHsOnnNsLKRuCYiybRw0kqr03CwWSOgfLmkwmhmmOmEZmkXxVl
 +6HFXuLPngpbhfqvm3VC6JIke7e4SIDuDcEv4niGir+M67BJN0+jSCxQhWaUhyJ1JaigCiuurID
 GkfpxqOB19TQ9KjxLfE4bYbmNc08A0xGe0B/fB7F0ASWMwo1TFBmxbpjPVRyPHw8SiPIKW5ugea
 28CQ+DnuerMn94TV23aTPBj31PQO3Vdfvf9qu5Iy/FiyxcLDSHaMMdeQGAcxwDKLxxU4sMbZgZu
 kAjVHU3dnTog3wDuUJQ==
X-Proofpoint-GUID: P0vTA-KHvdCFA4jCoeKG4-6hykIngUOH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE5OSBTYWx0ZWRfXzmbuDO/mRm34
 tKNywC5B7rNxrUAK5rlrgiAVMrJP+f9KzzHY72OgO3lvlIY03RxGQLhE0W1Ij6AZ8nIRAojDFss
 ie3XXZ2c9DWkkapTpTVM8tCJxj+P1pA=
X-Authority-Analysis: v=2.4 cv=PtOjqQM3 c=1 sm=1 tr=0 ts=6a455e08 cx=c_pps
 a=ck9HhUZGATh9INII0mabYg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=ZiNTjf_NrnXoq10ydZYA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010199
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 01 Jul 2026 18:36:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20116

meta-ti / na / 20260701182948.1604031-1-a-christidis

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH v2] libsdl2: Build tests with dynamically linked library support
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
+From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Wed, 1 Jul 2026 13:29:48 -0500
+Date: Fri, 26 Jun 2026 13:28:24 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e29cc0575fed64eb2e4f3f83a95bb2edd8506005

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: libsdl2: Set runtime dependency for SDL2 tests
- Commit SHA: dc30b5847fcb72eb7d6e7d4461bd5b3a492fb66b

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH v2] libsdl2: Build tests with dynamically linked library support
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
+From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Wed, 1 Jul 2026 13:29:48 -0500
+Date: Fri, 26 Jun 2026 13:28:24 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e29cc0575fed64eb2e4f3f83a95bb2edd8506005

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: libsdl2: Set runtime dependency for SDL2 tests
- Commit SHA: 77289b29557f8cd8d0e85eb2ef78ef333d45cf71

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887

wrynose
=====================
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




