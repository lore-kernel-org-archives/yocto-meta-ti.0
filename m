Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277CBC5DF7D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 20:10:51 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17740.1787083841365147490
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Aug 2026 13:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Db0aymPi;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=TkYTauBJ;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IJUm0X487799;
	Tue, 18 Aug 2026 15:10:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=VcP5FprB4lnvA3qhu9hzB/wLM/lQ7OA7mb7hFQROV
	Ew=; b=Db0aymPiqYQ8+ii/1VgMLJtU3j6bEUWV2lSHf3gGcu43dHkjrZAtPj+jc
	hnVUGj4sGILwnbeDkn422XnJZ9j5Pab0G2LCqNQ1wyTU5Rqsxv7XHf6x0PhpwgxY
	4+XmTNiIQJFaOEoowhqkzarrc8ncgxmcHxfJcejPh5p5xIEfTO4Ou/YsBm3qDLPR
	xDpS+uPDTKudvfmP9/YeTUqROrA4cmH/5qA3VwG5yV/PxR98eETh+aGhf9D/2YtU
	xz67N66eVCJvcSM27+Prf1pL7rIfpq/c1NZXn1GVu2PfXZVvdtzVkwzWrqa2UgdQ
	y6gZYg2vKe/AvOjaBo0ga2nxynKtg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012049.outbound.protection.outlook.com [40.93.195.49])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g4k73v50v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 15:10:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7j39AHpSCoTdTTNJiXYXYaXVL9icNI0MAvZ8UZnuFImtYL9HogSyJVxIX0FNBb+vpCKxfc9y4bx0OpXHIis/eqzFd9IudKT5y6iOiwqJ73lrdBd6Fd/JtZgmiu8RFMrMzGK/bAnccAenvl6JsshxC59E86YwrfjsRbXFfq/7gIxwLRUSKTceLpkk4LqlgZDBSwSBH+KHHryOZhHpA63Qmxq3mvCnV/olU1Y04ujAmoASAo3c44EcueYmALRmcpkiqCTJH3gcVJ1XDtBPuzbEhj/bzbrFSTD3/e4bJ0MDE4r+9j7txNQAXIrp0Q3YdZQ2yPrBvreJx9x+6LXV6RYqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcP5FprB4lnvA3qhu9hzB/wLM/lQ7OA7mb7hFQROVEw=;
 b=blzHlCEWrcUa9K+yCf6wXolck63WXX0VQySq8Cg6SirO+MO3vgrPo8wqBrcoTzWSpy/ydcvPg3Hs2K1KPK9ZJ9DYc87CdV6ncZn9Zb+RH9iL11BrWOj25jJ8ilPZtydQKfTOg2eDZRfS2G60LVZk+6XpQaCoKoSFsk7ybx1RJYcSqcpuV/NYDy5+1k4INzbs+vT9oYnOrg5sz5t1TjejBfpnNZfMjhKP6HgAPwcUPsHV0EATNL4qiRWlUu+LflDZnDN5pZ0RKu8oqd38yd5ih1r77UwJlczishUOQOTEG1sVAQyMxCJaBlARa5gQSnPH2NmTvi7ZObsEDK89PEt9WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcP5FprB4lnvA3qhu9hzB/wLM/lQ7OA7mb7hFQROVEw=;
 b=TkYTauBJ9/s/W2328IiKRkUfIdMI2CV3uI/NqFulwGHbIyTZCvuBew97AVRyUuZyzUN84nTEB3TrxRa6i+I8mY+Z0xAvCHisoYBJFI59OQZbIi8R9Siny7S4B/vJEgO00fZl3c5QQk9gf6I/nNPjeoRvikUvPK5H3ir7Vi9BFd9+kj9UmHX/sZ/hF16z598/MLZ+uOBqSWIYt2TrLw7j5jinmwbwNgYEuuFdKRF0B801fHdUmwBssptjOGIhb8ydzsGikQ6IMzu+e0S6t51JqVfQ/hRZ+fj3hKhDE+GD03vZOzcBp/Pjw6wjhU70X3u7FtSGZUWemFehMWmLdmOcjQ==
Received: from SN7P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::11)
 by BLAPR10MB5154.namprd10.prod.outlook.com (2603:10b6:208:328::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 20:10:37 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:806:123:cafe::46) by SN7P220CA0006.outlook.office365.com
 (2603:10b6:806:123::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 20:10:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 20:10:37 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 15:10:37 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 15:10:36 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 18 Aug 2026 15:10:36 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67IKAaWF1967286;
	Tue, 18 Aug 2026 15:10:36 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D2F1A9ACF4; Tue, 18 Aug 2026 15:10:36 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] u-boot: fix pylibfdt build with swig 4.5.0
Date: Tue, 18 Aug 2026 15:10:36 -0500
Message-ID: <20260818201036.4020507-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260818200537.3961166-1-reatmon@ti.com>
References: <20260818200537.3961166-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|BLAPR10MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c9ca0d6-374a-47cc-d720-08defd64c4dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	9rs762NOO3U2jNlIcKTMZPeZvsADUcXOnXoPZX1xwCz4hdejjD9EsO2OXUDwXWWcR4uES76508S4jgUFW2a9YjSTIOgccVxELNP6x8FRAqghpIZRp2u2KIGuKzgXuS27fFsfvFXM6Jq5v1R67hS0rkt03q9vlh4xbsFA3FQFQ6doWQiuur9jv7iPWgZVaFciZFWSSPQI9SfDyliVCx4RcwxolhaolY++4/ktIetudqvPTERAAagK8MzQS2yAdPvJfia2byTtzJU0FZfijj0McBc/rx2tV5UylZ3F43f4lfe+I9t8V/RNVLYIvSWXoHaMWU7H4x/Xo6iJMAVifVPvlVTfgxS0GQaq++3FWsDMWR4wcs8nV6nZXOEsedAg1BTEV4aoFcsck6fx2jUBONCUIusGECTvgtgLj0xN4SRIWfhnN6eRElclAr+yF3d7jMP8EOZ6m0r58hhu9dB5Qp8vlw7zdcaoTlYs7ZmbQHQ+Q5zF6ihCb9bcM1u/EGU+w9y3JrmLHhktVDoaZQD5RIzjDqe6+yx5FKBEueQuheFrfRmTW7/lG61mzGZAZOVFGS057W1aBo72VuZxB2ttP3uvicZnyRQ3CiX9sObGBK13njqjyUZ/87J+Wr/eoA37JeyC3cSBSMKHM9QsUkpJ2CE2bVmIukSCyLkYpHoJnps+JiWI0GSXJW7iZLP/TOmTEn9cfPTbuWdRDnOGDZlzWGmp6Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	OjoBYO1lMp2j+pDAZNub8ySD6rK1zTtWhi/CeJPhePH+7clKjLZS1mKZ7Y0nDp2T3s3FfBDKbJZy0SCC5cIInLg2iRJGbjNaU2LQF6fhFMCfsylTYOZtSoWcFX6E4kcvXzcYbXuxyzhpXVQXs0yLNxm+vrOMNK04h88OHG8qQQ/ZGmJBKkc3R9nKvaVP/T/D3SjoKG/VfNY+d+7ee6D5auE9/UMVL+in/M+siXCjV+CCNhoZx0JVuxUPrWWVK5FhI+mvyBKjF6xSEzrNAomAQiuIRcSPXerXPJn1gBe8mXmWCkYsBLpqDg6ed3am/9nDzyEGWO5Kyz1jjfMQbhGrLgzyg2ldkoG31lGb6c6eN2S12v6vmu70kjHvsh8AR6rK/xBaqg3nfsRuK0WP0R4jL7BjWD+8hDFIVZ5ktB7im9LZgHvc5KdLw1y1XY9A3CC3
X-Exchange-RoutingPolicyChecked: 
	K/jxJIAPl1Pu4tQ1gzL175FUZOZeo8KItwizn3huxRdZsCU2Ole5Qxz0sEyJdg+IQ8P8/DX/GKfnKIeBm78zj4RPx35Wdz4JjY8magtcIOj2Dmklzn8z4M7WAzR3eMiSRm4kOtccbt2iNjXKigJCKU3Su3kT2ZfmTeU1tS35SmJCMSGTjVi8crye4KY+V4XuEpDYlfzDgxxAkFDjB6PAAZbX/pRSKbINtP2D7+pE/IdbgYm87rGAsao91ZB8Z8yrYh2kA6zLz0/xuskp+zznPLvrNZ5x9pulIOiUydSL1z0tZQ2dyVoDc4/1zSYYDpWEPBXXtZi395sfndGLzCxajw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 20:10:37.3845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9ca0d6-374a-47cc-d720-08defd64c4dc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5154
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDE0OCBTYWx0ZWRfX+uc+PKVfHqiM
 VzeCGEp+Tyg67CgvXgu2zhDT816RneU6cwYEKGSVcQfXJ5nd+y3QMrvq/HfF7ON/oepOCyHpjyn
 XUhXITxgfsY5rEWjNl7VEF4+7twSVzA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDE0OCBTYWx0ZWRfX5/yvV4cO1voJ
 OAs8VZACVWQwpr+h0b1FXOYyzhB+D+xpkHeD0e8f5pfoPL+NQC383ihhkpPfcG9gXJEvKns+cu6
 eJNLZ9ynRxZw4kg82NQv4viyvvii4APWkSx3fnLEGpJ4+6bcxpbhOGindUU9ezXbv9do5Xkmy01
 usBrweciXNBUEqFEZWgC+u16LWjZwncW3mUJoEBFP7CoEfL3B1LvDiKAyUQBAVWbHEzryLK+qDC
 bxhTtbHtNaRX6teM/bGqQetdgP1fya5spLWfdgRB2dVWC4yyV3hXBVKr87skGq9rccRwHWcPtHd
 qiAXo3S3+5CIpdyZns2nP6QxESLr00miDrz3tiQdBc4WVT0rR90e5RZ4r+Vo5xr3FLKG/QvQIqc
 NHJhtCYC1pUv2AhBM6ZA1EMV3IbBx1LfhSTkNs1fNE4nRYJGBL52aqBDOElQE88LBu/IxoXMuja
 qUteE37elzRCdKCwoQw==
X-Proofpoint-GUID: d4JKBRvbIqx2zUZgbIdwe4uykZIF2886
X-Authority-Analysis: v=2.4 cv=CZI4Irrl c=1 sm=1 tr=0 ts=6a84bc3f cx=c_pps
 a=nvwb1BjkeYK3HDx+lqLWkw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=xE1FiokqEDOv69rCTxIA:9
X-Proofpoint-ORIG-GUID: d4JKBRvbIqx2zUZgbIdwe4uykZIF2886
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_04,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180148
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Aug 2026 20:10:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20276

meta-ti / na / 20260818200537.3961166-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH] u-boot: fix pylibfdt build with swig 4.5.0
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
- Date: Date: Tue, 18 Aug 2026 15:05:37 -0500
+Date: Tue, 11 Aug 2026 13:21:01 +0000
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 137c44d8b5dc03638c36d68d7bfbb8566ef99e6a

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202608122200
- Commit SHA: 9b61f80281b2f3d1c48be8086c9cea6e1c93c083

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH] u-boot: fix pylibfdt build with swig 4.5.0
    .git/rebase-apply/patch:68: space before tab in indent.
     	PyObject *buff;
    .git/rebase-apply/patch:69: trailing whitespace.
     
    .git/rebase-apply/patch:70: space before tab in indent.
     	if ($1) {
    .git/rebase-apply/patch:73: space before tab in indent.
     			fdt_string(fdt1, fdt32_to_cpu($1->nameoff)));
    .git/rebase-apply/patch:74: space before tab in indent.
     		buff = PyByteArray_FromStringAndSize(
    error: patch failed: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc:25
    error: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc: patch does not apply
    Applying: u-boot: fix pylibfdt build with swig 4.5.0
    Patch failed at 0001 u-boot: fix pylibfdt build with swig 4.5.0




