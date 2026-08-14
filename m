Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A10C5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 08:33:29 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8594.1786696406018032716
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Aug 2026 01:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=V9wBgSHJ;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=pZKaRdBG;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7eGSG1112245;
	Fri, 14 Aug 2026 03:33:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=/yTQFi1fiWJyuoWlxahCK2qYcBz37yPk3SIOl9B6M
	Hw=; b=V9wBgSHJd7AQeQtDccbKHifcdfMYSqHhcQ2r94pdp+S3vMKLPdFPU6O7O
	zU0jNDqsL6pjNvXvrtxZ+2min3AHiU5w/elmS8aW1hmvwkVFju6L1mG/5tRRduP4
	CXzcUNUiBFg/dQ0i67/4C3x353oDI135q6ODchjPAeHP4UyQlEHUwunCHBcgJd+n
	SJPREo2sRmJ2NSFWsi47yOp6U/Mzwxht7apSBDJ4Pf88J3hglGhXHbby+6cW0ZY8
	NGo9tDS35yJEN+V4xW5rMZu2yWXZPwAPri5CUsmwEtQaYi3pB80cZ4EcLe1kn831
	ifxmM5Q29S9eyIpY97a06+KeoOMDg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013015.outbound.protection.outlook.com [40.107.201.15])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g1bb4fa6g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 03:33:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uku8Uf5yYVPeEaFaT7m66cXXDM57Tc3DdWbLMUAs35I086wZKY0sobJeJT2EqTNR0X3MIFG6ScWgwGfWywalPRVzdyYQuGTXcqHkRSMMRR1EoXk9kC+enOM5tJQxEyexOItueIDHBD1DBlB4fMJTQe1YzocmPWeTjoPNn4eiP+Bur5WzcDMXP+wipgNwxzW8jgsYR6jEpVD+Hx9B1M/Ux8gI4qwBf0HcfFZtcRjIyXOQdSnakGHes8GKSu3VOX99l9bSdshuvANMLQ05vYseXfIAgskUl4RapGnbxSxmvYxYB1oPJo2TYrYJSDGXAX3DDPS6Csl+/5fJWHAmcpLuuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yTQFi1fiWJyuoWlxahCK2qYcBz37yPk3SIOl9B6MHw=;
 b=HNGlcRjCXL3I2eKP003tsKCSoeVC0OGherSE6jlHjGG9se3NusCdcNRJsTrANihkM30VWmlYDvc9DH0wITttbd3DtofC2gdYiVmlVjo5B6UhCj3EdzoUnKEMR+dK71ndedEzZNYeCBfjUjMd546ElQdPcmCulfXvYp7XmY29/9rervehHNiy2Yh4eqFztTamTyw29aIRSg2XASsaR34VVGKQWYOPRvRhOhQh0GfL/MOIn63rVIreqAdTgD5ogFWHHBRbYFhJQO2FYX159yoUTSkpZ2QJj7i6JFrA5JXXBse1tOLuzEJbe16FpXrHb2+q36LHl7i5wF949rul5EIj3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yTQFi1fiWJyuoWlxahCK2qYcBz37yPk3SIOl9B6MHw=;
 b=pZKaRdBGWIeJ11zlebqqCzhCuFJcFMDPaLCYWVuJ/Mgnj4uvuAHMpCm3vAm9d258Cp22N5tAEjBuDCcAKnUXmQf1E0Q/6/pqhqHSbdmInalRTOP3gwdcElPQIttOBt1/HrydF6M+8Sjyd28nYLmVmfJCPDHtKFg4ZPqym3aaOYGBqIEqnoPc73pSTN0k/Cy1NxC8sv8qawR/zn625uRT9WSUB9BeBAnsEBdyG73iwHtiD3O0/qKnv2VJUu/aXPb+N0TF1EEyBZA2ZK27mcVaXOJ0JLDNkcJRTR9YB1ZgKnYcPAIAgFoWKj3hIpWUJxGfJ9dn0CySYMukZqvN9Skb6g==
Received: from BLAPR05CA0028.namprd05.prod.outlook.com (2603:10b6:208:335::9)
 by IA0PR10MB7304.namprd10.prod.outlook.com (2603:10b6:208:40e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 08:33:21 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::4e) by BLAPR05CA0028.outlook.office365.com
 (2603:10b6:208:335::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.6 via Frontend Transport; Fri, 14
 Aug 2026 08:33:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 08:33:20 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 03:33:15 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 03:33:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 14 Aug 2026 03:33:15 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67E8XEwX2422969;
	Fri, 14 Aug 2026 03:33:14 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C363B2A56; Fri, 14 Aug 2026 03:33:14 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Beleswar Padhi <b-padhi@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        <u-kumar1@ti.com>, <hnagalla@ti.com>, <afd@ti.com>
Subject: Re: [master/wrynose][PATCH] ti-rpmsg-char: Bump up SRCREV to tip
Date: Fri, 14 Aug 2026 03:33:14 -0500
Message-ID: <20260814083314.2038427-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260814080612.982165-1-b-padhi@ti.com>
References: <20260814080612.982165-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|IA0PR10MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: 34edb489-2c28-4a1a-7404-08def9deb2b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	wqtBWzGl23wyIA5/YqMWoNZ0kI1DEkoff1dB7umpmaeihYLF8KRnDCVNzmqo0wX25vLE3uACaq8KWgNKzjewow5gwtlKx3odEOTM8TMCkLzBdPMS5kOD0QZuTU5mqwHF/UvLc7rHECk39RlRAESZoW6kqr7nFKD+CXG97lTLUs7/moOOjIJqAxar6S130SyvknDnsncu8Hkjq+TEid6ydWAYHRA4fqKv7mJwGJ01M68oMq24VqHUM5wA3QXQ1XUDMceMQUyCDiybnK9+tdu1oB9Zry9jtH62F8gvpPkozotxE18c2NI9GpMDkOWJ4LpgBb7+JFDTmsYveMQMPVh1DFPOpj/2zlRHmiJmXL7Imap52Cxi0fr6nfbc6VlZq8GJat+lFa1ZlBGqc/WPNhgNP+MulWOyd8KUcfWH2rbbKNdQ8OFrcMxxQx7Bdcu+KQgKoesoJqI4g4GonuIzyIrj3hVQyR/7lLvdyir4/+yF1ndN8BrDbsRI4QuDj3vjhLk81L5dSJ2V4Mkv3I4WpizgtWxG223FvrMpeVCjj3rjGSkzCAn+YT2Tpdt9kRd/5LYvwI4dIniIJnQ9MYW5SPIjBxkrS+I7Y/6imTLAv6vF6lq+VMM73TfZM/QDK48X+SIcIkQu8IbbF8bXDaQ4YpSRPuEE54OMPtnKXwsKPwomoM8XH5c2Hv21phrz1aPtXiTBY/zuc2vcmxdo0kNo58fSIA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	uafoCBfXPU95Cu3GtvNm5ya4VarLv0Z15NfVrlvkVmJoRGjy5lGR1ePTI5wzUP9eFSpq4UuLio4MPqmLUPyIPLbcK40eXp0l84y5DO4h7DpCrKrOq6AAXDWFREWUQ2+7fLRojzLUrj5x2zN6t/3hA9MMVcwqmYcBunOdiG2230pm7fubxgUEE9FLd5g21eAXLD/ROfm6x846p4rykvZQzszwPiWGjDlzIoyG7ppnaDxKareMdXE1PUB/b8IpUVXqLQdOI8t3ceIlz29CmEYi+9nSP7PwUmHHRxrEUL6KwfN1E/b6FHdaOsogKVwQM6s2+7rGB2UeO5SuHMdSzwHmts1angw1FH9iYpwm/FDjKPdr43hMZB9sriF8Yg55u+EP8VvQ0t7x0GuoBwKrp5jyDnf1ozUvzqQruOv12jdESrXjvzO66nH3acUMzNeNGqMZ
X-Exchange-RoutingPolicyChecked: 
	SX1m0lJhNApAr/tVPxk+X2se6gP2tA3IGjkqAcQBLiw1CCBcKtxv7CAU18VcFcfC0bVIqMdOd8//9r6miTB44DV6+bGHf1OVpI8pC1Qtsif7GNdCzepJh8I8auTqSRSwAlYbxgy4LC6GreGwxaJu7EIWAk+x7KednbFdxInxyAMMX04rCNt5x4HgDdbnMC+IddQd2CpoNViAmSlU5ni0gqlzpDJaIve5JsO+TU4aJ8vb8GQn3PmHyhEd2IDgb1ygKBmYg5dAD0F+uXtWKPWkkKfpD5DH+bd/0oTP2jK+gDCQ12XJTTIokH3gIoaArSWgxG17+PdqcBOM37G2H2I/bg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 08:33:20.8210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34edb489-2c28-4a1a-7404-08def9deb2b4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7304
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA2NCBTYWx0ZWRfX4jw62SXy1Hh2
 q4Jn1DLHXHwQuhwXDRtmVz33g/Rk1aUnNt15lNxbJCw9jq82HAeQk9vTC2yLR29s6oRyU8hQdWO
 A94+4c16WdzfNy/mXHc2JG2fNVu4tG0=
X-Authority-Analysis: v=2.4 cv=W5sIkxWk c=1 sm=1 tr=0 ts=6a7ed2d4 cx=c_pps
 a=ar5COM9M0msGq9wDbiNjNQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=VkkHSWmPFM6PHLY5UBcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA2NCBTYWx0ZWRfX/qiwF1ra/b21
 9AW5I+u59nERpFReIi3ODw106L+phhXrkp6oy23Rgur9hoxtdw0FybGW319QSbxOkQSWPHqESe5
 g4Ce9hHq7G0LOW4gn80bwiJ4Fv5eBOghlwKH413js6tUX6NXKZJrOqCXP3seXnV2fbBAO17hj28
 WILl1fy6mXMXcTj3llxgHTX8m0l4MA8BIn0Xs4bBDrCXYraCBLDQ5KipasHL3fX+zGmdKJzW5lY
 TYaqYis1W30lWBB8oU4EzGrTAxYJHO/ChNU1rLxAfrSVbmC7ZRcHpBl2Z0fmTqiv6kDdeEjhzVT
 HgpTYpTnqZXbKUdbHK7CmX/SmnLHR6H7OrFAudbmOaJw7mJY1Pc89C2mJWFcmalCS7mzLFDLW1x
 LhZ+TDF1tv3M8pVOgKFBTdxR5gyg3LK5GqbDfOQo4clBwAdd9kk2JoYQZyOEfVKL8eqFx340Ada
 qReTWog9q03PLmFIpEA==
X-Proofpoint-GUID: 0PRJuFiAw0Eh8vOY7jU5t0vWPsmPrXer
X-Proofpoint-ORIG-GUID: 0PRJuFiAw0Eh8vOY7jU5t0vWPsmPrXer
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140064
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Aug 2026 08:33:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20267

meta-ti / na / 20260814080612.982165-1-b-padhi

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
- Patch Series: [master/wrynose][PATCH] ti-rpmsg-char: Bump up SRCREV to tip
- Submitter: From: Beleswar Padhi <b-padhi@ti.com>
- Date: Date: Fri, 14 Aug 2026 13:36:12 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2f38d5a398db8a3aea27f510282d551c839fc5ec

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: 61fee7c8e69614a6897836c7708c47f627417327

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [master/wrynose][PATCH] ti-rpmsg-char: Bump up SRCREV to tip
- Submitter: From: Beleswar Padhi <b-padhi@ti.com>
- Date: Date: Fri, 14 Aug 2026 13:36:12 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2f38d5a398db8a3aea27f510282d551c839fc5ec

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: linux-ti-mainline: Bump to v7.1
- Commit SHA: ce0347d626c909d7fb37193b6325573dcfe43339

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




