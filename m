Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05EEBC44516
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:24:01 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13500.1784294633108857782
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Jul 2026 06:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Yt7RQt+n;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=UYgPWWmu;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HCKhT02454770;
	Fri, 17 Jul 2026 08:23:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Ow9iS3Bmi/QOMozyfiTKiQYaM3loE3XCIPiqG8YYC
	UI=; b=Yt7RQt+nJ++LvKWUGPVwDbAPkKpg9AIcXnJN3s1oF3x3ZDkB1Kbd1ntvc
	PaBFjW1Up5Ig1EVrEqKFIR7FYoBflOhZb3f6E90zZju0bMcu1U9d7fp0UIF5PzO/
	Spx/RIk/WcWBSppF2fAzBjy+uGTy8/k5jFbMQve/z5qLyDozbnAVJMHZqbqZQq7Y
	2GU0OF4/vFu54hXe/IO3ENr4KsYwMgdpkG5PYuvGeo9OI7UjDHtfERqLDkmglXxs
	bAxBTqF4lUdcZWbaX5UsFHtlXws/aqRTgV3RUA98Xm69WTUZF9Z5jo457FFDITAz
	b+IRCyunLrn1o7HzutxJcI7cJYqKA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011022.outbound.protection.outlook.com [52.101.57.22])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4ffkc3gm5y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 08:23:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PqeUYtftFqZiwSJ5evC2iUpey8vnVsRcNZlswnQR0kfd9nODzhfXmPpLEBD6yNQk+kyCTfcKfYuvR1hQ4xTHWcua1VSysuGA0p4quSZsxYsucBepaykO5UaV80enfCzpjLR6fXZPLbmajZEW7nEGrGAwNc8YozeITIbXu6UzgYaD8NO9RdIMvjZU1N3imX5aX5Mz9u2sd1ss1TRHVEZp9qjVTyPGGhV2gOBlYNeE1DEN9LXTTcmBjQzhGfHbuosbKGO8Wl8RSmfPD59xh58x3jZODtT18tTHFzoX76+mg4BUw/upxKPawHPEclwYg7PxIqfAR71qcXY5XusfgZkbmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ow9iS3Bmi/QOMozyfiTKiQYaM3loE3XCIPiqG8YYCUI=;
 b=kMHtCNKYYKCJmr7pwBg9S5pDTPAD3ZOUaQgxfB1DCiGPQju0teVd0/xwWhsAy9M0uAYnKucjYDKsmz5V+si7LSDeatcfssPXUwiOf10KcFv8jlquh3FLGQJ/jJZkj/X9vHo/zf8YSr4f33MIoVSKPCykI4rOSy1bCZWJ/v0Sa/yfMiBHY6F8xs5E9geuUZ/TfxEafSF0DEND63uAJLKjw5cEWBfvfzVkEm3pTaifp5NzeDSHmNQQ5xKcXiUv5lxcyhFZVuO7rQc7KASfDDgoKG95c+e7/b105NyOuOe4XyyifhQeSRnHGYMuYNj7DIJSo5AhmT0JuBXADhmJgeM3Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ow9iS3Bmi/QOMozyfiTKiQYaM3loE3XCIPiqG8YYCUI=;
 b=UYgPWWmu/yQr3t8IbKp80ghbuBXq6Xav0xbNNa7sfa5VWNJ0QCoHswgEPYuSLi5uUNvXfKHWpoYhhYuTtPewoswJZqLYUZO6zWuMtr1mjHfrA+3FBnIob4clQoS7C1N+i2h7nP9ZAbaEIx0TR0XOXAS/aVubbgoR8Ok2Y/K9LLM7WvFVgmE7IAl8IwcQa1bTZ3UCrBkXthHdoZTNw3esNNRosMJRcj4GousJohMOFf2BXwSg5QZMMhuZ2Tn3MzFHCRHtzrVFflZffzVDQ02Oj3SpIEzICHE9Fs6O8RmtnEG1IukcS8M4EejYw1UYeHeODoq0SWV410Mo/2MaRnQirA==
Received: from SJ0PR13CA0003.namprd13.prod.outlook.com (2603:10b6:a03:2c0::8)
 by DM4PR10MB6157.namprd10.prod.outlook.com (2603:10b6:8:b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 13:23:47 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::6e) by SJ0PR13CA0003.outlook.office365.com
 (2603:10b6:a03:2c0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.6 via Frontend Transport; Fri, 17
 Jul 2026 13:23:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 13:23:45 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 08:23:44 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 08:23:44 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 17 Jul 2026 08:23:44 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66HDNi7g278367;
	Fri, 17 Jul 2026 08:23:44 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 8E0B813F520; Fri, 17 Jul 2026 08:23:44 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202607162215
Date: Fri, 17 Jul 2026 08:23:44 -0500
Message-ID: <20260717132344.2744991-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260717130141.1790605-1-lcpdbld@list.ti.com>
References: <20260717130141.1790605-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|DM4PR10MB6157:EE_
X-MS-Office365-Filtering-Correlation-Id: b7743188-baeb-4d3f-1418-08dee406a0f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	jHHQH1ZGzGJDSV1lIZMneZgEnnXGIY1nPCj8n8hII44sCJNH+iRC+M2B0iT7Mlg1sE7CxwO/FNq3a1xO9lyijLoyGRWHUvYw0dOFgnB4Zss4GBxiZ9czf9pcvvxrCzBaOFBw/cpBEC8eO5YXYNvL61AHLb4I8p98CRprF3MPdLxdt/z/0dAVOkrV4BLR8bjDUT8x6SVZxfrpd+3+iH/AJVjSzVw1AfGp7LtoaNVJYPxpqcUVJtVnuNMKLUUp1asphAutN+W9FNCA5ZIsTTqgupLwKP0azM/GR7b2sGELZoUErg9RVkeKtG8iiqCnksnq5a+wuJsokwUXQb6saHN6/73oKjVF5OTol6VoZ+oxb4TmJ2HMg4jEd8q35orIAx0XGs0XdF7T6PM2cyHmRY6h1ZM2Ezwj5CYySvz18vcC6pI9GlMgLCr8cpH9VIkpCO7CDh2OUz98Zs5uXcWlzX67iaLuUmrlQpkYvSnJ0OrPUPzNHSmTFCo8h3cgy8KkdoANVUpcHGSzCU3ep5aCDqq0Cl6i4WHDXBerJ+zf9lyoiJXGVJGQkvwsvOticQ9wZiuF6L31SsfN67coprAwyi1MHSQCexHm/zV4og4CThoIu7V/jYrfnEeh4Sk5w+tTsfO7RNKFujOnemeSNwcLQA+yIMomHanHU/7ptNG0AGzXJvMXbFFV4GzNh9Vgd5swInvTq7CUZA+gWZ5u0rlsw2nYvA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gULZWftEO2drsv9UfOk7ueffk5ygM615JVBf39ROc5BGcUe049mLoXpLT0QHzMhViqhBEw5OcUurIxywy9ZereioNDCmzMbbjq1O0a/DN5D77EpFn1NC2h9baOQ9aEc9Ehk38D88c+rZI2qcIbS3zbfYvey1aqcVSADKsjyobmApwfIQpC0chYZXFGF1weHlw6B6D5HkPGqEjcBb5tis5BzPezBO0n/co0TnbtGdoU1HDpY2cIRLTDFGf2NQSVvg8GgnayK5a7X6S9w8HF2XY5NSrhJKrQ3K+xkbx2WCEPInhLVr2v/VaOrvp90b971ZuAFAdw4TsM7ZLIhqbd1z0wdBQoRXrqhH7aEeO43b90sB3u9R6y7d6Pw3N2+yx5r01ymp4STz7J/OKZy0SoKejd2rdAvIulWtAdiY0VzmTnP/zIweV18HaQ0f0JlBahbR
X-Exchange-RoutingPolicyChecked: 
	K/s7eVV+23d1prSumYBWz694g7sFw4nnUW36yJwAWuMPIPp7k2PEoweVAItu8ZPEUOfXdomAnyapzVr4S693NKBhuW1LTSK+Usdbu/huoJ/LeqVDNAciv0fp+ByWaJJObXd9a2A2MC6sIZnUtId/kCH6GCQHA1MRuNswp9GgmaGZXbYjOq2H3E34I4ZHTiaov1LhaszqCWQ2RW1ti715kkl1jrU0qTmK+ApYOdSoKFyKfKnKsHc5mQevpM07AncZooRCbVQEndLR5bHUAPd1er8uqBVqQ1i/1UBvE0X6SsWMwTYRyJpHlascb3DS2L+gfW91yka6E9R1681/QNsPgw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 13:23:45.3211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7743188-baeb-4d3f-1418-08dee406a0f6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6157
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEzNiBTYWx0ZWRfX+6FoTnAEpa12
 pYeEa746Yt6uLVUH0C7r0cQ4+uybDiJy33lUUZo8kyfscTH/IrjOo3B3/DavBcFHDSt9x7jXyrz
 nN3D7S4s8saNwaXlF8kU1BdQ1LUnfnI=
X-Proofpoint-GUID: 4LJuPKmDNbwP8E8nbTyYavA9_iSg-xtF
X-Authority-Analysis: v=2.4 cv=M7F97Sws c=1 sm=1 tr=0 ts=6a5a2ce7 cx=c_pps
 a=EBeQSdYSX+IxWZlepev2gw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=OcOmMNSFNrLrg0ByIzIA:9
X-Proofpoint-ORIG-GUID: 4LJuPKmDNbwP8E8nbTyYavA9_iSg-xtF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEzNiBTYWx0ZWRfX01liOItCrl2W
 ZH+WwdhBvbKXNVxXhBBpZTF9K+z8l0c2d6ubTGZnmNBUdUNqJRiyQTccgD2DlEZu6dDfM9MZVB+
 JgSWQXFIVzEHUJtBsn/2AaF4G5K2iA3RKPZWTk5yZ4TQsoM0ZUSKbgu8Q1WIR55vhjsU3YAm12K
 HaOu3Sh7zcJ67wE1dvFek19+A7fHalp59Xqb6THL/bdFxIuBaTpxO1D4Mp0Iu0CypDyjOLluWoq
 gd4HWco5664CHC8xFVsrDPefos0tjIRxBmJFxmmr+aVyS1VDgWUkKs6P1rPbq/4kcZ3R8wbvfMS
 I3+6Kjq4ZBL7WEiI01BYh1ZH40BKBkf0duYPh4/nIZ2R686/RF+nSITObzh8Qni+nzKNPTfOiBf
 QBWTLg3LZzaKqeOZHYRZ+utUL5VqRM0uJ3YTV4OCYfhQTdEkZ+GC1TP6nhnd+0K6vSPWEBlEWmV
 z+EiZu0QhOmfegZsWTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170136
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 Jul 2026 13:24:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20161

meta-ti / na / 20260717130141.1790605-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202607162215
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 17 Jul 2026 08:01:41 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 500b071092433b514717008f572a887617b0cdaf

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202607162215
- Commit SHA: ecf5acf07aa06f4f3c270b3fca600e40cf9bd29e

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




