Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DD4CDE00B
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 22:09:55 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23449.1782425385504863182
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 15:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=XRKZUS+1;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=NIdlNeSa;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PHiPxJ3869930;
	Thu, 25 Jun 2026 17:09:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=n2BiZeJVwn8a99Y/OyHgvgYAy8dcfKcyHhvgGJVBK
	YQ=; b=XRKZUS+1jos+PnJYYrIDxAtNVjQ4Eli+zYifkNaYGDOW1GTbpEr+rkSWk
	fryRGm0ite7vGC9QrDi6mUBdx5ObeB2rpCI/w4QjC4lJ39c/0SPEBuArRerGNcwF
	tiVTfsSJILey0ZlorDk3gMHwftISplUHcuLLJpHXVwFC7rxzj+CWTtSUNeFgJhK9
	ZAZ+2VYGTqv9MYO1CmcgTL533zdLFYWzQXFGJ0kohUa/sKQttBstiFK0sEb63hg0
	7G4spjFsLFdxnl38XcjB2orZelFUJ0C+shrxjxb9rccPYAGEXIwB/rAoTlHl0w3s
	OX/ElfY71+B9hzCG/L2tdbKhECJsg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010044.outbound.protection.outlook.com [52.101.56.44])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f12jcm58m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 17:09:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSQEybV0S1pk4gYKtVZNAXEocr+I41DRVmjvpBRx1ACmyOmJWGpd4wJ76jnIkkmZjURAvZZkHraPUz1Fp3uyX4TrEhJEaghBQdJ3WkYegJtmzOUg5wlYskjVeoRoE6XxO+fJqSOmYdGJKu4dRhLc2ddjaytahWYktgS+0AYzbdhWkgd2U8DFT4c+y+8/qHYICtWyLax68BPd9ClvVWBqpod48+NMTaJQoo7+pN6Ebs5FgmEx4pZHalDaJ8GTwqXvT8F4AI19wQ6XLu/7CXJjxFEVQPAHidU2NQY70VYqql4hUAwRxj4pIz1t05HH1CWZp0AHmgcLLMhLlAT1pMMLhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2BiZeJVwn8a99Y/OyHgvgYAy8dcfKcyHhvgGJVBKYQ=;
 b=YWTHyjqKVwT5bYTdb1ruijN/EXty1qedrbB18G1LptV+OEGzT/PvCeedBcf6CLV2p5l4dzik+KIWb8+nzH4b+TVSbpzBvqcMPLJmn7btLlAzQkGnryOl0Mt3hV9u6FJjwwfTRe4mkrM/0bSmo1Z1kdQILdE2RLJlsNZB6IM7U3fz4YZUXdnBf1+7DOD2/vXyVyHLICo6MFNK1TSFknuz7JUniAtfC0UoO44BQRIqKUuoThJH/uIYHHj0datR8jd5YJNpJJ0/bFwHKedH/YkhWJiaA8P96NDF2AIKiakotIKQcCXixEV32AhXH2PxsvzFpNIZQIq3oDVf0Cq9KkP6Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2BiZeJVwn8a99Y/OyHgvgYAy8dcfKcyHhvgGJVBKYQ=;
 b=NIdlNeSaf9o02VPJ1zgswuf/8dikOxuGVgs7wOlDy3yBy0z6b3iGM2rRPXzw4TvGTnx1a5XFJl8hYVb38W8XoTwYNpVHVp29DzTly3FJm/DIGvTZ61tLBHHxW+LK8lxDXOJ11BgweUIO2LGif+ZG0ODKPKG8SY2xRW8DgI4ZCQOH5BTdE9tN0baZkNH7erwDjO5Fn3OwcHFPGPh+/xyY2eR4dNDHWN8SYIbNfgZSrFdtdJEC+mZxsKvMaI5I2zc3n0hOURXqMkKmcF+XG7mkCgmES5J+UjfdzrK1UVwrsZyPPJpfsVbySXKYOIj6WYIMlD+ULu4sabqnjVhRuoqmXQ==
Received: from CY5PR15CA0086.namprd15.prod.outlook.com (2603:10b6:930:18::19)
 by SJ0PR10MB4544.namprd10.prod.outlook.com (2603:10b6:a03:2ad::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 22:09:40 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:930:18:cafe::9a) by CY5PR15CA0086.outlook.office365.com
 (2603:10b6:930:18::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 22:09:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 22:09:39 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 17:09:38 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 17:09:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 17:09:38 -0500
Received: from fllvdckhpci032.itg.ti.com (fllvdckhpci032.itg.ti.com [10.64.72.43])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PM9cdS3681008;
	Thu, 25 Jun 2026 17:09:38 -0500
Received: by fllvdckhpci032.itg.ti.com (Postfix, from userid 60899)
	id 467439A7DB; Thu, 25 Jun 2026 17:09:38 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH] libsdl2: Set runtime dependency for SDL2 tests
Date: Thu, 25 Jun 2026 17:09:38 -0500
Message-ID: <20260625220938.560362-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260625200942.1370480-1-a-christidis@ti.com>
References: <20260625200942.1370480-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|SJ0PR10MB4544:EE_
X-MS-Office365-Filtering-Correlation-Id: 18eddba2-4a76-4fed-ea27-08ded3067353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	4vHBNIhakObx2cCiE1AVs+1XYDQOOkZbrxGP3+CJs3H3EnjA17njp8xVNwRzHwLBEMF2ztFxo0iafwKGZyp5PxxpS7fKa7hUSc8ph6Umo77hweDVOYoKcY91iV0RFQ97aUs+G4waSLH+3vedBBV82+v7T5WEbOAVjbbUXq7d4M8vFNWljrqshNsGju7p1oq5TS5O0dpRfwMg4n9XV6y9R5mTRBUpbbHTmMZzyVOOjk4EWcCca5ynDZaHf3AhiVia9yW2uR00LElXPT5648vVvzVlXgcwxZok9aFecrLK4XmHUdqonsLbpX9YML/PphRCwt1h7flVRIYCVGeKYbawvly2GouyLOOQRSaK5UrfEIfbUJ3AIl+uOEHZEZrU67uecC1EY36LozS9hsOutuWHw1F/l3JQs4kX3qM5HhdrbwSfyQUhXpymD09rIbFJglkrH/tYkE0njWDLnLGScI8q8VkGVaNkejLttXGV6yO8LPCuvabIjh0KBz9Qvr569I+yyQZN5eumIloC45kKvGPa3jdc/iKP8RAns34fBMtnjLJuJF5Utqh/xx9dgp963tuT6VQwH+BRUOgJsTbK7woe1NHCaihe/F+9eF3TuX5o9ZrQ5RLNRk8RACzf8cZ3ac6zMmDXYilWXkJF5JNWL7io4snWuvgyNYsIbXVRNlwnaKa6/luZl+cgUuJDuCaV9MO2z5LqE4vP2GZ04+ptNBY1+Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dY3rGVzYaJHMkK5WCxEBeBG5Cgnt+7vakZRpitiu6h9i6H/74Qdq0KU3mrYb38Z5lTDr+FeihT6WNwQ6fEV/ENoOZSR59eMkV6mqnK0ltrY8H0vnjXOZn+59b4r6GcATralNzjw7nomBSr9VpC0WZN3ycY4HBdZZplCK09U37Rsq4lPr9svB2uamBrj9RPIsCCYf45clwgn1aDCbUbJT6qMNySp9Grne1g4RmT9n0ND6/RYKNwD35tkzEOJxaM0+Z7yMF16X11cd8v9NTfu0STy83ZeeeWkgJINWFpw2aHFJWxCRsp6KQqIlzyYp3EOIfTLf+9QkYA9k50LS1JouW9gAT6lUP4ev/ujArupEoG626Hk1ld9A2cF+/5QH6dsHhc5ngL6iOXDlWgV06+m4eTh3DoLGbrrIxDxfN4Gdqd+g7Fi6e1qoFIYD1UkNZXDs
X-Exchange-RoutingPolicyChecked: 
	s/2QWFoXXrp/xJ4uyULY4taMtuaHWrjV4YdPhqOhuu/xqrGwpH20Rvg3YbUZCuHfhVmNQ/A7JR6HpgvmxGaEo5sPk4WKeHX31gAoJfcW1J2XGs3h5VSYXmE7XpgKWmPXPhxKGsBzC0SJ8UllY2HIC0UvgYXtvuPmkH9DaMmYrRUY5ojLrpWaEmpqbWKhhXCVUYM0FLFN8dKtH0IXNnoZYdntUz644RrPTkoFSXLvs+DaiwfFhq4C+sk7ms4Cpfq3M0Wq10B8TDn5F2a8pO8oGGu1zi926XIKiWcg+0mYkDi733FPZX/qeQDQ8c3nE59J5T1W27LFk0VjSZ8wsnHnXw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 22:09:39.0515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18eddba2-4a76-4fed-ea27-08ded3067353
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4544
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE5MSBTYWx0ZWRfX5KDyEMCTphEJ
 u4YX5AAwUfS55fEHFDGy5ORt1uLYbfBd1m6DSroS8Ivq7rJzz6r3khmCnTu0nmDnPFfP2ERiOX1
 XkW24pJO/EdhqZmmn5Jy5z15YLRXYq70ExDdIsjMqLVDDh0N7fixBJaCP0tiFfpjpucBr7wIyxn
 Wzn0KdhNVl1tUu2l0DhswIAH4zWT8DpvMx0uzExD+QGedTfjjfEUJ1v+F07HVx5k6Phwk8A3lTV
 rpz+rnt6p7WQphU+FP81c2A9tDsS0X0a1oTubfetU1B6LslSz2bocQIJvklQp8V6j3jIKwM9Xm6
 vooW2ir25Mkk0qJ0AGauYu3ZXqBaf8ImnVNVuIQB4O+BEIYN9GBP5IEB4n0JFojIUTrgXYV88Km
 60Jx59ypDD5nfkZBLMxkojBSEeNA43qwN1zLxhMQV0ulLBtiic6Tu4t0MaByHHo4Rq5Dy7oY5+v
 PpDgps+qUXCyWBBTyJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE5MSBTYWx0ZWRfXzORpJAdrwE/0
 WWpmTtL1wgP5arnDIGUQqliKp4fu+eDO4TQbvDN0QYbZnf4tpMen7JkrMMcg/bxCSS30eIaAJ1V
 KZMhaUCewQCIyalXuWqtk3jZG+wsZxU=
X-Proofpoint-GUID: yfqPOytBb-vNv1JLr94RsFNSq99EGSP5
X-Authority-Analysis: v=2.4 cv=WrUb99fv c=1 sm=1 tr=0 ts=6a3da727 cx=c_pps
 a=wV2zXAf6sYQQ4uINbIt3+g==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=VkkHSWmPFM6PHLY5UBcA:9
X-Proofpoint-ORIG-GUID: yfqPOytBb-vNv1JLr94RsFNSq99EGSP5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250191
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 Jun 2026 22:09:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20100

meta-ti / na / 20260625200942.1370480-1-a-christidis

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
- Patch Series: [meta-ti][master/wrynose][PATCH] libsdl2: Set runtime dependency for SDL2 tests
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Thu, 25 Jun 2026 15:09:42 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7f0ac7f4890ba02f3360e13c43c389b97a126ebe

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: 07bd4c181e2a400d4375ddad7a20fbba6578b133

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] libsdl2: Set runtime dependency for SDL2 tests
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Thu, 25 Jun 2026 15:09:42 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7f0ac7f4890ba02f3360e13c43c389b97a126ebe

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202606241800
- Commit SHA: 937a0b45728e16c279a7dad65585da061526936a

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




