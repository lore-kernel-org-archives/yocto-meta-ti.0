Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6041C44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 10:45:53 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5672.1783507551615543586
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jul 2026 03:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=LxpXRpy8;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=nHVLCwJs;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6689NFCX1012552
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Jul 2026 05:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=E91ljiUGye+vBUR4FKys14FprisINkcejpYOTUqWg
	AE=; b=LxpXRpy8WXlk4Za3bTLdwXi9QLPyiIw7bGtpD9KQJGGiBv/omMFl9ASqD
	EdVTH1RwExpcOGI3kHASFbHchyEyt9hdtsIF93VsTvL18JS5SfkYefyoX810jU94
	CDa0V2UQVDGTKzq5lgcuvna4eA1hu+KlzyLBoz7pbD5gD2839zmpA48tq9CPKs1h
	CyTI+rTVtszXViebsXx/5WJUVCXEq2arbvC7gcGbDYWK9WLIHJFKNekLpPozRGTd
	xb5gQJ3qfMhQTw7YLRpqDF/ZTuSD07unt/jUWC4uDY3SaJQK4pHPy2TLyhyMqVBS
	zpigmQxMQ63pYJYLc7CwLdyGl9tOw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010046.outbound.protection.outlook.com [40.93.198.46])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f9kvd8bpy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Wed, 08 Jul 2026 05:45:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qWVX279V76MhyQVaYm2izlZsIjgBtaNHWmoZGk8bSCoNacXCNepFS6xO9ubejJZAlRtgPghRAyz3kheWogm3Oe3xHZ9yccDGEsvWTxb+gyzW0OI6x3sobAmtiikc0Kqs8S9MEYmHQuzcnnQk1/ksTEWK30DTjy8efh/tCFODzXo4k2HntMD5GL6Fca1p9hOZMu2mtvXRp/om39VxMVH5i0N/GlKnl0JHp0/6HJMN1HDGEkh0BnofxEr0iaz0bXJwP2Y1v6Z0OjLLa7oLZ8xzjx+41UPvOwNJlLIos0IaLoVOHg393aJ7OcDdeMOq4+wGbFlnjQ/V7PrG2Nfo3Ml98Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E91ljiUGye+vBUR4FKys14FprisINkcejpYOTUqWgAE=;
 b=MSaiK5sdenN7KtlQ2ZUMwB3E+Dvwe3uj4VSj8VyV1f72I3DndEN//6+klYURi8TLiPqzvUzZ6OQYzNLs6DZXEboKMIAPcYqFuambSwCVNjXW5KaFmhU0/QzpM9oWPeuDVCGHYr1r7mXeGy4x7e4PVgRdiHBK14gqoEncIKjfyPNCBpz7LV4iZw7fNGiGZtSjz0dw6//D0Y0VJNoZB3LN2tvneKHi9ABRReTz7mouZuK0NLzImUO6vFVNKFsG2CyC5Z/4lL3Zv5n/rFS3ajeMjka7+iJmChhBOa+hPHer9jYuNpLASsRd+/s7VG5gikmZNRUgxwXkJoXZtgKSV0/NFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E91ljiUGye+vBUR4FKys14FprisINkcejpYOTUqWgAE=;
 b=nHVLCwJsvm8Izfe8fMec/s7WsPFuQWwrw9X70NaWLWxf9SIEF4TvcscaTjIhnZz634lk0zu0QVAzso+7LG/4dMBzYIFuM/JdlpLpMyaGTsXngIdWrO2nQRHGbxV4Se4Vzxuag9L7IbYVrWbg8IiSzH4NCyCcTx2HbGKkMkyrNC/8Z4aJRNC5/JAiYnBHLQMJpkW0YWnUAlBlKbb0Jbi7QVWsgubcacXz3OOBfa0UeML2JVQdeJ7rzavVP+Lcpb211mClYDqqiQhL7f0sU3S7kJ3LcynorAa0i1mmZL4rLkHLmrTwpBuvSfXHTA8STe84lSnSSc15khF/pzfLkesCzg==
Received: from DSZP220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::10) by
 BL3PR10MB6234.namprd10.prod.outlook.com (2603:10b6:208:38d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.10; Wed, 8 Jul 2026 10:45:48 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:280:cafe::9c) by DSZP220CA0012.outlook.office365.com
 (2603:10b6:5:280::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 10:45:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 10:45:46 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 05:45:46 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 05:45:46 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 8 Jul 2026 05:45:45 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 668AjjEX2449368;
	Wed, 8 Jul 2026 05:45:45 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id E8948142E21; Wed,  8 Jul 2026 05:45:45 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: MD Danish Anwar <danishanwar@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <j-rameshbabu@ti.com>, <reatmon@ti.com>
Subject: Re: [meta-ti][wrynose][PATCH] meta-ti-bsp: Add prusw-fw for ti33x and ti43x
Date: Wed, 8 Jul 2026 05:45:45 -0500
Message-ID: <20260708104545.3724411-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260708104058.1287917-1-danishanwar@ti.com>
References: <20260708104058.1287917-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|BL3PR10MB6234:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ad502b-dbdf-47d5-38bd-08dedcde1177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|13003099007|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	2CUb3k74R6Ipl98QkVPs8Tq56dXru2/hguOam9JoAKjua1bU5pVuZIcNzBTOL6BuGKix8UtwxwIBzHo3S1XgNjadDXtJJ/M9YLskfj2AkW6QorcI44poYcI56D2B56sCxaFR0LXuYRv8RYrIJHwwmbTwIrwhy48MfuA/Gpv+ch/sqNB/rG3bEDvciWSDjSboeWtR2UephfVGZ4wp6ClvN2OhrtN9OFWxDhgHz1aQaEfQhxpEI7WFE72/CJgxAW00ziVzYqjk9wjMs5G41HVO2nRb8+9YUxmZSfSdPYyQpMtK1svnObSK1cAPnap0XQ+DR7/JgWU3zhIvm2E6onu+iTw2XsvDlCWhzhRkgkD2JyBiXLC9/ApORmoEOxCZ8WiYC7HYcU+X91uZmeYKgrUMXxBeiqVS14vMM1q0MhCLGPauC7h9VrY5vGsTIgh3v5E5wvwRX546JlNV8CHKu5rPFbF434DVqze5YMd75r3/qP7QNQiNCnXe6YAp565kER1kfRXs3K/WiXVnjj5l/TaVydBb+wSXJ99iDgMzH5RnLA1EmOEvCUNw7aaPNlsMnf3qy+AbRMdHl4+3mMNfb6qz8vAUXM+6eJg55kfUqQK/QXL+qnAzolNr9ovGvYDwYSwnPfle9toYSBGnIY4KgG7cKvoVTFdLanyA0GySn7vO7sohGqnXYoVUR1Z/nL6722Jj1QsDu90PzJlTbyXxYOhl0A==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(13003099007)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FkYlvQZy309jjUnk2MSxVH29+6bPlv5fk+Gpuqd8tCbQ7Ix+zA9PPwcV4Ij1sfeTquuX8qS/0dh48PSz6WJWdRu8gUNa9ozB8yMXsvCYAOtw22BwrJPQUF0ajDtU3y3o7xhwAYmSDU5vGyz3ahC8O45JgXj5U2uas6C61VNPtUh6LmslFZV+r0PMvasEkL7qu4foSzU70Jp9OsVdUGSMV+jyDlDQf/EZHDmhjGYp2Y89QfLq5dxbXvdC2lLZevYNFFYY7SM5k3AZy1QnyLORownHM5K9ZNN37rUq4tvKFKEyaCmg8TZzQawuP1Z9W1SRmOxZY/9zK09O7EJMOTTkyum61n/shDTK8Fq2M6NOjluIVIrjX2EPGs10IUBSInuTQGwRTi0kjItw5pwV3ECZg6b1fEex4CfLKnFVrWyYog97Gy4H9413ss/rwyrhVfaI
X-Exchange-RoutingPolicyChecked: 
	co/qjuqBjW05ZPLZOZ4eAcyCTyCYVdNa3xxw+VmJdll0F6QZV0LJ5IMfHjnt2uANhNMvO7yHqHbde35EY5GTOoOfeKHFFuAQfCX3pAvf4cpyiGC8UgizoEzj2FsYQmRWkMZfSlF9y6HpqwH9o+9pBhCk26NF3rqoXEKtFEUklT7nvHZU1EK8tOszi4SaPxOHOj8clrTjlmRkfKcL93v3Emk5QtJU0X2nJurI3TiHW6St8WMgk0XXlXOQeExgQRjgftb+0ewiS7NfOr7xnwlC3fq1uYgCpDPd/mJ4aekrVUdLPBj4k6ewuMFjbo5bhzPXTu52eCpAVc8jfIOL6w1yAQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 10:45:46.6060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ad502b-dbdf-47d5-38bd-08dedcde1177
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6234
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEwNCBTYWx0ZWRfX92nzudgORw5o
 WhTIWKvTcpsWNHPuGVYEi4Ho5mCwsD1WdEIykrqP8SRHEU4gbiRvXri4OIC+531gGD8C4sOqLCM
 NyK9ADeET+Y4S4/DkX0Ma30qvJzpt5EYMwHsjdUacTmt4F3xJ3xR3XSP1OFPF8TY6YIOUNlNAvS
 mg4eAHpbZnrHU6ZAe/nF8ckpEMfpOl1YY85IX4HRpJYrmwl0N4Z9Uh/Rm0jpjoRyhU1SG8Ey4AR
 rkLxaf/yx+TX36je8LATMfLWcjwvf9xduOev2Erl7H/OzawDkNAvMF79VM9BuQcjuUPblBnF9cy
 c23fjFWNQcEFmXu+TsbssdNcCivuCYE/XTDS2ylXRhVBTd49gfkDB8k19UDvJlqj8wzmzCRUCUt
 VOj8QmyKti/i1IMvhyrmcmVWibx5ZeNMBP6RFRvvM0L6kxIH55OAxVcFC5jdWQnINbo4gftr2th
 2UZFcmcio0T8c8a48Lg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEwNCBTYWx0ZWRfX7dGnrAleELxm
 4pH/5Ckcw/RFVYb3P1lQj7n4gIBYLirLwZef1Zg6FIsYg7HzI7twe0k2ro9PLqM8EGRDiT2+MAp
 xuhDYCU3xeUTyKf31nD+n3AeJQJrnX0=
X-Authority-Analysis: v=2.4 cv=EP42FVZC c=1 sm=1 tr=0 ts=6a4e2a5f cx=c_pps
 a=HD8lxhnvDrzpkXyYnuuseQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=H8dp1nd1jc9GItt0_OYA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: eSLPIEIYOuiLdpOGSGNkQOoX-vTSg5Ag
X-Proofpoint-ORIG-GUID: eSLPIEIYOuiLdpOGSGNkQOoX-vTSg5Ag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080104
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jul 2026 10:45:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20129

meta-ti / na / 20260708104058.1287917-1-danishanwar

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][wrynose][PATCH] meta-ti-bsp: Add prusw-fw for ti33x and ti43x
    WARN: Commit message does not include file/recipe name: meta-ti-bsp: Add prusw-fw for ti33x and ti43x. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: meta-ti-bsp: Add prusw-fw for ti33x and ti43x.
              meta-ti-bsp (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
wrynose
=====================
Summary:
- Patch Series: [meta-ti][wrynose][PATCH] meta-ti-bsp: Add prusw-fw for ti33x and ti43x
- Submitter: From: MD Danish Anwar <danishanwar@ti.com>
- Date: Date: Wed, 8 Jul 2026 16:10:58 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 473cd96b3425ba1a179caedf1fcddbf5d4b5699c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202607021223
- Commit SHA: f24703b72226b6ccdf662379c96bd60c447e4dfc

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
wrynose
=====================
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




