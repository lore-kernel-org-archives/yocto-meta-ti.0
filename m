Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0108CC43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 02:56:19 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61089.1782960969046283098
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 Jul 2026 19:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=l3kBXhel;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=sM9Nxorr;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6621LIiS659051;
	Wed, 1 Jul 2026 21:56:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=IYx1nUFMIs/KC9wECLBahpxkVQggxQEhYy4ycnhvH
	ns=; b=l3kBXhel2C9kH1rgMYLxHHgp0WuQutVU1BIcmBHo+xtVdxFH4GlTolnIz
	z8LPAPT0E1NSmQzUA+F8DZ4JKsxWtc9pXJp5nxPttJFiptFV5IvHwVK87/Wp+lj9
	B3/+/LcwliQ5MI6mjN42uGJvZdb8M/7oTUHZ/nIUYJr5RXxVDn9H/RAOeeBUq1Qi
	1WO8qKQ3DeXTfa5dGak7Nd85Zq4BmfdX615ROJdKSF6VEAe1GtzLZgO8QO2BbyZc
	7q1M+AtlkxXKAjBZ/5vGRzfPJRQjiqnCmvr6hPLaS2aEUFv8sjzt2qr7CD+EXjg1
	bYQbBCmhQuz82in8rPJo/hBGl8MSA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010070.outbound.protection.outlook.com [52.101.85.70])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f5240wabj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 21:56:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2EypLoY/cobO5JVeDtaf8MwLXmvVYjtpFDydtbXPwuE6yvub6I1GBiqczVnA0ii03Qn4I9MkTKLNTYQ9sKyVRnQUbaf+56/BR9od5FWmFL15L23ERz1KxEVe7XcY6OjbgWPuMv4SWm6hmwxp5CVcCCfX4cAaZWGzkOBMSCnc9dFlkuGr4EKW/MGQlEH8R/icnwi7ifl7QLJh526vlmXQyQT/0ch+1xrxJ/MQky4np+9NyoxIvV3I+D34oVtFQyin/ouDUpKrHZv4AykDGXIP0XBbLupYy9yEvXLgzQsnduKJ0cMKjK+Fvn18dxyxr+R37AjNJhjzsC1UUEtU/J5yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYx1nUFMIs/KC9wECLBahpxkVQggxQEhYy4ycnhvHns=;
 b=j/d04XHHvdL3aJXhcm7WdTPSE1vpeK3fSdyK3Q2vko6raSrfUcKo2UPrc+MM3YwDkcEstPZBCPNZBshhae4D4xvUjvxY4WVkn1/g6hFMzCJkmRy1bMTJng31guqpy5sLhA/EO2oB4GP73Sx2xdFzweFdXFuM3iaJtphm1e7DdaoplmLaZgY0vlQEw3QXYrVStgBr2yy1qznr3Gyzu04AYCUCxsE7tz4HyurnPo9JcOPN39xg6IFrAXDcpEfXOzpTspIzIoTUdM5lC5iDwe+zSLIFjNU7kbkHP1gRpzbh8/zRhEPepSKng8YqRsLkW6ClCUXYvyzJeIngVg9S6YSRQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYx1nUFMIs/KC9wECLBahpxkVQggxQEhYy4ycnhvHns=;
 b=sM9NxorrNtNG68QwEynzU8F/PNVbKqBV2Lwx6Q2ns+Cs/gUCJOq/srG9pZCJF8tk9F0qZ43UQ0QdTPvhDWWbYKhMyVTo1988UX4S6khiRS1h8q+EJ6zVBvCxqHxbH5x2bK4BegGbG50D1KZK8Nk2u54Ks5+XT5x3YjblUXibmF2GMHJ8SrnI98v2Js6pjMP6TUfqTKYpcpMTaHt9t83oWwYX7QStroPWmSInJWQqsB9xphQ68ttnlqDiZAH9wKYhut+xV/bQtCRlZPdmGceTlUxc6Z9K3B8YcjdRFGQzI7VgXw/EJR6hfTQ+uQ1kUmEiYEKGZCvkXdGTz8Q4/tYubQ==
Received: from PH8PR05CA0013.namprd05.prod.outlook.com (2603:10b6:510:2cc::13)
 by IA0PR10MB6699.namprd10.prod.outlook.com (2603:10b6:208:441::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 02:55:56 +0000
Received: from MW1PEPF00016159.namprd21.prod.outlook.com
 (2603:10b6:510:2cc::4) by PH8PR05CA0013.outlook.office365.com
 (2603:10b6:510:2cc::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Thu, 2
 Jul 2026 02:55:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW1PEPF00016159.mail.protection.outlook.com (10.167.249.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.0 via Frontend Transport; Thu, 2 Jul 2026 02:55:55 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 21:55:54 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 21:55:54 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 1 Jul 2026 21:55:54 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6622tswc2526090;
	Wed, 1 Jul 2026 21:55:54 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 47256142E21; Wed,  1 Jul 2026 21:55:54 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] check_yocto_rules: Add rule for new linux-firmware
Date: Wed, 1 Jul 2026 21:55:54 -0500
Message-ID: <20260702025554.1941867-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260702022054.3005463-1-reatmon@ti.com>
References: <20260702022054.3005463-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016159:EE_|IA0PR10MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ff730c8-ae22-4da1-729c-08ded7e56fbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	hioRJR9M4B+PttYm7f4aBPkOPGIyKSgdP9SrkV8J4mvRPkVmsN0Rnpg2Y91wPPruSCyvCkw2KsORCEVegIXvOBwZp98yCwQnycwjquBn6uKd9uZm1wAQMU8bka1RmG4dCGQdHiA7xPtyTaJbZJubJZdQ+Y2OZszwMH/H3O5DcYAkESVvFhKeOSvD01wukb4LdoJd8QSKLFndQKHtmg56g8BFARGLCu0NC3y/uFZ7oDZbHogtjLrxmuktuYu6ZQpux6TEGVjNPEbT0gqWJ1GhwsiydU9R1/3wowAp30rwCeK8HEyMe/BhwX9+0OBM8hgG9aSyLvIeYnqwPFTZV29j7N1CfQCPp4d/4dnZvB8Q4BsR3EFu0JIixG1p7ZOZCdIrWTeILl1H+I91+bicRKIkDA7RML2ZuVK/XfRq9qCtKEYa6wgGmi2J1/AgJtwK10nPVJGAW1nWAN5+XH6s1T2R/Dd6A70zjT0vT1bZMOWsbmV2SUvhST+VIoMu0aun+/+77gMyesOo4sjCZ09NRfhG9m8EzeQduXudXNj3Nr9nD8CCghZfoAakVmkdSRkepzhhKm6dewIcCpCkoYzJIEHJCfEQQL50Q9Z9wQNTaEY3QzMFiN7OvfLrz3TK0OeDjANTUtq4qjHHsvhf1ca5tNPVsQV2JHkwSIJSMT5FoDxGOC/FK/3BXFVTS1AX5bttzouR1ojI/+gUUB//DOV3KFyO0Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8l1jeaI4Dx5kqZ/oFMrYtNXw+vVOzr+h2GAhSs4vIWJjGqQQmVrw1tDcnO5xzH4DFx/7MIxfJU+ZTIqCO1krrfzLk/eTGF9/jh5KyijjYlqLtDLqOK2fLtuWj9tIj9kCqqoaFAuK0rH0bkwmliqdR69aPKbzofR2xtsW47WsqsU88v6ZGMddbsqkYBypiuMGHqXxHqpqyE3452MKs5qh1GGST/RiPUtMyAsXbQIy1+GN4eztfpf4LQJmC28uGiRLCgwjpvA+rBjT3VycLTNxVkJG3TZwlhqrHMMILsmYBFdLEU2cU0IHj29sMUimZnhOEAJM44nbSYFK5kshEtZcFqXRCVI8LXRvMwjPwa87ok6f/l3Dl2Qg4w9VjK84zND+tN+dvxBeNTezH3t/bG6xsh4idgPAbFo3h9RxJX1OSK7WMmFhA16B9al+Bjp9GJYh
X-Exchange-RoutingPolicyChecked: 
	I6S4ekMlaRMpmHqRI849ju9aF9oToaggasbbXBzS3WhgJaPHqkVyx5DPtYnF7j9wXePTlPPu2d2vewtGOlYJcP2NAIMsvqcJFx6gVcQaaWjbBBQos9uLMBSoOXfESDa27X9W+gc1AH41p1bcFNQRHi5dpFrYiM0ngBUB84qsW/GthlEfu28VMyp+W78CC0Bj9Ut9Rb8NYh2I5qH28t96tOOq3urPM+l1/4KcNddkbR2744cYpHB8dCmYVWJwFiARCXlhavU5kTJksrxSCmKrv6ve8zzWUeXg/BvJVBkQVdp7sciBedJmFweXOdLTjB/x22PMoLuUrTpC4k5IM5Lzfw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 02:55:55.3927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff730c8-ae22-4da1-729c-08ded7e56fbb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF00016159.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6699
X-Proofpoint-GUID: IEyM5LnQxVobh0Ho2YJFF6dj-QHu2Nfb
X-Proofpoint-ORIG-GUID: IEyM5LnQxVobh0Ho2YJFF6dj-QHu2Nfb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDAyNiBTYWx0ZWRfX9SkO7uHgSZpo
 IvJ+yFaPAnB5dw2L4hh1U+EumCAPNAhJwf0Yy+8BQxa1Bol06bocAmaqjD+ZndhORtWDNo9GTVS
 sJolfHCfmLx2hMd9Qz7qCxVMZ7gYICs=
X-Authority-Analysis: v=2.4 cv=cfPiaHDM c=1 sm=1 tr=0 ts=6a45d347 cx=c_pps
 a=8AG4s+rqopmfoFde1j+oJg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=nVUdPDZVTJYD3czVfykA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDAyNiBTYWx0ZWRfX68/FKUZTKBSU
 GRk4ljOUeeJC4se4JvNqrwUNxJRLsAYqwNy/YgLLvG1mIYEAseNE23Ah4GvzNVsnDqYQQsEA4p0
 nJ/6Y+wL8tFDsJS5j7lomnHBjdp2+ryWeNSfEG7Puu/b7UcAFxB7HaHhGd99iSgacSh+YjpIN5/
 9XRSGNPXdgIYL9K0ziHLIz8ryUK3i+7+4tBlQsRp3NVOeZwHW1A9ntRIeHi4JsHPXsjquPJaY3A
 hhKIEAbq8/3WSQK/mN78CgJxTHT9YrUkCFQ/2ugEZeMZJC5Tt04Hef1rcNKo/4cp5dkr+YfZGKo
 eYl4S7becFA/gTPq/l9zS7MDBff7JYe1I4Mj23Jw5MBW0APCIsTq53udrotcUvAxzBJ4We9XDHr
 zok1euTU16nTa74wUVckMf0pd3u6YQzgEttJGvJu4W7XvEwPn66mHbHKS34KlAKL/0Ubly6bxEE
 Gl9eAPju3ChHz2JtJgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020026
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Jul 2026 02:56:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20121

meta-ti / na / 20260702022054.3005463-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] check_yocto_rules: Add rule for new linux-firmware
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 1 Jul 2026 21:20:54 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d3713ddffbaece51a2ce626ac99da4ed21ccdbb1

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: check_yocto_rules: Add rule for new linux-firmware
- Commit SHA: 5bef2ca940f82e5c328a060c8e539255922b2f76

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




