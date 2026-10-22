Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18570.1792659368036587601
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 01:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=SmaZIef7;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=MLLKr9Z4;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69M6wn6s3671509;
	Thu, 22 Oct 2026 03:56:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=rVwGBPDdlxFvtwTehZ4IDfkp/MHq9DHLwIllBdhmM
	cA=; b=SmaZIef7UpPSN4ZPngO2a6DnNxQlr9aHxofW9D8VQpYcnWOuBocvoqg1y
	d11r8ZB19yWL5nIMy/9Y7mAg8ZI72X2AZY8Bi1R5pSHQ9EqoMBl1W/AfrYQuiEO9
	JDoCUyc7s4y5FSycKojeIq3lU4mFm2NJzPghEvPvNdB/RqPAr9Dxop5vmVrbdXTl
	KPZyLtdCjGHWBey9pWIlZ0i+yQx5BKGAoA1Q4e8CFxTBvm24XTLiLQpdV+4AQEWZ
	ZhwFNNlebRiZpBzBXLYD6jqZErUtCw0hY5kA2oE8FqUhkzcxinkOQyac+sKtFci5
	j++qtLGIsCFbzsizve2TSiyms8Khw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013018.outbound.protection.outlook.com [40.93.201.18])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hf9hmhwj1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 03:56:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWkGNqYkStepWZk9FNdpV+Hunbtb2OY9pz9RVHdGi0h+cLdOvqVmc659uSP0DtDbLmdpGfUnZZuBSonBskj4Nj1kZCSr6qX7wxqvbH+jxDpTQNhKdKKKFBevblrhCEtTMz22keBIu30GGabVgQ2REBYFGqoSGmmXemeBvYnqf4W5iZ8czbzfvtk9uc6j5MqCYGswjEL/d2IM2Y105rPdgpAtRGblMKiCwQYTiIEdwwAvkV+aaWT6Q94McAbGbmV/QxuyoKNh9NynlRxYWgH4DaM2Yu/pTSo1uHF2k9Y3yVCqDaNKrxTiDCEe0VJDNg6ZQlqzS/N4yEEu0ErJ61b6hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVwGBPDdlxFvtwTehZ4IDfkp/MHq9DHLwIllBdhmMcA=;
 b=kpv0tGEJu0J/2Ys37/9EZdoH28apcQxghbU/x2sVGcjRHdX67iVgPnFihTz1VbRLURpNKvaOnU1J5Oo3ukySeuZTnTD0jnNXlWUrVxdMvFuXpnh+jvvD28Njfg1HYRAx1MxVrPCd6YcwxPq3QijaFP/haegzGri5pAtT0pKY98bqxQDiYDd2r4WTGlM8/fDwTvtzOGttG4J7F0cFi3jxO0qa0ppPckwgwXDjoTDY4+tzw4u1DZcWLZgj6I5xaypt2O5hxlsbyeK8tMOSvx7i0jb9I0JrzODPmXqb6qZxmVwXl9ImqTM2MTt+SiDP9vZnNJVlBc04ex1z1eS48K++8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVwGBPDdlxFvtwTehZ4IDfkp/MHq9DHLwIllBdhmMcA=;
 b=MLLKr9Z4QqqrWAHveT+MGS4vX/nJVuaZSxlF36XQkIXt/Ctg08iXtd4uyjujqq2OwCZltQGtJmkfWX8lctGC5FnC7aInkR/Egqahr9fsQVD3/RNVt6obvFiklobg98UrNsBexm3U0nXez+9kauBe/ahokean6VjMSzicKB/fRcLhf1BjjWWhpwUvjoEFr6Y43zso/EZgCmy+k9TfUcmVNrGq7Z7GjXSO+WKxTPWb0L53I/5Ht9uF4hcyjXYQE/Lq/lDWlTEXpnmPjmg+qmp6nl/htcV0J9bUZr8/m2Phfy0m0Bj+OyEL9JZReA+DsDD1qvM/vBUfsN5cMIE2+j0/9A==
Received: from BN1PR12CA0015.namprd12.prod.outlook.com (2603:10b6:408:e1::20)
 by IA6PR10MB256933.namprd10.prod.outlook.com (2603:10b6:208:5f8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 08:56:04 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:e1:cafe::2) by BN1PR12CA0015.outlook.office365.com
 (2603:10b6:408:e1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 08:56:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 08:56:04 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 03:55:52 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 03:55:52 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 22 Oct 2026 03:55:52 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69M8tqk53277737;
	Thu, 22 Oct 2026 03:55:52 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 91E419A9C3; Thu, 22 Oct 2026 03:55:51 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Rahul Sharma <r-sharma3@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@konsulko.com>
Subject: Re: [master/wrynose][PATCH v2 1/2] am62pxx-evm: Add OLDI config fragment for Microtips MF101HIE panel
Date: Thu, 22 Oct 2026 03:55:51 -0500
Message-ID: <20261022085551.628908-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261022085156.1753733-1-r-sharma3@ti.com>
References: <20261022085156.1753733-1-r-sharma3@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|IA6PR10MB256933:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da72379-ea59-40ae-d190-08df301a4dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|56012099006|261009223027099003|10067099003|18002099003|22082099003|13003099007|261021121427099003;
X-Microsoft-Antispam-Message-Info: N0R7jDG6UV5jpwNSPQuxfKjpJwoo/uWwYkdx7+cCamLtQTOVC1WKWyw/Cmzs7IDbK8hcB+tRNe+6AqcVn0Te7/Zy7I0x+juTR9UhZ/7elBGPRXu5vtIUPyhCy/Dj8kX3ARqtMlMZyp0hMizw4/LS4c3gwIX4hztLCHS7dLEaZe4siGgg9w/bvWCHx5IjQxtC+uy7JoMH+O5gWYoC1EYi2eBS4NdT0AgaL7tRwvMF99D6HNKWtavymiMtYV6yYhOiRXL+rCkEnbURuWetu3+h7HykYHjB5XHz9VMqoP1JguJaTgsqhErcXsyukU0VlD9hwGoq5Q7cce2pf8pKeRNSsCuyMaevplhjPAdervWLwHRNMTSDMq1mqn7/aeRMNnh54OHc+wrJGfof+QuSeZGCU/YVzktssdPc6xAo1x5qhpQrbd9zh1TXjeD93B1aHMelY7a26D0F274pGo/sUL4ZwqPKDBsldS2c9P7eTpxw8mnpNAX5C8uUQrZfGi+ftuuf1IuyCnd+EszLgA8SLY0Mo3tABHdCRJSi84HiQmsmnL/WvfrMFQ2hyz2OEEzWR4ziQ7YlHfbUwg1qbDCvGH4/PPW/cZXNvCrxdF0MarEFup7dgRnzPtaNF+SQEdny/AZqO2lbgk4owJkwautxJ6gX+d2JW9+ycwgpW7H/VGR3PSY=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003)(13003099007)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rh8tr47gpTNuBE/KesfhZV843Eayhcgbl5qM3MwnE+T5hNIaRJzQL70ikEDEHg2igihc+BQ2zLTHO0phMkjttzRBg3Msi1m8Gl1jVb7fj+98ICdFnKEsV2/wCWBM5YpR1DnCV9g65UxEyfNo7yDOccQgz56WEY6PEtXH3V6KdpVGh4oXk9MkpsuATAT2GXop8QJCw5Rj2Fm12au98QP9CIXS4zthe4GTLDETH3eg7DyWiqMWh1KKl9zBZ79zEWb0zBK0XAL0D/6C8sU6t/GQhh3I75DAQdwUh/c+XFxbzeLIHJCCaAkVecA5sPX1GbizM/EWxrdCxGDWX2m3NPUQEwSwd4Avfcj7TcQwS5xWo8YZY9CJ321oHmYilI82dY1GwA+5xkrecOMvdiXAfwwp3F2KG7WA2UezE1VX4qEHzg25m1syraGoLLik0LIU3juK
X-Exchange-RoutingPolicyChecked: iu5qolJa1RIhHC3kiwZk1Q1yZomIvtbNl9laDRwKkNHaE00cwvQMDPFxDpkep8quEZDpOkFjRPsQLiEgODmVvSzxJew8Qg1qrqJkd2shz/3br0bTkxWqKshL1ZZqWvmf74q9zweDcc2R0OlReWwCYFgqOeG9mOPhKWg4xBctuPx0Ml9XGmxXL9FMywHnQM65xnU26vsaf5z+a1x8yqAdo4yk2Yo8XVjv+E8/Dpx/Hppe9A7iiG3BtfD5/8CGhEBj8+g/j/PVHHbSTokGY0F7d3DaGpF36HBaILzbV5FTDdgXt5z+VWJ7koHZaYDbVCf2e2yHYWArRWzw0Y+5RByYlw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 08:56:04.1065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da72379-ea59-40ae-d190-08df301a4dc8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB256933
X-Proofpoint-ORIG-GUID: xXyQuPhOvnLpwQMPSGLBek9m_i1Mplzu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfXy3aytUJFkrbW
 brYdC112uu5+q/kM2peJGhzD2htzVPSOtPTSFVQOHUzitaNMt6DRs9ykZgOEh9VbGyTATeU1I8C
 +Wyej55vnJE09YkQTHAe7q8xJLIeqfyT89OI/0Jdy3j9Onzd0R0bhMxJwPTB3w8i9dBPuzmvV+f
 cS3DzqXFgyQp9kRWGbfjw97obYqYI02jIKRjfI9PBRZ38AJ8a8xBtgbgDpKAj1SQvxocXUGA9wo
 seS0nh0IE1x+xkskvbmo0Ygu7J4suNoInEWKD6IRmi6e71YIwq3jN+f6jipMPtlzwgJHRokJw+X
 Pe2juTmYFdGmdbtuGjFK+nhReeNMzYhHsasCP6mofvnc6Obfea1SFL0xqldMXqJwGsRxUwEH3nY
 P8Ice4Ny+GYFz6trx0kKP2rs2Kngn3imoGkUhOu50W5GKTr0FNiJbXsWkN/T7WryNzaYIgvufG8
 t7/shA2fZ++eXzDX9WQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX59Y3rUb8T0Ox
 ugr/cyNui95MPvItCE4kPE6MYDYjFVcBvqtAZqq+BRzgFkuVoArGH8aMeCGXBHJbM3LzvDeMVBS
 1eUwVYaBm7quXMByeacYj7dw+GMOLkU=
X-Authority-Analysis: v=2.4 cv=O5qsLx9W c=1 sm=1 tr=0 ts=6ad9cfa6 cx=c_pps
 a=bOzAxYZ/tHfqF28wl7V57Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=a-CGDwnwlSQS433fJNQA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: xXyQuPhOvnLpwQMPSGLBek9m_i1Mplzu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220035
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Thu, 22 Oct 2026 08:56:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20483
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261022085156.1753733-1-r-sharma3

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master/wrynose][PATCH v2 1/2] am62pxx-evm: Add OLDI config fragment for Microtips MF101HIE panel
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [master/wrynose][PATCH v2 2/2] am62lxx-evm: Add DSI config fragments for display support
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master/wrynose][PATCH v2 1/2] am62pxx-evm: Add OLDI config fragment for Microtips MF101HIE panel
- Submitter: From: Rahul Sharma <r-sharma3@ti.com>
- Date: Date: Thu, 22 Oct 2026 14:21:55 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: e3fc3f475ed3a2905877e596a9fa41cdccff543b

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202610212200
- Commit SHA: 4d91cde5ee6bf7e64cc6efb09844a61c783b7821

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [master/wrynose][PATCH v2 1/2] am62pxx-evm: Add OLDI config fragment for Microtips MF101HIE panel
- Submitter: From: Rahul Sharma <r-sharma3@ti.com>
- Date: Date: Thu, 22 Oct 2026 14:21:55 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: e3fc3f475ed3a2905877e596a9fa41cdccff543b

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202610211800
- Commit SHA: 6c960b2cc85b73b69c6ba0941c3b21274a8bce91

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/linux-ti-staging_%.bbappend
    
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs/ti-core-initramfs.bbappend:2
            TI_CORE_INITRAMFS_EXTRA_INSTALL:append = "${@' initramfs-module-dmverity cryptsetup util-linux-mount' if d.getVar('DM_VERITY_IMAGE') else ''}"
    
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs/ti-core-initramfs.bbappend
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887

wrynose
=====================
PASS



