Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C210CDE009
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 19:03:46 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19146.1782414222791776846
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 12:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=PSi9NB2E;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=c4SSB7xp;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65PHiOkf3641694;
	Thu, 25 Jun 2026 14:03:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=leiw/gUA/FsMC
	DXhxH8pngd2B/2NiYR9EyLU6XA5HXA=; b=PSi9NB2EIzgRJ6aVlv//JsLO4+7Pe
	CMjKYeH3o2WhF5TAvrbncoVojMl3AlntdxSx5WHmuQjq26jme90PNTV2kfOhRw+c
	GraxV2u5CEGyGuXDbwLl1bn32G2ppK109WsE7wXCphSugWSQgKF4NNrmbAVaFFUY
	nbhE92IcWiXfPnSCv4v4xwAQ1DLSaL0r1Ua3dyCpdJg6MdszIGgs8UoCXzhck12n
	o4vFWqKNxNeOJ3YS48HWPHZYOnIP797waFPeHYETQF04R0VLfBVxffju71sMN3sD
	VsBs+g39gdgGAnaAvPkbqj3VccQm6Hx8YfdCrjNYGHp6+UAj/JyGbfMfQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011031.outbound.protection.outlook.com [40.107.208.31])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f11m4ufvd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 14:03:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvEyjlAZ6joqtu0YgFGJ7E+m+SO9wvXuD1XZ4xcSPZm04b1FUocZLQdMvBC3W1IBqCsq37PMrx135RnTYq9Qf+kNfkyE38lWNsd6KArhfNAzuSSdaltSrhmhnPLKZYjrIopLS5B3uFfPScfQJwpNMoY7RKlA8fVfCznM9u9uX5o8NoGBtPy+D3orJBKwjVYydupK4zUu+jO+8FMXBLhAARqNr3Juvvq4aTuec900+5ey90rBtrL8xXIsJfo+L3Vyw8qvExWkw+PJlA09VsIuZZVrzEJF+gTtt2YSynKdUqpR3NdTEy0gKJIN/o98d6dQ6Kocy2nuqSiWmEZa76amNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=leiw/gUA/FsMCDXhxH8pngd2B/2NiYR9EyLU6XA5HXA=;
 b=F60QBxg3HfJr/c6M/cKkJgBx0YeJ4FMzalYCiupjen6AHvMEJd2HyunOU/oEaopGbpb1Ego3dz0kXDmYK3B5oSpb1W0uEZGzKMrA4O3h67Z2puuOZR2oi2ieYOtjDTiCtr8w6CXvpfyTa4b42mUGdW6KCKyG/tGLvxXl5B01EnSQXzxyV+rhkcLoR6239qscTJPO7p7o+oAns+AoynCiciNC1UMpuCS177y/0Xewox7rI4pYSsWJErd4fQPpmKf87I8clHcFcA4/P/6f0ZaEmxl0LgprbOIPZ/FKZLB6WYANngBQgHMZ4SaMzqEe5ZEiQfebxeMY2Xbj8N8LyJnSng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leiw/gUA/FsMCDXhxH8pngd2B/2NiYR9EyLU6XA5HXA=;
 b=c4SSB7xpvDQ4ubH6jnl1++qv8Dn0/CFdI0EdoVi3mNXq/HsUStm5qkxUdZ2i9/Cp4/s0ojWygC1HP5FEjwMet83xMsfKLsIWjE2Nq3Oo5z+RFhtcD2G3IJe34Il/vl++K9mvGazjhVRfKEL2+6aQL/gV3J9vdlIc99n6CBeqeLpvSpezkFLURK8xbnHHWUoKD/QjP6p6UB3qAIqGT7Gh3vG+4y4KQubPY7aH6u4MjWpEqkBfQYP5ikMYTMna1zlIVrWfQ6H4fLlVaH9IT/QbZDjYwuy/hO7e4md7uFPHGXiYpt6ERXb0U2K0SZQQYHCJeJtaeeGksP40DoESRkqXRQ==
Received: from SJ0PR05CA0099.namprd05.prod.outlook.com (2603:10b6:a03:334::14)
 by SJ5PPFE25FD365C.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Thu, 25 Jun
 2026 19:03:38 +0000
Received: from MWH0EPF000C618B.namprd02.prod.outlook.com
 (2603:10b6:a03:334:cafe::ab) by SJ0PR05CA0099.outlook.office365.com
 (2603:10b6:a03:334::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Thu,
 25 Jun 2026 19:03:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000C618B.mail.protection.outlook.com (10.167.249.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 19:03:36 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 14:03:35 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 14:03:35 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 14:03:35 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PJ3Ys3277270;
	Thu, 25 Jun 2026 14:03:34 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id DEC5E2A6A; Thu, 25 Jun 2026 14:03:34 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202606241800
Date: Thu, 25 Jun 2026 14:03:34 -0500
Message-ID: <20260625190334.3816457-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618B:EE_|SJ5PPFE25FD365C:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dd3c818-330b-4712-bde7-08ded2ec7607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|18002099003|3023799007|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	Fbla9cDByYjli/EPA9Om32ZvpCFOiIFqnfB78MnFpsfj0UeQkUK81WEDSr/YXIp5tqU5iBlaG6X9DIRndYbgbiiWizLPyukFfoUkx3Lf6QVcKpekNxTsNFnZyQRvnfs7ilJMlPQIf1c58gn66eKsyhlRYZ9unQ1Egs8F63LQk3Ph/gd5mw4ni0xnTHSd9yYsvXcaRqCFXKpAIo1clP5QHXZ8AC/1dMSg5bjJMAFiTm8rLtpwigQl5O6h+r+I/sWQsPmnt8XUxL04pzCpvUT1KwQeFo+rqUPXg512/iZI2sS0y8g8aqoN+FdKQ1RPrcwS4tPZM0mgQVxkwkevmKn+YXP5qbMFOjFB95m/anA2nDR8LNLOKY4P6+q3kdm+iq89g6nRBsj+XB4GX3Y+kauwkcyXdRycJ+/vwDZvaubSuxfO6N4cVCePodoPUPj8xVy1oqObICAY0/xLXcKEqNSSEukD2YCr3dTQKY/PtNmrMahYIif+BQpd0W/LYYOIKGuIe2wi+bbl1iu3klwhfHi3rR7IU8kBPJl5njk4utWhagcHPG/m9FsuW6y59RKm4TZcNYT2mz8qHV6aaGDtS45jTtX9bc8zu4ZwGyTZJssgjU73HINt6X8S4SqijXN+MFC0L+AIwRD59RDVQviYNxyDDj3Hxem8NHh8q4lFt8rbjqCf/Kw+W6v7lK2Khu2k8Z+TwwA8TrfrE61Hbakh0Kkqkg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(18002099003)(3023799007)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	acTLUHyZqLCflURaQ9JPn/v607ZAK4+iEHggbq7VucyBXEst9lq0AYFY+nOx2r9lqUcAcmotrhR6rtV1hQd2WXSJsuRjZN5zrfMxg9+zqjanuvr2XrmoK+TA6UtIjdRoXLofa0JYTq5QxLdVE4dL3E0UxLdImrZ8wMFgHIW6cry9Uot41bp0uZas+yN74X/jjC+fEwSq9E+cUYM9qo1JlhRi+UrFxJqbDFh2VdadKyV4xTU8+yVOjqmwEZVzjuIFNDpMOqNpsYW6r3qWUuMNnDFb8sJd8cTAMD/Lkt3D9H1AblCg22GIZuia3CW6Cs3vTZjANd/XB5GfCtZ/UM+wauOynhhrrhhDmjPBfb2drijrylLVaAqehnc1z8aA+M7jAdJPwhfP/waiUvLSuNPIkjXrfDSBAxThjFsnFR/TJUw+B3Rzc7XGWZ5+R3C/DkDc
X-Exchange-RoutingPolicyChecked: 
	LlpEUWUilDUd669/l+82QAwwT6HzRLHwbkojoPDH3JzhzH2AonAbH91HealD+UGs1XeJXGL5HdGgSvWHB2xeU5sIXDK8GMpgAuYMI1vo5HibpAn0uUz9mjEo/oyKix2IMmmZbkhlKPDV7FlDTzaeQINp7huR4TB212DFOS1EbVuMAx2FhcDZPhCrMmD5TDWLY7xS026MJVb399RG3qOmg0eh5E22A5e3Mhwzs/9NH+I/27kZpDbeSSkELyDy4yrlhPnP86CpE0GsqzzJEd7JjY3ox9RmjbwGdhRCcva/XmhtLhFh/YHO2ZIYPmFtY1jik8a51geTvf5uDgvQ9EaDkQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 19:03:36.6212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd3c818-330b-4712-bde7-08ded2ec7607
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C618B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE25FD365C
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE2NCBTYWx0ZWRfX8uDmqi6hDHq1
 yr3k6ZDZ3uCIx4X0DIrSl/HpAumPfBoo3nYuEbtgbPKzkzcg849iewYvAEDpuUPUlTARdQgjrEq
 pa0JlVmiEPNZBkUsmO6xtmxan0HGVMk=
X-Authority-Analysis: v=2.4 cv=TbumcxQh c=1 sm=1 tr=0 ts=6a3d7b8d cx=c_pps
 a=cMqFfNUV/FaVxlb8CdtUVQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=b45o4kL6AAAA:8 a=NEAV23lmAAAA:8
 a=0ymn2w7eR_o7O0sdVFYA:9 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE2NCBTYWx0ZWRfX8HFNuz0VFAYW
 N2y0gG4w/FapW16paq4MEEbqiBx6L6CqpVJd3blCAxZycTzYX3mHYsohVEEzd8TU952wwFzAhId
 ydewwzF0aq+jnzRZxNkxLK8SY+qM6A5O+G7quEzui1UJTlUz824weV58pi0Ls94lYUXmZO0vTm4
 TpSbS/toi3bM7ibQ6i8n6OOUCrgJ76nihBH0FnUcQB22FyK3aZ8rS5T9CI6QAIWOfLNL1VRmg1z
 aFxwlzlr8dRr4my3T0ouz3DhLad4YpzUUl98LMMdC3e8nFSE8lxPBVl2bBIy5+QTmtsIIyKqe6u
 P6yEjWj5cgOC+dqfLTjTcyHVkoq2OFoP22bMwSCdYSLt2G81q1xq8T0X9vlQwauBctAoDQfQLTG
 ohQOZz1baQsK3x/0TRH23n9nyrkBaEZb+vN+ANXFdZEDJ1Hkt0pXe52/VjLXvo9Hzlv1DToiLAv
 EgsR+fqZYBpvTicZeng==
X-Proofpoint-GUID: DlDxElhZRpiUHRywCqz5jQLPM2lJNIA8
X-Proofpoint-ORIG-GUID: DlDxElhZRpiUHRywCqz5jQLPM2lJNIA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250164
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 Jun 2026 19:03:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20097

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV_uboot
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV
  linux-ti-staging_6.18: PV,SRCREV
  ltp-ddt: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=ec029baad8b4b147af8331a5e099ef891e5ae1f4..5ee4bc3535481fe9831c0223974101e5714e7357
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=f6338e22d2ac0777a68fb0f295f4cf1e3e63f659..1612e4d1deb11d49304c715576854b28cc10e34d
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=617c6fa1c50fab2acb3955b8888ec71ae7630769..ced00b83625b0270e481d517b76313cfa517c2ed
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=d7f2b5b19f14fb51ad279f76fbeedd0dfd40b69c..c6cc0cab5b8575a2a70f0c4f9dbc9981f367d8e3
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=4e3bcc10a5d1e9822e0ed2dad5cdd16f7cf30fe6..98bbe0d37952d0ce1b6508f108c357ceb6d58bf3
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=4c3bfa15a22a5c6729519e730459c483c125d5db..6b2eb7030f32ff300e925dcc01a15c9ec4f3e470
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=b042b729cf573537f68fa3ea5050f5d22b07c811..fcf2909c4d225f0116d7d497c511f5d61029320c

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc           | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb   | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb   | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb     | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb     | 4 ++--
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb     | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 126c46df..e3a2708e 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -21,7 +21,7 @@ TI_PKA_FW_VERSION = "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 PCM6240_FW_VERSION = "1.0.0.0"
 
-TI_LINUX_FW_SRCREV ?= "ec029baad8b4b147af8331a5e099ef891e5ae1f4"
+TI_LINUX_FW_SRCREV ?= "5ee4bc3535481fe9831c0223974101e5714e7357"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index 82c0441c..2318ef4a 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmwar
 SRCBRANCH = "master"
 
 LIC_FILES_CHKSUM:am62lxx = "file://docs/license.rst;md5=6ed7bace7b0bc63021c6eba7b524039e"
-SRCREV_tfa:am62lxx = "bd4afc7d9dcc492b8894fe88a666c880b2fb1734"
+SRCREV_tfa:am62lxx = "04a8132f33bc1f70b363d1aa203e58f7012ea535"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH:am62lxx = "ti-tfa-2.14.y"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 31fd341a..bb841fc3 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -4,6 +4,6 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV_uboot = "f6338e22d2ac0777a68fb0f295f4cf1e3e63f659"
+SRCREV_uboot = "1612e4d1deb11d49304c715576854b28cc10e34d"
 
 SRC_URI += "file://0001-binman-migrate-form-pkg_resources-to-importlib.patch"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index d3a00652..1337b373 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2026.01"
 
-SRCREV_uboot = "617c6fa1c50fab2acb3955b8888ec71ae7630769"
+SRCREV_uboot = "ced00b83625b0270e481d517b76313cfa517c2ed"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 21baed23..64a5e0d1 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 = "ti-linux-6.12.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 = "d7f2b5b19f14fb51ad279f76fbeedd0dfd40b69c"
+SRCREV_ARM32 = "c6cc0cab5b8575a2a70f0c4f9dbc9981f367d8e3"
 PV_ARM32 = "6.12.57+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 33972782..61cef2a6 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -21,7 +21,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "4e3bcc10a5d1e9822e0ed2dad5cdd16f7cf30fe6"
+SRCREV ?= "98bbe0d37952d0ce1b6508f108c357ceb6d58bf3"
 PV = "6.12.57+git"
 
 SRC_URI += "file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 306ac881..8a3a80ba 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,8 +22,8 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "4c3bfa15a22a5c6729519e730459c483c125d5db"
-PV = "6.18.15+git"
+SRCREV ?= "6b2eb7030f32ff300e925dcc01a15c9ec4f3e470"
+PV = "6.18.32+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
     file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 5514f2e7..a9ec110c 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "b042b729cf573537f68fa3ea5050f5d22b07c811"
+SRCREV = "fcf2909c4d225f0116d7d497c511f5d61029320c"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


