Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D95CDB471
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 20:38:59 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31163.1782247135135891179
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 13:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=XkPIf6UX;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=gA+30W+D;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65NJvGQg854632;
	Tue, 23 Jun 2026 15:38:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=NkzvgGYng0BbbaF3bwkX+C97FC0OHCDsulHmqEkMD
	IY=; b=XkPIf6UXNWHmR+RvkTJzDq62N85femuTC44LnCBDzSqAuqJ1yaV7HjunH
	eIhGggm9oja50wYpZoBjvikIN2oYSloA17vMaGdvMuxfvc2Rl1U/AJoi8JB8P4Vj
	S9ggPjdcU7vuAiTJwjr9g7l4yYxTS5hBXJkmuX7kMJsMa4vCRfwoT8pR0rdfrTHN
	c4ttpsjhKF5hg0Vx8C6JJS97jQEi9piQFlnubCIMkUbKRY9WxYl7ZlGwkl6W1ksw
	qwsLv9sm2se5WPyhpzz8T1+UcK3/MOrhPR6L4UdBTYvxVr5pX+WdZx2WD562ybJE
	OXoW0tMi2WbCL7Z6ljZD9zsHDx7Ww==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010046.outbound.protection.outlook.com [52.101.201.46])
	by m0384305.ppops.net (PPS) with ESMTPS id 4eypttcbs4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 15:38:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTfJY2DoZHGuQZ29F5+sDHHW4d5+KrwVY8GeKkf4jKLjGARV8Qv06N9zoXV3ur/8GTP+j7FAt5kUpxyTvxeVp4HN804dWDTGxi+nChrCFAf6D//ANQ8x0Xs55E6oFy3Rv6kzfCCbng7STopheFK5dL9e6Zb3+aUskzANnF4UddpDIdsJq1zje2h+V7tRaT0/QzwTN9aatTTzNmiP1LzakWEBD01ZIr0FVWUiwQLrzX5rzIz6HsZhSQpPccJ4tovqWsm7HFGmRMWTZiLYeI5NF1ivrFPCTer5v22JP2d4T1BJMqT3Aqg2GrXebfMSiJOOxUllhnRiBTlb6T+UOa8E6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NkzvgGYng0BbbaF3bwkX+C97FC0OHCDsulHmqEkMDIY=;
 b=m5Bg9A6xk+crTvDIGJXVTCvsgmziapFp+y+WyRayfLgZfP6NaZc9hLacw7SuWQnl769mLgzyOz46cNOd77ZGjlMb6di4joTesdyRCNBpeto7z4zJJeutSWxoHzh2z3P4XVqwLcPnD+g6GCjPJruUCy09FAobQKJu+0P7yB2hdPKATEeFXe5HAfuK4P4Ke/bZXGrbP8exyKI8XVSOfNXtkF4+ivY7lr7QLdyV0ZIWVAcUTp2aVw3T+w8WT+PXVygFM0uzGsT11jdvSe40DGvlZnANCNaJqiEjuXEUyIo8aIbCC9OxlYFgxlE7ur3Y59MMWYuAqbwRrK1mAXSxgWqsEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NkzvgGYng0BbbaF3bwkX+C97FC0OHCDsulHmqEkMDIY=;
 b=gA+30W+D3JKuxVNtzXX1wVjOOQdNj3TaJCXZEABONFURR23oflZmmSpVn5a/bXXknaqzv0EVFgffEx+mmnK2nsbfsbXBGHaUi89lD6g7Njz6rBr214GmcUrDySx5fJQiL7Bcvua1oyteqXpI2zi4HqmWFGokcq1oRqLqdQ1WwgCyJ/EIa9kPdWuS18ehArMuN2qUAIbGHp/6+VB6bZGmIAlT8WTlZXdMEesROGRMH69IDZsvQYGnGPD6Vd5sF+sIlN850wLBOl0DlSz6KtgIXRaCLoWv48CNEFPTyzNe/SyfPNrwcKhC7GS7f7i+G7fMqrmgSoNFdy7WP+y7oxjmRw==
Received: from BN0PR02CA0027.namprd02.prod.outlook.com (2603:10b6:408:e4::32)
 by DS0PR10MB7020.namprd10.prod.outlook.com (2603:10b6:8:14b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Tue, 23 Jun
 2026 20:38:48 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:e4:cafe::76) by BN0PR02CA0027.outlook.office365.com
 (2603:10b6:408:e4::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Tue,
 23 Jun 2026 20:38:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 20:38:47 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 23 Jun
 2026 15:38:42 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 23 Jun
 2026 15:38:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 23 Jun 2026 15:38:42 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65NKcgm33058173;
	Tue, 23 Jun 2026 15:38:42 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 616AE9ACF4; Tue, 23 Jun 2026 15:38:42 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH v4 0/2] mesa-pvr v24 -> v25
Date: Tue, 23 Jun 2026 15:38:42 -0500
Message-ID: <20260623203842.1623921-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260623201347.1152792-1-a-christidis@ti.com>
References: <20260623201347.1152792-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|DS0PR10MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: c72f1a54-1427-46e0-7130-08ded1676ce8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	0ucWbFNCWWIlbthPC/QUgbWTMRHJAwuA3YPCWgxTR3br+bd2PNEbIX4g7324gYPGKZUpnbbMSH8iaLO8aogQ0Idq1TMvhjjTGWyb6U/N4iKqUR2yoUC92CY3MOeSfnUCodysWnpeBbXIzNgdvK5B8IchZ3dlPAdoAqJPo5E8lvRqeRgdaHbIK0ErvlUiNqTHVvDwfbYz1nvcXHGpWlalZT0KlUqDnncfzr63NVfDq50rRFZgkVmbSIFTtHsGZe1Ifcv3UrVIz8a3qCQMhUNNSTbo+oVFWNTleLpaYFGYVAcrGaGARFXX2IdLpahKb3MVT+SOC3kt0oiioE3Nedo6EWoM+9WjNKvTdUJZhR/QGzdzLVvl+YFUG+SYnFeOqhZpzuEXJXkvaJWcvDinOEcHqZ+7bwCxrPz81csR2h6QY/j/mjlniTSmPUuOOlIRKUGKUgHTo8wvQnyjTY3ltTSDjWOkwpSSaYmIitAfmBnR40MQVabn66CGzUyMJWgwXmBKi4ffULc5fNdyy5tEKXHOZOTrmDBCrVnPy+TIK/Fje+MoD76NGLJDCb60Ct/pZE7gD5CkkVYTY+U2yFrA0jL9FQM4gh+euwUyU2KobvJcn+JWa2C/rSQzI8SWO4ohhLiJDapD3Y2eUlIg3jbni7HOBrCxApHC92gntsHu5RDcmfCiZsKxS9CaIheRwcPbpW95xbl9WB7NJJ3JWFYr/gtVpg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rAAmx2NRvX6zmTzqPXCwPeJ5DUvtN77CTzN2QijfKlH8wwe8HuJT0bRGQAf5AhAZxVR1POVBSLQc4GNjJ9AvMRH+AZEuUQFQXk1eWcwZtMnx0GD9oBqr1/Y/P6JW/u8mZh/EEnBIRXwAG1CIbCafx3pd7l67LH4qRWvX0iXm6Atj3jXgnCqQLcaJ+w/qhw+5TSapieMv04YJcEs9y0YqgYxyHZivGQ+2oEq6tLpMXqQQ1/avVWjOefIpOjlOrhZ9IsWuVc0w6tZEUlq8GzRfJ1sJ99aRWOuMcHAw+Bi0QZFpFlNzZroad7LBnSkIiDTql0nt6GG7vJzIBqlYGYyOn1x75G8CApzDNayl+i91yZH/FUtipfBCV7nTWRSTNH3nsLBo3mKXjOnwuTYozMsqR3ofp8ASU09WR/I01cCGRS2XfuB1P68fDWp74fz6A+Ow
X-Exchange-RoutingPolicyChecked: 
	S7fTLIwl2GxF6GasPtm8PXA/hQgJdLI4VCYU38Gprxf5PJeRlvSRiUo+yBYesW/M8iQpBw7kANW/+b1kAxlddZjAWDoGFkfkYWguxG8KkpOpl6YBY2K7Bd5ZwUm/+YYWWAG+0RMyi+hd/OUS5KLMwtdJYlZVS/yPrmpWUIMakefinWlsfAVIdwqxFJq6QWAx5DxyMuz+T+yKXE5lTa5CPTV/ybVolkj1koT5Pf+l+YIGkMZkZr2ZyUVhwAJBhMW5/ewImOVVaCkOWAoVTa7+gb2Buh6lArQaZoEeD3EVo2ah84wMjSNdNt7nCNL9NzEU1dyTtUbTbFm4ziCQJtnWcQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 20:38:47.0983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c72f1a54-1427-46e0-7130-08ded1676ce8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7020
X-Proofpoint-GUID: Xnf_jnxttmeqEiYWdLd5ugGTjhe0Onw9
X-Proofpoint-ORIG-GUID: Xnf_jnxttmeqEiYWdLd5ugGTjhe0Onw9
X-Authority-Analysis: v=2.4 cv=EPo2FVZC c=1 sm=1 tr=0 ts=6a3aeedd cx=c_pps
 a=Sm015RFco05wDkMfClhrzg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=eDvC7UuUFdV01mRjvF4A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE3MCBTYWx0ZWRfX6b+vvU+k4RQ0
 aVsGOHXC8AJuaeZ8kKdJnjzRV+vbRKn9HIS15PWia5NY8Y381XeS2ZG++QdD2pD6M1etx8fzn81
 YBDo9R5YK/Ye3KEJFxSzaoaui3ZAnkM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE3MCBTYWx0ZWRfX65aFVmXsAMPl
 WGtq24McGULUB6DS+pIC6DoiSCRQ7molsq+cp4nnj8fRhD+rj2pUPI2KP1GqeqiXoKDFQ1R1cA2
 +x1377oExZFmQoGS5mucCX3OjI4v5dybuLI1DrE5rvvAFNwBDdHQmdIP2+/E4WDguEJQW+20kry
 NtUgRaDYc9A6FoIXjXVmR0VTLha86xgojfppGqqTyomS4zSG76Gtr3zMdKLjWdeuzqDSZoe0S/K
 KyvcZ5+LmNtKfea+LqRcn39m3XWu7/9bEdz91qdMg9bsbBRxvyJhasavJmxd9i9u5jTDrSsc1B5
 JCIG0pYFkeMSGBicgHaYMxtuAqA4UtRNTb1k8et1Q50K2p2qEGI83JjfgR+kypn3o8vr1Gqx5i0
 JhHnSZDcDtDAEgee+/aJ0G1XlnsUXaIVvBuVyPotdGn3lYifPH1En8trDFCuddnG+eiH2ya8bA5
 VWhpra8SHg6Dnb3NhiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_04,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230170
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 23 Jun 2026 20:38:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20065

meta-ti / na / 20260623201347.1152792-1-a-christidis

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
- Patch Series: [meta-ti][master/wrynose][PATCH v4 0/2] mesa-pvr v24 -> v25
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Tue, 23 Jun 2026 15:13:45 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: cedf1a8a9c5802a787c36193f3105966edf4522f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202606231334
- Commit SHA: 4eeae3cb3134c3779a6f44282e61ce273ba2974b

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH v4 0/2] mesa-pvr v24 -> v25
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Tue, 23 Jun 2026 15:13:45 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: cedf1a8a9c5802a787c36193f3105966edf4522f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Suhaas Joshi <s-joshi@ti.com>
- Commit Subject: tfa: Update TF-A for K3 devices to 2.15 tag
- Commit SHA: 88ce8160ec6c5804820555e0bc29dba23059a4a1

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




