Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7608FCCF2DE
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:06:05 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35317.1792418763486229234
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Oct 2026 07:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=BiN8p55x;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=LnbGrBSb;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JDwZqw490200;
	Mon, 19 Oct 2026 09:06:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=vU7qslvQP6+4FuaSKb5CCFIxCYOpmLN7QZ6s544aG
	ws=; b=BiN8p55xPKt6A/O2gg29gVU6yTA/s84Z0JnJeO6ii34PXD7Gv/oC/4+YY
	RC6Rr9xU5qgPZGV8h1GnLD3gf65nZpyrE9b29FlLnYR5I0VF/CWt50MDgWqyi0QN
	jiYZGHVL6IHVA2tfk5P9lJGYNDP5pGlJa3CPE6Lq1wCdI32wcf9Zg1Zwlt/ZV+Ys
	z0A1cVpdee8TXBedkIvvHyf0kvqrC3RNXv8nwq9MT1I1YXe4E7+d9Ukar6DFYd7o
	i7Sfn8NrVKmJshTc8G5Or2ycddPY/rTF5RnRZ6FUD2IET3jYAeIqQ3gcnp9KckCG
	jibm1Cu59blQ4SK3DBZvYEjX6EpNg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010028.outbound.protection.outlook.com [40.93.198.28])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hcrd5xe86-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 09:06:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X37QrYtnilfmVfc8EOc7LvHu8fW3d/f5Zz4x+28ocCqhZhlH4SsAI2/XdOFF4JyKVmTWCPNuRDP5Lb3AE8FI6xwAeL9wmaoYGoNcmSWz/YHOKQzRB69Xwi/uxOqhAZljM1b480pibyflY/nVwaxYAmOwEp5uY2cZ5Ujs0SVIDrn0CORMajY6gv58YfsX5YmHJ8PzSi3dULCi7hlq2i6t4OSU9H8J0AL/b71HC4MU4hbnk+9F6hQukQ2Ujw3dv7doni+0kO6erTt1KGhwWSdlB7eUh9wiEY+cLWdO7dnXEkuiB8cKvQ9PrQdro8ecT1awBdIb1O1EbMspE9BIDQitNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vU7qslvQP6+4FuaSKb5CCFIxCYOpmLN7QZ6s544aGws=;
 b=G6RooMf66BzqOV03dqpJ9FJ/ydmxlvJCwnGmD+tt2KuNaS9VmlTyn/0dSBtFCG13keLxAQQLIcK5UtE+y/oNwE4UnFBAfeaEe2GNMutRTZicxUw0INoBvzVSMjxr2JZLjk4uI5NZujWz+g0KozqY6sMWqCg2hHilE7Eect1qDEEIroiJUwYqGa3HTWA1aPc7MgbeuM0TaOcr77vvRpkUilCa6ymh6PO5r2ANExXBQkdAE4Hunc2sEejFxkHHFYBjKIRqlAOCIcuqA1S3aThEfVag9vzFI5v0R2XMPiZkcTrZgrvBjJYtPsvtdQsT9GkwwHk+abedBfegA3CRPQwfdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vU7qslvQP6+4FuaSKb5CCFIxCYOpmLN7QZ6s544aGws=;
 b=LnbGrBSb73I8BYvdRasvCkdESe7pAQRpkaWnGBih7yzUpoq1JnCy58R1tfkxKr1xYAFyHIfEafhOly6GtGLVkC5Qib208YuEQMDuBqzBFkSxeddvA8Dh+juF+sgKRAfkQAy50qg7ZibF7FG17uTC+1GIE6h91zNYdeS/RwdvwKTMHuX6cPUAlftATkyCgjuhvKFq/Ify6lusTKjExGEgTURez+CwrmVeZS1JYRyRSZsbFEhjxiDTr6QE4caB5CNYjTFHq1nKNSk7yWGCXRWPBTOr09FaD7bApkEP2ZMkUzORPc6GUOG5jzI7b61PHqw7sPwy6Ya0cT0L5E4xEJY8ZQ==
Received: from DS7PR03CA0118.namprd03.prod.outlook.com (2603:10b6:5:3b7::33)
 by CO1PR10MB4578.namprd10.prod.outlook.com (2603:10b6:303:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 14:05:58 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::84) by DS7PR03CA0118.outlook.office365.com
 (2603:10b6:5:3b7::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 14:05:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 14:05:58 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 09:05:39 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 09:05:39 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 09:05:39 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69JE5dU33876013;
	Mon, 19 Oct 2026 09:05:39 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 048F69A9C4; Mon, 19 Oct 2026 09:05:39 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <reatmon@ti.com>,
        <praneeth@ti.com>, <v-singh1@ti.com>, <j-sahu@ti.com>,
        <y-hegde@ti.com>
Subject: Re: [master/wrynose][PATCH] pipewire: Set default audio targets and use S16LE format
Date: Mon, 19 Oct 2026 09:05:38 -0500
Message-ID: <20261019140538.2607547-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261019140111.3881999-1-p-bhagat@ti.com>
References: <20261019140111.3881999-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|CO1PR10MB4578:EE_
X-MS-Office365-Filtering-Correlation-Id: b096be29-049b-41fb-28cc-08df2dea197a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	9hX3bzgdp923dCtbg7Giqua1oWowm9uA9T9xFwaUua0jV6z/cAwqX5W4oLhNfBesWxYQWPfIOk6JDHx+gMBSgjI+vJUric+e0tVdhDSKivLSNzmVXu2zKYv9dWpjJaCHjDsYQ/fPuKjShY8ySwL5wrFcjXZ41VeDm/i49HWGJWHHZCW9+NOx7bnAZGACwQsrpxaC7Hes73PVcF65SG3iif3NrCSKQ0os+WdtP1+TldAVq8G/tK01xc26JVoAFPtYC6tKFKQm8E5trLKw8CIZ8khofXzwcaDKAPrc3P8Rql4J4S6xLKmagIl0lMRYaC9wcHEkWpH2RXNopIooFbtwen/ujpCUZNJY7r4Uq9XQeSuPWwP9o0hhhoKK0VQhytcY+JWlFnZSJXl/Mwkmr+/hvPbwTh0apB8LWG2NsDgkMc98Hh/ur35eOmlc0knTJv/So8JSPloa89YT7nlOM13enOznUEbWCZDHvSM3y1/x3G7WCOXCsVmRaGda0bmzTazAShPz1YVQsjrxeYMLZ7dsxYFwZ81pEXQ6SFuyaBYe+ytM6oq6/wOIIR1tpQrWCQtAfnMIUUbWGkkVGEaKblFdP6eSy45AJOS8xk7yfaX7ikQC3/LE1wyqOUu2C1OTHqNkzGUsUsNZKk95CEcLp0V01g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	GpetoW3fy3E3wX8/7n1ILPaL7CMX8Y47sKdo7ac7IN+LxuO+ipCY5FR7Fcb8HoDPrPteXWUmLCU6NPV5TVE3kHStW65W6LpN0RfrpJaa/TH7EoP0ft3snDHnjLAaMu2UzKHeV3Jjh6KRL5EV+szUZ6A9jFzd/E/beEy/MhU/kpEDUymsqPMwJc7I848ajvMwx7MEShNIpppEJ1I+JMKdYJvQEo9DZIpZzv6EN+vWvBmMYI2rHu/aaRnQf4xZWAt9rb6WumIlmwAsFhnjUHwMRmctjpfpJk3rO30W1Riev/hdo2mJAF/RbH7/hT1N4BqxPmoGLRefS3SbP9zTiLRv6nECU5wtq8vE30ptaNsMgdtnorA0/pYeJAU74q383oEse6RSoqZc8bi4NfNltwzNBbebmGDZ2J5GxNeGSb53Uldr/EwTDT1ckut/OzRx7zwz
X-Exchange-RoutingPolicyChecked: 
	KVvPxKpTR7wXuJmhr7NNw9Fh3xDpfCzJ0P3SvwSdgQsZ6vQHq6moVAhihA+5Pc8+S8W6yLhq7AKrSmo6E/cOr98gTguEu38Y4f1yHxUMSAEa5WOQ8Yp8Lk8S3wPUjInVBs0MWUMe8+cb8LOG6Wi2oGFhB16y/zxCW2IDlPr1Tx/O/QCqZi0XN8qUPuHx1l/o2fKTVTNCUCOQhemrdg2yyCwjQLNUw10SmnFGNYyVtGfcQKPHiUIJL3RoHAS5I4h07XjsFw8I31NR2yzX7Unnhq7iwf/JmJHkwDtUfwccGxqaxxMOivVQm+HX06gh/YOI57VnE0zSPB1QKTVfG2gHXA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 14:05:58.1941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b096be29-049b-41fb-28cc-08df2dea197a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4578
X-Proofpoint-ORIG-GUID: rbvIsawuFiSEpwzHYORvBIO8O6RpDl1E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NSBTYWx0ZWRfX5M4PmZ+DLRaD
 PW6D+/dOUmb8gdgL4NNBXqV3UbPTgBCfLCvV6nnNy3fDsy8Ew8tIOll9kX6dvAZg9LkW/gLeFb+
 ffaypXKBOtLCvLrrmAW8pt6MgxuvnCtgnT7O/QKnKMLWQq/rh0/xvvu2xpB3cfAsEhdyfOS+imX
 gR1YBJRJ4VOZhfvV9eIVQOjkQ5naSyO+UyPmG6eDis4iQ2AGgDN4c0dJQEMcyWnJp+XD+n2oFzi
 vhvAiXeTzEiawoVWTohxou7XeTpgK21h9RJ8oHGJ+eWjEWWbtjF1sSYa6xyedy5TIotInHGbEqW
 rutAr1BMUYKCPqW3QGnZQteLhiEGSpbeMgBUrDCfsaADRONPjv2VZAojF/LgdhJpMb+AFuGghFX
 54tQ5LMqwbn6om+wIAw2BHP5r/Ykgzk2c4qwGmhGVQ5gSRxP8c+5cRps2DqFPSCRygjEjtPnThT
 +0Ua8/GH+kHNtvOk4jg==
X-Authority-Analysis: v=2.4 cv=ReYFmFtv c=1 sm=1 tr=0 ts=6ad623c8 cx=c_pps
 a=W+OgQPQm/Pc/5TU0+uq6wA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=aiFUIUhQ_bfqkH38MPsA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: rbvIsawuFiSEpwzHYORvBIO8O6RpDl1E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NSBTYWx0ZWRfX56WbDvu42XJW
 +l5IVPwB3nfCZUD+QGkgwkLKbbmwl7affWhXhW0hDCrZQ5Mq+qEeec7S5eZeV0uL67pX5VYBpz2
 VKaXScHFJqrl8R6dj+EMfRVd2vCj7KQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190055
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 19 Oct 2026 14:06:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20467

meta-ti / na / 20261019140111.3881999-1-p-bhagat

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
- Patch Series: [master/wrynose][PATCH] pipewire: Set default audio targets and use S16LE format
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Mon, 19 Oct 2026 19:31:11 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 198a0c66d4b087a636a33f6bc1b832b132ba37dd

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: Revert "k3r5: Fix mc:k3r5:libgcc build error"
- Commit SHA: 03c17fcac2fac1f2b7f77663ffba8cee77f2de8e

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [master/wrynose][PATCH] pipewire: Set default audio targets and use S16LE format
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Mon, 19 Oct 2026 19:31:11 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 198a0c66d4b087a636a33f6bc1b832b132ba37dd

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: flutter-wayland-client: remove unnecessary include cstdint header file
- Commit SHA: 03e3d09e35955c46c67d19577e210261efea4f27

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




