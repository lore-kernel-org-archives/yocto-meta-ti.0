Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40464.1793187007831742760
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Oct 2026 04:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=Iy4D3skc;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=ULUPVy5X;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: r-sharma3@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69S8HljY1625849;
	Wed, 28 Oct 2026 06:30:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=70UxOuSnDoqdArkBeOtffiPkpPmk87NbWOaQ8bWB1
	jM=; b=Iy4D3skc+prhgQ0INVQUjIJMDI9RRucIYyqbpjcHxi64BbTf0HRj+Ot3C
	36joBtXNpFq23NCQJ5PKdzoUjxa8Uh7KweEzNyoSQlL39TYnK1e8j7/l+WkqPvDj
	qB/LprQni4FFpqmNCORgAVjZQJ1cKrl4Ge9wP1nPPeXEk702LRDG76aln9wW/9oe
	IO1sA32jZ4zKIKozJ4gbc9PuwGsNqUOWwggdASManc6+cHnu1Ramc+AQd1XK1Myh
	P3Z8opDG5EBLogpylniDpeiskk8lC+OKiG06nG5A6r7UbDHvPOdzL+gRVfuBOGwQ
	kxmZgPBiGZ8yJQ5vyzDNMUCZw72Xg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012007.outbound.protection.outlook.com [52.101.53.7])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hk9ngaf48-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 06:30:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JczFC285Ijv2eXrJvj7UHsk7kRlEcWoCCvOae+vwYS117Pd53uDUZRqMOv1X8Y2lDTtWRMEDR+SInLubLN/oaFa3LCWIiHF7BZb8GVuGaiiQ3h9ac5e1KMdTs+Pb5dRaEwpzYyO+0roBuZgRgJfVZjGvAr6GSCwkysmZ0LBEd8O8XS4hwdxa3FuE5FnGzTkEGGBjbVZ2avWvEQTSzapblw+iM+yKFjoMacjr/iO6tF49OSaFB44W4L9q6hVc62LJYpuIvtErbZaW0mQIFi/mkc/ukya1IfXjV6B/Rht1SqCi4Rxb2f/sjQ/EYcxDKo9TJJf8H5o5uWZKBkIJP9aXeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70UxOuSnDoqdArkBeOtffiPkpPmk87NbWOaQ8bWB1jM=;
 b=inp9uZweTrSi9eJPEWBjYl+tahJmetxW97LYx77E8TLN8UizwB/l57xxQr/kqpFlvSOTyIiTCirV4R6rVEegKvCZgzCdvaVgBl6RTE9r4CtMeEeJJ4rvDQlshypPNEu0mR4RndF/m/p/MPM65uB4PlG80PzeRRvjMo6iP8NnWXdOwmDjG0JeBrswXhQHVZhwuzGjChzVPOcHzYR8c40OVsEZOL6dIhRqFdiNT34w7AicS9Jko40e4QhQZALXRjhkvOxGwlNM+etFGNmeY4vktpaUoJ5G+986X4ThkqH16MurBFtpyweCy0d1Vy8swWKN9aw/FwB/eFQhpBhF7HUWZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70UxOuSnDoqdArkBeOtffiPkpPmk87NbWOaQ8bWB1jM=;
 b=ULUPVy5XvmoDa4DFSvWAV8KnG/muBWwsf7NCEBdnbUA146Z6g+nxeH0lKSqEy/gkXOtwjdRjsmpOhq3TalozOoA0vGwBRrKQKR1iF95bwlBlCycw1vKNa+VewXycDYi9IezTGM+VSJskcQOvFA5H9bX5Qwlf+t0yp3A/1BstFH4=
Received: from BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::14)
 by DS3PR10MB997726.namprd10.prod.outlook.com (2603:10b6:8:345::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 11:30:03 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::1b) by BY1P220CA0022.outlook.office365.com
 (2603:10b6:a03:5c3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 11:30:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 11:30:03 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 28 Oct
 2026 06:29:48 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 28 Oct
 2026 06:29:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 28 Oct 2026 06:29:48 -0500
Received: from [10.24.51.39] (uda1253387.dhcp.ti.com [10.24.51.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69SBTk143895055;
	Wed, 28 Oct 2026 06:29:47 -0500
Message-ID: <de749233-b89d-47ea-b2fa-5fcb0236aa77@ti.com>
Date: Wed, 28 Oct 2026 16:59:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti] [wrynose][PATCH v3 2/2] am62lxx-evm: Add DSI
 config fragments for display support
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>
References: <20261023075540.2577479-1-r-sharma3@ti.com>
 <18E11980115CD830.3062525@lists.yoctoproject.org>
Content-Language: en-US
From: rahul sharma <r-sharma3@ti.com>
In-Reply-To: <18E11980115CD830.3062525@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|DS3PR10MB997726:EE_
X-MS-Office365-Filtering-Correlation-Id: d9334196-6a03-4884-14b4-08df34e6cf29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|4022899009|36860700016|82310400026|261026135527099003|261026140227099003|261026130827099003|4143699003|261021123027099003|56012099006|261022113327099003|261022105027099003|261009223027099003|261022115727099003|261021130227099003|261021135927099003|261021121427099003|261021133027099003|261022075727099003|22082099003|261026121527099003|4133799003|18002099003|6133799003|3023799007|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info: ngLEqBojybtNF06Md9tkzwLYEiHNeiIc3KxekicZZyY/25IUqFMF1LPONJdMbfX0H/7+x8vUSLXNrer4s3kvsWuU4UOhrF5T/VxWX5uGywshVnLISVSrwlbtsZVNd3etsaE3g+s9eS5NFJEFG+ynwg7uBs9r1adNKEZLALFLkIcC+9BS1r14jbgNKqRpWw+xUnN+EEDLq03yEZmtQ/3WZrzXkkf0pA2XeR2naLYjCHBDy0zPxLbCR0F+TmVi7h0+L6Co6vDQvCy34xRKTe1YUGLSZ/hjppb55AR6C9FBWdmEnipmu5/sCdp2e+cUUVwnnZeOWiY8H9zSdowkDaF+7EwKtOtHVqLcpX4jdOEgctvAo+Ilv5h9Dyu4Wym59qjYcKkbO0luqDA8yz6dcCM6MzLUJstIbqT2UID33ew93yaYexjxec2zVOePL4KwKJV6rBkOJCKl9iqql2IOlnIWfEuP5uZy+IgA2KzQMUPd8ihBB5nkZA8DMq8aKDSY/BZe0yFX1vPeKJcn7kfYLl+RXTMCGDefjAExlT0PFGWRzDiydWnYfsU+Z1+uu1LNCDQNen9/P+qvkeXAqB3Ws3RZF6IutT0Sb0b2zNfblt9/BtDXSjaEJKPRSwGAwT70ZgfCU4pzpxodXmJG2wh2WxzjBg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(4022899009)(36860700016)(82310400026)(261026135527099003)(261026140227099003)(261026130827099003)(4143699003)(261021123027099003)(56012099006)(261022113327099003)(261022105027099003)(261009223027099003)(261022115727099003)(261021130227099003)(261021135927099003)(261021121427099003)(261021133027099003)(261022075727099003)(22082099003)(261026121527099003)(4133799003)(18002099003)(6133799003)(3023799007)(10067099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: U3ew/Y+xDNuCDzXJuw3QWxGueCwt8+diAKstbRwhDzpzPsoU7FDWst+PxRHSEETCkC893jFSQOi+ySEJgC9j6JoZWWD/xSpDamSryLPKNs6doZ5DUkh4Pvhbra+dnbopzYe69E9TMgE76MPWWNmVELidmuSB8NqKWAh3Npy+hPeT4NitZuabf7HXCCDeVO6wFarFDkZf7bJWyS263gzmpO5jo7EPZnHBKGpRRGdYlaGjmyMq7jgGhJtRKb5lGP8msr8MISNdIfjhl7BQpCJi9Fz33JKNeyzVLFb+WQURA5j0vkpCFrvy9PH3YyqaqEaZY5C/L1ElNh0B+zOoyEEkwSfzThdgthV6fITp5gOGN49Ic6W4Px0Y1roZhbh+klY2lZPwjBaQdsToO/sEYhEiuMPmwFQEtdlNbFr6htkYx9jOQqAY+n2KFI483OgYBnCb
X-Exchange-RoutingPolicyChecked: w9uidxkab4eoZY/za6weiDWjE4Pxr6xC5607ItzWnBtlRKnATEoHCVdHmmkXbMKmsRjDvXbORydwDE+jQIUdfuu2LCGgnDxBvDlivuYBm3YzBglZkkAFoqh3wGiq2UDI512YZqqB+7RXItY+o9f/3XwnjUxj6ZVN056TTF+kGpFNtFdDIoZ49r48ViQY448SuDSiHo8RpzLwbzscfV0aLpNgDVuawsevbA31yp1SamYlP83IVv9MIAoASyIggd1R/P1C+9hxtMbTWJWFKUEw16wcyHOS65JGGc0gJzSbZfbv+qKdFV7POVGYXwX2EJJRu7KLDsPws76X49N+YdsgXA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 11:30:03.1355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9334196-6a03-4884-14b4-08df34e6cf29
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR10MB997726
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NSBTYWx0ZWRfX3pYFY3ISrkjm
 GhHAgtg4Y/oi3pDnLj0+0kSwc+4mHb/0L3JlzyAx2HL+RCG2m/Um+7O5TaIdudwOnvJJjUEDe11
 iFJVI4GUrlVT2T2yDWlv2Ba4je5TwAo=
X-Authority-Analysis: v=2.4 cv=CJ+/zhrD c=1 sm=1 tr=0 ts=6ae1dcbe cx=c_pps
 a=OViojaO3c1oaidwcGWKC2A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=RpNjiQI2AAAA:8
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=UhW-HX3ZSOM0d8rbzY8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: tWdW7ImKnEmwlNNCEUNInNsetBiEHBH7
X-Proofpoint-GUID: tWdW7ImKnEmwlNNCEUNInNsetBiEHBH7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NSBTYWx0ZWRfX5/NcI7Hk3Czd
 Yu3Jwu6G8M9+LiU5VyoGA4nyx0WLJ43ePPg1dYwJh+Oo+F7LZQCGbbJu7R08PFPOKIADtE5/j5T
 NzfvlWusy9I8yhHNQuSJWpNqF+I/9SX6AHRU9z7MeSAoVi4CcsTwUwIPULazAkIMPooivZOZz6R
 u+zfC2BGEikOYsyREIiWWHvMGDsYVvE2inPSnKGL0lzC/pM5MDXgc5oA8ylN9dC2+rdz82txpoc
 yhEHLcO0VjmKEalYsd9clzX7OLvj7iTZ9t1tvRvkGw7608ascQ5TZVxbRrJbT7O2KQI2nrfUGmR
 sE8XjmfUr4P/V7bihhcAuI5SDv7Izn6ikMFVnICo8dr0AhSES5OWrIKDcsMLMY6qCst0978mGqM
 T9vFmfP7gkIqn4szfyN5MHBmKbeNnI+eVFbK2o08FHTcHY1AShm6E5PFw2G7E5kdTlVH73XdEaB
 34o4onA8Hgxks6oO05g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280045
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0384305.ppops.net id 69S8HljY1625849
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 28 Oct 2026 11:30:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20498

Please ignore this AM62L specific patch. The other patch for AM62P is=20
good to go.

BR
Rahul

On 23/10/26 13:25, Rahul Sharma via lists.yoctoproject.org wrote:
> Add U-Boot configuration fragments for DSI display support with Raspber=
ry Pi
> panel on AM62L EVM. The fragments enable: - am62x_a53_splashscreen.=E2=80=
=8Aconfig:
> Splash screen on Cortex-A53 - k3_a53_dsi.=E2=80=8Aconfig: DSI support f=
or K3 Cortex-A53
> - am62lx_evm_dsi_rpi_panel.=E2=80=8Aconfig:=E2=80=8A
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source =
of this
> email and know the content is safe.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!
> updqPBkvVkw6KgZEHH3tXcy92BOiRNgsA3mnKk2PCt2BhTigyQURNeWYii2FwywusSBJAwz=
87F9If_ZgfAentg1LzP36ox-R$>
> ZjQcmQRYFpfptBannerEnd
>=20
> Add U-Boot configuration fragments for DSI display support with
> Raspberry Pi panel on AM62L EVM.
>=20
> The fragments enable:
> - am62x_a53_splashscreen.config: Splash screen on Cortex-A53
> - k3_a53_dsi.config: DSI support for K3 Cortex-A53
> - am62lx_evm_dsi_rpi_panel.config: DSI Raspberry Pi panel support
>=20
> Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
> ---
>    meta-ti-bsp/conf/machine/am62lxx-evm.conf | 3 +++
>    1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/co=
nf/machine/am62lxx-evm.conf
> index 7a422617..0799becd 100644
> --- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
> @@ -26,3 +26,6 @@ UBOOT_DTB_LOADADDRESS =3D "0x84f00000"
>    UBOOT_DTBO_LOADADDRESS =3D "0x84f80000"
>   =20
>    TFA_BOARD =3D "am62lx-evm"
> +
> +# DSI config fragments for display support
> +UBOOT_FRAGMENTS:append:bsp-ti-6_18 =3D " am62x_a53_splashscreen.config=
 k3_a53_dsi.config am62lx_evm_dsi_rpi_panel.config"
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#20491): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/20491__;!!G3vK!Qyn5HIvwm5mWZxEmdL9aDjG0=
b16w2IetsnTpu828eDRbLgPPiqPFrNq3Ul7FeaZxpQJDBHqNIOoMLlv52Zzi_J2A46MCfbK8t=
sc$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/121897108/10703656__;!!G3vK!Qyn5HIvwm5mWZxEmdL9aDjG0b16w2IetsnTpu=
828eDRbLgPPiqPFrNq3Ul7FeaZxpQJDBHqNIOoMLlv52Zzi_J2A46MColOWBZk$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!Qyn5HIvwm5mWZxEmdL9aDjG0b16w2IetsnTpu828eDRbLgP=
PiqPFrNq3Ul7FeaZxpQJDBHqNIOoMLlv52Zzi_J2A46MC7qPjZtc$  [r-sharma3@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

