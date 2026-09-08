Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C815C79FA0
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 08:59:16 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2811.1788857948858032769
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Sep 2026 01:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=hc+lPAR9;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=bRm4iaTK;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6886PNUw3415076
	for <meta-ti@lists.yoctoproject.org>; Tue, 8 Sep 2026 03:59:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=Y/Q+xjWR6vm1sX0
	Y+55hkXo4czGRtrfM4zuU60fHgKM=; b=hc+lPAR9oJXfTjoQJ45QLFi8EjYzHL1
	Aio+aoKov3Lj8+SCg5xkd09XIoMjviRFvGGbba9HSOb9p9t6a7MSI6AGfFAYA4QT
	UiBGgNAcLInjqI3poe8sGFgEHIhTcrdfYpydG176uhXjhT8OXjA67Ig6mrUlQyY4
	biOQUiFrkZPx3xpCCV+c+IsWiWQCALF9m1LNOblk4ZqAsPjUR0/iUBkpngZHPbq8
	uJXiSUn6qZPY7IXsSjQGLUHZ/ESnZogO870p5Mmz+VyH59/SM5D5K4vbWzkPG9/N
	0QmZfLym9R3xdsQdSfyhO6BtuG5M44yYuC4A1GlFD1FKpi1Hj4bOo4A==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ght65pj2h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Tue, 08 Sep 2026 03:59:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRMRLwra032UKsR/+WeR5mXbb0msIHYRwO74KGbk3v3fkeGlNffaZj1q1iWiJqd0Qg7P3zsUftIXGgWrLT5LSobTAh+a+JER5k9v9cfLAMTBfDcc5fmuDLmS3MZ2yy0lxkHUfELPY0rcWY9H0MLzSdR84TOR6jrcN3GPGA4O35Je4COGA0CwMrZ4lXD6XWwGKp0OtStzVXLi30J35vTxsDYqHFD30gT5aK9LTuhcMWsQAczjBajPgdquMHyG8rz4F59gz7MFK0WMsTcoyfKCzpEAom+z1+JhfmVu6myiGmf5IzI1p+kOS2D8xxBqyz5YQo8Ku22dlcgUU1rqQgX9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggzZcnHr8mBQiCPky5TdlIWvtDwR0btsEsnLAoIUgp0=;
 b=u1iz3VKszIguiwjRvwaLMW9LES3CZOdu+rZn58zQhY97claxCgaIb3Jkegi78KFx0bz+OqFxX4BC1NV2aIESLjsWnqiETtE7FV/lxZPrvAWLH3f0ocPVa9Zmoiga5Ek/UAk85voYkkzc6N/jR7vsZE1wnq7aSt8Us8otnFYkj7QCIGFogUXDMrub57eCrawO5ubNtaRFsOQ+bIsis0FJ2EuwPnepfBphOQWe3V49K/JtveNtXO5HZXCN1wBajHNX1JGjIJQif/1f7k8odyuaXCt+d4sdI6SGOyojsR4wF8ZG4S/SZUSQOV+1Qfk/rYcIw99Vr+HkqUEK/0yRjJ4icg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggzZcnHr8mBQiCPky5TdlIWvtDwR0btsEsnLAoIUgp0=;
 b=bRm4iaTKuOJrR8ZaEek27k7vglL1XIa7wduuG1atdht3y7NVSjMaCaaB60Kx+n+uirgbtv6E2Gb4DwM4ZDL2fQ+DXqXxZg9ZeVB2vsAV8ha8sarcgeUlYdDp31ylv3FDGmIdnFhN+HDtv+P1EHOBkd3qO4qHc+Zwt2CeVUO7blQ=
Received: from MN0PR03CA0010.namprd03.prod.outlook.com (2603:10b6:208:52f::7)
 by DS4PPF4EE72D997.namprd10.prod.outlook.com (2603:10b6:f:fc00::d1b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 08:58:41 +0000
Received: from BL02EPF00021F6D.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::90) by MN0PR03CA0010.outlook.office365.com
 (2603:10b6:208:52f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 08:58:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00021F6D.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 08:58:40 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 03:58:27 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 03:58:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 8 Sep 2026 03:58:27 -0500
Received: from [10.24.50.31] (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6888wPRo2158373
	for <meta-ti@lists.yoctoproject.org>; Tue, 8 Sep 2026 03:58:26 -0500
Content-Type: multipart/alternative;
	boundary="------------GfEDYyeAvEKLr3ViQD6kr0zf"
Message-ID: <46bb096e-d0d9-4624-9ebc-275316b25d4c@ti.com>
Date: Tue, 8 Sep 2026 14:28:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti][master][PATCH v2 1/3] dm-verity-upstream:
 Add dynamic layer for meta-security dm-verity
To: <meta-ti@lists.yoctoproject.org>
References: <18D2151EE391A011.1191858@lists.yoctoproject.org>
Content-Language: en-US
From: Atharv Dubey <a-dubey@ti.com>
In-Reply-To: <18D2151EE391A011.1191858@lists.yoctoproject.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6D:EE_|DS4PPF4EE72D997:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e84fb0-3d31-4b4e-f186-08df0d87611b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|4022899009|23010399003|376014|1800799024|82310400026|56012099006|3023799007|4133799003|10067099003|8096899003|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Mn1J/xyBXrZHeHi3oFzpDmxadDtFCNJrSvM2av99iEciMWfwtGMfbf7Q/H5QIfnaietd6VpDvoEln35ND8S4i80+ph5vnr1AvzmS+vEPzfZHEwUopLn5GKm3IolPyZgKVj0HhAMl5VkVdpbQoB1syP1vninDk0IsMHrTbuhRx3G8UtePiohrUxVxkakPnyVnLSX7pVOxa3mUYop1acWsFJrXA3uiYuYHT3zZtr6DKUPL5eJXeP6aCJ1uuWyi3IaF+Oa4ZOwnStjuo6W2F3iGcBICFNO9FoQofEocjfw6hUe7gic3i3kZ0EBQ53Srwf5KBqMTZ/qNl07FgS4gjunM9APsQB21S249q/NOAw5jQrU3no7x5nA42scWTWHmspFVUiCTRCQga7AFufQPUyjLjFSX64fmYFuO+9k3r9d9mpbkhi/I6l72Vj0sOKsKNur2wNrjoOE/aLWkv7IrEnax5dOtIdcweGd1MSvz7xKb6QhCnJ4KXQHwVdXiGdOhwankdmFK2W+QP8YGptZNTCRpatq2m6SJzNcbxf0+jMu1vdO8eOhm7Hw7hv9DEirD1aLHi5VA42uR2qz3F9CpZZKigMrl/znIgmmEr/uR5CL8eAorMdhi/ch3BiwbZAPfXt7xeUjIsl2kiJMZg+1PHozbzg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(4022899009)(23010399003)(376014)(1800799024)(82310400026)(56012099006)(3023799007)(4133799003)(10067099003)(8096899003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5lGzzyxJiGFgbvr/XrVLM0PMLnSHayxk17GgO1YBwnIhYRQuoSeWruaLqIAlp/97o/mU1rKaFWP0xi2NKerJniWM7Dwt+5DglCH/A/fcBrixJ83ZdkByGjAv8I3xIMS9VSUOvAwpB03CyJ5hku6FjXd8AMMKOc3DBj4NfqwnpFzY6fI6i5PmPKa1VAYvWD9kHKNOjiU3fij+tevZ4HEAupPTbg4U4i+2FropjFVxYcYDDw3ffpHLCJIkLM1oFuEYEPAupgikrKiAsbiMDpTINbppCNUaldyuGQWkNxHUODCboIbwuN+QzdmvmVreMiquxzVIL8q4sDdFg2JLLRrlZPIe0O9Tz0OYPPBkVuN6S5Kc64qcUWkgtAvmm7V3IzsxtXvhUgDlEknDEhRLOlK4mTGkZQZArhyHlnZq+SpvccaOhmv5eoTJUdrnTo2/EGML
X-Exchange-RoutingPolicyChecked: 
	Ilc5vyF3LquMP/D8q+kAU+GfBsixNmkRA7ugOw2KFejnt8dkp9ifRJC+edHB/SfwAGU1bEMi3DWWY/tbRruMm0ktsyJrPyfE+/MI51n1k0t0d5tCa2GDO9XtoNc22iffMM4JKYGloOPg/DAWQ/fMyk/blt6wSrRN4zjZNCfr/bqzvLTEOCN+iGi0MZ88GnbjHMEDotceHqhtoYkG1qbXAQOHB1X2gDBlPn8GaIUsn/lJOUWYgqQX81Ztea86ub0GG2Ow+kja8EKmzFP9fVyK2xbT5pG6XqLLDw9LJf1Usa0cG88ZYFsEhd+9DED4vhhVVhmF0h9v3ac/lBZ+VWUl/Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 08:58:40.9675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e84fb0-3d31-4b4e-f186-08df0d87611b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF4EE72D997
X-Proofpoint-GUID: hGTDGFPQ-O_SkCneK5wWCcHsLBbvORLd
X-Authority-Analysis: v=2.4 cv=I95Vgtgg c=1 sm=1 tr=0 ts=6a9fce5c cx=c_pps
 a=pRydOQwFKDU45SaoCSWz9A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=RpNjiQI2AAAA:8 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=H5lvFAfnNcAtYEuKfNcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kgj1iGsYw12fPELyMn4A:9 a=tqdMzFhGG8mD8GCBlf4leDhY3gs=:19
 a=sTxRpBpiy98KL1WkT8X2XIWo+SM=:19 a=qUwWoXz4I6Ij6XWh:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5MyBTYWx0ZWRfXy2WgqQT658lY
 dEPmS8PGnp4XK/aCQEoSnWShK/5N+FGVD4k+OXFzsZ1b1jeyuLp3bRMo6drlT+qr8PxP4s0NHbi
 Qo5dEs1EaDGx6aNdo2d8+xbWRxxLtX8bk8d2LCIQ6rxFksc57uRQQB2yfZwRK1ysd/qhsio9urC
 69DWi2VnpqfYm7USWfpyjfrbNyFXbM3ISDtTyCYwdAJYYwcsDDuoO3l3KvQ6Zf9oaP7lYPzoB1g
 9Bi04ar745/bLl+GRiF+UC9RP7UdNC2Nwl3j7hPyN+nBe7OAqGOUwGQbJgskDoiffqRZOux0Fbf
 +xhNFd/t/cCFaw7PnJsfpO25z+LXZ3BUW/DyCn1zR/arKSWqNEr2WDCM/fiqn1Xi2GnTnlgMza/
 8JRj8znav0o6KMQKBLT7k/xqCUspg1ftwJPCAftZRUM+jk/xuZNCwp5JRiovWWkVOT/sfxl4Rt7
 fJr6Y6eUs9ojd3DPRaw==
X-Proofpoint-ORIG-GUID: hGTDGFPQ-O_SkCneK5wWCcHsLBbvORLd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5MyBTYWx0ZWRfX2kKDzO0XfM1m
 glSUZOltNQgV9yT1J6T4GqgZwtzwunnNT355rXs5AAF6CpDo6ZLZgSmqWDad5bRvSl8ZfRS5KDh
 SD2fAxUbYIxsa1FaADe2TcAgrDaBTx4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080093
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Sep 2026 08:59:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20343

--------------GfEDYyeAvEKLr3ViQD6kr0zf
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi All,

On 04/09/26 15:16, Atharv Dubey via lists.yoctoproject.org wrote:
> Add an optional dynamic layer enabling dm-verity block-level integrity=20
> verification of the root filesystem for TI K3 platforms, using=20
> meta-security's stock dm-verity mechanism as-is. dm-verity hashes the=20
> rootfs at build time; at boot, a dedicated
>=20
> Add an optional dynamic layer enabling dm-verity block-level integrity
> verification of the root filesystem for TI K3 platforms, using
> meta-security's stock dm-verity mechanism as-is.
>
> dm-verity hashes the rootfs at build time; at boot, a dedicated
> initramfs loads the root hash and the kernel checks every block read
> against it. Wires DM_VERITY_IMAGE/WKS_FILE for the K3 boot chain,
> hooking do_image_wic instead of INITRAMFS_IMAGE to avoid a 3-way
> circular dependency through kernel-fit-image.bbclass.
>
> DM_VERITY_IMAGE selects which image recipe gets verity-enabled
> (default arago-base-image, overridable in local.conf); all effects are
> scoped to PN =3D=3D DM_VERITY_IMAGE, so building any other image type is
> unaffected. Only active when the "security" layer and dm-verity-upstream
> feature are enabled.
>
> Signed-off-by: Atharv Dubey<a-dubey@ti.com>
>
> ---
> v2:
>   - Replaced hardcoded /dev/mmcblk1p2 with UUID
>   - Added install -d before installing the udev ignorelist file
>   - Changed the FILES automount to specify the exact file
> ---
>   meta-ti-bsp/conf/layer.conf                     |  3 +++
>   meta-ti-bsp/conf/machine/include/k3.inc         | 10 ++++++++++
>   .../conf/include/dm-verity-upstream.inc         | 17 +++++++++++++++++
>   .../udev/files/dm-verity.ignorelist             |  1 +
>   .../recipes-core/udev/udev-extraconf_%.bbappend | 15 +++++++++++++++
>   meta-ti-bsp/files/wic/k3-verity.wks.in          |  5 +++++
>   6 files changed, 51 insertions(+)
>   create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/conf/inclu=
de/dm-verity-upstream.inc
>   create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-co=
re/udev/files/dm-verity.ignorelist
>   create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-co=
re/udev/udev-extraconf_%.bbappend
>   create mode 100644 meta-ti-bsp/files/wic/k3-verity.wks.in
>
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index 3cc54aa4..aca35cd3 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -20,12 +20,15 @@ LAYERDEPENDS_meta-ti-bsp =3D " \
>   LAYERRECOMMENDS_meta-ti-bsp =3D " \
>       openembedded-layer \
>       tpm-layer \
> +    security \
>   "
>  =20
>   BBFILES_DYNAMIC +=3D " \
>       openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/re=
cipes*/*/*.bbappend \
>       tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bb \
>       tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bbappen=
d \
> +    security:${LAYERDIR}/dynamic-layers/security-layer/recipes*/*/*.bb \
> +    security:${LAYERDIR}/dynamic-layers/security-layer/recipes*/*/*.bbap=
pend \
>   "
>  =20
>   SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
> index 2ebbfb9e..e23e0ead 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -64,3 +64,13 @@ FALCON_INCLUDE =3D ""
>   FALCON_INCLUDE:ti-falcon =3D "conf/machine/include/ti-falcon.inc"
>  =20
>   require ${FALCON_INCLUDE}
> +
> +# Upstream dm-verity path: meta-security's own dm-verity-img.bbclass +
> +# dm-verity-image-initramfs, used as-is (build-time hashing). Only active
> +# when the security layer is present and this feature is explicitly
> +# requested -- see dynamic-layers/security-layer/conf/include/dm-verity-=
upstream.inc
> +DISTRO_FEATURES[validitems] +=3D "dm-verity-upstream"
> +
> +DM_VERITY_UPSTREAM_INCLUDE =3D"${@bb.utils.contains('DISTRO_FEATURES', '=
dm-verity-upstream',=20
> 'dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc',=20
> '', d)}"
> +
> +require ${DM_VERITY_UPSTREAM_INCLUDE}
> diff --git a/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-ve=
rity-upstream.inc b/meta-ti-bsp/dynamic-layers/security-layer/conf/include/=
dm-verity-upstream.inc
> new file mode 100644
> index 00000000..4de9e2fb
> --- /dev/null
> +++ b/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-up=
stream.inc
> @@ -0,0 +1,17 @@
> +# Enables dm-verity to check the rootfs for tampering on TI K3 boards.
> +DM_VERITY_IMAGE ?=3D "arago-base-image"
> +DM_VERITY_IMAGE_TYPE =3D "ext4"
> +IMAGE_CLASSES +=3D "dm-verity-img"
> +
> +DM_VERITY_INITRAMFS_IMAGE =3D "dm-verity-image-initramfs"
> +
> +python () {
> +    if d.getVar('PN') !=3D d.getVar('DM_VERITY_IMAGE'):
> +        return
> +
> +    d.setVar('WKS_FILE', 'k3-verity.wks.in')
> +    d.appendVar('EXTRA_IMAGE_FEATURES', ' read-only-rootfs')
> +    d.appendVar('WICVARS', ' DM_VERITY_IMAGE DM_VERITY_IMAGE_TYPE IMAGE_=
NAME_SUFFIX IMGDEPLOYDIR')
> +    d.appendVarFlag('do_image_wic', 'depends', ' %s:do_image_complete' %=
 d.getVar('DM_VERITY_INITRAMFS_IMAGE'))
> +    d.appendVar('IMAGE_BOOT_FILES', ' %s-%s.cpio.gz' % (d.getVar('DM_VER=
ITY_INITRAMFS_IMAGE'), d.getVar('MACHINE')))
> +}
> diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/=
files/dm-verity.ignorelist b/meta-ti-bsp/dynamic-layers/security-layer/reci=
pes-core/udev/files/dm-verity.ignorelist
> new file mode 100644
> index 00000000..5af878c9
> --- /dev/null
> +++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/files/d=
m-verity.ignorelist
> @@ -0,0 +1 @@
> +/dev/mmcblk1p2
> diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/=
udev-extraconf_%.bbappend b/meta-ti-bsp/dynamic-layers/security-layer/recip=
es-core/udev/udev-extraconf_%.bbappend
> new file mode 100644
> index 00000000..dc6b37f9
> --- /dev/null
> +++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-ex=
traconf_%.bbappend
> @@ -0,0 +1,15 @@
> +# Under dm-verity, the raw root partition looks unmounted to udev's
> +# auto-mount check, so it tries to mount it a second time on its own,
> +# outside of dm-verity's protection. This tells it to skip that partitio=
n.
> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
> +
> +SRC_URI +=3D"${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream=
',=20
> 'file://dm-verity.ignorelist', '', d)}"
> +
> +do_install:append() {
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'tr=
ue', 'false', d)}; then
> +        install -d ${D}${sysconfdir}/udev/mount.ignorelist.d
> +        install -m 0644 ${UNPACKDIR}/dm-verity.ignorelist ${D}${sysconfd=
ir}/udev/mount.ignorelist.d/dm-verity
> +    fi
> +}
> +
> +FILES:${PN}-automount +=3D "${sysconfdir}/udev/mount.ignorelist.d/dm-ver=
ity"
> diff --git a/meta-ti-bsp/files/wic/k3-verity.wks.in b/meta-ti-bsp/files/w=
ic/k3-verity.wks.in
> new file mode 100644
> index 00000000..2ad0609f
> --- /dev/null
> +++ b/meta-ti-bsp/files/wic/k3-verity.wks.in
> @@ -0,0 +1,5 @@
> +# Disk layout for a board that boots with dm-verity enabled.
> +
> +bootloader --timeout=3D3 --append=3D"rootfstype=3Dext4 root=3DPARTUUID=
=3D${UUID_2} ${TI_WKS_BOOTLOADER_APPEND}"
> +part --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDER},ini=
trd=3D${DM_VERITY_INITRAMFS_IMAGE}-${MACHINE}.cpio.gz" --fstype=3Dvfat --la=
bel boot --active --align 1024 --use-uuid --fixed-size 128M
> +part / --source rawcopy --sourceparams=3D"file=3D${IMGDEPLOYDIR}/${DM_VE=
RITY_IMAGE}-${MACHINE}${IMAGE_NAME_SUFFIX}.${DM_VERITY_IMAGE_TYPE}.verity" =
--align 1024 --use-uuid
> --=20
> 2.34.1


Please dont review this patch series. Sorry for the ping, will send out=20
the next revision.

Thanks,
Atharv

>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#20328):https://urldefense.com/v3/__https://lists.yoct=
oproject.org/g/meta-ti/message/20328__;!!G3vK!Xac4SNABSkxHw2RTkn1Y4rERROGlF=
cByoMZDF6tBf3B6sZTe9PwvsuqdEDl9b3ovSFUWS1rvWjMeb7Rbg_y0_jif7ow25rro$=20
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.or=
g/mt/121083450/10595936__;!!G3vK!Xac4SNABSkxHw2RTkn1Y4rERROGlFcByoMZDF6tBf3=
B6sZTe9PwvsuqdEDl9b3ovSFUWS1rvWjMeb7Rbg_y0_jif7jFgGdA0$=20
> Group Owner:meta-ti+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/g/=
meta-ti/unsub__;!!G3vK!Xac4SNABSkxHw2RTkn1Y4rERROGlFcByoMZDF6tBf3B6sZTe9Pwv=
suqdEDl9b3ovSFUWS1rvWjMeb7Rbg_y0_jif7tcd--1Q$  [a-dubey@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=

--------------GfEDYyeAvEKLr3ViQD6kr0zf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p>Hi All,=C2=A0</p>
    <div class=3D"moz-cite-prefix">On 04/09/26 15:16, Atharv Dubey via
      lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:18D2151EE391A011.1191858@lists.yoctoproject.org">
      <!-- BaNnErBlUrFlE-BoDy-start -->
      <!-- Preheader Text : BEGIN -->
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
      <div
style=3D"display:none !important;display:none;visibility:hidden;mso-hide:al=
l;font-size:1px;color:#ffffff;line-height:1px;max-height:0px;opacity:0;over=
flow:hidden;">
        Add an optional dynamic layer enabling dm-verity block-level
        integrity verification of the root filesystem for TI K3
        platforms, using meta-security's stock dm-verity mechanism
        as-is. dm-verity hashes the rootfs at build time; at boot, a
        dedicated</div>
      <!-- Preheader Text : END -->
      <!-- Email Banner : BEGIN -->
      <div
style=3D"display:none !important;display:none;visibility:hidden;mso-hide:al=
l;font-size:1px;color:#ffffff;line-height:1px;max-height:0px;opacity:0;over=
flow:hidden;"></div>
      <!-- Email Banner : END -->
      <!-- BaNnErBlUrFlE-BoDy-end -->
      <!-- BaNnErBlUrFlE-HeAdEr-start -->
      <style>#pfptBanner3m2yu0v { all: revert !important; display: block !i=
mportant;
    visibility: visible !important; opacity: 1 !important;
    background-color: #d0d8dc !important;
    max-width: none !important; max-height: none !important }.pfptPrimaryBu=
tton3m2yu0v:hover, .pfptPrimaryButton3m2yu0v:focus {
    background-color: #b4c1c7 !important; }.pfptPrimaryButton3m2yu0v:active=
 {
    background-color: #90a4ae !important; }html:root, html:root>body { all:=
 revert !important; display: block !important;
    visibility: visible !important; opacity: 1 !important; }</style>
      <!-- BaNnErBlUrFlE-HeAdEr-end -->
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap; w=
ord-wrap: break-word">Add an optional dynamic layer enabling dm-verity bloc=
k-level integrity
verification of the root filesystem for TI K3 platforms, using
meta-security's stock dm-verity mechanism as-is.

dm-verity hashes the rootfs at build time; at boot, a dedicated
initramfs loads the root hash and the kernel checks every block read
against it. Wires DM_VERITY_IMAGE/WKS_FILE for the K3 boot chain,
hooking do_image_wic instead of INITRAMFS_IMAGE to avoid a 3-way
circular dependency through kernel-fit-image.bbclass.

DM_VERITY_IMAGE selects which image recipe gets verity-enabled
(default arago-base-image, overridable in local.conf); all effects are
scoped to PN =3D=3D DM_VERITY_IMAGE, so building any other image type is
unaffected. Only active when the "security" layer and dm-verity-upstream
feature are enabled.

Signed-off-by: Atharv Dubey <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:a-dubey@ti.com">&lt;a-dubey@ti.com&gt;</a>

---
v2:
 - Replaced hardcoded /dev/mmcblk1p2 with UUID
 - Added install -d before installing the udev ignorelist file
 - Changed the FILES automount to specify the exact file
---
 meta-ti-bsp/conf/layer.conf                     |  3 +++
 meta-ti-bsp/conf/machine/include/k3.inc         | 10 ++++++++++
 .../conf/include/dm-verity-upstream.inc         | 17 +++++++++++++++++
 .../udev/files/dm-verity.ignorelist             |  1 +
 .../recipes-core/udev/udev-extraconf_%.bbappend | 15 +++++++++++++++
 meta-ti-bsp/files/wic/k3-verity.wks.in          |  5 +++++
 6 files changed, 51 insertions(+)
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/conf/include/=
dm-verity-upstream.inc
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-core/=
udev/files/dm-verity.ignorelist
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-core/=
udev/udev-extraconf_%.bbappend
 create mode 100644 meta-ti-bsp/files/wic/k3-verity.wks.in

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 3cc54aa4..aca35cd3 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -20,12 +20,15 @@ LAYERDEPENDS_meta-ti-bsp =3D " \
 LAYERRECOMMENDS_meta-ti-bsp =3D " \
     openembedded-layer \
     tpm-layer \
+    security \
 "
=20
 BBFILES_DYNAMIC +=3D " \
     openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recip=
es*/*/*.bbappend \
     tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bb \
     tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bbappend \
+    security:${LAYERDIR}/dynamic-layers/security-layer/recipes*/*/*.bb \
+    security:${LAYERDIR}/dynamic-layers/security-layer/recipes*/*/*.bbappe=
nd \
 "
=20
 SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/mac=
hine/include/k3.inc
index 2ebbfb9e..e23e0ead 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -64,3 +64,13 @@ FALCON_INCLUDE =3D ""
 FALCON_INCLUDE:ti-falcon =3D "conf/machine/include/ti-falcon.inc"
=20
 require ${FALCON_INCLUDE}
+
+# Upstream dm-verity path: meta-security's own dm-verity-img.bbclass +
+# dm-verity-image-initramfs, used as-is (build-time hashing). Only active
+# when the security layer is present and this feature is explicitly
+# requested -- see dynamic-layers/security-layer/conf/include/dm-verity-up=
stream.inc
+DISTRO_FEATURES[validitems] +=3D "dm-verity-upstream"
+
+DM_VERITY_UPSTREAM_INCLUDE =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:${@bb.utils.contains('DISTRO_FEATURES','dm-verity-upstream','dynamic=
-layers/security-layer/conf/include/dm-verity-upstream.inc','',d)}">"${@bb.=
utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'dynamic-layers/sec=
urity-layer/conf/include/dm-verity-upstream.inc', '', d)}"</a>
+
+require ${DM_VERITY_UPSTREAM_INCLUDE}
diff --git a/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-veri=
ty-upstream.inc b/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm=
-verity-upstream.inc
new file mode 100644
index 00000000..4de9e2fb
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upst=
ream.inc
@@ -0,0 +1,17 @@
+# Enables dm-verity to check the rootfs for tampering on TI K3 boards.
+DM_VERITY_IMAGE ?=3D "arago-base-image"
+DM_VERITY_IMAGE_TYPE =3D "ext4"
+IMAGE_CLASSES +=3D "dm-verity-img"
+
+DM_VERITY_INITRAMFS_IMAGE =3D "dm-verity-image-initramfs"
+
+python () {
+    if d.getVar('PN') !=3D d.getVar('DM_VERITY_IMAGE'):
+        return
+
+    d.setVar('WKS_FILE', 'k3-verity.wks.in')
+    d.appendVar('EXTRA_IMAGE_FEATURES', ' read-only-rootfs')
+    d.appendVar('WICVARS', ' DM_VERITY_IMAGE DM_VERITY_IMAGE_TYPE IMAGE_NA=
ME_SUFFIX IMGDEPLOYDIR')
+    d.appendVarFlag('do_image_wic', 'depends', ' %s:do_image_complete' % d=
.getVar('DM_VERITY_INITRAMFS_IMAGE'))
+    d.appendVar('IMAGE_BOOT_FILES', ' %s-%s.cpio.gz' % (d.getVar('DM_VERIT=
Y_INITRAMFS_IMAGE'), d.getVar('MACHINE')))
+}
diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/fi=
les/dm-verity.ignorelist b/meta-ti-bsp/dynamic-layers/security-layer/recipe=
s-core/udev/files/dm-verity.ignorelist
new file mode 100644
index 00000000..5af878c9
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/files/dm-=
verity.ignorelist
@@ -0,0 +1 @@
+/dev/mmcblk1p2
diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/ud=
ev-extraconf_%.bbappend b/meta-ti-bsp/dynamic-layers/security-layer/recipes=
-core/udev/udev-extraconf_%.bbappend
new file mode 100644
index 00000000..dc6b37f9
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extr=
aconf_%.bbappend
@@ -0,0 +1,15 @@
+# Under dm-verity, the raw root partition looks unmounted to udev's
+# auto-mount check, so it tries to mount it a second time on its own,
+# outside of dm-verity's protection. This tells it to skip that partition.
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
+
+SRC_URI +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@bb.utils=
.contains('DISTRO_FEATURES','dm-verity-upstream','file://dm-verity.ignoreli=
st','',d)}">"${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', =
'file://dm-verity.ignorelist', '', d)}"</a>
+
+do_install:append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'true=
', 'false', d)}; then
+        install -d ${D}${sysconfdir}/udev/mount.ignorelist.d
+        install -m 0644 ${UNPACKDIR}/dm-verity.ignorelist ${D}${sysconfdir=
}/udev/mount.ignorelist.d/dm-verity
+    fi
+}
+
+FILES:${PN}-automount +=3D "${sysconfdir}/udev/mount.ignorelist.d/dm-verit=
y"
diff --git a/meta-ti-bsp/files/wic/k3-verity.wks.in b/meta-ti-bsp/files/wic=
/k3-verity.wks.in
new file mode 100644
index 00000000..2ad0609f
--- /dev/null
+++ b/meta-ti-bsp/files/wic/k3-verity.wks.in
@@ -0,0 +1,5 @@
+# Disk layout for a board that boots with dm-verity enabled.
+
+bootloader --timeout=3D3 --append=3D"rootfstype=3Dext4 root=3DPARTUUID=3D$=
{UUID_2} ${TI_WKS_BOOTLOADER_APPEND}"
+part --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDER},initr=
d=3D${DM_VERITY_INITRAMFS_IMAGE}-${MACHINE}.cpio.gz" --fstype=3Dvfat --labe=
l boot --active --align 1024 --use-uuid --fixed-size 128M
+part / --source rawcopy --sourceparams=3D"file=3D${IMGDEPLOYDIR}/${DM_VERI=
TY_IMAGE}-${MACHINE}${IMAGE_NAME_SUFFIX}.${DM_VERITY_IMAGE_TYPE}.verity" --=
align 1024 --use-uuid
--=20
2.34.1 </pre>
    </blockquote>
    <p><br>
    </p>
    <p>Please dont review this patch series. Sorry for the ping, will
      send out the next revision.=C2=A0=C2=A0<br>
      <br>
      Thanks,=C2=A0<br>
      Atharv</p>
    <blockquote type=3D"cite"
      cite=3D"mid:18D2151EE391A011.1191858@lists.yoctoproject.org">
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap; w=
ord-wrap: break-word">

</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#20328): <a class=3D"moz-txt-link-freetext" href=3D"http=
s://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-ti/message/20=
328__;!!G3vK!Xac4SNABSkxHw2RTkn1Y4rERROGlFcByoMZDF6tBf3B6sZTe9PwvsuqdEDl9b3=
ovSFUWS1rvWjMeb7Rbg_y0_jif7ow25rro$">https://urldefense.com/v3/__https://li=
sts.yoctoproject.org/g/meta-ti/message/20328__;!!G3vK!Xac4SNABSkxHw2RTkn1Y4=
rERROGlFcByoMZDF6tBf3B6sZTe9PwvsuqdEDl9b3ovSFUWS1rvWjMeb7Rbg_y0_jif7ow25rro=
$</a>=20
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://urldefe=
nse.com/v3/__https://lists.yoctoproject.org/mt/121083450/10595936__;!!G3vK!=
Xac4SNABSkxHw2RTkn1Y4rERROGlFcByoMZDF6tBf3B6sZTe9PwvsuqdEDl9b3ovSFUWS1rvWjM=
eb7Rbg_y0_jif7jFgGdA0$">https://urldefense.com/v3/__https://lists.yoctoproj=
ect.org/mt/121083450/10595936__;!!G3vK!Xac4SNABSkxHw2RTkn1Y4rERROGlFcByoMZD=
F6tBf3B6sZTe9PwvsuqdEDl9b3ovSFUWS1rvWjMeb7Rbg_y0_jif7jFgGdA0$</a>=20
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:meta-ti+o=
wner@lists.yoctoproject.org">meta-ti+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://urldefense.=
com/v3/__https://lists.yoctoproject.org/g/meta-ti/unsub__;!!G3vK!Xac4SNABSk=
xHw2RTkn1Y4rERROGlFcByoMZDF6tBf3B6sZTe9PwvsuqdEDl9b3ovSFUWS1rvWjMeb7Rbg_y0_=
jif7tcd--1Q$">https://urldefense.com/v3/__https://lists.yoctoproject.org/g/=
meta-ti/unsub__;!!G3vK!Xac4SNABSkxHw2RTkn1Y4rERROGlFcByoMZDF6tBf3B6sZTe9Pwv=
suqdEDl9b3ovSFUWS1rvWjMeb7Rbg_y0_jif7tcd--1Q$</a>  [<a class=3D"moz-txt-lin=
k-abbreviated" href=3D"mailto:a-dubey@ti.com">a-dubey@ti.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------GfEDYyeAvEKLr3ViQD6kr0zf--

