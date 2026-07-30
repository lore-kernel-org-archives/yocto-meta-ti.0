Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA75C55165
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 13:25:17 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11728.1785417909361874884
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Jul 2026 06:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=bZ7uRBUd;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=rgeW2dnK;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDOorj1188848;
	Thu, 30 Jul 2026 08:25:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=eHDVzXHneTeJK1YXzvmEIgMCwBEF537Eu9fIIWuVt
	0Y=; b=bZ7uRBUdlJirxHPgVutVNotr2hzjjtEeQHXVqepGjhCnYEpWftMUmery2
	4EC8UCnF4MS1qjVDj4EiLGSZsesIgOWSPExQSv2OyRVUDFBBFTHfBf6NDPLR1USw
	Q5TG4hszJthroqUTQ9q9mKy3IuTFzZfTWTQneJfRQZ1f8IWpB2KNsfl+fcvsDefw
	/qyFRavfNwE3XnZdv65/n+iSj+y/t3SH+beRQueOjLltbWdDKC8b/tEmYOrFxUYt
	Mpb+v0ssLzGOQkQCdzW4J5pa06bdylX/uQ9oEBSaiLahERjV3tn2JMemanRXKTmN
	B6X99QZ/8wQxh466bhwWW00JgSuGA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012060.outbound.protection.outlook.com [52.101.48.60])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fr7fn001v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 08:25:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJ3eoWysMp338SXj2HBzgmu0SZNEyxlJCMnivKlgsBzHSEgpqK13nq1j4KmkZw9UulJ/DleGccIGMXIbV8RbX0siXfxjYf6t+HmoJWum0O4OWnPve3TgKjYMDI3bwcRx6wpxX3k4EVsXQEd/tVYnLNHlmGQMXwllvkelCb7EIBa0wGZ5fZjdM9NmPq64JfAHh3oJP0op8h6dfovCg4ICh0Zl2Pb2OLAtsxk4N+q7dfrX4evSKCXiTR6MEQmVXPmggx1bEtUgu1NhOvqlLg1iWFdTU05Xx8WKEhri8tRjyBPzuJKMEGLqKuolI0FrO8OiI09NxWqvC5b//jbHjKIHZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHDVzXHneTeJK1YXzvmEIgMCwBEF537Eu9fIIWuVt0Y=;
 b=SgJT5cN2/Oj+u++uUcU0Dfz+V4d9Nzkme1/xl1GqJ//7E7iDbDha2c/vTtpvVawa9Ez70vl/85i1+puwIKFF1Yhb1GNTsB1jTQLqBXv+yxeTM0t0kaf0s7/xAkO/xO8JUp0bDjb+2eNU45Kx2hWGfnihAlot8Vd/eQxfL5eB04aJY1Ewf8G/TV6AELqE6R3E2WD7dnqm4xC+LwrKP6O3qy6W9r+627sE9JxAmHWmQbUKIFjOpkWcs3+OzJh1Gn6VIs548Z8DBnN4aAPKWt1GByoz0MVMkV8mGlDkDtGwnWPdKrdjBP3NvYmZ1nsX6O8clH8k2j6OyHFWZiFwt754Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHDVzXHneTeJK1YXzvmEIgMCwBEF537Eu9fIIWuVt0Y=;
 b=rgeW2dnKjJJH8SSQMa5mTJBDaKzeyQv8uAGT76RABg6M6iQjXznDr8gTJSGuy04jqmsdfncLWncu81Qq+phy3iyIzSmN+MSFcR3jbJuzKvGt1/It6cSVaMBQQS82TiXpYM/GGO8DSi0QvCWvJBEYTGpFO7Ch2b0xCbaYskrw1SjdPpejWkLuHikrU00B8Gw2Ct4UXLJWl+QJZMnQ5LWOq+K0WwAPuE3fQ2vg4eXoMSzn0YAyfsAvgDgA0QtR1C1xTBnDh1AGodV/QVvI8qaNCVSrymYw/9hTM+pPUuri3lOCVYljLvlC1+9D7b4LCWLk6OPJ6BctFSHYN2S4oBqHzA==
Received: from BYAPR21CA0022.namprd21.prod.outlook.com (2603:10b6:a03:114::32)
 by PH0PR10MB4535.namprd10.prod.outlook.com (2603:10b6:510:31::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 13:25:03 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::d) by BYAPR21CA0022.outlook.office365.com
 (2603:10b6:a03:114::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8 via Frontend Transport; Thu, 30
 Jul 2026 13:25:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Thu, 30 Jul 2026 13:25:02 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 30 Jul
 2026 08:24:58 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 30 Jul
 2026 08:24:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 30 Jul 2026 08:24:58 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66UDOw7i2732083;
	Thu, 30 Jul 2026 08:24:58 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 40E442A58; Thu, 30 Jul 2026 08:24:58 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] ti-core-initramfs: Add the initramfs to the fitImage
Date: Thu, 30 Jul 2026 08:24:58 -0500
Message-ID: <20260730132458.4085176-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260730130113.1192704-1-reatmon@ti.com>
References: <20260730130113.1192704-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|PH0PR10MB4535:EE_
X-MS-Office365-Filtering-Correlation-Id: e775a188-b5b2-43e8-d7e7-08deee3df65a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Jk3jv6ilL4/w20b9a0xwH9Uc1p66JejIWX6zhyaM1SNs/YKqdA5fSiI5UL4/UbhDDtOQmwuUcOPDEUpDEzHnqLo4PaZIf9ebvjKg1qO6mtLKPmQXs5EW7ZU3irssJCpkeFWbWVdJd0ZQIBvjvCdwFJmL3YS4xWU0dzrQDnNcH8OhWxWFY5cu1tJs/5zgt/7HkPMolIgE39QDT9vD8/2+dGZ/3TqRG9RQB33ZW1GQE/wRnW0n38pompFuk7VssJCmYyQ/yK8jqUIAuIxzDJrYMkhqAKOO2XP5pnbt/c9dfeXB7hIyIEs0K1YlSxxL0sBj7M7rnyGDuFc/STsJfyN1ptNnSJAAPjDI3SCp7Yx0DklehHDf4+0ypc5QXaC3HurldRSkTdw+3PchGhEW26rDCMLPkL/OUZ3RR/XeQufEARiHf62VOQKkTveJ+b39L8LVcULehKpEeqdmnaSh9m8To8+Tk83gfSAwESjdQV/3727SP9ePC/7ZK7aN6d7p/Qom5B1LKmX0+np4Gc3l51m4Y+6MqOqQi8s8px8GoVyBdG/IUpO0cFdSauRNdzE4bx/3OYvPTUotWZSxOMWbtI8y1te25kJ5wtOwcuhYZacloxCGNW4r8PKazOfvNqIeGjQVttyKvd5jMsipFdRk/z+VBZPsLeHb06AoXqTTa0XY4mnb558pS/syJKe+5MGfA858Z19EYtoRqE49CUJTVH6Xsw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zlfm53C27+0w1iqII9TPVCkbBxc3Q9ZsXW2TTEchVlaF6arya8IMt7ElgYTdMAEr2v5/dr8A8raifzbHiGTkDRVlma88T2g2l0bLMrumRvEkqkOPBqCEQ9X/DXBAszJstbCwIMUM5Rdz7EuQUPO7/91yR0d0w2Qe7SXaqvyYFuRVg95AZ2H7tON313WSIHIDy4wisxZgV5UeMZe/EUHmPzoSeTkB5luR42GMRtXT6rwVtgprukM39/fqn3EcBtdjRNVlxv0EyhqGOuQRyF8lzO75PaAixWOdIFil86kLuYHU1ur/cvMDyTnkbBmYC8XKcRGJPSwyBjkVk4l3D53qJWEGM75e2btc375EQct6o+b+U9u0ifh2yDFQbgQLpPDtttOGQ9Sr3lrOeULo3pBO9om5qpt/R+0dWaEBhBxvJ7aKtljxKNVpf6glE/Vq8+j2
X-Exchange-RoutingPolicyChecked: 
	XvzU+VtaIsvKAg+2ZqT7qxEnJ901EiESHd53g4EXxPJ+S6HKWlNeAykmo6H5x9Ub0BKihD3XjCWffsInQEmllDJaKP5S6e4WNxFTIFUUPwWAQftHf39oGYFlFpfeoJhnwlddi2SHGcQOgNRyIQwmmKqG0Q3TYeyKR6XHEhYD9XEKf5keS2+Fq0d7DEliTKJ8n5xDaMyfELVURaz0Yt2vTXpWVSvnRPIWDy2FiDkjEII8qK+ez7XdB7juxWKoNJQbBKkhiV1OOUipETbCoj4VcZwYtuORYmgjdN2cQNOo82+X3uVcF+llTqQCc7zsJtchVv3TAF8knl2/JtAGiHdVog==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 13:25:02.5513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e775a188-b5b2-43e8-d7e7-08deee3df65a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4535
X-Proofpoint-GUID: JmNmtLXfZW3dOLaId3jhL9-qxTM261n1
X-Proofpoint-ORIG-GUID: JmNmtLXfZW3dOLaId3jhL9-qxTM261n1
X-Authority-Analysis: v=2.4 cv=bLgm5v+Z c=1 sm=1 tr=0 ts=6a6b50b3 cx=c_pps
 a=MzitxtHdenuwXKuz6QWlPg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=ef_xxL1EtnS6UrlDfdMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwMiBTYWx0ZWRfX5PVMLk9hRdFe
 l1nedngcnQVCpQ93ITokE3Hu8ZFsKyz4qpGYSdZSPDxXjpqIvz5vwpHdRFCjRguPYxyKsa2COpv
 dov0qpBmnoP8ldv1G+A/oVYr3Y9X7jnCsdRwAv4P0OBH8LvAlA5Z/c0fADtjBOdMG7fEZoOBMJ7
 g/E0SlUw8Jk7seq/Jfq89BY3QGVFdt64bI7bc8rahWTJmGIA/rEvjQXtgLgy2FvqSrtryirGT7v
 tNMyzBsXX8vYfDztc+6YWJEqel4acQO40k7ecM3+wleU5FFMmWeLqQLsQ/pDTdzYwVK3MjjboqL
 +3wjGZuG49UdeSbFOVCkKCFkY7IUZrQoMdftsE8R4DYYTgYuxk4zGJTLQ+zV+mOKHz4+ZfMylyp
 rOmPgJYb5/HYMgqzs/eORlPNgtxIQA+V5thjH7XWd1fDADY6MXVLIHEfT3UOwalVua3s9vVaXn4
 VTbqPPQlpZLvmT9t4Zw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwMiBTYWx0ZWRfX2yKXBwfFZ3nJ
 GAOAFDrUgHnlaESA1nLNPbQ50vrmSttcJYuuk3VCHWHLbT2K3yFn/AP71SCloVc0agAY//lp9zI
 y9i308HMjYCoWImO8+UdS5UONpxdB1Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300102
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Jul 2026 13:25:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20210

meta-ti / na / 20260730130113.1192704-1-reatmon

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
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH] ti-core-initramfs: Add the initramfs to the fitImage
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 30 Jul 2026 08:01:13 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 11bcd2577327037aad0fdc02ec6538baa1f76f80

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: 4ec99432c369579805e8100a92e9088069276b7f

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




