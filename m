Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14068.1793088390770714691
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Oct 2026 01:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=mEfF8WqC;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=tC78Frju;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5j60l485527
	for <meta-ti@lists.yoctoproject.org>; Tue, 27 Oct 2026 03:06:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=z03xJnEF0DuVTDEs9vMairN7WBsjfDYkjEC5UgAyi
	7Q=; b=mEfF8WqChUcs/duX12VwnlIP8r+JI9pnOYOKw/BtriyblWpwAUszibhn1
	5rmeoS72ekWnIM5G4QunqNcsyvHAZzlK2bWgaaXUOLHiO+vHXgOGwYRYiuNgYeZl
	47ximPXiN3FCUFg706XXCk0G5YB+pmnDrQWYt9r820rOZhLRXm6a/B38YWqBmixD
	VLxZ6ix1dJG3trbPJTOKCTNJeXqKbuEomQ1n3l0FQazYCiIuf4AJa6fukmCQwBYI
	uAT0hrTylint8FjEaw0mM8WBAIkIcyBbTNYJgslvUvBhotWzqz/iIgnlDsp/OFlS
	HbEj6P2o+9ofsRf07c1MrjDPL9XjA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010016.outbound.protection.outlook.com [52.101.46.16])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hjp2ygsnj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Tue, 27 Oct 2026 03:06:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1amEgXxV/LH/3wwu+j0B/XSYRCYxtCVphQ91CJAGyPd+lfUvHxxd0W573hD6f/chz9az+IuYCDIcNlk0UYJnALkKXn926lLYgyQDXkFcG9FqO/oH9Kjo1Hs+GSaRrcvk9oUIPPdZ9J3UMfAHyetYF4TRI3ulQkeEX8dWzoqTxVlTu3Qfvc6ClflVwxI4rzVMu1bg1TIqJkOYhegjxOlp4PcbHEPxkJoSnv4GpOc9MStYGMmik7Qm0k298mclt46IWw69BmvQIOb3VuCUUKc0vJ5Z4gBFNrTxzPkiMe0zibUNMSv6715NntxZIwBLQjxxKodpPrhTdz5R7A6s8U0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z03xJnEF0DuVTDEs9vMairN7WBsjfDYkjEC5UgAyi7Q=;
 b=dN8/Oc1xr+4BLQnPatOn0RDXCYNQTXwIJILzntFJPypmCBb8pO9UnczPTXJuFIDxwOR4rxkuD6CLzPfdNwSQRovbOWg40S3zJ6v7XfwCMxzs456T+RCfNrgCTxnEU/kSLDUHYZgYb45Dl5D5qxpC4CgTznaiMLtz85k5D+LdagOJ0Hd1RZ+lF1xtAagG4TlKnZP8xFD+S8TTpzFbbujsd4WHOZEkuWC7AkrzNVmt166bQi1hd7G0iHszKNy2vNrDFqUAl72CcVdeLUbHBEGwi7d7tzqMTRp4t+zzgTQhnj0ZVsVZEgXaKbnugEL29cPT1yZTIcw07f9iiWc8A3OdXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z03xJnEF0DuVTDEs9vMairN7WBsjfDYkjEC5UgAyi7Q=;
 b=tC78FrjuROy4ZpXdldilpbR41vsXBXr0/UGUu4B8j+g0bBA/h3r7BznSYqBBgkLKsqDT6tAxEgSpC+HysZLdC/QHLC31Uug4UymskSlnBsXTzbtLPqosOLmcuTyYXF9v5/uZ9wIelgWXByMI5yQqE0V6oz3eKt/bu23i/7pjRpiLX+qIWUVJOVSoBmAH+KIRZ0u0PTpOlUqgX5vCF49DWxP1NnZ2HnGFQKa804+oegXDsvC5ELjcpTcJ+fETPoUT3YgylIaIHWvd/4ZYw3391imUYgndxHjbVFgOTq15M6mS83X8xaN86QDOwcVoq25Fq7xWPwRL9cKElEUhpxWimw==
Received: from CH0P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::20)
 by LVWPR10MB997861.namprd10.prod.outlook.com (2603:10b6:408:3c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 08:06:26 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::e) by CH0P220CA0025.outlook.office365.com
 (2603:10b6:610:ef::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 08:06:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 08:06:25 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 03:05:44 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 03:05:44 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 27 Oct 2026 03:05:44 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69R85iag645245;
	Tue, 27 Oct 2026 03:05:44 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id A4C7D142E09; Tue, 27 Oct 2026 03:05:43 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Mahammed Sadik Shaik <s-sadik@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][wrynose][PATCH] conf: am335x-evm : Bump up max_leb_cnt
Date: Tue, 27 Oct 2026 03:05:43 -0500
Message-ID: <20261027080543.953115-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261027080058.3446900-1-s-sadik@ti.com>
References: <20261027080058.3446900-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|LVWPR10MB997861:EE_
X-MS-Office365-Filtering-Correlation-Id: 71e76338-c23b-4e9b-4787-08df34013259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|18002099003|261026121527099003|22082099003|13003099007|56012099006|10067099003|261022105027099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: acQCdOjfKCjLXnh0V0Dwt02rC5SkroozrfCctuMWRgfvYtaLbBQaMApncYNCFm0KEqGUmd6cuXE1rVTyeMhFk0Okhxek/NpqjndM3XAHqHBShqTg74VPmmSvinyVdmopK8KxNrr+bOjpquuUjOmGuyfVSX6HX6QcHnrr2uL6n47xyBuexOzsfpx2mZWnlcRVmoCgcq5NUO+KrKcQJ4p+PXvNYq5ULIL63gnjQ1C8i6bq2AW1+ZcUQbJguBKkjHvQLzDRHDkWviqQJbFpwc7xRd7QJFQsuk8qNG1Acvak8QI/NEAytD1CQ7CfkWakMV+pD/Irp+SknmZNjx3zfjfsuO/xIppW6NtcfYN9fByX8pPNdm//AACabDc9u34j4A4ANH80aMfUxu9Og3Ju8pHObIf20SfXCGmY9XkOz0wgVdMVJ6co/EM9RnogVQ0tcz+kNHbMUZdV/x/LyxQU6O3kc7rdFxb0wMP/0xJgZQZMXXzJKFRuRcDf3M171tdlL9EMCi14BrjxVLNxp+jzAsiOGl7vck7zK/U3eSN7lSPwRXSCC2+alU0DvcSrdRrMKi6LypUfEW3TjQltslYeNlUGBd3xxI8eaEnSmnChkH2759YxqlHhps81U4PfCol81WYo33f3XH6TGC3ChgccaJ5NKA==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(18002099003)(261026121527099003)(22082099003)(13003099007)(56012099006)(10067099003)(261022105027099003)(261009223027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OmmMkH2Kop6m+gVFV06G6xqlsjeUeJj/Ovc1U3BJRXHc5vEsfxvy+jQt5zUu1EfxVsVoe0GJ9h6IH8sWgJafMQytjakwGAdHregEs8w+2s9/bxbsa5x7bpybYC4c8g7l/GPbLE7iFsPRV7SMgcuPUCfY4Kvcm43pcRPpb5UMWzs4ldAH+5bRcViwBLI4ACfXSiyGoBbsJot3FmU7lLSfN9Juh5fDsUpa+LFx3ikYx2dPQkT2W0yqVtc9+1RKulBN9qjE3zhictrRIK+PpUHYSAaP15YAofAL2VBwZ10zQlzHc66N49lXbctLJW1s2OvBwIjRUjhpldig46cR6J9fwXkYV3IbCXoTCKfl6D5U13COCnOh7Zp5vOritb2E0kn5fyuIVvZXR3xyZzz03e3l6AmkmTHD+IJDTveGIObe4etOmW5XJfpwseaLuFXtsM9Y
X-Exchange-RoutingPolicyChecked: Jp6c/tB4eLlrm1tm9HyW5aEkakE5DTao6OVbLt/fgAmRxx/SryhUP2DguJNZafIT8Xg2r3Z4KVpCwhCUp3o0b8heyDeUe4eE3n/OWFBUkaFYSpPum0JTeL1Tgbte1e4riM4TinYYvkYwKo7IDZ8k4ifnk3ji6JIB1UHcTUrAP4Sekky3SzfPikw/GzNaW091UyTtLphWg1MKRyG6Mon0EMM+iluYx9CKW2qzmP98YDpCN/MPJgmQIkKdr/I+zSNUp8iuREKXqfxdAlhgM7l/6OPkDMGtorA47eXWB/nYjw9ale+PMa8hTZLzPKai2542BfEvQg5ucz7y1MZhLKGIqg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 08:06:25.2994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e76338-c23b-4e9b-4787-08df34013259
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVWPR10MB997861
X-Proofpoint-ORIG-GUID: ijJyMrYt7F4l5RuCYTZDmTWjhieIJvYY
X-Proofpoint-GUID: ijJyMrYt7F4l5RuCYTZDmTWjhieIJvYY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMSBTYWx0ZWRfXy101jCiYIpub
 VpfeQ7LfB15eIByOiwC37n96zlea8KoUzR22KHcr/7V/G7ix65WC7Y/KnABc7wW1hTCs7SgSiqU
 9l71uK59v5RTDvHQb5FjUxySIdAhIfgjmSMtXYuRPtemHQaaTcNEVhabzA2euWGnWZ3Hpe5sHVl
 6ZQ81jjh7NkbdZK7ww/Coe4os+9SE8C8cCBfcx7tIKC785TBYA+tzZspPzSUCMYe7yKkp+E1Nzv
 x96YRp2+6UMXglbAHhqiw4Tnc14V7WYPOHqqaGHMdNPjR3TG0CXqpbHG7x9Rk0zftJNVYdit2dK
 ikb59PDhf+FV/2FARScZQ+xSD91NsAfpTrFpyUHn31scsFod12p3yHWcYAdX+5qzfP7JeFbwDrW
 WGEvTuek76VgiBX4L2F347IMYlkpu2go0k2gOKbMJqFuNtR6oPj1pKQ10LVhr7+wThUhsAEF3Q3
 7Gr3VR8cTpAisxb5GUw==
X-Authority-Analysis: v=2.4 cv=FbaiV5+6 c=1 sm=1 tr=0 ts=6ae05b85 cx=c_pps
 a=+tUgqrp9vGCFEjR5l+cGAg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=sBNHsWmQaPnKv0l6e3QA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMSBTYWx0ZWRfX5xFWnJGYb4zY
 5nOScg2W0aotaInJS0casEbELRY8G/fUX+xaDoYeF+H7qqAh91Ywg6jXMYYPluy2Ta+GOe0KnGv
 n9mw6p4rWDtCMFH93oIbwtApYJuTYzs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270031
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Tue, 27 Oct 2026 08:06:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20495
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261027080058.3446900-1-s-sadik

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][wrynose][PATCH] conf: am335x-evm : Bump up max_leb_cnt
    WARN: Commit message does not include file/recipe name: conf: am335x-evm : Bump up max_leb_cnt. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: conf: am335x-evm : Bump up max_leb_cnt.
              conf (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
wrynose
=====================
Summary:
- Patch Series: [meta-ti][wrynose][PATCH] conf: am335x-evm : Bump up max_leb_cnt
- Submitter: From: Mahammed Sadik Shaik <s-sadik@ti.com>
- Date: Date: Tue, 27 Oct 2026 13:30:58 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e4acab130603666946b82a5972443ba43e979e2c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202610221956
- Commit SHA: 7baceb0737e457b7c9acefca00c76dbbb7cd6b72

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
wrynose - PASS
=====================
All checks passed



