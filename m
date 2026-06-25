Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 343BDCDE00B
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 22:38:25 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23914.1782427102925046677
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 15:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=RIsTyxa4;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=hk7sraXh;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: afd@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65PMbpUs2491729;
	Thu, 25 Jun 2026 17:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=t0OwHLDDCOqa8MDSpdJrG/noe3G8PVrmGPp2xdGoE
	wA=; b=RIsTyxa4/mHqNAblBvNIWnS/NtxYe62/+u9Y6yTkclxbb8ft0fqU3SX/8
	BfwnYWD/n15ahUpH7AAlRJVpWXC94wvn5vShMh47ShP26bT/nyVjlu3Sjxe4JXe9
	2evtkiB9MPueRm+DOnGlUSFlaZE+B64Im9PzUph33Q0JrsLlgXfTfUBMDryqKBFg
	NkL2bzyAaWK2BgCo7mpGL9fm76K1rBg5bhzJo3BOGkMDec6hZt72h6u762AksDpz
	O3AJnM5oo3j6mMtYNn+KH4Rd84kUBWlO6vHPhfmrmIf+2eSjHjI6Xj7ClwTKzaDO
	Y+ij2BynDNOTJaxTryryJaPN4IaAw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011021.outbound.protection.outlook.com [52.101.62.21])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f12hfv78h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 17:38:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s07NtRsyHfFds+XxklhDIDSWlGL9kgqT7e5WzNV4AmbY1D0pA3sSSA3rNfxj0g7FNRxNyDjPB+Ct85lB12Y3kypXa8+0ftkY2zf5E9U6LpBc4RpVn0MN21/8cujNCPKtuKeC45pa8KcdOk+fBNiT5frv1V3nHiAzXbQg4fSXqiPoR4Fcj/epJejaf+HzDuKW/Lps7zbHIu2femHyHLXIBbdEIn0IgpLYs4thaXDZwl3ZY9BYJ39scZSghwsQuCcLEf2YBD3gZgw3okpSa8S0+IHGjtxjzTSgpUVhSxkJDGTSQdhihMepiF6Rw5SWmICeuQPWBAPNxjGPktAQQiADHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0OwHLDDCOqa8MDSpdJrG/noe3G8PVrmGPp2xdGoEwA=;
 b=sxoo1d4cnNkaYmwcTPrN/t1p7DOYzsJpOvbGLn0ThgwA1nIPIElqs5/mkMTWiP/IBg6k0oeEXsiRaljnkbavftI/VpaBLgD14uNveKZAh4kymQdo3ulhhhJxRRyTZ4R0eqSdX1LIg3boKQLoRphyIa/VKJes5fKYcsGUSjCSwBbolvEnYvADeE2CBxUUPuOgLNP4pA3D2eYefDqO1nPN1+BYXA80zKBkVg+0kKua9Pzk3NYdQqkhHpQdwAgzngner9nsWrIaAZ+MWDkSHGzY2P40x9Pfb4FFDG3goNXTiveQmyhGW5uFs+ylgU5cNHxmB+CDrJsVdZD0JyQboVa7jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0OwHLDDCOqa8MDSpdJrG/noe3G8PVrmGPp2xdGoEwA=;
 b=hk7sraXhVDp6E16oIGqRf7sf6ogVQwztTk67CSwmVKlNnxxPQL+TfPpCekw93qtVjswbH7Hkn/oscQUAU76hEkCj453L7D7WFKrqMTCwsd9BmEqpAR+dJlgxU5DcKUozlWUIhcGO2i94LIdhq1KnR7dM/UVSji/kzZ0c9jOdNDU=
Received: from CH2PR14CA0027.namprd14.prod.outlook.com (2603:10b6:610:60::37)
 by DM3PPFA35BF3976.namprd10.prod.outlook.com (2603:10b6:f:fc00::c3c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Thu, 25 Jun
 2026 22:38:15 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::49) by CH2PR14CA0027.outlook.office365.com
 (2603:10b6:610:60::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 22:38:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 22:38:14 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 17:38:13 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 17:38:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 17:38:13 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PMcCil110086;
	Thu, 25 Jun 2026 17:38:12 -0500
Message-ID: <fbbb7452-b179-4382-870a-5e38cd9b8584@ti.com>
Date: Thu, 25 Jun 2026 17:38:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH] libsdl2: Set runtime dependency
 for SDL2 tests
To: <a-christidis@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20260625200942.1370480-1-a-christidis@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260625200942.1370480-1-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|DM3PPFA35BF3976:EE_
X-MS-Office365-Filtering-Correlation-Id: 74b4e8e7-b811-4a85-18dc-08ded30a71aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|4022899009|82310400026|376014|23010399003|56012099006|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	qkwqrPrs5UmO0Bn4bnkMiDO5BIaSYFKtBSQp3Ge0OgPIfCowbaqWsjWI+AiMHBp+RJBp/hcnRZvPPXv/ry+XUBUJtLJpHj/DM4D9xZSBMfzBs2L3fE0nSBpnPXqV22M0V/2l0MDIFiF8hqitSDC4cZ6/NF46OZu6yqNZZr9LcDzNG2s6R51jhBixUWk3LzCfcR55JMHZA9zdpHFoRCKYd5/tT+i46Xv72KvZaw+AN/I8fRLR/KfUpgeXOrJnmwhYkjxczfNGxetDCmuytviqghC+4JpX7i599UaJjZGqre0N98loLq7UnARsGnLKEFZ3zxiS4u4Q7934eXU6BgUUCx1B5d0lFKjJk2kE4meQd9Qt/mkQY8Jpfsw+iLJ+5idzZV/6GAma7PRnXE7LQKOjR2y9jKIO+wDSVwZsFbJ4hohBOBXy655JhwpvPE98+F1IAb7jIRbze87JLytS31i+vhg0+COP5st8zjN9FvavH5aE6gL7ikXzeEGePmZ2sfsMO67YGqvVOURci4V17artFr1c6tMiUA/ZFhmq18rCrQeKkWBxXWBZEMGzLj6GNaEGjBjGODE6jngEScDJ5ARmD4CncqD/7Mj/ZkSiP7wGlnRub52tRct/qtzNgv2U0V6DHSUp4Bw+4iJov/wmyqxB7UqYOwLykENFd2+f3ZtbjTayBCDQOis53QeyZTJwdZvwWSIs89WeatVTbz+UQHumOA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(4022899009)(82310400026)(376014)(23010399003)(56012099006)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LiZ3ES6i3hCrbzyDjT60blJnGDVT2RnUvCqynywaf4oJ1SNNukXhBeyRnnWN3cODZvPEPWmnIQwp3ql29Zx0lgYvS/QlHmbyCN/KfE046r0huuKyGC29mWySwABFBeg3VyTVslWqmTQLlzwxykEaLFWoMSXZr4zkYgEgoUP8LBmWeeaHZURN1n0GmDuotroktzcCS6QpzhQstd+IXETO/VKmFVKVa1qHBq+fqGbi3ugWzkNPkPR2arXvfsndQZV8s7OEZ95gVviUhPvcUEO2vB3n6gDGj+G/WwmzWSEMXtZ1gf7KTcSvJt7Yd/qJjY6pO12cnUN1hTp1Vpc8VXR4yPg1PBNJ4lnn6d8Knl9eFYSL0/GBXD4FxyKCm0ZCE1EXBaBDG9aejs0rx/6dZwH4XXPLtJ9S/jBjxpE5BUS95bK3U95+1HGZqDDNADGrnGKC
X-Exchange-RoutingPolicyChecked: 
	HEEZcvxctTf9OUGPByRNcYnOt6zVQ5Qn6IVdIt03lZZ7R6FmOXBx6k0i8Hcy7XPSlvhWiJCpcDS+QlEAn+KCEbJLNDSUZXU4Zikvm9jNihLfgFptbNYUTiO7I949rE4Ck/NTodTkvrFcVap5F3mWbE2G6ofSFyF7yOeZFi5321PZexoG0nZMFLx0fF0TacIfjCPrmcP47/Z3Ww12QjFDTWCDdIJ+rpSafigXwKxbKC4ZoAN/Ud+grRmV21zxbH+ZEyF+Px2hqFZSywDu/Ygzvwb3jqxEgXB3NgkvImezDanA/bUZduhIzP4W1YMqnOXpMIYuTGGx881XjncybQyd2w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 22:38:14.2268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b4e8e7-b811-4a85-18dc-08ded30a71aa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA35BF3976
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE5NSBTYWx0ZWRfXwMt55hundEm+
 +4C9gfDc3pFbqml6Tqww6DNj1QZHZI4HyT4sxI+jXQfKiggFf3sk1gFsibOCa2p+MVvgPAZquIs
 7/wiDkBKG6SD/QOapa71gPlbxdZKAQgVBWaGvYajFuyzguHO2T58C0M00l2o8AxuRrHGrGdtelK
 WEMkRRheOn0qshz4/6SPTEVOcFvpcmfvwiGLzmrIsUvXQ2SmHdFl4dX11AI4v3PjTk5XaYy1m4j
 FNHhdKQ3kerefYtzcD3ghdihC7KvrzK17o4d8gUh5tWDvvpmJECqu4CxQjutMMMGubhYGmGW5Zk
 hIKo2tVYmmyntJWikmGHa90DQ6xv0WzA5fSsgJLkrxJ+cjPetwwORNp2/XW0C7ufoV+BpXW+2wb
 vwjaGW0UiKyXGHaEmGMN7cYS7hgMtQvFer0P0R6NkhlPDQ16dwIIZwOpJ7cyNAvVmFAJW6T37PF
 fQGSvyLYtJ98b7dfXtg==
X-Authority-Analysis: v=2.4 cv=YeqNIQRf c=1 sm=1 tr=0 ts=6a3daddd cx=c_pps
 a=k+Wq2vL5ZRQmlAOTCyP+eQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=rLzpEWi-0PFqA5edV4kA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: hO5ZnH-_dsoiAoB1VUJgoHBWlHvQZwKS
X-Proofpoint-GUID: hO5ZnH-_dsoiAoB1VUJgoHBWlHvQZwKS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE5NSBTYWx0ZWRfX0WQjar3rmsTT
 618QhglLbQ6GGMPRPvdQlGYF3mwtXtmJQYEhnCWTK8my8H9gCk/hG3VmxZcVwxsQoLUFns+FpDd
 2MwgsgkF/VgPB4POAWZOxlpmNxhd3kI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250195
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 Jun 2026 22:38:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20101

On 6/25/26 3:09 PM, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Set a runtime dependency on libsdl2 for the libsdl2-tests package.
> 

Any clue on why this isn't automatic? Do the application in the test
package not link to libsdl2?

Andrew

> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>   meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc b/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
> index 33ff0632..750a5603 100644
> --- a/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
> +++ b/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
> @@ -3,3 +3,4 @@ EXTRA_OECMAKE += "-DSDL_TESTS=ON \
>                    "
>   PACKAGE_BEFORE_PN = "${PN}-tests"
>   FILES:${PN}-tests += "${libexecdir} ${datadir}/installed-tests/SDL2"
> +RDEPENDS:${PN}-tests += "${PN}"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#20098): https://lists.yoctoproject.org/g/meta-ti/message/20098
> Mute This Topic: https://lists.yoctoproject.org/mt/119980196/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


