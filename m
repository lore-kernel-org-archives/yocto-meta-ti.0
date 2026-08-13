Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AC9C5CFEB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 06:58:50 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13482.1786604321622497416
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Aug 2026 23:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=qZ8W7ZlY;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=tVGiw0U4;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67D5gCgX2466112;
	Thu, 13 Aug 2026 01:58:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=BXlpazbbitEJiQET2VpM8t2Laj2kT3r3YDi2yJ27b
	nI=; b=qZ8W7ZlY/bn+Q6HY5a7z4mcr6fL1dIwcRFY55VEVb1u7ga15UoecF7Wk2
	K9k0uRlijBRYdiuRCP0+fE3eb1VE5UtOvCo/Kfu9tRMcNpbZQZck/xejSye65gU5
	ToKP1FGXqTewknIqpgG1SoAvv/n9k+D0A/gRnyn9JB+aN02ifs2pEBvgX+/JuHnQ
	6ZXN5BaV8knHaJcah2UKdYoYNohD65mBHXdvQunyf57prYKGy6dwsQrnq5OXABh5
	mdAoYk4gYPu+JZYsgG3dLlNkLU6X08rcTwOBzYuuKhQ/J1OcM5jcAnxcwUstQc32
	i0vZGcDi6gtNYwbjyjlFzyxXrUZ+Q==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010064.outbound.protection.outlook.com [52.101.61.64])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g0musf868-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 01:58:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZePgju6z9+QLdeWJwjOU4BMHKbFVeSQxUaaiVQl3Jao69YQxFHbiXbcj/hMTy4wTa2LjrmmLeFahNsmSQ/rccm8sMfkb9ai8FMhUJf/tq4xf1AwYISDR7/9Vtriv2Mf52h/EvgK8wojoSndMPzSu/3QUmvd+crl7/6hQMMWCoqme0jAG4FWTAFvlADfR/fm3TL8YgdefKQn5InrJPoN1VFdPnF1wCuqRj/yD5JokAuLEofAI5KORbvRAn8gg4hRYXBEURCykiJY/tSsTLaX35Srhzpreijc0l4HgJt/Ju/Dh+YENzvlOKGOhKBb0VXjrFqt/9qWWsRTXqO/wBtvJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXlpazbbitEJiQET2VpM8t2Laj2kT3r3YDi2yJ27bnI=;
 b=Q7d1Q+vYsPjrd2TDH9wyalwFuHm9qby9Y9I4a8AseLrrR7K8VhXLTQ7f7/9nqYGAFvVWFfh1LlgoVDgK7WKDXDfuoEOyTVzewkGnXtqQC7NxC3bDZYnw3nxwG2RBVLNbUwYs53qmqvzOTMh7j2KroJg3sWI5xa6lS6FpjjrpnLKNnqVeZ0/TqFD1dRA1iiitYPSH1vfZlVFPdgZ4r9JAnP5KBzW63azuXwEl4heBLnoI3CPGC0erfPIndV/Gn8gY+DaKmnoSb4RFdQ6YPEFFpD7NVyUExajFdXlrMFCfeJDZpdXkBrRCyuB5fwGZ9KEe1/mCNbH20D2pwqnpXqJHyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXlpazbbitEJiQET2VpM8t2Laj2kT3r3YDi2yJ27bnI=;
 b=tVGiw0U4bMCdpvefc7PLhw8TyEnZIsjiHISWkMLHFx02B3II6eoCySwUcSb/Az9+wiorRYyawtR1QBugBkGFCnbvarM4oPyq/+IPq2wMlI7RXE73l2eRVvqDh4yPKPibn19ECoYDpSa9kBgu2N12GkG+H+vHVPi5aWwjtLA1mpeo59BF4q4m3KCpNBzEQVqbmtbsCphgF/BcdGygDMfZdOHu6tFTncuDkNaCoXbnH0yznAkFxw2zTeTmgAE45kc2ZBgt3fx9X1MKNFo3cz7LReZzCF3tEzOOceHWCDWE7tqg2OvvTWvy13c8y+gUaf/BLcGCz2iwvMboM3Vn5Ptcrg==
Received: from BN9PR03CA0475.namprd03.prod.outlook.com (2603:10b6:408:139::30)
 by SA2PR10MB4713.namprd10.prod.outlook.com (2603:10b6:806:11d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 06:58:36 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:139:cafe::a9) by BN9PR03CA0475.outlook.office365.com
 (2603:10b6:408:139::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.14 via Frontend Transport; Thu,
 13 Aug 2026 06:58:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 06:58:35 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 01:58:26 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 13 Aug
 2026 01:58:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 13 Aug 2026 01:58:25 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67D6wPFe3566018;
	Thu, 13 Aug 2026 01:58:25 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CC5BA138B5A; Thu, 13 Aug 2026 01:58:25 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202608122200
Date: Thu, 13 Aug 2026 01:58:25 -0500
Message-ID: <20260813065825.2036479-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260813063755.824401-1-lcpdbld@list.ti.com>
References: <20260813063755.824401-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|SA2PR10MB4713:EE_
X-MS-Office365-Filtering-Correlation-Id: f6ac96f5-dbbd-44fe-73b1-08def9084bcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	yzpy6wnSbz/fThtQCfnIFWn3m0W2LYUiF3nQWEmLQfIwFq7iC5BJX9N8SlTQLhJpnr+gc/SYcAjq7xfWvVYAj/tHLgsAT56ry+F3iExhVIc+T9VfnMvYpk40t7h9b7dJ/cEay8/IvCUhm1p2ieDH46XwGf7410dzyAzjzEHxSGzRioHlr2nxe8rdcBw2oAbucPrKfbWS/X/L86C6SFPAr2N/oBQcER7l2sG0BvPhawfnmUAdG8/7+XoSd0JUak+nsIgkN6QFqn587eCXhvsHocvAXH8HWiIximheAJybwRcdP50/iGiK/sciu4X/DkEapQOxSPyyQSSk3gFQYxk42TQCqFmxZB89PimwhRcI23QPZ9yUapGhMQY7qHUS61BW9ipyfn9JnbBnJBveE9LAcalqePhq9rP6cRNjc9a2EhoC7bHGgc2jQCJmpO2WfV03rosAOwFuUj/B9d3p1h0VxsFdvcCcqQizmYAlolAk19HqRx2xjuz5QopwY0acGSiE9XKvVgzpFpzfEA+gQkRFRnjKGqREwdvDva7oPqUwP+mJFMyReAcYAklzkdncb1EmJlSCcGXXoAfFQY0p7IpJGo37lIh43R+/4zpVV5+v5CHZZuPwJJqlDNKDYCxMqhDS8rnsQU5pUVPbbX4O/y1icl7MVrm5qdAmbesrD328oxKICIHmdGQd9LN3NIEbmZGv
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	NrBgHC/uaT6a0S7mB6PMP0yWiwpNvrCk8ZLGqe/to7aKjtlBCAGASjF7HGM/R9rwzzmlKQuD8QLhp4Es5g45f5GY8k9E5nm27fLbWDIEW3lY0IYwJGzgKAh5bxlWe0RBuKfun/YuXh199SUygiF3tQRx4KdF0DzTNzIA1k2Nm4D6ffb4LgQ+kwZiypNtLgcfZRpv+LPBHYaVCRkl2JInryxMOrWDBn8FmnFn5MyQQMFN5xPf5j0Ws3XG5RL/PRxmsiXNmHBG8rlmK08eb1YlcuqIQU/hq/v9fs4cDLwUaw5tVF0wbXEKlOpr4BwM4MnNf6q8qSJyVNN+c1a97jo9qOhB+0aJA9/RoZNBnn3rzkOMMLuLtjXZAqWpdGH8TWER3dMJWhNUPOmYA2+gQEMYwNn6kt+cvJoMKW+YGoB3IcWVB952W7dsPrO0tT88JSsY
X-Exchange-RoutingPolicyChecked: 
	Umx+66HFjydHA/TAuS3OjmKQq580LAK0B5df6rLa48Q96MT/8LOwc3WGFIJyT/52X5AyoafYmZL92tdWuAXIuJL3fr6fazx2ERqlmhKb2N06AovBUB8jIxeWgMjDGCDbamx1uyr++fT0ZL6kM3hD0vAFlgyTIC7q1C259pnzCv09zXaFth9HA6ho7vJCZ9dODKfaLa/ABTq09pt8lOelh2vW9tO/5Ib1RaqxsDBOHDguyq/2vj+Y1KJGs8160qqVf3WOTI63uHzKJPulpiSU3VBwzhE1DgCl+JuYyQSQAeKvy8WuQQ2aibkSeEY6G0pXAxk9cePwgFkctObtLOOyvg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 06:58:35.8774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ac96f5-dbbd-44fe-73b1-08def9084bcc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4713
X-Authority-Analysis: v=2.4 cv=cY3iaHDM c=1 sm=1 tr=0 ts=6a7d6b1f cx=c_pps
 a=0b+utHCzfji0ILmZHHcyhA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=ef_xxL1EtnS6UrlDfdMA:9
X-Proofpoint-GUID: FGzL3FGkJUBbVVsBmJehb8IRMteBKPI1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA0NiBTYWx0ZWRfXxayr1t1f1cBZ
 mOyCV+fqfwBaKMik+gOqflSdWnjqgl828D2TthieHbqPtdVGhBBbaYCVvqw9e3ol7X+SLxXDTIl
 gIN9TptVvEnctbmTbpF+NTEeA6BE8fe5RlthK51Dgz24HWLVQjVf7uqzIeQnHqLGpabD4Kqjla+
 SCTkd507+TfAlMlvmHP8QWb9oPAYQV+BNMNvXOwJpCreNFaYqrziK0UiR9m4XC3boRNRpU31zMr
 vUpmV8TZsnOAEJeuIY8dtBEv2TKEiI3N4dd2rxHL24CUEkmWOzhxzCH1ipHBKyvvhXW+xUogiUc
 RanSzy+7FdK+1aFSFvdKe/i3+TYsKXn55tx3Wcadu1VMopqexJizmQy3+8MWwUlxQJ1T40V/e+X
 hgwNJ6pq/s80eb7xmJM6+jFNLYEDOTqmKpMXPXArs6JEuqKKRn4bDvT+5cz0BEYHuikkkQeACPq
 4NrXrWz73t79YZAo0kw==
X-Proofpoint-ORIG-GUID: FGzL3FGkJUBbVVsBmJehb8IRMteBKPI1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA0NiBTYWx0ZWRfXz4GznnH3TrVD
 UjBlyCLML2MyVgIMyEs10KVjy9LSK90KlggvARwgIeN7oLPujB+eBIM8/DPQRP5ozLzCDdp5sDg
 IxsFT20uBAJYB2FPKMyeN89ggiE/oqs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130046
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Aug 2026 06:58:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20262

meta-ti / na / 20260813063755.824401-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202608122200
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 13 Aug 2026 01:37:55 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: df2c63e7b5fa8951999463879fa4158f94482dd9

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: 4b9b341ae61979266d750016def420350a683845

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




