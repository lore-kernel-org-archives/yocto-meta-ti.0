Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63BBC982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 21:24:15 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.383.1790112246802396263
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 14:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=lkEX3Dep;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=iruLViyJ;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MIwEeP3440019;
	Tue, 22 Sep 2026 16:24:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Zg3ijKafx/d7usi5PY+aTZPnv+ZhJZ8HvOFJLx7rs
	uY=; b=lkEX3DepEDjmOEKLDIcBnMBlowdzqOIQr0PIbXJFLnuB/cpwEtJL7kgNh
	90VhroasccDkdP5F9ODpE14qnrE7t3br96n4MQdSm0WmBg1yjMpDvMUQgMOnZp3J
	xJnuaw0+zyITjB8zSRnmkCXHnSQpuMnos/AquxFUhrFLXtOzMORy5DP/RXyDJZwr
	D/wj8LDHGN2n/pJbbNJW33FF6ezAJqeJqpFeJpqHFEFw4dFVpAzwTAAwAxdDF/KX
	33ivq2S6LtssPGdUyydfIZPIQEN0J3g48++vuYCizFRXnNlZWFGgeZmSSbr/dzIK
	nRj2AvHvnt+zfS5ACtaqhM4lCBmIg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011068.outbound.protection.outlook.com [52.101.52.68])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugcsxgvd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 16:24:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yBYORr7z+s6wFeqnRVEC495xOErn3xP0UfU3qOL22owkYuY1no6tRnOWw3he/U59BnqhDlYg1kFdDtUooZRRKIo/nOUNFYVyO+wh7CAb+0Xu5hTGpJvMed7lAfKrexPpg/q8aDYqcbedWQtmWIVD99FUwYwgn9RmbHAe7Bo/cZgLL0X/QVdtgKNsLNuMr6FjRO6V+CdmrKiZO1uQgpOA9nAwiFFyR87JwHfEOChuXApxZZ15x7RXPXNyz2c/RfU6y7RTApiUiVnXnWsvDKRQLsjkp9+ueWHUndq7G1SGGgkW1hXWSD6NrtTw5pZdG5J4rH51mrJpH6tb2/8cQB0X+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zg3ijKafx/d7usi5PY+aTZPnv+ZhJZ8HvOFJLx7rsuY=;
 b=WaBPnWaBQ4Z2GQAsVCeZSDmIfcjSnOYVnWpfTC61zL3HEXc1Z1p7zRPyKBwdvpNE3Bq2sNNJldBk6l70C319Y3RADpuGV5Ip08Q5ATObgPx/cUY1ytL8evJEigpMDf9oU/lQfeyx1LuHROxr4pxWH5iVnkW/1fe1siytOx4rfCz3tQaUnJRySLiyids2+jIZ11WqOinc09M0PdLpmPzpfN1fFaoqCb5N9WakIB8i2DL9hV/uJNeq9UuZM6NTKviYXGaDBlu9wYFJSp5JWEL26w9CDFG8UXni3FqF0eJVK2xZnCMjEg3Y2XdxeRtNPPNj7oMlzzfVkEDi/T3Ayx8NIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zg3ijKafx/d7usi5PY+aTZPnv+ZhJZ8HvOFJLx7rsuY=;
 b=iruLViyJOPbsenT5pANDkrSKpKKrLppxRPHDZSzTHv6NH9B+DC5iZMxGq8A+PV1tA0AWeoWXW4HUtUgyBIS8lCpKSGFMruV/mbG/ccsdv2OOLt3iFgcr4vi8qaqB3UnaTbXotUXWIBHkDztOmpMRmKh6PwwLhrVsfXpZvNGPRQg=
Received: from CH0PR03CA0395.namprd03.prod.outlook.com (2603:10b6:610:11b::12)
 by SA1PR10MB6664.namprd10.prod.outlook.com (2603:10b6:806:2b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 21:24:00 +0000
Received: from BN5PEPF0004698A.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::c) by CH0PR03CA0395.outlook.office365.com
 (2603:10b6:610:11b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 21:23:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN5PEPF0004698A.mail.protection.outlook.com (10.167.245.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 21:23:58 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 16:23:40 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 16:23:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 16:23:40 -0500
Received: from [10.249.33.88] ([10.249.33.88])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MLNext726434;
	Tue, 22 Sep 2026 16:23:40 -0500
Message-ID: <edb0e4e5-f125-4bf7-9292-c15b1be85ecc@ti.com>
Date: Tue, 22 Sep 2026 16:23:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/wrynose][PATCH] recipes-multimedia: Add PipeWire bbappend
 for config files
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <s-kapoor@ti.com>,
        <s-sinha@ti.com>, <sen@ti.com>, <y-hegde@ti.com>
References: <20260922103002.3723697-1-p-bhagat@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260922103002.3723697-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698A:EE_|SA1PR10MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: 08b635cb-132c-4ce7-881e-08df18efd077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|3023799007|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	i4LRBiK1QvcM6GbWkW/EFBZT/5XU+bI72H/dC8Eu0eo86mGxxLZLWXKVLO5zvst4reoYvG62TGHaY/DuCXzNMtY36uX+LCt0gDHp7ked//pLupNhpIVeQO7ItJ0lDKqNjs7cWsfzg4Fb77zArUbP7Q7Z2/Fk9/YvEmZMxLtA8uu4WldpAJ6FQmUVcHHFH/s+tNxwHd6+dGy2G1hQ6WrZzkWGTN7HVDreQJWFOVbOhOF0To++k3Mv8uBDRewUsFpmU1+NuzlNyCfnb09KqHiMmSMV+bRQLj5OvtdBQd5zGGpOOspcN+1nBCqFjV2Coi3ckSbxzKGnYQlcso7gYHOeiSRq2FCInpxkmeN02ggtPsdMT33KTSB5D9RshcZ09h0NHObbr/JvJt5YBmLbGhSzl2pEvCi5Th+LY/3tx38d8eeG8Wrl808P074GsnWzHHg4db4EpeiEL+zKpNYxsHrG8mLLl6a+8AXf36y9QLAGjsC2k2NbZOt+U+FupO81NbzFPNB+itW8u751xS1eFBVWFMQdJoHxc2Cb/JqxIeEyZYzaYExyG5YgtCxKtb2XZRXSQdbbJVgvkTCfnAnIzR6nru51g4JObbHk7bnSypoOJrq91QyP/AvpHOCbH6hot8fNdMzMFaA9qtxOoduNnp2B+sFYApH3WsGj24OB1A2Pf062BoQpgA+OKVZPY16PtoLDzf/2Yh/SrYsoXbsORgHdaQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(3023799007)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5t/UiMyyC/u/6MNL4kI1l0hzO7HCBLwbrL79wvSmRRiW4HuoIohdKpJKVa/8sgj7XYhnVA2RJkYOWJRLk6syckZwVzl94UQbY/6sUfaZBu4p9NfVYBAJ/VW2FcvVQU6O07DPCmLIsSExzpmYYbZK0vuZisy3FkdLIxnK5mJxCcnHXyLbS9stfGoHtK/Nts9OGEkayUM1YvLwVnLIITyq1PPngO4/FDjGgzrjigkEXEi4Rat2fUnWGgcxgqxMpttqib9cLU+3D79hq8SdZIutHY4bvyQq5h296pxEkS4Ux18ciwCSFq5gCGE+W8WLbMXksR02hoTITqahHPQ6oUnFgPxI1ueIUmfzD1xcBzj/bynwur4CYy3YPWGvUJW55jr3dmKO70IPXq7SkD+AFOI0I7ZfyBLZdEBBdJoKA8RawLRoNvLSorcI9S0oGlyHLaN2
X-Exchange-RoutingPolicyChecked: 
	DbMvJmjLtGqq28+STv+Hm0/79iA67XTp4bVOYPVN3TFtdyLaOh85+b9YWCdLuKsMNhKGcB7nmjCQ5+Y9854YZCr3TAjxgu4pR4KbC3eXLrqiotVPSDdGzTU/NQWmxzhVsKR+UjjX5H7CvLdS4iDka5Wagwf78H6FKF03hWOodqU9xMEbyfWF9Esc9ziXrHJ/Z9F+U5gVixWTWeZXi79tGCwiAhLq2zNXOLxt7021AKjjEXif0/ffFhFN6AIbgNtmTGNmI4xqAn+Aa1D0rfVgX/FI4HxIPlmohFO40Rojn9c/JmQT4h+USAiDncWIt4MFZchvsSCBAiWifmTMqLorkw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 21:23:58.2350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b635cb-132c-4ce7-881e-08df18efd077
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN5PEPF0004698A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6664
X-Proofpoint-GUID: 6L0KDY5uk-OlbO92KhRuF4ztGTVd6v3S
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab2f1f3 cx=c_pps
 a=0BIxaMzE3dEfASKLcfg5vw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=Nm9cMq3_g25jxr1EOdYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5OCBTYWx0ZWRfX7xs5ZI7joXS2
 XEGCr8x3ADwnK+BE+YTcD9+yTNPFyzXwgLkh8a4kQ4tUXbDpkHb6b2fR1nhcjp4OSDypddUL0Gr
 Ne01/PrD+kqbbNxpdUWD4KZnkwnbgZI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5OCBTYWx0ZWRfXzmUxKqgmSdbR
 M8bTENpFql5gDwbn8k5jSGi1PebIZBUUmkQAx39nrS/EcM70XopycCBIKFMj/3QycPHRCTxIqwH
 dhWq+AvNuJ0NIpgi3ecrHNT1L5DCsL2oPREjjiTrHyNW30FpzOLaRzTfZoBwUl2rYhMyIvxUvyF
 zVAmj4gKd+faLsF9Cvh0AWJCmiL08J6upLg7KiUETYBE96lCbO5MiJg8Vq4vQj9SMH9bgppW+GI
 OC9ENZjf22niQp6eb8hZ1Ov236Tcj4WRasKha2vVHZ2DaVhESwDCR4pBq1HBrJ1i4djO+5txwe/
 oUzhFANz7iQj+kGigDhdOHud3KP1mt91KKgIBwIxzkCmbDvQnl70imqmOPfWKOjOR97L9UG15c6
 iM7qDSFSH4yautKx/b8JIdlE+NC5CM404mewWGgG7wNRPrf4JgLb4iO+/XIeD/kJYvmWUGxEHLO
 ArwPsq1mOzZfYVmhT8g==
X-Proofpoint-ORIG-GUID: 6L0KDY5uk-OlbO92KhRuF4ztGTVd6v3S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220298
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Sep 2026 21:24:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20399


Ok.  Denys and I were discussing this and we have a few changes for this 
patch series that we would like to see.

1) This can move to meta-ti-bsp so that is easier to get into users' hands.
2) When it moves to meta-ti-bsp move it into a dynamic-layer for 
multimedia-layer and add multimedia-layer to the 
LAYERRECOMMENDS_meta-ti-bsp set of layers.
3) Make sure to layer the changes into multiple patches and not just 
glob them all into one.
   a) Create the dynamic layer directory and update layer.conf
   b) Add the pipewire bbappend (the current patch) to the dynamic layer 
directory.

I think that will be cleanest formation for this.

Do all that for a v2 please.


On 9/22/2026 5:30 AM, Paresh Bhagat wrote:
> Extend the PipeWire recipe to add platform-specific ALSA configuration.
> Add sink and source configuration for 8-channel audio playback and
> capture on the AM62D2EVM as the default configuration is 2-channel.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   .../pipewire/pipewire-ti.inc                  | 20 +++++++++++++++++++
>   .../am62dxx-evm/90-pipewire-sink.conf         | 17 ++++++++++++++++
>   .../am62dxx-evm/91-pipewire-source.conf       | 17 ++++++++++++++++
>   .../pipewire/pipewire_%.bbappend              |  4 ++++
>   4 files changed, 58 insertions(+)
>   create mode 100644 meta-ti-extras/recipes-multimedia/pipewire/pipewire-ti.inc
>   create mode 100644 meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
>   create mode 100644 meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
>   create mode 100644 meta-ti-extras/recipes-multimedia/pipewire/pipewire_%.bbappend
> 
> diff --git a/meta-ti-extras/recipes-multimedia/pipewire/pipewire-ti.inc b/meta-ti-extras/recipes-multimedia/pipewire/pipewire-ti.inc
> new file mode 100644
> index 00000000..65a82671
> --- /dev/null
> +++ b/meta-ti-extras/recipes-multimedia/pipewire/pipewire-ti.inc
> @@ -0,0 +1,20 @@
> +PR:append = ".ti0"
> +
> +FILESEXTRAPATHS:prepend := "${THISDIR}/pipewire:"
> +
> +# AM62D-specific config files
> +SRC_URI:append:am62dxx-evm = " \
> +    file://90-pipewire-sink.conf \
> +    file://91-pipewire-source.conf \
> +"
> +
> +do_install:append:am62dxx-evm() {
> +    install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
> +    install -m 0644 ${UNPACKDIR}/90-pipewire-sink.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> +    install -m 0644 ${UNPACKDIR}/91-pipewire-source.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> +}
> +
> +FILES:${PN}:append:am62dxx-evm = " \
> +    ${sysconfdir}/pipewire/pipewire.conf.d/90-pipewire-sink.conf \
> +    ${sysconfdir}/pipewire/pipewire.conf.d/91-pipewire-source.conf \
> +"
> diff --git a/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf b/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
> new file mode 100644
> index 00000000..857c344e
> --- /dev/null
> +++ b/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
> @@ -0,0 +1,17 @@
> +# PipeWire sink configuration for AM62D.
> +
> +context.objects = [
> +    {
> +        factory = adapter
> +        args = {
> +            factory.name           = api.alsa.pcm.sink
> +            node.name              = "alsa_audio_sink"
> +            node.description       = "Audio Output"
> +            media.class            = "Audio/Sink"
> +            api.alsa.path          = "hw:AM62D2EVM,0"
> +            audio.rate             = 48000
> +            audio.channels         = 8
> +            audio.position         = [ FL FR FC LFE RL RR SL SR ]
> +        }
> +    }
> +]
> diff --git a/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf b/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
> new file mode 100644
> index 00000000..ac7635de
> --- /dev/null
> +++ b/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
> @@ -0,0 +1,17 @@
> +# PipeWire source configuration for AM62D.
> +
> +context.objects = [
> +    {
> +        factory = adapter
> +        args = {
> +            factory.name           = api.alsa.pcm.source
> +            node.name              = "alsa_audio_source"
> +            node.description       = "Audio Input"
> +            media.class            = "Audio/Source"
> +            api.alsa.path          = "hw:AM62D2EVM,0"
> +            audio.rate             = 48000
> +            audio.channels         = 8
> +            audio.position         = [ FL FR FC LFE RL RR SL SR ]
> +        }
> +    }
> +]
> diff --git a/meta-ti-extras/recipes-multimedia/pipewire/pipewire_%.bbappend b/meta-ti-extras/recipes-multimedia/pipewire/pipewire_%.bbappend
> new file mode 100644
> index 00000000..f806d28f
> --- /dev/null
> +++ b/meta-ti-extras/recipes-multimedia/pipewire/pipewire_%.bbappend
> @@ -0,0 +1,4 @@
> +PIPEWIRE_TI = ""
> +PIPEWIRE_TI:ti-soc = "pipewire-ti.inc"
> +
> +require ${PIPEWIRE_TI}

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

