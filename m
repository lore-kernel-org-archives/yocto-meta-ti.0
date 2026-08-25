Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DD1C61DBD
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 22:08:50 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.285.1787695720686155848
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 15:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=W4Lrf9HX;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=kn38n+CK;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67PLBDbg1898968;
	Tue, 25 Aug 2026 17:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=mN+qUd5NT4b5QN/KkSXUw9RNQnoVhoQrWhZ/gE0EP
	S8=; b=W4Lrf9HXkXkzxmWBxoo+IWr3gilr/Ydw5rCF3mhALRJq/japKSGopzqyF
	wRV4zv2TTpbzOOa09+RsS0lwEIFSaExbWhV/DAglRtyRCywEvY9mXs/WAknnqe8O
	cGkXoIuWlTiIKzs4nU/sxsHQONDToWbF/CuH9WfJN4cmx5wIF+19tVf8i0Uas7ui
	sOShueCkJXF1r24Inw62yqr2VjFazKHSa+QO4bWuRo/RuXW0PKvY/lk21OgoZwug
	5LIdfmXn+WWpvuOj+4hkIfzpbBx80b9veoZbPcJVzx8TccbZJPrUnDVbevYcDCo9
	gca0l8sf0v09QfyRhhlqrg02lUC0g==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010056.outbound.protection.outlook.com [52.101.85.56])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g91sxnyb5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 17:08:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vsx3okSke907zF6sABfjJPzjEkmPMC5SRqZ5NDKd+biS3rhhFUKU49bnuTsmerVzPjQr6Sf6kouHytiJyIGbOZdY3Qj8tTAEJ3z+amkczBZB7fSZAKqGK76T3PsIdOTSo2+uRRZMi1FgLBeTvhUiF8CXpXVqbHyqOXgVfsmPENGMzfgdYvCjdJbqOUyIbgZQmL8Bs33cia6ZDOGmASamVUnKlICStXwCprHBma8gFcHjQZldvbkWPGfovd4kz8j/9OPfazaX/yh5uZ4xNsNwCx5BwIvR4XnWuumEjDkZRWjzBgqfYfkVpQGLf7uWT5lTaC52bbUxBB69FrEewKzjTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mN+qUd5NT4b5QN/KkSXUw9RNQnoVhoQrWhZ/gE0EPS8=;
 b=rsfkZi0yrjnmpg5Ugnyy6MUhFkFW0CSW8YNxwhjP/vWE2I2EumhlqX1fiEJSwwlp/gZNjYxKIkLzEXLwW4G/kDwH5RFRPAxwP3iwqYqnMMQS69IPTZ8DlD76irt++JyOEBpDhFMWExfAjnQcYoAHEVnaLdZh4Sv9HRNMXFHxnkDDfSJybhRNDdAMk4wdGFP6z5YdgbxPnasxP6IThakGcvKgQUhVEWQj8BTT/ktILRq3lZ1M0bSicQDUdO4pG9OSeAESIEjvgkLViZ+l0P2rBFW7c0BJrD33ei7geDFAEeylXSfLnZAsihQ7J2YxME2YO7n7WDkXcejUceH6LPIlkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mN+qUd5NT4b5QN/KkSXUw9RNQnoVhoQrWhZ/gE0EPS8=;
 b=kn38n+CK0qi8CBrJTJUbwk5xYftBJv0sGSZJj0Ru1TW+X3nXzFiOd2HweFo+XMf7VbuDDzICUPmrwmEQv3bvYkrOSkKxS7ZCvB/FmxTfe3UvjmtHJ94/niKNYY4EOT2/wEi4sl65VrokSZC1ihsNxWdvt75gIbStaNqE1SWf5D2oKIsJ6FJ8ExZ3NiV/jdot35oykx0QSHRaHI41OeUy7QcUKEEh56M3P6b08P+Ak+bJ+3EnK+FmZlREnvbOVExO19cYaZBJKn3ncZxshFP89E+o9+AFD7WnjqueQlFmLsJE/+vzoAtFLL8QQztftsKLj56n+mfVJ9epnBXYv3a7CA==
Received: from BN9PR03CA0533.namprd03.prod.outlook.com (2603:10b6:408:131::28)
 by SJ5PPF2740EE012.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::795) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 22:08:31 +0000
Received: from BN3PEPF00022BBC.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::21) by BN9PR03CA0533.outlook.office365.com
 (2603:10b6:408:131::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Tue,
 25 Aug 2026 22:08:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF00022BBC.mail.protection.outlook.com (10.167.248.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 22:08:30 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 17:08:24 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 17:08:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 25 Aug 2026 17:08:24 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67PM8O851795962;
	Tue, 25 Aug 2026 17:08:24 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1F3C49ACF4; Tue, 25 Aug 2026 17:08:24 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202608251347
Date: Tue, 25 Aug 2026 17:08:24 -0500
Message-ID: <20260825220824.22542-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260825214817.3103136-1-lcpdbld@list.ti.com>
References: <20260825214817.3103136-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBC:EE_|SJ5PPF2740EE012:EE_
X-MS-Office365-Filtering-Correlation-Id: a5323f2f-933f-4dfd-dd62-08df02f565c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	okc5dMpuK7rgJkeMweiC9ccuPbgXmMYjwGETk4aR4Ajd7N7MgQlxIaksBvIQaSYdyja4tlsdy9/lHzOmnnE0mwWuvBlLox4qU5s5+gvKD4qHiNvC1h9+Ns2OM0kCFMSg026aBlkLii9bj4NuCH1pVWLRr7YONPHm9LbdLbUIqOuhXvxtA2hoNII8bTicl9ps8pySSsqppHKJfY+8TnoPMJv12J2cBcv6jEOgcW4pb54jpoTpVOkdwTtCS+yydTOwSJEz2BQEdfEXC5iJzJi2CrxVOX+irHKvd1SDK5hmeilR6D0OWiZiEhZngzq0q1BIhD/aDtSwSjBoHF3g0ZA8t0YZgzRXf3b4beUyfyCkCDkGqxMo9Wmleaxfn5iszRo79yZhdbF3G7m1efL3f17kJ2yqTeKNaJ9bKUw2QNxzGQREYT9sB/3L311d8ZpdijMnPvUR5yR0AjfsPe/qwUILnS0M7IBmpSIWZVDF+ysfBmLnS7KYN/l88kU4QJFiLDyy5ZosVpj3URzcqtcxJfP36mYs7/xLCQrmaRLZFVYQW2p0RKDVu19YwWmATN/WdExO0c1jKZcWVE4De8YgkpBe6hnDdJ8ZzSleQD4RHAdO5J4LMQGPoQ1U8g1ltQdkzQbv4ghHFoNG6VdsSQB4qt856zvQJOoLOAWUYVlcc+X9cl4eNI3bObWgrIbGJ46us3Owx63w1cLZMCza+lxJxu5j8A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CKCMk1NQ0CNETyPiW/cLQ/G8H/6aRf7dw73q1VqAnZRfJEKIqJJhrk1ntmVJya4ItQ8lN5gRhg9vxGHJtmP/G0HpGHcVwIHUOmpih9J4bQQ+LG2XYYEofo4o3oPh6WOds6+uIR9gJ2BvlhCrCnuMnVdIDD/eq319VC9wU9EJmo3P/WbWR3lW1l6Fhv8cr4+f3mJgYS0ueBWYaQiWxDnnpg1PyKVUzVF8J8P6XpkD0Z7qV0dyCXYi6L0PF9uD6vaoA1HXhtzO9EHzOab5kJ/Xv+S53J1mhzILRU632C/z69PyyI+xhgfzm6dN3ELT2XvZBHHWYp2BBnxFhUSYxKm59jKpbhTKhPz9xHrGlvNuo33jQJtVXbnq5Y1CgOXbEQIWIP5BzyD7G+0y60v88GabEsMeIdW/EtKEX4POwfWqzqJDZ7keX04M63zmXnLL6bfO
X-Exchange-RoutingPolicyChecked: 
	AsZz152I9ZsBLUTCA/Mj6nFOiE/PvJ44FN67NBnyYaeJF+rLm/HPw3Gx5FBgniPvsPtu+6mrtdR7hYIXkAagBJI3ZNjRwjilMb1ElA9iVN2odpV1JxoQVS+Fc5ikd6AVbf54g9h4ecltmgVlGpXu521310LWFKO/ZpnssXoTEKhcvX2Mru99QSFxSFXM4sFyk6tzvJ9/nkYoQkYjsAG9Vnrq1igm65Pr9zyFq7AthOOCl979PkHQXJlQj73zuy1GuBxL6HK7o4h648AuunFB2QIkKWOCuGWH+6Izb+924GUuB0Sm4NaL9jnFjGWyEzbHVFQSYHssaNTh4FVoo63KnQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 22:08:30.6654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5323f2f-933f-4dfd-dd62-08df02f565c9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF00022BBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2740EE012
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE4OCBTYWx0ZWRfX1x3H1jiilDXl
 AC7zluhJiEQ5yZR8lGGPE6Vi6mTO+EMMiu++fYo7pFLLo6LjhlXdKhU9wE6upVvWjQ6ybcJi5fs
 cTeLgQIHLQyBa9SgGVSXPUSHXbB1CLg=
X-Authority-Analysis: v=2.4 cv=HackiCE8 c=1 sm=1 tr=0 ts=6a8e1267 cx=c_pps
 a=CnS1ju6qDdjTg6bRefQovg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=ef_xxL1EtnS6UrlDfdMA:9
X-Proofpoint-GUID: Ghz6yn7QEiNSRQOzNnfiHIBL4wmSpCjX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE4OCBTYWx0ZWRfX6nIaJdQf3pPK
 KSlB0nqCThRv69OYV+ETPkmBFU5ovEdrAbOOgAJ3LsHr0jmEDF4FQVwcsUUfwoZ98cRpUWv8n/5
 iYHqucqtHFJvi74I7VrFujaVW1U/uAbiBws2J/auRbkvAx57WqNIqZo3hInkNL0SYr5n/ghe0nM
 iIb62anTOOgDCYICNHGbtNMtiSL92E7SuC+k+/n5T+mVxFsHhfXq0RaDZ6u9vaeV2epCh/A26cm
 sonnWiTeoCWXTMpW6zUxjV1Q7lZ1ZLd3JE9xVNbV0M2adMqVt/DuNjBaTrPW4hOslTCvcIwlqR4
 FdUe53buZ7gltQVhgKM60Gi9stYfERGv3oSyQIYY6NmLP7d/Q9y62w2oR4THpqbxlSjPhh9JAOu
 UopwoECQjY3AXZsZt1S9jdaWtKBKIp+OiVDAQ14yalvz21ighX8UhR5z40NVXYTiscUjaIloAb5
 2/w5CeC8zDt7QpsIygQ==
X-Proofpoint-ORIG-GUID: Ghz6yn7QEiNSRQOzNnfiHIBL4wmSpCjX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250188
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2026 22:08:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20293

meta-ti / na / 20260825214817.3103136-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202608251347
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Tue, 25 Aug 2026 16:48:17 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b48fa461244b618a4c12be711e648df3faf475c0

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: 4514272f76eda83375aa2e282ddd09b10237c71d

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




