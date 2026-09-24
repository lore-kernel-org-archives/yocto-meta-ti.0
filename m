Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3D7C98317
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 13:57:25 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8423.1790258237260828258
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 06:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=cGA7H+HJ;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=FFd2ibDX;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC6RZF3501688;
	Thu, 24 Sep 2026 08:57:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=1YuhO/ApgR1Ht1kumZEm71ahhen4pwUgTwwRI+M8+
	DY=; b=cGA7H+HJ9X8Kw5+2JddW2onmTFnRin+9Llf3PeCfZeVpaJa2DaA0ihFOf
	tGtGpm63Grpl/ieFIuCPN6MBlL2fGqBatif3PVbnj1xStficOacWf25HvriKRpUl
	xcFxf1ZtI+pJ2y+fXiyvmCude/CUWYMX8DXnK82JRW9EuJQjGWPcFhQ/d1pMT1PA
	Pxe98KTNHxuBJmNmP3qvijSbMhBF9pF7fGAPM/V6OdkF6QTPpfrAMGIvrHCVtQg9
	lPzukMv8bsuHg1V4uX8NcIE9vb4jjxm/5pIvdtuS8CtBHWFYx3lUWTO4wIUbYsp9
	ZGwwVyJSKnH3ChIscDrFwYabDR9Pw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011064.outbound.protection.outlook.com [52.101.62.64])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gvwm32qb6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 08:57:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2wToG83QzJ6qbOtdgxeM/zi81g2K+4bvKZHQ5Bsp3LwE5ZS6x83Thd6n2/ATlTt1m48XoYeuJmjwi8hMiny6Ei7BDe6KwWCw2LHvYnoVtDFKsajrWvAkID7TTZsmfsA8wBBAw4ZCM3lXRlYrudH/faiAHIfqsCYmPqbbaPmTAvNA6iBGgffHlHmQnY9mr9Ka6Cn6LyF85jHIDahIIHTUKLtFKie9koPetFA/D66MXyJwJtG7Pzv/RayzYQOvTk0G5ZvFX4qTnCqVo7VgvP7UmBLUoo6zgbBZGtAunaAmktqXqoa28MPXdVhkmIvKZzdf2xjwy+BIuQTZKqQ4btTbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YuhO/ApgR1Ht1kumZEm71ahhen4pwUgTwwRI+M8+DY=;
 b=gwX7dXnSZGVNFxknsv58M+jUGAG3JiBkSDOFmOI2wQ0pXhG038iEKj0FHAc2BVrijB3uMtC1lTWokSHvwaLWBz4p247aAkVVBi0S/MlpvneoUoxJH1v+e4fe/ELM+7rQ9BoN7ucl5JFUvTpmmQ7rM9R6BGF2ixseXeL59qSSvlicm3q0l0Y4s11um7ajOyQahbtQkg6KIbXvgiXJnrjUExmg8y0Fw+sLyulbLpSIamyJ8zYVXv49GMT4pgBZ+WhOU452z6aHaX6r8mplEop0SmgxayJf47RCx/+qSfbgxw+4G1YSi15vtAQ23jSxK25CkncihA2DdRewCW/rnUehQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YuhO/ApgR1Ht1kumZEm71ahhen4pwUgTwwRI+M8+DY=;
 b=FFd2ibDXAjisTN94qtvVX/L3iC7LOtp6spIUQ3TogPzvrGYdQTMudAplEKhGeUtIT6dMrK0w3fRBfZM6QLuYbNibbHwgJ9PR5PODKhx3Y9TJlfhide68uSHS+w+xkXeHY/yKH/q/QG9uENbIYDT8XRqN4Ql8BPOEHgWkswIte3xoO8r7NRZW/KlvzC2l2vu53Z+zpzlC7BddaGtqHpny/577VZAQ3ZmHBP2clSlL7h2RxjLM5x3pb6PMnGTpPsuMyZEwbE25Z0aTK5jehhKB0O+Y6IsgG1g1ntHq14aJxaeCANUzBirk+j+MC2OelW412F8a5wj7tPZCvMfc1EXqoA==
Received: from MN0PR05CA0020.namprd05.prod.outlook.com (2603:10b6:208:52c::34)
 by SJ0PR10MB5788.namprd10.prod.outlook.com (2603:10b6:a03:3df::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.4; Thu, 24 Sep
 2026 13:56:05 +0000
Received: from BN3PEPF00022BBF.namprd04.prod.outlook.com
 (2603:10b6:208:52c:cafe::37) by MN0PR05CA0020.outlook.office365.com
 (2603:10b6:208:52c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 13:56:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF00022BBF.mail.protection.outlook.com (10.167.248.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 13:56:04 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 08:55:42 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 08:55:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 24 Sep 2026 08:55:42 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68ODtgQ4915842;
	Thu, 24 Sep 2026 08:55:42 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 13BAF2C86; Thu, 24 Sep 2026 08:55:42 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH v2] kernel-selftest: Disable upstream patches
Date: Thu, 24 Sep 2026 08:55:42 -0500
Message-ID: <20260924135542.3143782-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260924135018.2067502-1-reatmon@ti.com>
References: <20260924135018.2067502-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBF:EE_|SJ0PR10MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: 75ca9b03-8daa-45d6-eaa4-08df1a439356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	WKm0+oTYJ2jqboQH7vJjLnI1/ib8sH8QnWM/4IS3dreDIEps+fR0jiL/BimZKDWbxAk8TXHWQPeoAS7SyQNPMralkEfbhjB5bYyb8RwhmRha4jXSxnIUJGZzWniD2dnHBuA6GFeDAQXuM6sEIJAjJ0UR9vZiodPbfH6cBrMmiGVIZaECMoRH0diuNjrou5DfYhQXB5/y983Xy8ubQ6S4mqg+zCC1FlkkluV7fGVEe4sGgEDje5FoHAGGO2vDApLbrbFf69nH1SOc+qyIXFqo9Va0m2U31h6IxZ5f1Ldi15c5Lorbe1Cd2ks8o9UJNj/kSUR0aGfOI+jdGgHKj4giaJulN8PBvJEg4WKRXlgG7OvJtJAYqi+ggoeN0nP4L8tvhPSjaSKfHcXRsQthDoN+gtGCsFxhSvs8IdTmy0cHR4pw14ThgFi2NfTCTvv/e2Mh0IWZY2Gvr8JtnglDryIy4RuMbzG54qtrsJ5QMeIamQFrNQbY8ZTws46HrdCxo2v3j46H1jRy15iOC6WCg+mHYtPlgmFXhu0bHPR9dnp8bGZV4Pi7YrfOl9onEtqeflB/spUPlAJ8VLDG+7aGrig7pOGpJCVzXqdRi5q9/fecDMqvAxxB7szzyZ6hP44UGB6FSmvoD01xIGk+xFaxP3YreQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0qS346hOSAXU4VLAgPvzm7gHxhmzi8N12OTA9WoD12ujve2TXbeIzW8l86UeLc86mHWycSeGiLGIo03AT76AR0MiFJTvTsDPkp1XEv9AFzwOqN3xmMrgPNCDrg9vO2kob0eCDsflhT/RwCa3wXNYfp8dKxdv6yDuJStwM3/3iQbvQs/g7JWtCF5puBYxXgm1c10zOwo5gnfkyLpHqO4NCZgXAf+gKf2AcJulaw4zdmmddfAGJi6lfwgVd5CVzCRFOpVzghrLaZd46HpQoR5jsga19IDxEkOziQnZmp9mf6FDzOssEPTVGSE5y+FTyEhuZPdS6ljm0tKJmyxZrjwvmQLi0nhRAl3jd5Ll67oVgqLJu+U0rpr9zTWfSWxA+alxvtdLglV+w28I8PXr2ezqsCoobEHtECOQ/GcFSULXiG0JuzBkz5hInW2SWT1LI4M4
X-Exchange-RoutingPolicyChecked: 
	boUWLf0ri2f0fVuVBRVfD6DhpnhYv14I0n49f9Lg/6ZvtACAMdpW3zszpPaqTR1bHSoki3EDdW7QfS6i88G1AvrZbc/awjFMHge7/pySpYioDm66Dtaa+AuBPJBVq5CUHHKqcrWnKUxFRX+AbjLxBSdlwElfHO4AzNV7jzYr/F6z/xvZdT0pq/Ebuht/B0hP1SAfzYzPqy9QWNW8Pch+mvM4fhTI9XOcu1KXdhTRIRcOPDD/rvDAzmCepywSWV0OIFRdiWbslRU7xfmNPMW/xfkq0MAOma7x+ysk0bTPZnpHn6TI00zF13/4aeK+SftYjgQaYmkdrrJ8Ulk4a2MOGQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 13:56:04.5794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ca9b03-8daa-45d6-eaa4-08df1a439356
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF00022BBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5788
X-Proofpoint-GUID: pu8dpuOFrjIVwXtG3aWcfNM1LyG793WC
X-Authority-Analysis: v=2.4 cv=EvdHPicA c=1 sm=1 tr=0 ts=6ab52c3b cx=c_pps
 a=ImwGUT2bfrWU7DBu6bNfJw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=L5vV-rESFnTAmhBadDoA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1NyBTYWx0ZWRfX+Bv7lWOjHyCV
 +rX6wcCLlapxiccck4GE//NOgZJQYj68uAueUK3RHYagaaTXl3o5omvvVH7/dxz5jztYOpXpLWN
 rVSdKrr+jM1Kd49dmi94UKeaUZVk/uZxecbzWPZcuIJzQcZmIiJBjt4tdQhA6ZZlMJiyGhVOui7
 sYEbq/rCdXKim18uzyxx8oPs30oi0UvsXF9i+8UXTH5HvGeC9n+q53YMW6rnyOwylM6dZnsntu1
 ZCPZ71Kj+5LApj8/oxkyCMwuTjIJzv0z8fvf07uo9Kthy7u1huIQPy+dl1bnc25icMy8OQ3GTdE
 2Q+HhCDsQfSDFVa9S3TDin07SqmDagOXfnasKj8S28wI7xY2Q/0TqInZ5lXFc18LbCggKfIOAyc
 ot42Wc8FRA2koYaf6Uqop7bRvKcBJcKLwdPzsjyTGFL7HMsp0+9l/+rjba/rDin+VcAl20KoG2o
 O4IWNsXCKK/WvlyehKw==
X-Proofpoint-ORIG-GUID: pu8dpuOFrjIVwXtG3aWcfNM1LyG793WC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1NyBTYWx0ZWRfX2Uqd9Dc8fq1y
 zfFQofN1KLelJuVmqdAi+hG0uBH5vdJtE+P3pSTXvFRU/J06Stja6XHUhHog5NpZJ9E3tNcYlhu
 +ghNzA0y4XxpxOOl31mAhONKhQ1bQ3M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240057
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2026 13:57:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20415

meta-ti / na / 20260924135018.2067502-1-reatmon

PRC Results: FAIL

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
- Patch Series: [meta-ti][master][PATCH v2] kernel-selftest: Disable upstream patches
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 24 Sep 2026 08:50:18 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6463c5328d6f9591f042e80a64564d452957859e

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202609142200
- Commit SHA: 7034712771a19a5dfa13a0356e28c9770c226eaf

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    ERROR: SUMMARY cannot be longer than 72 characters. (SUMMARY-2)
        meta-ti-bsp/recipes-graphics/mesa/libclc_22.1.8.bb
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




