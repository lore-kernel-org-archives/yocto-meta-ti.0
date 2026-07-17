Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDF1C4451B
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 14:51:26 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15438.1784299884461721080
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Jul 2026 07:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=jHGoYZWB;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=Olrf8B7R;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE8U5d2675548;
	Fri, 17 Jul 2026 09:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=xk75c94EloAToYQjr764rcbmKHDVZyIxlEp4pB8Z8
	Yw=; b=jHGoYZWBLsHoFHjGDN3lpZ3DqsCs5SK716jcO9HbSkafr1haOwyCEKZ7Z
	cO5oyJT6fcr9EbX9QaUnha0HycGlEK532dbLkuhbXfJaiPnWNgItP9nrp70O2V+w
	9RQJg859n7Yi1GciijFH2o1rbgMpA2kHsZPTPAaktq+9icKWPuDro83+kTypkFh0
	K5V5X7l0vKYv1agbMLcCFKlodu7x5Q9HEu3pM+zCV8WNEJSU4j0el0lTLpyd26aT
	S0d05s2q+LAn/HtLIIPAFK0iYLRD96NWeBZHxGLA8R7oePC55m0x3z0SjA+ZeFV9
	1UWFw8s2fKSz0QjIafpQgxnNbZHXw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010068.outbound.protection.outlook.com [52.101.193.68])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4ff2ccxak5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 09:51:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHysShclZpl9EjyuWbAebmLxP2ZlFxAsW7jCGF50Kinw3/EzHwQCYOFRAJCEWJM4s3TBlI3TLq1LHflgnlY03VGRPGvhLLzE3KJ+6yMavQaLNHTiXP66A9WkWYuoIgXjO8iBQk/mN+wthBcJhckGfs7X3fr7mazi8YLAgdzVMvQduWihd4CsMMdE2+3ClW93YJrYi6NzIxFjC3b0iOoZM7W/vPReUGRtha3rBI+CB2cnAhuzs6jrJbbkCQzJv4C6qAZnNZwgOOldvWGFfYeNIPZAEHPMIIwsJMwya+QN+9S+QGvpTzKRoMOVgMa2BRtYVHskz2kD4UUbcYIC7P7YDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xk75c94EloAToYQjr764rcbmKHDVZyIxlEp4pB8Z8Yw=;
 b=UydpxKhvEnBVjDFb4zbtXs3i5J5FjdDK8ilLu47s+IPRY6n/WUCg7FTXwVqsvKrRXQvqTJO4ol8TAfecfbwSdebTP+1dWrVpvPNil/h/G3PkAa5WGPmyclZimsvw3MA6+dfqCf0yC8zHXjwmL04BqbhwK4EElhWvzFuQCd+u6Iej/9zhzuMfLEtmovGETSqr3lrfofdNp8koMGwgNvjo3eR6quGYIyes15pdWqaRDfv9MJgPDaDOznifXBbyjZYmudnwSAotk5G0Qghy07MYdoYNRlWiReWE55oJjgzfELA8OdsyjZeOvkf2CuIHkKMmk/OxpD0NEuQnl/v242opEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xk75c94EloAToYQjr764rcbmKHDVZyIxlEp4pB8Z8Yw=;
 b=Olrf8B7Re2GxP4bdbPuTENVdJmkw6HShSbeOvVVEinUgj6Fyo98p5LkxTUDTPdB08qcYgZUGQxD/BsDt74vmP1Mkfr+lP/1v8cJm/sa3RQQaeyjK/dKsuRd5y/ftOKywJq1liTEfB+ZqCA/BEra6X8oZaKdMv/jFfHdPpBhmE3XOCEouGM/fhoVgHfSP1LOmJgS5pkMrhwXzx5y35Nr7HknLIktP4Ece7F7qWmkhnS3A1Ke0mG0VngpXBnmA6F5E2w4l6kxuA1RWCYWPp2jxsVwYX5gxoU5zqtqHVcDx3oXF/MMfzlJxO1HyCf8bSxo0Lz6JP0el0aHT0pEGe96+ZQ==
Received: from BN0PR04CA0015.namprd04.prod.outlook.com (2603:10b6:408:ee::20)
 by IA1PR10MB6877.namprd10.prod.outlook.com (2603:10b6:208:423::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 14:51:11 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:408:ee:cafe::48) by BN0PR04CA0015.outlook.office365.com
 (2603:10b6:408:ee::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 14:51:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 14:51:09 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 09:50:49 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 09:50:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 17 Jul 2026 09:50:49 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66HEonaf3428677;
	Fri, 17 Jul 2026 09:50:49 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 75716138B5A; Fri, 17 Jul 2026 09:50:49 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202607161505
Date: Fri, 17 Jul 2026 09:50:49 -0500
Message-ID: <20260717145049.3758670-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260717144855.3524322-1-lcpdbld@list.ti.com>
References: <20260717144855.3524322-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|IA1PR10MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c7eaba-2692-445e-aab9-08dee412d6d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Hi+omtMASe9nyPPkmc7nuTXzKP+mjfn2HQFGhHUdS4RTXTqlr1PvNFEg4WTWoaft0sm4HLSw0wh66+GL8OU9JEXNpw5no2wjiRx2C51faQnowvt/aA84WmWnFlZ1jcIHUAqOtkMhOVwfxoPCaIpxRq4tXrE70BGKllsmDov5U4KHT6X1uM6Br9waT58H1cHhY6CXGj3MTt4B4lsa1xc2/6P0Hgj9zmUXQgLgJzAUV2CznWpySU6nMPUbpbVpFjjYdrd+lk4DeIc4fOE2PHcasJ5X+LWd8w9uFPvCFwpsObQsE0f/jBUHLgJ83f7Kaivom0p2GdBkeGfK+WIaHt/2OJ1hwTmPV229XFN1sYJ5yOcpYWnDQf4SxFC+6aBtbwKUyO9qQiYRQV5qExvpptIutn7SVBFmT17XSzAh7W+ZpphIiv1sPkwXs+alOiD8oTVqsD5zqC11hSceGehrf2fwpRsyUZwfIBbdC6YOMSyhOQOACZ0bx9VteeKioZUkJs0txHQle2JXfNtL1f1R0SWv9W6pmINU99qVt6JBAxw+0gFeINHm5YcpHMsuDAu/9aDupbs+g/EdlIV+jEgNI0cgi7HpCpJZ2Olv9lUBsywUHpO5XkvH/hKJWyvUe8Akzy/CyW3iAijTRK8szzXfAvPxvEgoyjNGSOsDtIDwMm0z310ZvNx2AjftRtdZpKfgfuFXDqPKpGKu9lNyZgPPFSPnQw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RFOoLaT97wgEUjgYxObHYXY4KwDzLLxbhkWXaPAk32EKnLC8u2Kw8YbPrfTkA7MM0/PRHDCOz99BU14e99yG5kqRtAakRpM09iaHrU4x4kJXZxmoECqnlx+SjpL5CbN3mKTqF1f+UdiF3n71LxuZ4VaJKOoE3pm94w1RZFZuA8N6CaGiNfaW7goVYlQqrc3S5hFu2lE9GQ0juWf8Nlbke4rFY4KWEe8sIQhXLwyuYhxjuf1nXHgzfi6xYjhlX1z1nFK7kvKvnXj27Hb+0BzyyOMFbc4zpj8f65Y7IkNrOkRM0AGQb3Av83uEmEeoJvMSZm5i8woYodaNbmflJUFrtEdEPEOMCk8sQc4nKSWRLtku8nZo1RoOswZk3bDcXnrZ8t2UxlZKCWVsXgrS5SnxiSl08N4j+9zrMoTQmJ2jXa8RFulOqn2gyGmlUdQbBGX2
X-Exchange-RoutingPolicyChecked: 
	FQVsnx4bKcZ8dF17SD1OzAkCnSQgK/+uW6JHyGZwjLNC1+5PLcttLeusQXxms3v+vxyJOwoGIzItj+GHRCT6xMvY/tgzBu/V7vbgUP5oyhWCtlwk45vl3MY4FjrilxwEoEVXnIoAq1utBVqBndSRNPkJc9nq63lzgADUlIJFzn9fONmlkwxK4UmrjsvLUkblq8tqi+a12x7uEdYKY3LSe5bcrrPQQPGvdk2i3WAacZnUnGi9TrAepTiNsTcAwcXFk+wZLRv2hjWF6Q74GxqcrqU1I1gd/q/cvsDh/m2U+uBceOMM65vM9cr3+PHER0rAWz06C+yr6bgZ4AK3oAQVbA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 14:51:09.6837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c7eaba-2692-445e-aab9-08dee412d6d4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6877
X-Authority-Analysis: v=2.4 cv=NtvhtcdJ c=1 sm=1 tr=0 ts=6a5a416a cx=c_pps
 a=k/S6D1Pxv1bk3xTbD0KMJg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=4C2I2nHoNkmNE2BiRYAA:9
X-Proofpoint-ORIG-GUID: qATbGaTqiTD-LEGT9YYmM72QQuB2zps7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX4H49I3nICbuO
 BNgY6dBfxpV5+C8oY02EeGk/RH+Wu1F/otdNWk0O7+TDSrIaAdj8JkHK963bEDFn+ick3joYM5Q
 z6W0SzGGNXEOophlAOIJSr9T6LDZs7IRgqzIUWrXcRFvj869sQGN9nNiLvQUh9TkEGtrsLUJ6/W
 GCdJ4nj/wU++CAUpRwUgeuv6SWoKOkRigMSzBNA7VKBkZPV3YwVmbi0/ixQ6PWcl3TPKfBX8SSf
 axlsZNSxIAGNioqPMf3j5tjnmcnfBsZu3Em9yYV/UPhed21oZCVq92Bt027fHgADm+GgbIRNMdE
 7co/5BRLy5+plmp2BVyafI0LUdNly6LTP1A1kGn3pa04GNfKKUF9Hp2JSNr9COmArvMvVa94ZO4
 lY6iTk6WK+8NEzPcSuoxts/cyYtVofxEeJ4nNF+qkBq3iuWt6YeShuqJ6lAqEwfo7ROoLL+W8pa
 Icp3eJVhs1qb+YIgC9A==
X-Proofpoint-GUID: qATbGaTqiTD-LEGT9YYmM72QQuB2zps7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfXy92eg7HI5Kp4
 t6vX8JY7zRCEjwgIE6yzcc8UrZUy/oMl0l9XkmnLPr3oF/zjrJZfgzmXJHsGeLy4+jXLvZ/QQWg
 iBVjgWUlCPFK/a+NJg3bEHz88RCzYLg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170150
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 Jul 2026 14:51:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20164

meta-ti / na / 20260717144855.3524322-1-lcpdbld

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
wrynose
=====================
Summary:
- Patch Series: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202607161505
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 17 Jul 2026 09:48:55 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b01c63fa3c0667d612a94b518c1c2bcdbd437432

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: ti-img-rogue-umlibs: rprovide virtual-opencl-icd
- Commit SHA: 45fb9b44d05b87fee50e7772403247de3ec65c24

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
wrynose - PASS
=====================
All checks passed




