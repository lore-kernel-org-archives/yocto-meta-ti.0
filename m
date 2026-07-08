Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A423C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 10:45:53 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5671.1783507549057670562
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jul 2026 03:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=WK5qM0PW;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=eKyp8Tic;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6689Rov41945164
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Jul 2026 05:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=N8BEq4YE3zq0gtDH6rfiUIILdEGU4jZxPBxd7YRwp
	hU=; b=WK5qM0PWgZeDgC05wo8fK0X1PJ6jnjJ7ptZ3VSl7uwt4juvWRr8a8R9EI
	cH+TW0z3z+OarfwHOgUWCNjqtvTdobdQrkyT8Kcdms4VEIwNysTUM8aZ102T5+ET
	vx6BbLiJIA9FHX9RBSW7SioO3io3jQ416xUeh63hGifjPzHYwU4EcLjE2aFN2Qw5
	X2n9XhIuToiIiOgYqK2JIbzUDIfr2G4a+2EegnQMKl0dq+xtmdv61pmOsm2ORMc5
	Pvz3jI5doU+PTkZwxpXdsQWOe6mo0abVl/nPHlsitaSGqd0+7aCwiIdy9bV68F2A
	vSLqe4JYkXPr7GCEnHnLTpWMC25xw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012029.outbound.protection.outlook.com [40.107.209.29])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f9kxk8b4q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Wed, 08 Jul 2026 05:45:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJJhX0frgFK+61WHWINsuFfCNq7dYuIXpqCW2EaK+Zw1YVsRxpbnsqCsBtKjm6pWzRIaFV2SVlFRMLupWbXalbMBu3l9a++F90OoYT8yCgJ6S6PTMn7WviwZAS4Er8/L+ww48ce49Fe0R4HmIoFFRjyIAwNNsykpvlnO725ZYmcczM3VCLwIqZ7FZb4JxOVBOJ4/tIlIP/5wUOiRO+ioalTWiHjDqcfr8ISc9zXXZjQJVrRlDeChgalPDGF+9JhrAo5rSYxNYPJ1MlW0Yp/oGYgZ4Ln2yPwvbh9lMvirtM89fwEEHPdxlq13TE1z0sZz/lqam1EKsgudYGPUbC/tZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8BEq4YE3zq0gtDH6rfiUIILdEGU4jZxPBxd7YRwphU=;
 b=UG326g10FzAMtclhcQQBdmHIIOlqkyUOXFLCuB85C+j7g2MovamQMMe5GViuoT4vvaffC51yK3N8bfkUpGgNQxwlQBvqyJa9jANwNtZANHuk590okMm4oGzZr/xD8ElK7F+gX6g+eRySjMh9Hi9nstgXvuN60opTwOfXMOg5/Y/adGZpuyN2YMk0L4p0+wulfLswS1ZT5xZXIDxe0GEAGFTfdKvEIIZDTkdP/q0R76IVup10ojNxoPvRTWvS+PEA33Q4uO/7QPjQDtBz5KUSCCs41+BSKBCJE7+ZQ77ut7OyUBOybknVcll8fjHsSwvT8WtOZTueTPPUk+DbJHSLRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8BEq4YE3zq0gtDH6rfiUIILdEGU4jZxPBxd7YRwphU=;
 b=eKyp8Ticj+nFSxisIliMe4N2UVQh2GwLW+C4VixiLzGXp8HgVLPCH26XxpyHA6WUg0RRlSik0hCaLjGU4x3wttrYIft2u4Alo4kdqaU7992L9YSXPdG5+/XP5KvaHBO0KVn+5tZkLHs9n+ajpMzROrhvWGeiaLti4L9By7Hn1VFMWrFEVxMsTqpZHvsHgShptv63152Hzu4BKTfkEDyhu9814aBqv0F1xHiAowbCUDXMf7RH3f00CB7Xny6CFjZS6aoC6ot+EsUZ25KYEWNk9+2C2pLc/d6dHH1f8X9N9BT90W2NwAlgRCIlz1L+RTzmwrOSAj+HlbZR3zBUUYS0wg==
Received: from DS7P220CA0104.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25d::19) by
 IA1PR10MB7333.namprd10.prod.outlook.com (2603:10b6:208:3fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 10:45:44 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:8:25d:cafe::5b) by DS7P220CA0104.outlook.office365.com
 (2603:10b6:8:25d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 10:45:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 10:45:43 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 05:45:43 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 05:45:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 8 Jul 2026 05:45:43 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 668AjgLv1994459;
	Wed, 8 Jul 2026 05:45:42 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DEDF49ACF4; Wed,  8 Jul 2026 05:45:42 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: MD Danish Anwar <danishanwar@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <j-rameshbabu@ti.com>, <reatmon@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH] meta-ti-bsp: Add pruprp-fw for AM64xx
Date: Wed, 8 Jul 2026 05:45:42 -0500
Message-ID: <20260708104542.1864450-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260708104003.1287599-1-danishanwar@ti.com>
References: <20260708104003.1287599-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|IA1PR10MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: 6151dd85-59b9-4f04-95f1-08dedcde0fa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|22082099003|18002099003|13003099007|56012099006;
X-Microsoft-Antispam-Message-Info: 
	zi+Z2dncTNjkp5Yn6Gz9t7da1Lsdzg6UyTbRfIrClQrH5OR+6lk/fufLIEUxWBqUBFTbqlDC+0gYu4R2W470oUWhWdG/agrCP5aV+mhtfVYToiHNUaIhmEPFZugbSkkzRvTPXsqCrP2jUsWEsNL2QEB2yNlW26z3U5mlFvUBKIndKvk0B/96pQ5p+Or6GQgWUzmWjSUUm/BICupTFmPkVlzhl8lN3hJ5Gar5WVGc06lzhZifd9GbxxX3Rf8kS1JnettOtI7Enx6+Vm+CxCRK58O0bYNPJDk/hILqsn2c695jkw6oltAzK9xvSXZOFV4uIA2exLzxTqN26Oc+mqVrgdzNd7yVI1s3qVMTGR8a/9929hwf5Gs13DrSwiSq2R6HfJnLJdUuIqlVYWIVOfUruTERvVBAznzh0db3B1wVoKVOzeTlYPCg2S8zSdZmb5a/xPXh+B709ymth+kXnrmPCSYmALqXR1cRqht2FwQ/dWTM0eUmVucsIGiS+VjFO727ixk38kOHqvrkrvTDa6UU09GnQg9jMGkxY/encQ5xwDbyKKbXtRgVXexrAXwJPd90/wV9XvBbdUGRCUp8rNOj8sy2mJ1VBs9mJt9Wiij/9uCWeEdlq3T8Lvr/F+FpWVN1v4yZEsinlbiYcY65zXyb1nIr5J0irEGhTPpb2p1CLQoXZxM4ZmGIYCf8czo/QMj0U+nN9ZuLH8K2R/fFRUhKiQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(22082099003)(18002099003)(13003099007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	k/u3blAaq1cO0Cotp1YH2BAys7jh02Fyat4KhdKTVlmfIIi+sQLU8dDXedIdAMV9ezDIVUv2MznvgMWyLjCCATpICpGvMv6PGBxWqwpVvSeG68Ckiz4QzrmT6LYBIe7FmMxePQ2TkZOkO43jE2u6QDOdKwJUVEQzPTqd5x60fwIWsO0jLJrQdSKYbq2jf0iTEXf8yVALd5StO3q24k+hFsmfxac0aelo1FArv1LShNhcYsmU04qntJercVwhY7ABoeWaCrXvZ/Qig0QYd66H8gROi73AZSP8X+9ttQcYU08VHhTO2weqYZZzqv75ExSFpEydnDUOaBmmbKqaW+/fz+9BbLef5TKNMAcR0mso1H5FRIykkc+p03iERf6AJidTiamtNmCTj7najb4Pa+NR+Qh56kW+70XKXQQ3j/G0fTvAhBfmtXvKXvIprrXEnxDL
X-Exchange-RoutingPolicyChecked: 
	kvMn2QUk4aQOaJB0kWAF5lLGbmLMZKZ6ZOSToMnFO2krB8F4M7eJNv6x7foOfYYdJ6SlezmAQbVI4omy/525EwiJOSTG4regH9uf3IcTFhjkXeWhQcNAkqXNIM8Ohrol/AnlCrt8ZK0St8o75TdAA2MwEr0Ra7rXe3w9RlVlD2f9Wx5ES0nh+22jNI4JoAOoJ8xz32aK0MwaqUGhZlio0kSdbN/JZlmiBP1k8reidEdaRpBLrMxT5zRW9c/iU+U85bHjbgC2nEHOmN7NMFTZL5Ijluu2+AUsZIHoBxiTG6idDRVa0yoBns4nYWpuCJoyEJdvybWg3bP9CYmEt3tJ3w==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 10:45:43.5477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6151dd85-59b9-4f04-95f1-08dedcde0fa4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7333
X-Proofpoint-ORIG-GUID: maNyvN--k-3P2ZnW7o9qs34vJav7gO6y
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a4e2a5b cx=c_pps
 a=WJg1qJ+8ll6SXBP1xA03Zg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=k-42gJp3AAAA:8 a=cN9th1_XAAAA:8
 a=buGZfScUNWcMasWwaK0A:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=uCSXFHLys93vLW5PjgO_:22
 a=5HybKBhn8h5UT_hmDMpx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEwNCBTYWx0ZWRfX86+FRlxyA8B8
 VF4cfOpDMsgUl5Tfm3VrOXgJ08ZoxvaxVhKnqoqlvMW6E5wzWCSYECQRVoe6w/mxXZIpVGYN/yV
 GFmeGAqivvTkzuV69lpxY/iVoAuE0Oj7zRGwRH0BEdiV8tm8BhqUio3dXbfzPd8qFsTXTcMFQt2
 XDY9TYUOPOFusXRL4IiNjjpVclFDbVQvXLg3iVJLwTTQJ6KH6sOe5JeM13+Au6GIYZaFbrRD4+3
 vqO3KbvZjYe0ADsFSLWCY4RUF2PITHNXPMV6w0zl0/RZfUQNW5ZQHOEHuJ4iLESAbCbyGO+89ju
 y1VVB4fWnzCXXvhOGTkzdJb85Lc8JCyPucBdfMd0xvYhHbXVJ1NqeJ9EKmwB7MzZTPm9id4JScX
 3dTCbg6SJNICSYBW+HO4HsXfETP8auaAdASpt3wTMJ988dCF2Q0GCM4I4GB/bAHMZWXSHDZ7U85
 3/9nmrvlsOcHFI8aLbA==
X-Proofpoint-GUID: maNyvN--k-3P2ZnW7o9qs34vJav7gO6y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEwNCBTYWx0ZWRfX9wTGYYd3vnte
 7VgijC3NI0uH93GdXywVusAhQDyu6EC1Sa0F7tgRE9J1IBm1o7Cb31OAFjPhALXntYpfL3EM9Id
 FuE444ZtJu7+tydPuA0VYsqN9is4uoE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080104
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jul 2026 10:45:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20128

meta-ti / na / 20260708104003.1287599-1-danishanwar

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][scarthgap][PATCH] meta-ti-bsp: Add pruprp-fw for AM64xx
    WARN: Commit message does not include file/recipe name: meta-ti-bsp: Add pruprp-fw for AM64xx. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: meta-ti-bsp: Add pruprp-fw for AM64xx.
              meta-ti-bsp (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: FAIL
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] meta-ti-bsp: Add pruprp-fw for AM64xx
- Submitter: From: MD Danish Anwar <danishanwar@ti.com>
- Date: Date: Wed, 8 Jul 2026 16:10:03 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 3fa01f1a03c88ba39f1fd1fe0ad0e7d0ae1c7676

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: meta-beagle: linux-bb.org: upgrade 6.12.43 -> 6.12.57
- Commit SHA: 7ff810824442c56ef59fa2d705d64a03ade5f5f7

Patches
----------------------------------------
FAIL - [meta-ti][scarthgap][PATCH] meta-ti-bsp: Add pruprp-fw for AM64xx
    error: patch failed: meta-ti-bsp/conf/machine/include/am64xx.inc:28
    error: meta-ti-bsp/conf/machine/include/am64xx.inc: patch does not apply
    Applying: meta-ti-bsp: Add pruprp-fw for AM64xx
    Patch failed at 0001 meta-ti-bsp: Add pruprp-fw for AM64xx




