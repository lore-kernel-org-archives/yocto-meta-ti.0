Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D47C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 20:18:02 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32781.1784665079962107923
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 13:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=dMSFDv3z;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=DvdeRAjW;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LK94NM1747480;
	Tue, 21 Jul 2026 15:17:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=12jjGtW5S/qda7E7RbJIejxxqgMDWXYSHK3ADxGuC
	uQ=; b=dMSFDv3zXjKeg/6YeIfGRaS59jAzn8xhEs8X+RsgXjpnjwKLmMC3whyck
	VY8Zwhnwr0ZxejEFl2nDk+5q5ZjzaAesnEC5f9Bm8oFZoe8hdtH9ENoX+/0Ozykd
	YTcvsj3db6SLWyyVSCDRhd4S27EP8+ZY/j5n7EwP0P3uNpWOV8n0mROOJqezT24U
	I+r+Vatw6lJJRfC988wOOVCPi+nBPLKPqYUY/g1LOZOH/yB0g16ZJmXBKebC1Mzi
	J/9B2il6w1EArdmc2osz+bqil3ix+qiJw5gWJRFWJCABo8q5an+v/JZXKkOBaSkf
	QkuGUO3tt+AJ5h1rZmqGjBZHSZdCA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011020.outbound.protection.outlook.com [52.101.52.20])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fj7pvud3a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 15:17:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCUoqfBzG1CAYvzJExwIZt04t9yB07OWa5pNGqvOO0XNwvTpsASScyLDtwntvJu7wFbjpoaEBLPcfG42frvgqqQaDTODutSdwnuTtsHdPg5kDLB0edWIB5SjgLvyVlWgpdXtCfq7W+WEOuMUPfpZb6Bo8VLhuv7s+oFQyk09W4lwuHEvtgKZYFFaSIljyPu1fS9J9H7ztG2S9qYJsKYyHT3SKsVDmosPoQYk2vJSdqi28HZ1/2hVI/f/9mJygr7H7XjWQ+IBo4+u/3ZMK1jgp8i/emmgVThCQqNkAP5a/SP1pIJ2zczz2zCa7eSyozxkw3iUqxqlc21ktyLxbX8TZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12jjGtW5S/qda7E7RbJIejxxqgMDWXYSHK3ADxGuCuQ=;
 b=R5GwOcUIOsLGl3Ai3ucbj8mWA0RJRQ7PRVMQhS4O2jmCwJqQ3argjfRGnfuLN8+T37DvjXsASWKKg6daMtNRGY0VQT0tnTZdju+Y2D6nuAM4N8qmGj9ltmzuCLCyZbHYFAxFTQE4MU6r3a6ZUnZiAVPNgyYtcBQTWAER2Je5bxkiPc6AaD02JvraZleqFpl07qspFnuUfnz1NcdE7AJLwLUWxFP+mhdMfZRUeUbi1zZkjT6HcFRP8o7sqeKPHMcbKogZhaE0e+B8PqfFns96JO9kxHlHxm2dr1fbD+9j7j2ZR/t6pnrMCVHc2pO8lseFIciQ15oB1bGgcBGMGb9WuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12jjGtW5S/qda7E7RbJIejxxqgMDWXYSHK3ADxGuCuQ=;
 b=DvdeRAjWgMth1BhmpO1BxWs+u0uHTvjzSxV1ccrpereo7Ye7FOHdO0s0q4TCw80CobN3nEBZtJt5CJEfxxedy5UYEnQ8Xy9IGhUwuxZq/QiWPNXqh/Uhqfn1cQdfL1xb0FqUySX4Hj9Vc/LPN17jYJPrSAC2A7YMSNYSN51pSb9+OH2ooaFyvqbm44/hvSn9jKcoVXrh9lx8qYrlbqFmX35OQLHJ7E2CC1wcLw9tPLGXgME+USa6c3NopxKzNf0mn0PkVphUDf7ofHXhvyUvw8J2mmEQjdLMY2EO1S2hec9d6h5b1RDAryu9LA868Tb4CQxjV6V+b1J9U5y2K1pB2g==
Received: from SJ0PR03CA0348.namprd03.prod.outlook.com (2603:10b6:a03:39c::23)
 by CH3PR10MB7679.namprd10.prod.outlook.com (2603:10b6:610:169::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 20:17:52 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::1e) by SJ0PR03CA0348.outlook.office365.com
 (2603:10b6:a03:39c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 20:17:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 20:17:51 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 15:17:51 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 15:17:50 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 21 Jul 2026 15:17:50 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66LKHodg2993200;
	Tue, 21 Jul 2026 15:17:50 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CBF979ACF4; Tue, 21 Jul 2026 15:17:50 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>
Subject: Re: [master][PATCH v3] recipes: Convert to SPDX license strings
Date: Tue, 21 Jul 2026 15:17:50 -0500
Message-ID: <20260721201750.3805808-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260721195818.18455-1-denis@denix.org>
References: <20260721195818.18455-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|CH3PR10MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: b9d0408c-6175-4803-14a2-08dee7652426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|6133799003|13003099007|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	W5GparFf/OTqHael0VLxzxfYfHPaxDHF/5eySWOdTu0zUuqtJo7V65DILG3VqVz2hOmkMaEMPG+Xyrba9rA5sgUbUg5z1oTFpEJp0wHwll69rbYqp3UZ5QNDPYhQ2fr4qSsXZvpyx7Pb44BXnVMp8lZZ1aBlMKw6lE0POmjmpjB63E+NoC/Hbh6dLseAMqSY0De0T50lWYg+eFGfJJp/GkkQRpmtDjSGhkOC+u6eXn7UTdFyQ6xY48SRXQxv8OSw/g7Ho2k6JFCcO+llMMQsPu6NjTuIZUhhZLOhSDAgFM/lPCf0PukJcUp4UmqJaC+VbFsqMsikMXPDsXQI9fS7raMHgDwg8piS9ODyh8Q8SN5qtdui2ZiUUDbdGJLjAA6jHCUObACqrB9wstzEZXaNtpDbYqVtBZnyMUuOv2D0EWQ4e4w/IdNR0MsOAlK+LwxRH6cfwPRks4TTOHkjZvsSHgKgxhKDuX6wG2dksKaii1UZSPRP6kpwdP8YMjtZI3JLs84MWufhwVMuaXRA7e4xxvmYxSkl0ip88lRMD8xRYOD/xC0oyKhN6DAOueJ50ALpT2UBkDWw9DCHfZiq2qBkiC6bSQ5+0SA+fU+jIG5MwQjMLkg2awLEuiNyAhLkLh0W1JkRzlO/4OYta9mpjnwHlnG7oPyMudWw/6gTurtIA8rv50b004B1CNW7ItmyK4rnXMvBOJ8o6DMWK0HXDYqsOA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(6133799003)(13003099007)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	XLqsBBQxUJ9cZMbCdKsbpGrTBGmXFbHpwEl6HwZfflSwAkVO74EsihhScMHeeOd7ry1xxQccNU/5oNjHwPLzm0Q0tOzHufyYguLBLpheNkKx9gtNhZ2b5ilhgziz5OHP1VzIzxSr8s26/ap4eRxaE7kaIonV9S6KAG+O4zopes4IoNxKbpdnOQHGt6dEUtH3KCAFNa3672LaxNqp/2xN5wGk4jbg9ElRSKBQFS5vOwQKPc51M3mMUXY9d6z0QskFh6AXJoVH6k6H8fZrt+8ek8cw9TXd/ssg3CG8wNQWDc8f+LqTxY4utYQ4dbb0xJvjf6ZCaNhYa83uZsaWMEZLKdtkPm+yt8ylIFCINZAVuRs9QdaH9KJ+wfSDb2qGXkjtORtvaGKO9GSnXWjBIA4GlXGZ/yslpcZoVW9nfFh/TonAVh8mc018RAkT7C7akfAi
X-Exchange-RoutingPolicyChecked: 
	DC2rjJz7t+tYVontAtV73GJSNHxxPlzS7RYng3c4zivwSX6UHnvpKZCgO9UHXmWvpfl6j6lfAWvGr2qrCrIaXhe5H7gvGx9enJR47OfFKrvQkEk7HpGJuAvm9AdpCbclb/iTv/9CIZ3047G3yJ0XtN729bkEwlq1bzzLeJBOkameXGkQwjbirRXbNWTkbIbg0q+3i/YyqzhtZeFCuIEOE2ldll30t3j5tkaq3KlmJZYPNcJALSt3CqGUoPLrZpGgmUqzLeP1WAD11GUt2gA9QVmWT9/XDEfkTPIiZn/1Z+S+yjIg9YGszIrmOCT7ZUzjVWSCXOqoOhy8kY7STuVkeQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 20:17:51.6095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d0408c-6175-4803-14a2-08dee7652426
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7679
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIxMCBTYWx0ZWRfX+MNvXebATaLC
 pOYxGAXXw2w3zzs4FRMINN5Rxn8Ca0SZng2oOZ8I6a/CkZMD9qCtpOOh8JQzrGK6OXehDEsOYbr
 kMljh80BnnFgcS24THSlJ4ETkiUdGo4=
X-Proofpoint-ORIG-GUID: hsui0q-k-uYYnxAj04UQfA6Z3pjXtvPn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIxMCBTYWx0ZWRfX47hj8fR4YccJ
 KaEhvxBbe+HIIyNk9sMTxe8Ug+I4zDiq8Ra8hunANHauYc3pw0QdBNfP/c8mHni6U5t8ukb0Bay
 y5PA+XQ5vuyTsHMHe7cVGKapN1RNf4gQBUvif6eTaC3NqyohI09/bQre6g7sy0fwr67pLJro18S
 NeTvpGPyCk/4zWmYapzSw/QSsnFAoT3xYqH8zRxvWy1NfHOWaVJV3u3BMBD06nUj0Mw1kyvRdu2
 UdkYEnSM0tY/vg4zNKtmNsnljr9Atqei/ETdkn+qt/jy+HPwuoOclOldSXI1GU1f/2ymTvsJn+V
 adZGuH7OvxFiDSOY40uhKXr3ZKKYqRPTybMYH4eaaYCigzqLEYKqAHCyXt8n9wvl1FskMsL3G1w
 IkpxEoEFjifLtWqv1yFkV6UbIpD/GDoeYX6Z+0yB4IXAb1UeO6Eu0m/JYal/7eV1Kw0Wd9DkO8H
 Ltbfi03B8N8/niMSXmA==
X-Proofpoint-GUID: hsui0q-k-uYYnxAj04UQfA6Z3pjXtvPn
X-Authority-Analysis: v=2.4 cv=MbFcfZ/f c=1 sm=1 tr=0 ts=6a5fd3f3 cx=c_pps
 a=x0D8RYL8GqfJKF6oaN0fjw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8 a=0gcC27t9AAAA:8 a=sozttTNsAAAA:8
 a=XYHafqtSOsTbNBGIUeMA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=f5sM90hAhNS9OGT-JDKn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210210
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Jul 2026 20:18:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20185

meta-ti / na / 20260721195818.18455-1-denis

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master][PATCH v3] recipes: Convert to SPDX license strings
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master][PATCH v3] recipes: Convert to SPDX license strings
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 21 Jul 2026 15:58:18 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: cf332b5b6ac62bd8d92858a7154bcf497d6b74fc

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202607202200
- Commit SHA: 31de93f3201eabdffcc7ed5ee7faafc00d067ba0

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
  yocto-check-layers: FAIL
=========================================================
master - FAIL
=====================
ERROR: <build-dir>/sources/meta-ti/meta-ti-extras/recipes-ti/devtools/ti-cgt470_4.6.6.bb: QA Issue: ti-cgt470: LICENSE contains a reference to license(s) LicenseRef-TI for which no generic license was found [license-format]




