Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5BCCDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 20:01:03 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16234.1782331255050901785
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 13:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=iWY/ZHxi;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=FYf+PeKL;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65OJsOiD3625131;
	Wed, 24 Jun 2026 15:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=oehvYlrl5ZwFTwVFVkn4A25NYtfQjaQTc1EItIrvB
	rM=; b=iWY/ZHxiVZvkhhG2NNYfHhcNPPeIfx5EGVT2ICzkFlfSaDPe5ueSE4559
	1uPoEmc7DGcSnMEi5dTdwGzD2wH0pdvM26ExRE94B4yd9S3iKDf6GI/zcw8ysb4c
	an0WnVJv1JgiQ/arBVfZBw/b0vjN8rla0aIlc0ltJjYeqwZGd/nZDe1Imk/h3/Oo
	uX2U+MQVhpW5YHDPD+Zgsd7dXoB91czl+V9vCWwfGNA7JdYaTkqEXc92GzETZSH6
	Cms5dfjGucsaYwPF3Q9gIfzP0S5kJ/G85tLjYk4vQ10lvl56o/LM7b5wOaZdf+e4
	C9hx8BIYSLxo2eu13IeQS1qboBYIg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010019.outbound.protection.outlook.com [52.101.56.19])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f0ecru8yp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 15:00:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZs/rBr0gKCQDAKAKgVHn1xl6NKkKT5yLkWVAJ/WQlMgOh1mkdHq6hn/N0+5KWHV0xPuxqC22ggpJvqswi+PmkzQ3/S0gAtwqUZJBLLw02ZVi6vIsAsfzC92KTF2X+Ettmk/RfqYqvKFhFmAZkGx3547EmBZn4KxcOfev5u5Zy46ckINMPqzvJjM7l66to6TdCyRk9g8QRL9rEmTWnOnCTXdp+Kd/KVWL5hI+p8iAog71CUsuXUOFc3DVdx3vAmg8K/2PWtoIGORxd76foBgi5c5OgEgHkWn35SMV2d+NjIrsuO7l+5S2plXPBjPMcddyjH4z5+LZrmTrIJg+w19Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oehvYlrl5ZwFTwVFVkn4A25NYtfQjaQTc1EItIrvBrM=;
 b=mdxl5gbs99HQQrYno/BJrR+WFIBROtdJ4XOlc+kJHqJwwoc6RmhifyL2BErBcKucabkgHu8BdRvydVRC86gY9MiWBIr28RWpFIMrCO+jTad/JctMSlnQFqAr9C/LBcoErolrqU0yrcJb1YAm20IevbnSD3APfa1lk/ad1gc9v1JV5R57TQ4KQ5w/+tYAXO7MmNlrRYLneB4k7LxabrfK9CJtqOzqXfWFKYjEFlJtOMFjFB+qMuneNMJmDA015nUaSV5m33NzRbl6TbhxO2jco1i/GX+k50P0AJvEYechIneaDWHCfnziTsGafXsNOS2LKdjub6lDcm9iX4kqy35YEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oehvYlrl5ZwFTwVFVkn4A25NYtfQjaQTc1EItIrvBrM=;
 b=FYf+PeKLANdpr1T/ITW9RxP+SyBAHrGgzcGoUmImpwxfm1WtJiHJe7ROjfRPw70ZYZFmyERkC8BWkpDdtj8WUky9OW3DE7Bkv9zjm8vhDG6Cgi3wscieQOuGkcT+E/MgbQ6WKHYMtgxZtOwyEB5BPYrJD4hbEVdyXT8YQk8BYHDnl1OH7xP6cHo42akKZ+QQ9Nh6IBM2kwnZ00mbFwaSMPMtm0mfFT+nAfsGKHcDqgKtfFt3uyjoHmpjqXxUjxkpm5iN6TASIuTgY/K3t80B2WN7kB9LUenpbMmKp31VgY0xik4ucAd9e1kY6LpSUdwwf9QMzOwhLD2Ye7CJ6pnE0Q==
Received: from SJ0PR03CA0271.namprd03.prod.outlook.com (2603:10b6:a03:39e::6)
 by PH7PR10MB6603.namprd10.prod.outlook.com (2603:10b6:510:207::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 20:00:49 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::15) by SJ0PR03CA0271.outlook.office365.com
 (2603:10b6:a03:39e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 20:00:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 20:00:48 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 15:00:27 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 15:00:26 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 24 Jun 2026 15:00:26 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65OK0QSH3962077;
	Wed, 24 Jun 2026 15:00:26 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CDECD9ACF4; Wed, 24 Jun 2026 15:00:26 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH v2 1/3] libdce: Runtime depend on IPU firmware not the other way around
Date: Wed, 24 Jun 2026 15:00:26 -0500
Message-ID: <20260624200026.2317448-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260624195533.1152173-1-afd@ti.com>
References: <20260624195533.1152173-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|PH7PR10MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: efb7622f-bead-4951-50f9-08ded22b48ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	VLI166cd9bLyn1FDvxv7V1HmX0k3DhZaWPwuLcMz6HychnrMeskCDNnvRvMru2SlQawGlLgAKRkJbCSu19hMp7PT881wxyA7HxB+IBenCX6P5syobQlTeetbxEnsiBzO+bqVrDI+m1ZDIa7/6NUMLbJKGdi3sTvILY/1XSxN70mB2f042v8DC38eF0P9VU5gXrTCSTcAO4AMAtZ24EzZaCkGHqALTvFFuq+OzEQ5xXE0qMPG0G21PwjpfgyyiXG8ejx66Xd+sLX+I0AOmo5nN/JYhsLFwNObJcYUhwUUafXUtWQexy3kkS5ni0YaFO/YtKy1My3gICEp6v+6KSORfzpHjbUu6Ifwil8rFD3xeAl+RSF2WyBqGvh/lsvio4kYPbhQ/WqwlVw3Y7PmrwoalBN4op7k/8h7q3S4V/HFGjSUfDkY/zMO+08ckfUsMgXGzEdt3aBpzlxkciek1EhsYGmXsyl+BwN/5HNHmUFarOFqUpZU7slaiVdTZFyvLe62Hmwz7kqXsKh+N5LOsIowy5MRNd6fTNHUpsYlhXYSsQkrrcaYT+sRhWDSKo5VqnZehbJSl8V1Sq7G41H5uNh0sbKScbnSsNOs8LxjfJiejEnXQjJNo1eXMysnijgCF9oqyCJDF4/71GiUQVrboJM6K13uVcdlTkSGBSafc0hwsItmgoSLNQkey7MSz5Bm2k4h/g5KwWLP4nR4ABhwLNbjOw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	GifRNWqNKW4pL1L/unEc89wcY07JKyp6b80IgqRDWXx71ad+OhuMNxnAAynh2AW8GVJ6GcIr7QLqoS3Pvz3T6B2V3i0/3VnI8lI/X6ewd2Z1+uLjv5iHkBIxzeCfUfz4EoAv/ldav9hNFU3RomcIQdXSmYWI9m6t5hvEg+AtODDkdVvq5lNY+rx2trrJq863zQpIwf6L5lvI75GLyJaYf8NsspEtyWr8W+8n2+cBLriDyqQJ3xty6tpVI612AVdhnJCP/XcJGxmftqlETrcBRg8c72JcLSvBS2jQfBCQY9ZwjCE/Tnd8kjlUXorJO982mwvusI5zp+0yBuk/p3mvynF3iPfenmT6YMUAxy7jAirEmDBYMkpcux1pk+iL3nLGW2HLmLBCgSa7GuW0ZxHDcBPJEm1GHqyQg/iFTZ+qeTmC2djBfmwS9uXDGQdMX7Hk
X-Exchange-RoutingPolicyChecked: 
	jc4oEnLDBvLVH5RR2zGKAbR+rJj707WZEH2cweqXd3Yy/d+fwtGl+R1WsxuxYNv2fp9+74BaiQHqqV+zuYGEj+hcq3edOMwjilaI/2TMN/Uv4FatVEETaDf0WekIdrWH/GbP+7Zhq13aB+efdm9Zwe2wap58T0/WoRax4POl4V5RFAS6aXD4WMHOWUaiH0h0IcbVjg2sKh7Sm94r593RTJkjyqHDjrB11t+vOcUM1Fl4HEGE4wr/s0tQx537eBjDFpvrbWNsyunaMvy7CclOmAHP3Ykm1o50BUBbGuljYuuZHh16QG2bIxlHNpP9T/MMJhTjHO4CjBUegg+QIwLsvg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 20:00:48.0607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efb7622f-bead-4951-50f9-08ded22b48ea
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6603
X-Proofpoint-GUID: LtfN6rgsThYWxay6rXrLUi0u4pv9bPa8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2NCBTYWx0ZWRfX0K5WICZo6V1r
 8+wbuQI7Xg3rQdT48C5uE7tP7XBFrKG9M+GFpiME5y92cMQQCs/KjtgQpRslVBYhHACtPKJ8PCk
 E0t92vCTR8O5BMwpzBdmR/BeU6QIrgdhDsGfs08Mx24X+CinBJlKteztgSVYc0iALBRLGD7+OMK
 j1eQUSBwZf0Dem4El6uZx2a4KCt40E6IupIHONxzuxmr9+4wAOjHfAVc4pjK5d9jwanbZ2OBwjY
 0QpNlQOxAzlJOAUevLLhx0p+Dj0N6njyG7ztm2G38n483vJNwuV3R017chMFGUQ0qbxJc9+1xkn
 ykBzSPcGCYCOVBmawjtDYtXAu+/zG8tdAUHLynBqIHs5lS0XeQIu2GyU8jH7/SLBmghYiC2usjZ
 G+rCPvIEVRPT8pyV0QH3FtnNRvGDhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2NCBTYWx0ZWRfX9/Vx87G976B/
 0u3H0sV0Xfbt/PRDFjejGayzP1J8VZmfDNH9vIWzHXQUhv8aZ8BZEZ/aUILvVKf+fPJC1ZU0cLz
 +6WXtjbQE0x4O5xBb/fyObfc5GCbwCk=
X-Proofpoint-ORIG-GUID: LtfN6rgsThYWxay6rXrLUi0u4pv9bPa8
X-Authority-Analysis: v=2.4 cv=eekNubEH c=1 sm=1 tr=0 ts=6a3c3773 cx=c_pps
 a=atoSyIAEYEcRU/7H2q9pJQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=vMju1V79vTge0bfHOGEA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 spamscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240164
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jun 2026 20:01:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20076

meta-ti / na / 20260624195533.1152173-1-afd

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-ti][master/wrynose][PATCH v2 2/3] ipumm-fw: Use prebuilt firmware from ti-linux-firmware repo
    ERROR: Missing License-Update for change in LIC_FILES_CHKSUM. (LICENSE-UPDATE-1)
        patch
    
    ERROR: Missing License-Update for change in LICENSE. (LICENSE-UPDATE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




