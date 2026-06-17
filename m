Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E92CD98E4
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 10:57:37 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12627.1781693846643907973
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Jun 2026 03:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=p75ksuTP;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=IgBnfaNz;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8ZAlB1511701
	for <meta-ti@lists.yoctoproject.org>; Wed, 17 Jun 2026 05:57:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=87zlYCqnpkuPu8kiOvG28wWSWx0GMVWmLpWFmRBuA
	uA=; b=p75ksuTPKBHMm4f+zYhZgHmjHsZVsEu6HloEvZ7MCfGkby2O3+3+GXmaU
	0jpt9H4Rselc6UNh0n1atIMBzg7QDlhF3wTR1U2RaE6gtOz2zJoly08POIT6OFQS
	Cxp/U/B64hO0yf0AhlybCf/Sg4tOJC5G/pPoMr/zIK93Yor21RONSyiCC9gZYiMh
	CX8hCxK5PST0r9nIC8ZMrX6qYNYy0duxROvBhdqgIswA6ZoJ6JxAr3ysK+PhWHun
	3YjaxBC+Dwe5duPzbvLkKZwWH1IOZEo22Gx2OQOvCk6pP8jqQZNjkUbA2k5TTjco
	bZr58JUp9/BzdXTH8OPj1euGBlWMw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011058.outbound.protection.outlook.com [52.101.57.58])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4eueeuc20q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Wed, 17 Jun 2026 05:57:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9dNhdqg+qKrQthAV/VUHx+rqIGBHDuaXQ81RSLvpqI2qk+be6HhoI9ROpqblBQHPATXmrEdyBbuuNoncurMcvLeDz5HxGBJYIZItY6D2cpDLas4RAw9xZsIwZ+BudFPtxjmXPtyAYpteGWFnxV8AIErVb2qK2ZBDwRnWHC69LoFi3PHTSHEzz947LYTdds9dSIWq0tR7TWDl/o+/8NSivNqMTvCo+ylTOYoGxsKPJDu/2c/3tQodrSJn9I0wphsNQ+oJ4WHnp76wVewxVJanQMFoj/TREctvz9eyaTcHSL7U26poAT6DUOiAX6puBheEJkvlGF4aKFUoeVf5RQhHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87zlYCqnpkuPu8kiOvG28wWSWx0GMVWmLpWFmRBuAuA=;
 b=lppzeQ7k/OHv6dI46GrUfMopYrbnZF4j1z+HPOQmGGygaMo/3cvjzsKO9hA/27g56ukglQCEuns/SnZZRkyyzc8MAyeOdAF6d1NyuHKoaMGE9QY5mDhvgeIWmd2rHfQObpiOPJgFWPSOUYOkdZf9mZ0XR7T06nFHsqBYuv96zb27gotI+0NNT5ypynx+d4ulsJxyFcNdsrpdpFpGyJ7SHuSJmSvow9WGtZovDBE9Qfvyjn3gfnzDjdTr1wzBrfUHtizCXxE5iOajuKfG374BL1N0nHwQ4o1K9Ij+/tAtiGW4c4vlW3XlyxR3Z6taFL+fyluNoVL3hESfCwtL4SiVwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87zlYCqnpkuPu8kiOvG28wWSWx0GMVWmLpWFmRBuAuA=;
 b=IgBnfaNzNMj23EDuxCj+ctJtBl3yxDcm7+PPU0eF2R02j7LbTV4WTzAx8yTru//iLEkcqdUEqY7jxeG3rA+KtZjjtSeKj7Jw0jg/8BbMTkQUpeii+7N3Eo/GVQxM5OpLNdusODTP43byNjczEImnoYXBmaxM5/T8GtCygSOgWMUYbnEHS6ojZWFefRt1//vP5X1x1dmHdP1GgQivU0iB8WpzUXeA2Bc6nFM01sG3uu2EMnaTpuWV/B8JkQ3Mrbc3boHjrTeRGo6cJOP6YGcG/MQJKvMsavIhcaOeWZkl2nR1ujeTxDWJ3lLoG1i0jMq3bSmRKwl5ZNg5cEzJzL0qCw==
Received: from PH8PR22CA0009.namprd22.prod.outlook.com (2603:10b6:510:2d1::25)
 by IA4PR10MB8568.namprd10.prod.outlook.com (2603:10b6:208:565::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 10:57:22 +0000
Received: from MW1PEPF0001615B.namprd21.prod.outlook.com
 (2603:10b6:510:2d1:cafe::ae) by PH8PR22CA0009.outlook.office365.com
 (2603:10b6:510:2d1::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 10:57:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MW1PEPF0001615B.mail.protection.outlook.com (10.167.249.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.0 via Frontend Transport; Wed, 17 Jun 2026 10:57:20 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 17 Jun
 2026 05:57:20 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 17 Jun
 2026 05:57:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 17 Jun 2026 05:57:20 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65HAvKms1569675;
	Wed, 17 Jun 2026 05:57:20 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DBE8A9ACF4; Wed, 17 Jun 2026 05:57:19 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Yogesh Hegde <y-hegde@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <praneeth@ti.com>,
        <prudhvi@ti.com>
Subject: Re: [master/wrynose][PATCH v2] beaglebadge-ti: avoid building ubifs and ubi for beaglebadge by default
Date: Wed, 17 Jun 2026 05:57:19 -0500
Message-ID: <20260617105719.2183275-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260617103020.613051-1-y-hegde@ti.com>
References: <20260617103020.613051-1-y-hegde@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615B:EE_|IA4PR10MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: f77f0ea6-d8c9-4dfd-ee13-08decc5f34a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	ixeXDhVZsz+PU51lufDSi05iAKECrjHEVyqOl+Dk66HrRMwkoENuqirTY3l0IHP+hJA8+4y7sOfUny0DNOzxfDnSjpXRvYRgZDTHAQXt9XpJEA4Hqx793kaUi5p36PNkfWS1BqZ1Bs6JbudzKCykbnUT2u9g3FFzw4kQTFunFWBk4JvWFo2XJB99yNe1UnCh9cmmbgsvIEWwf4iFXm43n2tAe4xDM4xKDSwcxd/9tniPZIj5sEsPISnZ2NI/HtfvUUz4FtmIR311QYsfei0y6vBOHy01K/LY/ET1NKcPWduJDYXXYd+h/SW5tZG502qcurfad1apOrPG1/xejOXppkd8ENJCVvEvP+iqM8kOtgNdqm3rINGfenigm5gd2mQytXTrSERvxlP5WXTamW4Lfc2zpH38WUFkSgTizojW6mvgrruSpI8ytw8vEDQULQ5BklPzTg+HlrBv9OhHlsuI3dxpT23kDF3I80yArLSYZH/KuHWnYptROfEfxS/sIKqWwiiYPyLGqs27oFiHLI7omE7bqVZOs4HWwMHqgl8Rkucbs9WRqewqGReFz/YxkbroXRq8Fk3wGuHzu/fpTxuFuYwEh81sV362QRjmfK1+22s50tz1B2OmNkFiWcJLKD2JEnJpw0lP8lAw7bczrdo/ljAd/b/XYs+lPfbWKroue5Zrnnpmxw/vNy7O0yF9LS9nO5W1iLQRZUfBVlSoLhSmQd1Okb6TVSeTPYrb54espDw=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	3CE1GMtWtBHeau1ZlFsGNy/vf04mgMWlMBAUcrCc+O/91hS00Pbfag47yRmbTydDPhy9llQpUvwFbEg1kJztZCjMH6AEayoYCuPOq/YVoDS5zemyMKitdAwDvMO5QAFbvl8lSvOLbs0cigR4Zzl5d16wh/+MkUe1NYw5CU7Q3F7X52tEQUqPBRH6Yn7VCCNbpv7s4gqFKa4F0YZzSojbjGFotjebPcInCjxsFFEQmZU1I06ChRyYub2ZC80dg0gD/ELBfTTnUboOgNhdu4I3oIx278TrGZDJoOdbeHDvZSBBXMKyyKurU/9f0rk/Hk/dmaUOuT4rnJkCIUsr2Hjl0eaxxN1T9qHZ+sG/m5CRts4odng5WLRojc+j9HTabi6ED45rDMA3c9hyIxDNZJMj1dg069wiWvcx/9cMjrzFPpnOcw4xZHwwXNKEw+Cd5DVL
X-Exchange-RoutingPolicyChecked: 
	c4yNFgyBsP9Zzayypu0MEbhv7KAzx0Z4zlmS8tXlCI4uHkvynHDdzNM/qvM6e4yDFmwOz7vtd4kjyhwopHptHAbWz2A3fck4fqTgnNJMsIedK1pLjW1ZT6VW5NUa0oaZbuHY/vFqfWvCzq4qBaAfUGsiXyVwD/CXbm051dvupV+K5wKAUUENt4w9/jDwk6G9akEMZsWiKTzYQyKTWKSkXq+FhaZXrBbmF+YGD+7VKKi+Zd/hbfJr9HWaZ0tKM2sWtkYiaChy0h5GF3vbYeUz3qCOdAnBkGothCvK5cVSteS1sVCJvUNVurXPW6t8pLKgGMkTPzcTft6PkJ8GZhohuQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 10:57:20.9400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f77f0ea6-d8c9-4dfd-ee13-08decc5f34a9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF0001615B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8568
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwMyBTYWx0ZWRfXyaO8AyIvp7eq
 1erNFEst8UZeKkSz6Z19VWjQn6ULLDfxS93XOfrV43v1KaJngyCiIYhBYArQxKPgjj2yRQ+P+RS
 btr5kzSxcsS+Gt38SwHeA8rc2E5UJ+A=
X-Proofpoint-ORIG-GUID: 8iKSe8Bm3ncFhUfHnoCIMpaEcTrsIO-0
X-Proofpoint-GUID: 8iKSe8Bm3ncFhUfHnoCIMpaEcTrsIO-0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwMyBTYWx0ZWRfX1BaRbmGS6Q7C
 2d6YDi1Ie9GoqjLSZycsQN545uiNmFnYGng/Yu2BRPLyoDmnL1zb+EUBFtk4fi/kCcR3VVeVPGd
 dBrfj94nYYoG9o7UuElIEnxrw82cO00f9Vx3c5zzWN7SxsMCudSJyp4IlwmyN/P7Mmc9aohRRYX
 4VPMkQQqAyxHoIEo8CQCLkLwtJdL58snnwxCgKd0UvnkKLMLAzzyoWMICV7V5Cfv47jebebR3i/
 SAwpPF6SYsEVsB1alTtHj0vG59eszj/lfgEgJO7rM++dQFsqnBC3Cx7mYALK4exvEuoUx99ZlU3
 VnL6gwnOmpVBqd1n0NWh4b3DCyfbroKGP2TZWsl03fFQnWVDOYLdNpPkjg+A1gmEJLp7X4qv5yM
 XPl4PqwPZM2hjjhM75wUU01uCRARTJmiw1EHeipkeu/JL1Yz9s5jvccqQq6tSHSHtwagcZcIcjX
 fYbmasFPKettCP6yzmw==
X-Authority-Analysis: v=2.4 cv=KdvidwYD c=1 sm=1 tr=0 ts=6a327d95 cx=c_pps
 a=qNvklhu79FbMMzLDwJ4KEg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=jpmRZ_79C8KyZYMeFdAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170103
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Jun 2026 10:57:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20043

meta-ti / na / 20260617103020.613051-1-y-hegde

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
- Patch Series: [master/wrynose][PATCH v2] beaglebadge-ti: avoid building ubifs and ubi for beaglebadge by default
- Submitter: From: Yogesh Hegde <y-hegde@ti.com>
- Date: Date: Wed, 17 Jun 2026 16:00:22 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 39cb4172433e4d67aab3630d3199be2b3b31ccbf

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: d2d075cc819a43946149d76c3a087251bd105aca

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [master/wrynose][PATCH v2] beaglebadge-ti: avoid building ubifs and ubi for beaglebadge by default
- Submitter: From: Yogesh Hegde <y-hegde@ti.com>
- Date: Date: Wed, 17 Jun 2026 16:00:22 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 39cb4172433e4d67aab3630d3199be2b3b31ccbf

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Judith Mendez <jm@ti.com>
- Commit Subject: conf: am62dxx-evm: Fixup packaged overlay list
- Commit SHA: d6532526fe8f4d4a2dfa4fcdc85cc224f0a13fa2

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS

wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed

wrynose - PASS
=====================
All checks passed




