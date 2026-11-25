Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3900.1795648631067512707
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 15:17:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ibm1Xmhh;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=Fe2bc8xg;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJALUh1209775;
	Wed, 25 Nov 2026 17:17:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=i3R+E9NBJYFAgIcbc8BRjpK189ebxGAxQwpC9IKxH
	sw=; b=ibm1XmhhrRPmgFX1fwV0lV37allmVDglkgrSQHKeNqNfvc3/eW5U4rZQ+
	NrtVx035z0556dU+YSDXcdSpeDVMkGSA+eqoGq+j2INKN0J5mKpdZ9STzXnIOzNa
	9VLCiJjdNTFBMHBlcaAs7Qlb8FatFaOtq3y4jX28shbgczCaZedHCajqo1LMzqTX
	Y5V+Glf9KR4Gn3/zueqes0zlnKfbYoPr+4AWz+dCOgGsYhZcWdQiuixGGyEqduK1
	YGLMfWax6mevH4mt3fK6Ei78eo5zP5YmWTg5ku7Ey9xMJoxXX775IHXqdmWOJq4W
	Bp1i0OnnD+ZkLxjh5SbiAUHBIZUew==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011064.outbound.protection.outlook.com [52.101.57.64])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j5v36ve00-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 17:17:07 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBlq1qtLuFEeiBFM7Y9cBnoXiBlfxfZJRn5e8ph5XWPsWCcu+nW2Gdo6gWfirWsx9Jzq4A68Ja6INW6AImvziFFFwoTawmlfk7ehkMBkjfPipQRBVj/8a3k1jY1dtYM7ROXamdqJ7UFeCotq14wSEAnQU9rsNIkOV2TfjZNuubR/nVphZ+jGf8O1MnVBRpbIfzN2JS0GIKiQDfzuXP6h4DpT5ye/1iqvYNmFhCfmMAuqBffcSY8xq4BwnPvGygNynvG5OeSA2jWQzohEH+NyyRgX0nx4bro/pn5JNfUGKIZEA/oSksbx3Jm26GEiAJEdJgkfm97WQy84y/liKC17Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3R+E9NBJYFAgIcbc8BRjpK189ebxGAxQwpC9IKxHsw=;
 b=CQPa/MTzU7xgkEsqp+cLRdofbcHknwBa3REWVi+XheBdScZW3bWi+RPLWKa+ZxPSq/1jXi1q4qf+KssCv9k2eZD5tq36hMTsOru6oFqH3t3Zi6rDwHeOifSO1RVrKDjHb0T7bJfApS+gD39R72N4uRmvbOtdgg2raEADqfYem9rOl4tsb5YTEGUSTilLDvS4j3jvtRDnt5lF4OsefHRr12v68a8YNWdHK6+5QoU7BzaVJCS+2H1F28I36ybCmyn4jORlQwoN8hxfDGV/fFeza3kXYuE334tVAjAXJTlJljCcGH/MUOg7EVWgMvEKtbUeZGffnXDsLe+4MnTue/caXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3R+E9NBJYFAgIcbc8BRjpK189ebxGAxQwpC9IKxHsw=;
 b=Fe2bc8xgQ/ChQB+zAlug7clQoNxJCmKIzcREYOAzN+zQOjT7020lOLZxOl2/hnkAGPXQAwE0Oxgl6WWmnZ50sT7+skn5s5MlAn5928fF7TdJKMlxZqGugNAOrQOLMpLAfdvdZoKtbr+tlr0QLHbgViIQLZM8hoRVt+cd73ANTJXt19CLg9hDeGMKLLoY6fVCC2gFQRFQoOZvXTGtRltWaeJGI2XaWoy9O6HAAh4w1SndtcSTAZSqfyouJXgwZHOLy0E6bdJEAY62dibcciOUDlFE9ifXbFVsGvDTjMlV714MYEW9a1iq4UNbVuAIS0816QHxT52fmpfaElseY+osZA==
Received: from PH8P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::10)
 by LV0PR10MB713392.namprd10.prod.outlook.com (2603:10b6:408:607::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 23:17:05 +0000
Received: from PH2PEPF00048912.namprd05.prod.outlook.com
 (2603:10b6:510:345:cafe::41) by PH8P220CA0019.outlook.office365.com
 (2603:10b6:510:345::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 23:17:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 PH2PEPF00048912.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 23:17:03 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 25 Nov
 2026 17:16:24 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 25 Nov
 2026 17:16:23 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 25 Nov 2026 17:16:23 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6APNGNTk3669088;
	Wed, 25 Nov 2026 17:16:23 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 1AEFC2C86; Wed, 25 Nov 2026 17:16:23 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: <rs@ti.com>
CC: <denis@denix.org>, <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH] ti-sgx-ddk-um: upgrade display fd from render to card
Date: Wed, 25 Nov 2026 17:16:23 -0600
Message-ID: <20261125231623.1024068-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261125225407.916981-1-rs@ti.com>
References: <20261125225407.916981-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH2PEPF00048912:EE_|LV0PR10MB713392:EE_
X-MS-Office365-Filtering-Correlation-Id: b9723742-1732-445a-1ae0-08df4b4a375e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|10067099003|56012099006|260925022911599003|260925021311599003|260925021911599003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Vs4f/TyZ0bx53k2IvummeKc8yzy4uJneOVvRpdayzh79iF42MALL4QCBkABUFkKp4l+RfaT81BNbZTiw3Zbqfup1XapuLv/4dbxS9Fu2cipubuwgsfmUm+Db0/yHZVD6PEdHXrXbn8puWXze6N52YdNSImO/NzOAy4RBzx61641xYjE54H0eA2Yi3VUykPDEYJYXrAW5KzNxMIXbmPFqsYRkhXhvxLPfY6Qlk6xjQ46PdzyxbVdJvXjvFxDNsyuTZGIYt0DUMiMqgJEWvjJ1VlDFS1as1fvLNheZO9RmV3sZ/bi4Tn4hBjgBSj4n6UNbQs1GMaSPaYa+QxsMu26+xPYRjE3JGzolkNJqp200m3V36syHGqqQ1V90XPpjomuVsF+kj3LkEmN68BytM84E4RBaBZ7z8kvThusY2xaSbA0xd8MSVso4CsqKnpqt0CtvTmuhUL2aTywwnTOgss2CqEIqS/qlZKIvOh/hibkDlD0Mi/i0dBFX/VaXrPbQeNTAsZYHHMXhqWkBN8pV26tgQy44PUme1UXDtLn0AQz6pcvMa8TWEjIfiWxwcYf0aFqWqHR4bG9kIX5RdJN4nU/XX8oRnAJXrLaAfr0RjlzvCozk23OE8D8vhPaj1R4OXtLEe8/2MsPWAodUe5WzTSIFoOXe8vwDXY27HnyQxPSa70yVet2nvHunR8cepPAcjOqRxbc3fEknIlqgRNmY6cvfRQ==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(10067099003)(56012099006)(260925022911599003)(260925021311599003)(260925021911599003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yaAG8QwaMhvjPMNTtb34tTnJZJfJXRCgdmeAC+CsRjPZ6FdQ0j1dajlf7HXswK0qXOBSEo48OlUCcbgawokn4LqcCVzhWfhIdcRy2yQrFs7bFzhaS2j6DdTiZLgu2i3EiOdjQsHQJ9HuuiNjXLbHbY6UjIdDyrfucRCxi0z8Y9H35pFIfP8f70FvXAWWzh5t9OQvKplW4uXmgBTErP2HAJ6XwR82KYNlPCAv4IpAGdnTa4mo0FY2fwChTh7vqfeeZ44+PMwIdvLGkaF08MtbF85RYgi4avF83u4ADIS5llekk/zcCWvqOESMM08BJ++ylzlk8h+tdUNwp9Kf8R8xB3V6AYESM3ZSpH+oOXND3l8nDNTIod6FCAw9OtoXUluBz5RBLx4tLofRbR1p93o91h32F3YJo7wxdFx/LaumwaZNF+92rIdhISHti+RnUBwQ
X-Exchange-RoutingPolicyChecked: o05MfH2BswlgAsHM02E6nAqsLZXhw4j++llt0N5hgEANCVflfH7WgkbgdWfPKqbQOMYg0eIpIn5QbOy6IZ6UTW0J19GbVDEVHqhs/fNkdlvOU+Z+CsVo6ibPGulANoCbmvOE8nM6y4GWZJnn/ktECDFDmFwsYxSJzax4zS8Mj66lPOK3vqfiQM/9eICK842+LPdIQIrxNPUPigAtywc2vTlLP4HHjbcyDz3f3C6a+Nm7OHvjecRx3UnOmxBR2Gc180cMkVvxVVORQhaF0H3cGgqCsXUpMlin6Yl/PmNgsk2EW7qcLi38Z0MfjegHs1u9v0qw4LcPCPuZdztxYrGsOQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 23:17:03.7413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9723742-1732-445a-1ae0-08df4b4a375e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: PH2PEPF00048912.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB713392
X-Authority-Analysis: v=2.4 cv=aPllOr9m c=1 sm=1 tr=0 ts=6b076c73 cx=c_pps
 a=pvXDubuVmAGz8fO+OL2vfg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=VkkHSWmPFM6PHLY5UBcA:9
X-Proofpoint-ORIG-GUID: Gr3IgFXCwjBa9ebVbwvgz54Z74exygBL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA5MiBTYWx0ZWRfX4hZ0f5lFYqbe
 j//l6niMqznCmH0Gz6ALx1gGC/3CO9nL6ACLNzdjQ6ulUgWQnYndnqboo5hWZKThpcVQQK6QCZp
 GDf+HL2Ig+ettuNkG7E+vn4h4w+lBln99XbGlCS+uvuQD6qvBg2QAkpKYOPgtJK6hBMMcZAiqHB
 ATR/UjMn8YgKY3B8Nl8pEJ7zIihKnnQtiUZWxeCdcyTIdsLc2vrz/qs+knYQe2nro876hETiX1P
 V8i/ChwhKfP0rH1MsQWIsGDjBByzjwtqmxY8Ir7fTGsrxcUw7Cp62mGZGD+Lh354A71H5PUflUR
 i7G7McF56yBnHafAT/uuu5DsAQpUHSr/GyE+gFjukr6ycAbemAZF53huKPkgTsU8Zc4WSl3C8R7
 9dE8Vz6UyCXEGCKhOuCfhTOhsbtVMsA7rTNfG2aLpjrj+HZRDk0UB3OlSfWMAYoFPOeAt/2/HbJ
 A/C+yK9Qs0j+pydJlLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA5MiBTYWx0ZWRfX0PeYWYH5vkTx
 zmpFzRZio7ozcwaGhtsF2Py0MStCVySGMEi1UbWZ7As5WWa2GrQBPKOcT8SaWwMC2V1cS0aZnve
 XtV7bCrTN24VWxlEy2cjB1DYLJqIv1g=
X-Proofpoint-GUID: Gr3IgFXCwjBa9ebVbwvgz54Z74exygBL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250092
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 25 Nov 2026 23:17:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20572
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261125225407.916981-1-rs

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
- Patch Series: [meta-ti][master/wrynose][PATCH] ti-sgx-ddk-um: upgrade display fd from render to card
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Wed, 25 Nov 2026 16:54:07 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 478ddb30141bf0d69f3c4ac4e271fa2850039600

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: 3fa492d8d22e348e7a1ea4058dec805aa1d3e6a5

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] ti-sgx-ddk-um: upgrade display fd from render to card
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Wed, 25 Nov 2026 16:54:07 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 478ddb30141bf0d69f3c4ac4e271fa2850039600

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: u-boot: Fix uboot_config for am62lxx
- Commit SHA: e9bbaa18b4af7076ac2855282865044d2cbb516d

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



