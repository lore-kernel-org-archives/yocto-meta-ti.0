Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C190C5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 19:46:57 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27279.1786650411619501140
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Aug 2026 12:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=e0H6LyL4;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=saSBZNkC;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DIfHlK3813685;
	Thu, 13 Aug 2026 14:46:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=/SDHGTHRm2HLGTCmVib2eQXms4knhHNeSYyFwp827
	UI=; b=e0H6LyL4BfRzIVrFy1I2C2cbTaYVcmLeBh/emGMw/btxZsg8Iv8W5dk6t
	OefqDEqao9oOxw0Bbqg6JznHyq3sa1VFpHA0orwjjnufNkFSM0XAgGIaC/ykTv/o
	GyO0+2Abu/zC4C+9GoIGBJzPGSEImJUqq34OU6u++b/ImS4Stl10ZpinTuLK383Q
	J7/P6Y7+8nDGEKK1a8WsS9BnCiVx0LA5oM0x5zpGGtNzUJzW/HRg9B2dZmZWyxSX
	sOKGByPa9g9WDagoWGso0VjCnbfPVuOow9+rcfAxKPcNkKlvKRrRETd3JeL9/U0Q
	wWVYfFBqTUOxlz/T0MePLkQl6iubA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012053.outbound.protection.outlook.com [52.101.43.53])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g1bb4br9p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 14:46:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrq5i4WXCLv6paVVxUYuvB56mCr8+DXihceobfHZpgr7Uyl77gsLxr0KFpc94vvuAIZ9Jaw+QBLCZ/GBTdwE9d1kF/4gJGHYLe/OVmjksY1CyJ82Bbk2XYe9jXjj9FFOcVnLTPQ5v/uzz0ndUl5jN0rcXBsSLKR0nrnQtQAxtGGvI/IAIjBNerDvmOken9zFh5PXlJTZboizqvxJKJ2eYKlsGYGbUyKtR5suxnM/QNvl+idsMMSNjW9bBeMYTlMALdbRhmDoO7f2tmeecCU1SEYH8M162ypAGv9VzYvRCJiMUeu66C1tbU5uQXx2GbtP/IE2qcsk6/HgCtxpqQqVbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SDHGTHRm2HLGTCmVib2eQXms4knhHNeSYyFwp827UI=;
 b=Eh98Z+VTbwaC3BZEOACQqtnTO/FVPXBx+lQzmN3VPw313aKuVcto6GOyZej5UP/jjtAAIRX7v0SLu75QIS+B9ybIzpa8txy5jSZyiBJ5eQmzHvFyCFKb2pFnnQiCiEuvgAhHgRqQCu0Ls5TL4sarb2cYCn2GmUEsQqNDPYQ5rkkANd03iiq6UjVA843o8GjNqYenv3B/Ghr7YceLKkfHswxE2wnFA+pXdXw5v5zL8yotcSB/VK1ZiCG4l/eXPQpd7uz3Anvu27rIVxo62Huh+3VFeYzW22tKydwuk7OoloAV8OIG0bG2GRAEJhnTr3FfLz9ASTOlh2XnQqPjHVDvJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SDHGTHRm2HLGTCmVib2eQXms4knhHNeSYyFwp827UI=;
 b=saSBZNkC5RYbVUnSaVUz0la2IYeINvnKu5qHZZovlqHbeAjSVwkR8N8Bt3WD9f6R5H34kAeS/5mIyPqzjOeHJYS3TS9w5+j4y9JgQjuQHEq8IUa4iC+dtkMNUEQoHYpv9j9DA4dEPMS03VQYjPXSp81xcrFruTeo6T2W6pTDKOHVWWKT/G4rPw/GSpgxF7s4HmMaWLgHbeXc07YBEPi4ubHRnyBr0V0SOnZpyBRnX8MrdTTy1C4pG1N3yZuYO5mXZlduQjslqKbMW9a8MhiieMf2NQRurpOeA1I+/IJEowvWwfRS9ndclUi5Q/z5028mc98dGs+nZvn55ZS0OSa3qg==
Received: from BN9PR03CA0217.namprd03.prod.outlook.com (2603:10b6:408:f8::12)
 by DM4PR10MB6888.namprd10.prod.outlook.com (2603:10b6:8:100::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 19:46:45 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:f8:cafe::a1) by BN9PR03CA0217.outlook.office365.com
 (2603:10b6:408:f8::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.14 via Frontend Transport; Thu,
 13 Aug 2026 19:46:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Thu, 13 Aug 2026 19:46:44 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 14:46:42 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 14:46:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 14:46:42 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67DJkgmN1422154;
	Thu, 13 Aug 2026 14:46:42 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7C04E9ACF4; Thu, 13 Aug 2026 14:46:42 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202608130935
Date: Thu, 13 Aug 2026 14:46:42 -0500
Message-ID: <20260813194642.1815602-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260813193524.1893813-1-lcpdbld@list.ti.com>
References: <20260813193524.1893813-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|DM4PR10MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bd8f38d-3c03-4a6b-d97f-08def9739ad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	vp3fID1HuyAB0aiDT8xGbi8xUjr5kljs7ppmOyCntCviBoKt4E/Jgx+8b0CIa7+JM0Iu0WZdpU3IPkAjTVX5ldhwq0jIhA6uhoRaGXE7SRmRk5EToz/6cFg446HxJhXv+jwCPH1rKNjHm78pCxpVzt7LBlrHv2YNWx2swIgfp78ELruawIZ1OCJFDwTj8x6EDxBnOI93+/Q43IGdD6sJ2Oqmv6ukciGyy/qa2gR9w7SVQqJHnVD7QVA/0Dn8UnOMPJga+O4/f7iixSs4a4QccLKDU+HxOkRnD34rbpO4SityBAOZeR5CQkwMxTyI9krk0dk/QB4RQkZql94Q+eLW5ev9Z+yqv8oVIp7a2z2j4tGRhu2Zd4yjPnf/5hP9roPKt2PIg3bAE8om+D0BfVrPZV1s8Y7f0G82idAsNOyTTHJWq9XmqLfUDt9uRJThCW5c8HLUHIV2JLy9EQV13w8146+zxhW3dh/LBJwsOSJHvB3q7FBMNEB/EkQlOb+Ml9lzJNB452QIDzWCsUMiMNNZHHs+f2lBmUyW5EmhTyY4EPDoMAxRUK18Bzc7erY7WXrMGiroIy/n2plde19fhnsW4yB6Adi1xJNwCuQyI2IzvwjJQrTZ9ts5N5TWMYih5yF+hPRUUPXff73a/KNwU5vITujeSGqQmC2yDrYnh0oo5xLq8wleO8Wl3eejbOcTbK1Q
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PEFj8l6UuZURWFo+wi2lyz8N0YnB8kkG2Jcq6HrzS7IUaZhQ7vq22qeyPbn3rQw8hnYB2E2wjS/jc6hToFv+cS4ba4AA+BUXZTQDIV/pFxezaU4zgTQA7IWx7vvxWsyd1sm07UtCa9E6/7n9NnidVm9M7WYx9a28S8T7MKBW0G5rdYoYcrPlLmXOkLKv34Sr+fr9jxxh+UgqGe/g2IXSv9WwwNfqRjv7jduhFaRoNWp+VoGqUNow7jUm0/iTnP1TDCTY5v965rTaVLO6NouqoE6kw+9tFgt3U6Thv3eCWqutrf1OcEU1NEJSi7nTL/BvAnNW2LnSC8i4vDFI/rp24/+kNtRofJe0bnl2G/Z8wS0bJs0iKbZh295R/AXRYL8pQpJMP/Tp9LWYMOXChPGO10SDDDxrUgoTCRbMYqnPjZoZSk5Aiej02L1urlS/CGYQ
X-Exchange-RoutingPolicyChecked: 
	kesadR+sGP0r1Vtmq6c9TH1mxrTkmkOk4txRFyHFeapM+f6HMuqTjt4NzqyqA8TFJSokkqHW3DYCouYSeqQeD6I/GGGHi2PPkoPdzZPrJv/gLsy6KuyBvk1PxwcHKV5xayAXSQXBeuLygXNaFVivaGBrGsH/mexS4vcJpdNpvcWsqIVo5l7W52nlpUiWoZmltwaPyq7gQd7+8Bhj4ZPNehcp9C++MRsgXsk1myWOtycW1TmP7MVi3zQ1dRVXPWYr1nXgyfg9AdDsvPZlJZ2enHRdQL1IebBi2O55KhpgOkW4LWAKfir3at2v51nmsqYdfv+xBlqU5mhVqKYc11C+Eg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 19:46:44.6428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd8f38d-3c03-4a6b-d97f-08def9739ad7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6888
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDE0MyBTYWx0ZWRfXye602yoOVNCs
 e9b8xgLkNu5zK/mL8gA6PncxaaHqxzrQbG2V6S8jcHVIKEuXE5Ee4OrrfiRUsFDhJ4cUozUomo9
 TYK3d5G5SFy+H4Uf/JNtT6tsiRrkbzQ=
X-Authority-Analysis: v=2.4 cv=W5sIkxWk c=1 sm=1 tr=0 ts=6a7e1f29 cx=c_pps
 a=m4QPU8/Yf0DQKtM+qTkXOQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=ariNBzQZFib8H_CuL4MA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDE0MyBTYWx0ZWRfX7SfYjgJvWjj8
 FiAPiXGS4GVnbGqrmBVfkgxmcCP6VmPnwrs9+k8HzQhbuvXmwkIs2aSlLOeSsdxRf+YPKPn68DK
 zH5sHX6pfT5XQpBCIzFKuD/Ml/84NfxwN/DILBWEWL0zwg6lHQHOiaPUn4Czd9X8PRhxa/n4okj
 SIIS2sIkLwQ0atDJ10kRgG1KhRhszMDVeh7SjCxewbYjey+4TTjcF9QGiYsnOQDKlYvamXiI7LY
 m3h6fBE/4/37B6zekFgO+XnPPGyYuLediA7m65hTC372wbTqShC++FErDGLZuE6hmS+/7RivHZQ
 yJf2fIT7ceRNixkPyPmDEmWOft6TAD3ck/xW2Al2C0MhOi6Uw3gBG5An8Zv+tuZPntPyq+yxjBs
 JVHJj5Zr6hxbhEU9TDml9x66KdqEEvPlEG8TUJrJIkfqdLNFN32j2aSB2YzNYYpJyoP4oWoW2CQ
 ZDCHguAimD5XgSZQJ+A==
X-Proofpoint-GUID: rtM9OxtLtUdVAHpvSvCOgaqNBCR1QwDk
X-Proofpoint-ORIG-GUID: rtM9OxtLtUdVAHpvSvCOgaqNBCR1QwDk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130143
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Aug 2026 19:46:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20265

meta-ti / na / 20260813193524.1893813-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202608130935
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 13 Aug 2026 14:35:24 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5c911ae61f6ebe047f65f071a85772db67474563

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202608130935
- Commit SHA: 7e466122f92e1cad7442069695f8009e440b6422

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
scarthgap - PASS
=====================
All checks passed




