Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8823C5AC7C
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 06:26:45 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36845.1786084001947050798
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 23:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=I0PQ5rOc;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=TJE08qJV;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6770Fxxb1467161;
	Fri, 7 Aug 2026 01:26:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=oK/lVOApn3SMjwgQ4DkuscjSSF8iuSJPVNvsvdHDB
	8Y=; b=I0PQ5rOceltyZUBuI3ZPFp7MwtARELW/BvC05Jc2NJcU5HKsmVSW8RbCJ
	h8hAi8vLn6bzYKvdqi6wPrIHFHgjcBsHCzZ7JJrrJ7gp1FzWlDMJg/RGkEcafJKJ
	QNLN2FcljsmgN2qqnhsvkFyEhvymVko4vP0JDgXyX1QFJYCJrlu9SEo+aM5VpYTw
	/BSzOEEJmkAlgkLQlGQZUCGTrgvk10YFEhToJ4J+xQTdpvAZ/tjVSp7ArLZkKrzA
	DFgmJd3twPMAcPF91XD+NGiwEVvLnJjAhMVcR+ex1qaoIYmghDAQIrkwkqtHvXqu
	e2LyzObgcTc/+TiFG2RlWfSTXr6xQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011046.outbound.protection.outlook.com [40.107.208.46])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fvsruykpw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 01:26:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6P6+tFIcFM+C4llHzR02gcKUUJ9PK1hxas6qlLn2krtDujqtqP0HRCGGIHSQ6/UjG277UG0HX4mcWY342T2S7gA4xt29aU6lgodMEQEcklLTdaz8o0rD70mohlZQSezY+ekvjqP0o0SUBA1W3Bf5RYDeHl8SeHHolp5Ren19WIgVgFivttt3ThOG1L7NJKIT5hKDrg0gIcz1IBdxCWecl6zTIpNX8NzqgOX//mt8+fRE/WejvX6WQw5PqgoP0eRgrB8pKuDFyf+r4rx50Dp+EH2IY04DtgfgN0uiLjCRyDokyU6CnR9B58aD2TQicnsdfT6Z9t8rFV1RkGbvL3uKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oK/lVOApn3SMjwgQ4DkuscjSSF8iuSJPVNvsvdHDB8Y=;
 b=kISeMixjDy50fMa432OK8W7L4j9kYw/0zhAKbOKrli32HK9f8KBQggTN0AWZ6wjiwNh7S4YLirOP28/Jc5iCmI/bqrmO07431a9GVUmZMccTJugrjia4IQ6bn4FRLeuziVdvbO2VKq+Kq0yR0rwHq3KiJotaL5C/z1naWMPj+v0HH/Y0/N0XW5I0z1Ce39RNx905IoygcCw68/gqu+cwb4d43oBmh9pXxh99SL5JovvKL/5feI4zhm61LklPmFqXmkFqcW0Xm/OvZVmqtgb5MK0lsg4/ZowjhZX83HhR6ijH3ib0w+6wl2loheNOuLOmwkL9m6YSudLl83QdSdoEcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oK/lVOApn3SMjwgQ4DkuscjSSF8iuSJPVNvsvdHDB8Y=;
 b=TJE08qJV02dLLKb/miOZBymBTgDLwrovotF5pseKZOkZKlK5f/ervhdXRcPMM2P0qESTuj+9udQNWoa4hOS7gpkTgBeQzfekbQ3RaBcQIIxfDlnAd/4Hajr61icUe10XDtQ8LyvhbvVLpuNPAspzO0HJ6MdycUwe7JawJ1c/aP7gy02xH3RCtq2CNMgZxgMXHy2FV8V6KYmkVMT1D4gq4ckOE18gnBZcK8TxA25vNBdGMZY3ZWrlruxCGKavabOMKI9XM7lHV7iJQayEiIeE6d0RV4EyDsJb/sSu44rrP/UJ6zcLTsPRPMzcm/x+FDPK8DOS3q2gU2GO+Mnf7HvbPw==
Received: from MN2PR11CA0015.namprd11.prod.outlook.com (2603:10b6:208:23b::20)
 by DS0PR10MB6847.namprd10.prod.outlook.com (2603:10b6:8:11e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Fri, 7 Aug
 2026 06:26:37 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:23b:cafe::a0) by MN2PR11CA0015.outlook.office365.com
 (2603:10b6:208:23b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.24 via Frontend Transport; Fri, 7
 Aug 2026 06:26:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 06:26:35 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:26:18 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:26:18 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 7 Aug 2026 01:26:18 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6776QIDp847685;
	Fri, 7 Aug 2026 01:26:18 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 11BC3D6F23; Fri,  7 Aug 2026 01:26:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <u-kumar1@ti.com>,
        <s-vadapalli@ti.com>, <a-limaye@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: Re: [meta-ti][scarthgap][PATCH v2 0/4] Backport ti-core-initramfs to scarthgap for j722s NFS boot
Date: Fri, 7 Aug 2026 01:26:18 -0500
Message-ID: <20260807062618.3622709-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260807062154.1387339-1-m-shah@ti.com>
References: <20260807062154.1387339-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|DS0PR10MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: bf75dd72-3720-492f-b3c9-08def44cd4e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|22082099003|18002099003|56012099006|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info: 
	p9dcA8lpg/0CemgZ6CNOhrJ0GJuPvqku6qRGe4I1a7pG3aSGS7sQSgn7nCUICMOKmt7ROkaPMQIpK2zCyr+88QIT1k50ugSaeAkDLu2d02kh6X0WH7hZ9JUZN93Wajg7zTbTA6ctiKdM3m0Ed/qHk9dISOaTB/5Ad1oIg/UtUnOiT3PHmSgr09q07+QLvItD6YoA9P66h83ZjrRcE2IqT4b8yT/Bjg1NgR8CdTIGQui83VUEJ206WrcqOeuR3Z3b1MXgQNVRcsk1MK8qznEgGr2HBVzHYguPKwgPsXQWPLwKp5dm6JrW4gClVtEv5fWurqQF8jVuLZtPV+HMqt341O/v/AcydBw6YDfezKUkKiNgyytUCKkpKXLb792IZOysOUWkmxEX4ya7np8zXe3SsJ28kseqs67g3Uk18m4vQYmYmxnyPUQHXMqMabgdrxDOkTtOvQdqANI22NuFMAgWLjcRwCekTltO/Llq2zTOG/hqbsN64aaAkeZRMs1vmM4G3Kd67PwrnUbJ8rg7d1tYSnX5ejcWIwMznQcWFuVHLiBxjbz2aBojC7sCY6xWql4YH0Ck0jpc0e99AKZoUeUDGINdFIcrR85jHf2kJXKwBTjsueZ2jrdcojrz9ViBfHj/A3D54AD9IGZ1oOmq4sZLSTinTjTC2lmTGK6okO7iTfgsWvMuJ2z1yghWFhNeE+HIy1R3Y9lJCqCuoX8wsDukPA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(22082099003)(18002099003)(56012099006)(13003099007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	HVNbLI9kFkIDjosYhoqUp8WI69t4xh+q5L/IjDhEv6MbgnO/j1w01z9xJT/2kmFZbHOJ9zu+Yl3sYT/j2l3jrBR0k5wzeWWmroG98ZjhzNXGt2CrkTa7BRkRtWn88kSuE7gJxnyQx/JryZ1K0brAYZRBj8EDTgcyHQD1FrTuVmjVylCrrVqYTX9ElB29KG5h23U7wGjwsInLOLPUD2nPYm0Dn0CRmhIsChK8jPnTZQ7DC63sMl7ICy6hb7HEUNlWjmQQvtOXeAhOU9ZXblhvx3CVlSxX9uNWt8LiOSfmLt4T2qaD6yhso0drlfrSyoFmh0uxV6SMROmqWKq+vhdfwVGvArmxEFTb1H4DTkPYMnpbqZVRaT9tnCQHiSRfxDJPllsCYqYmgGf79upEG6zC/UjRjvWYyF8ablkEsBlDJ5zV7IWxzioEanAJ8zhRqhuX
X-Exchange-RoutingPolicyChecked: 
	MBFREjJK+R0R/DPIMoWu01gMTGkfNPOfrf+bWAwCVS895VoBayA5A4Tty7z7tDTC+4jEO8odCwfoHOxf01sRoKSwJGtaR4142t57pvRu0xJuIIogKa5uuKWufzf4oGsZ5+upLVDjZ4KsoL8U4LPd8bGLf1mDTEpKTUca8p0gRYbgIpV47DxmK4D3pyf8sjsKDcNXvfuXSPE+VagtqXKsTinmJqZNyoc5fLXUw6JdNJV0jAc2UQKTnzzsgpEtVilzS4XwMeK1o/8EWY/UGgzMCHylLBWmc7+eduAynbrHpmZTZfWX++HmONAleriH3gjterVGMHERyk0TUF8Qge9J3w==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 06:26:35.8856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf75dd72-3720-492f-b3c9-08def44cd4e9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6847
X-Proofpoint-GUID: ka_p0RqUuXzKPhTGL6CL520xP75ZOPQS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA0NiBTYWx0ZWRfX4s7+VgY+VRTi
 cV78P+2B8WZujdbQgUpv5ZJPfJ7ZWZGowJzKdqh9BSGikBTb6WNoqauAc4O3WutVUNAlYD1h5AQ
 eCeO0lwy0oYH4aWH2Aym2JgzNxM/sjU=
X-Proofpoint-ORIG-GUID: ka_p0RqUuXzKPhTGL6CL520xP75ZOPQS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA0NiBTYWx0ZWRfXze4ExWWQO1pJ
 VEK7MXO/0GSuXBmo4fqxhK3xABU11LJkcZEMmZnA1dr2UHvoPtz5vWk1JBViBYZen0dQeTby/ZB
 5JJ+KWEdvBGKUM343mnXDLgPGjy3s75xiKKWKoZUv0GP0vyQ3Cm8Hxva4dbSrerD4Q5PUMrf/CF
 Jjm1xYZY+LsA2TxomeQOQBATlWnvWv62W1jwbFftQpvNv+pPbDpJcpXQ4FPQrrFBuoUkvj6YBdu
 3lDCLNZ8tGeQSqk5znpVqGydKpik2kbetshOTP59hEQqHfJP44R3N/SyiKQeAEDus49sd77g3/P
 MLZ+6KxN6lzWbQ2AkK0a6h2pxBnyLduyPY3NnXUw/FnHeW6nRNg2moYhjHOz9BF4d2ldKPvLXf1
 tX1K4wCoaBTo1WsWeZlUzo9kMNOkjHY1TmOCCfOnoLaKhQw1JMWq85buXaxXjb6/UNoVxnRJOU0
 cu/BSrIdwOcj0CFgfFA==
X-Authority-Analysis: v=2.4 cv=GdcnWwXL c=1 sm=1 tr=0 ts=6a757aa0 cx=c_pps
 a=U7vFK3P1qsHFYF4fogjkkw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=k-42gJp3AAAA:8 a=cN9th1_XAAAA:8
 a=XCktzniVQbRvQybRQRsA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=uCSXFHLys93vLW5PjgO_:22
 a=5HybKBhn8h5UT_hmDMpx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070046
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Aug 2026 06:26:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20234

meta-ti / na / 20260807062154.1387339-1-m-shah

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][scarthgap][PATCH v2 1/4] initramfs: add ti-core-initramfs image and packagegroup
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [meta-ti][scarthgap][PATCH v2 2/4] k3: fix weak IMAGE_BOOT_FILES assignment
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [meta-ti][scarthgap][PATCH v2 3/4] initramfs-module-netsetup: add recipe for DHCP before NFS root mount
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [meta-ti][scarthgap][PATCH v2 4/4] initramfs-module-netsetup: add j722s CPSW proxy-client kernel modules
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH v2 0/4] Backport ti-core-initramfs to scarthgap for j722s NFS boot
- Submitter: From: Moteen Shah <m-shah@ti.com>
- Date: Date: Fri, 7 Aug 2026 11:51:50 +0530
- Num Patches: 4
- Mailing List (public inbox) Commit SHA: 575bcc471da0a088c40bffe3c97bfb958fbca2fa

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: meta-beagle: linux-bb.org: upgrade 6.12.43 -> 6.12.57
- Commit SHA: 7ff810824442c56ef59fa2d705d64a03ade5f5f7

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
scarthgap
=====================
FAIL
    WARN: Are you missing a PV = "...". (PV-1)
        meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
    
    WARN: Are you missing a PV = "...". (PV-1)
        meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




