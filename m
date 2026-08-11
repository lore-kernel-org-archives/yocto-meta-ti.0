Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11203C5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 20:05:24 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63623.1786478723219354519
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 13:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=iehDjk4r;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=YUSe6uT6;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67BJJno22797094;
	Tue, 11 Aug 2026 15:05:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=tY872SiI+lD7Sjwed+t79XBNKaYcZGgxW/qV6Pitu
	UE=; b=iehDjk4rajAVbErhbGbV8Rs51ferw1d4690RoQujpbOuwHveqLktUJfIx
	2JRRjHwUmUQX9DDcVMbRgQ8a2Fif6UZ6pnQaFLisyqs6bz3ZmU0k3wQzHY29qyYQ
	vFjvpE3yNyilUNEwy8oPgmN/Gph0Qf6PzeuqhLzfOBHyfpLFl4AFju35yn6KpZDH
	CFPxt7ys+coJfFxxGyu8cJmid62vxLhddzt8uA2ZRNVEXksrFP7A9d1qU6f9Jvh3
	kSDKHrjm6WV5HxTywf33dWHwe37P+TiUUKGgbrtueyRazO7erfBWLnuz9TytCyue
	QyCOKPKRofFkfUbM/QDzMZCJGobyA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011014.outbound.protection.outlook.com [40.93.194.14])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g00wu422n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 15:05:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bB64+m6BVmlqKW8OaX6vnS7F+hXTGp1VqaPYFR27HherofLSMDsMFXVwsHz1rBV2pbSyhO9yP9tAuKtkQl4CDC1/3bQ7A+wO1z++AYP7opWmWvvP9/H3b/I/85s3icFmfK3xpXY4qmpcVD5QADKdIX8HZsmK6maQx71yu+XPsYqtmktP8/eSA0GLw2PK31d1EqZl86u6k+4CqcoxyBcZS+F1sOSwoH8ZpEiZRrJ1Kj/dxmVnH+qEvUXQhTfOzz35STYZUyJSTwWHzgAphmFfJ/Fak/Fl9ivv9dlgvvaucorfPismA1ji0XlYLUhsq5VJL23QMFoAQQMddiwnc4RJlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tY872SiI+lD7Sjwed+t79XBNKaYcZGgxW/qV6PituUE=;
 b=b1+tXvVgccRdYLp2QQQ1GjWOvlHRxN7XQutS1dkXiQxZYujn9Ynj/749xAHLvZ93wCgLuFL83AaaV5mlex0BzUVCaDEAJv88BFHtyZWld5dLoVNXcpoDQE8zKfajjqZGwcvbhE5YVucg0FGcxA5TQs95syOOr2dBMON6rWNiCAzBV8gLME7MqVXBU+ne/MqOBedNBwIAfYbIqvtEO0tXIfxpfVBk4KElnyKa7cLkYXSuU/Rs5NPskcvfzNfydrdrE0fhU8O0TLmMrsFTGKzyK762LAobdPadh8b+0Tfj7VHsjhMmKko2+DaNbOXAR3+THG5Ndpa0G/nS/08lFZ3KDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tY872SiI+lD7Sjwed+t79XBNKaYcZGgxW/qV6PituUE=;
 b=YUSe6uT6V50w6tNJRQMmAX+M5WYtLYm4Uh6MBZW2cGy4p2TRQuMyES23wAb5MGyQRwjjfKIucdH5qiMKmMmCT1IojBoF82qHZvDmzNJxEvAkPH9Qk6PHMK3bc1RS/xm5AsWcYaw4/73jHt1a8RtQyZ7MuZ6YRQkcPRy5F/q83dJddnMwENJOUZzohQo0WicE8avwXqOY1jS687KQ/XR/eVUO/KPnnqe0h+XqdEk0fuW+1bRNAXS9RErpK1/WRigrOWpyP6lYYZanbbwIKEh9+A/vpqSjRxf29nFXnEP0BxMRlThogRR4Cj9/UB04l0UCRPzsq/nepS0RaGGhhdRLxw==
Received: from MW4P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::24)
 by IA1PR10MB7215.namprd10.prod.outlook.com (2603:10b6:208:3f9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 20:05:15 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:303:80:cafe::63) by MW4P223CA0019.outlook.office365.com
 (2603:10b6:303:80::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Tue,
 11 Aug 2026 20:05:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 20:05:13 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 15:05:09 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 15:05:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 15:05:09 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67BK59VN770876;
	Tue, 11 Aug 2026 15:05:09 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3B69C9ACF4; Tue, 11 Aug 2026 15:05:09 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>,
        "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master][PATCH] weston: update bbappend for version 16.0.x
Date: Tue, 11 Aug 2026 15:05:09 -0500
Message-ID: <20260811200509.2993821-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260811195945.53759-1-denis@denix.org>
References: <20260811195945.53759-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|IA1PR10MB7215:EE_
X-MS-Office365-Filtering-Correlation-Id: af777696-767b-407a-bae0-08def7e3dafc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|13003099007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Evd3x1XCs3PYAgCqTXr0oxhpKZlL5RXLjYAzXAb4DxaSbkzKsdEDExrb5KCs2NosMeiqKXBpAXhVgGid+DkSkipdNyh8P3GDIb1RTLft6z0lQvp+FocR9B8+Sl3Bnw2hC5QVxwrIJ85qxdsZQ6TtMKzNhJ7Z/8O8/QPRkZWitQ2n/xHenfkoGss8iJiJ4SI45w1uSKC6tGY95l9tA1OtN/BkRIJAeo3l6Ao806SVoQWp/YZHC2y0PQ9aZzM139bdlzKKaKHAK7rRhOnneN+AtFOWFBt+5w/72DbHOwas5zdSEVzSqBC36S9e5xyRL8nqD9AqDHtjXLEhr7bHj7LRAVpkASBwK2bBKcYAuXLXezK6DVCMbHUNaWjGceJz5rGFZs4w1ZWtSSXUeYpGpIdqBbMmXFhvHAeT+s1NzLhV5nkjnA35+D+ZaQYZhhju1tgCXjJYMZvbOTYTpdLGKqPsCw04B8gPsmRZLBmFe9cTk0S1tn2jah4tb0y0FA2xBwc81ZpyISlItBKzVAa/DRqo737bA6gMGjrOCMznUGwwisHeY6D1vaBro8GzbaVWcabMgWiiaTm6/YhBmc8gaqN8NXdlHxy37Q+jTkTW8y8xpf5lrYIaXCYfu8R+bpUkrZn3GRZiAcaB1x03X+GXa1fv47A5SUaK1rwuc50S1F6KWU87i3ilp5dLfrsLAI8U//6RxS/PrkuNVJO1GErEiyW8cA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(13003099007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8PYSdp9DNl4ZmAsmcxvCCjzYsAgKU5k/yLg0M9UnVAbOpZKdDs0/Q0JOeZsfNvv8dmaABN3qVrCMGrF2QQwlIruQ1CeiqUHy+MW6BzmAe4JjgRCwKX1PXkeQTcpN95EAANyrmkH5MOH2Zc5yINKoqzAmNez71PgxFKxtde6odrWAOKx7TS5aCx6BYriv8g47lCyRlogGesSIO4t/dXV8FkophRLUw4jW8s2MnR1mR3D+Uwklp5b2X5h5cDpmfZHR5aLXkYjJAbE3UtqDLLtPmYPWCLjlZTpBUEhLcFSiPhrgYSfUlvagI4H2UsrhAdv86vb3Gj6KBjJcs6OGXIZQ/t7JDZwHladMZKuz70MfUceQRKUjNuoaSTIXgcK5Bew/Vbcx77avOpypgOG9iKXPTSTlubxqVtobSLFwxYaehktWFQVOhK3TeWD4fcmguGPd
X-Exchange-RoutingPolicyChecked: 
	KAUEvYDK+HORIBL+GEOWZ7IdxRflkoiBqU9TYv2GP9qo0juG8XsWwpBRSGUJgKIrDkjtQOQW/RXjKTruzAITfXxgc9xdU/p9sZ9nDnvRFYeo3cINrcHNm1du3KKhwxqa4EzlKd6oEGhVJRg5+Zrfab3xOwKTTxrPVKP/+fe1AkdgiyeHd2LJe0XEPQ3DWpqLEjTYk66qcXyY6U/YhkvLX2XebBYhcf7S1/lx0Ro8zpH0Ou5ZDGAW0gYZ/vg30kvL/9+jtv5ABlgOTmZARt4JDUx4doHnBpH0zFNChoTDikzr8t14hgtO0aezIEw2tZOMFZw+tIcWFCY+4Nz2Z/XOVg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 20:05:13.5500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af777696-767b-407a-bae0-08def7e3dafc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7215
X-Authority-Analysis: v=2.4 cv=M+V97Sws c=1 sm=1 tr=0 ts=6a7b807e cx=c_pps
 a=u5a0R1DJIqwdmu/eAz29vw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=0gcC27t9AAAA:8 a=k-42gJp3AAAA:8 a=sozttTNsAAAA:8
 a=QX4gbG5DAAAA:8 a=ef_xxL1EtnS6UrlDfdMA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=f5sM90hAhNS9OGT-JDKn:22 a=uCSXFHLys93vLW5PjgO_:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: ZrM_1gp2_v7ukDndiYXeVikTGwU3sv5E
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE2OSBTYWx0ZWRfX3gIdrCGIsiqR
 eL9IYJWwAf3LJB4k0yVoetlDMqxjuD5Vr3QSXPiBMfGtcYM1zDo6NbzK1HgyQXcwfVXk4qd2UY8
 8dtuqfBYhe6eDUBMi/feHwaXiHnYoN4=
X-Proofpoint-GUID: ZrM_1gp2_v7ukDndiYXeVikTGwU3sv5E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE2OSBTYWx0ZWRfXwZpmnd368g2C
 o9zYT0/Na+g2MWRKeX1JWHk8scFPVk55Nx1NMWnqJqCLAQhdb3s8+vTsJOvWANjDW2GXTbqgDSz
 Au2DKJ3U3HCGCz52kPQU82VaRhCREhVhUoKhXjfV7nTHwrqL2IsgWJCZmk88YL5BsvM5oc//Yvq
 kmuwkeHvDf4T2yepoJbCzd2PS8/r6RJba1Df68Mmtrqi75oX6Jd9tLfCa7AwbOfha1n8NEiYwJI
 +JUSMTkelF5CGIYKJjGAktYWre3k+hJGgVs55bYMKvdUPt0NcnvWYVghVCh+UhpYjao1H5crTiL
 xH5iaNHVdzUPBRoApsnjd0+/wenJ3eykctafO2wqlyaH9r0lZ5NLAEvGG9fjfME4P4SmhMXWMK+
 uVSuHGlDL/DUvHBsjP89lt+7MB+UG/7HbYuQyX7rZh+G9kcY0mrGwh/7dsvCiNK9TBT9xhXlGyk
 fkNwsMF1wEfPO5u5zPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110169
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Aug 2026 20:05:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20252

meta-ti / na / 20260811195945.53759-1-denis

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master][PATCH] weston: update bbappend for version 16.0.x
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master][PATCH] weston: update bbappend for version 16.0.x
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
 From: Ryan Eatmon <reatmon@ti.com>
-From: Derek Foreman <derek.foreman@collabora.com>
- Date: Date: Tue, 11 Aug 2026 15:59:45 -0400
 Date: Tue, 24 Mar 2026 10:52:59 -0500
-Date: Wed, 27 May 2026 14:12:36 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 728d3c7bd42eb6ad708d34f3fb4d2c900b5aee96

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: dee29d47fde9ce17751e65d565bdea69d66dd659

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
  yocto-check-layers: FAIL
=========================================================
master - FAIL
=====================
ERROR: No recipes in default available for:




