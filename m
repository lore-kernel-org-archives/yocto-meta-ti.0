Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.361.1794413218799601944
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Nov 2026 08:06:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=BFOchl87;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=GwacE1iJ;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ABF2uwr616939;
	Wed, 11 Nov 2026 10:06:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=l6gGOdfS5l38C/jY7WoJzKDJkDaDKyAQBjqDN+imf
	mY=; b=BFOchl87CtYedt4715EWjKtGtqUa6mA4VTQyKekG3Vq+OagGY69MIkASZ
	D2uToDXagEulGLjjDKf/kL7oupiz+YAzODutTlmRLl01IDqRwo3nv5BKvuNo9t0O
	RIR2vSq2vfboHIn/WUq6fnc9c1EyWc8vSNwgtaFlW98fOw4LtwXB6SFt60UXRRum
	BkezdgXlHIsNYqUgMJTlXdXwnJJwXbewwYpCB31G+J/+hbo8JQstYImHvPhrs5m0
	gcyDp+DyksOYZLtjW8v7ynf6V8RS2j/w3rACXYhPSALpyIj2Ep/egdOTsx+LleaU
	aMlCkjHN/T7I1xa41zpVJULL03cUQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010016.outbound.protection.outlook.com [52.101.61.16])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hveupvae9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:06:57 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uNpVZCUT66iCc0AoAbLuzgEQDLcxOT27O+fYR3flL9+UEDXQ9XwgBnpqmSI+b+vALnWQWtxQHlqXqAITs3GD7fkymIjLLFqBXelGzoR0HpVVozj+V8xsfv5wHDQtqD0O+QzUKiITDjNsH+L6GrvjuaOkLUvivkfinVNztzKPgP2IrmsuINTWeNiyj54MoYt05DinLz6iJDAK/2a51RQBdzmx0xZzjqV9G7fFzaEbs+YeT2zHNMMtlNk9qpM+RMX9nfMzQ3QMM0y2QVasDDHFubeAOJD9uRGXWJQicMouLSNe6XiuH8qooXfmhNVLKpYseEy6vhKtbW1hXUrLjTJMbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6gGOdfS5l38C/jY7WoJzKDJkDaDKyAQBjqDN+imfmY=;
 b=IzfEdxoVODg9bgPQ9mZfuSYbAzpRj+7xp0LCiM/rp7jgEHWXEBWw0BMcIjiciDpa0lXNAFgmJwZbe5T9JxqTU9JMDVQ9cv3eM1mv+05l3cWpmFZVpjpqo7eq7piPVmvXiIODSpEiueo18lj/G1VBYFZ8aALfcfyKULktptGgPmmts3r2/IP8x2w+UksBox2Ndi2iuRdii1OCl/U2nM8QQtRJ8dk2PZMfIj4WbWzgZRlOCTx70kH4N38K/qhXcobB663hl9gUfe6lut+My6+GKPtE3o80Ekn46VVnl6+tE6gfsJP9X4ACozVzM3fwYZqPCB8S5HuimJEwyN2oSHIazg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6gGOdfS5l38C/jY7WoJzKDJkDaDKyAQBjqDN+imfmY=;
 b=GwacE1iJu5fLyj/VCE1F7utK+OOGgJtfgKUYnO2Lx3+YO48BPbPkveRLrVXp7SYF0lSTXyARxsMI99cFHl2XsCVbYckK2/UMBXudgRn6seF/PUviZGXCCt4su8qZ2rgkZa7p1sXrW9GW9UM3bbDw2Cp/XF6Icuc0GjkZGfdelfw=
Received: from CH2PR15CA0004.namprd15.prod.outlook.com (2603:10b6:610:51::14)
 by CH0PR10MB7533.namprd10.prod.outlook.com (2603:10b6:610:183::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 16:06:12 +0000
Received: from CH2PEPF000166C0.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::95) by CH2PR15CA0004.outlook.office365.com
 (2603:10b6:610:51::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 16:06:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF000166C0.mail.protection.outlook.com (10.167.252.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 16:06:11 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 10:05:54 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 10:05:30 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 10:05:29 -0600
Received: from [10.249.66.236] ([10.249.66.236])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABG5Usp023280;
	Wed, 11 Nov 2026 10:05:30 -0600
Message-ID: <20456b38-7fed-444e-bc7a-c54f9467cdf5@ti.com>
Date: Wed, 11 Nov 2026 10:05:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [wrynose][PATCH] am62pxx-evm: Add tisdk-uenv configuration for
 display support
To: Rahul Sharma <r-sharma3@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <denys@konsulko.com>
References: <20261111101358.3203148-1-r-sharma3@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20261111101358.3203148-1-r-sharma3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C0:EE_|CH0PR10MB7533:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d682a7b-f26d-4535-2718-08df400db4ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|56012099006|18002099003|22082099003|6133799003|10067099003|261009223027099003|261026121527099003|3023799007|261026140227099003|261102123227099003|261021121427099003|261022105027099003|261022115727099003|261021123027099003|261022075727099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: tjbC+crG0LIONn84ePYV973Rq6knod364OpukxwUIAan1dUqgdiomwAhDsCxIc3loQIps06Qd1+B+hOM/p3/QUgEgZ4E6r4ZP8SRqB13NOF3AbbS+qwIEDFCDY4xdE8ZPxSwwQ6SSHhvY8qRY0YCe0UqpQL5S2x17ynUYxhYCc3T/ZIqA9NCJb7/qKdta8mDJ5mW9aaocfblaTzCPl5lncME65NGbEhWKKlFNjrCkY/m0KGxKOsoGHQpw7stGx55nc5WYvK05m3vJYBPxApudXVyIFM/L7ULuFMkKeEKdekk5aQDHRk5dVeh4HoTyzx64K6rmQp1yNHHLs6xm8+4Q7HOJfr7M+YemascYoZMN5qC/lEgdGHkvetqa3EccgJDH/Lb1R7TvLgwkMncWFG0yAnqZZvVVZYwV4D9bP5vDJPPIC7xWbZafdy8se6Xd6cL9MGVH6OsNaBAgoiOnNJNMYszTsaUnC8FcSJPfQrBOkduSAWtft4i0sTDU7lZOYAAfpwPw1wdJbnmc/HIu2EZ1obMRaFcW41U3kZRlv+6enoL8fKJ4PBByvqa5GLcjlbQeP621TU+nhfDw40K8k8QjJwQIrMcW5UsQ3OXDppQAvZ3nE53JE8UkIYbDXIj1xLNZnp578pZET/H9CypG7iD4rysNlaiT99wMh6E8TcFgqjrjjgUMup4CcHTuAej6IPRTos3X3Ur0f3CC2OoE2XvhQ==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(56012099006)(18002099003)(22082099003)(6133799003)(10067099003)(261009223027099003)(261026121527099003)(3023799007)(261026140227099003)(261102123227099003)(261021121427099003)(261022105027099003)(261022115727099003)(261021123027099003)(261022075727099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5ZKDckh1QbEpOSZjU4WBRGJv3yaWl8MyYZuG7QJ7PYx6hi/RsjtjQvoxhrb0LyEUEReyNM8l2DE7SLgJl3t8OaQyuZSfkI9GgKoS0unG7lFhRcJX2uPVHrA1tEki6tW9Wma9NgrIJZ2VJzIsT2I61vQe09sXg31XooRx4frgeJ1eRkCmOze9Px/2iFETjSTBrPgDziCvP1QprR047Z9Xx76r/5hsiYdjQB3UwOofoT5SCdJm6sTPbp0VjyIrVBZImaXyB0wq8dxnrTjQ6ku8CtGqW2pkfeJpxRJlh0ZaetfQagYwBN44bNWwzzCXxvTdYPUzyRUDMJAfQeSQzydBhCvA3Vl4wcIbimCixE9FXSFtcJMo+g+C/Hvai6E/hWLUbcKoGRMuR6nrn7O1Od527aPiFcir/fN6A9nvtqgsBmkS+V7gmf/HIKTm+3InxV9H
X-Exchange-RoutingPolicyChecked: p2OB/Vhvmo21dCmDsiEiQ5tHJNdFwTo2vB3YVdImi0wmavbVr4JevXDlJJ6o88/1HQnWxgKeRH/6JkwQm1TuXhEjwKhZe1Ik8ng4ppl/DCQid8UsFs9idOcZIN3lYJeL5mYbk3+bViBr2CIOAKNIoaV0eO1Ctl3GA8Vd0Dfmi4sSkIsoBlAb7B5N67Hl837+Cl6c6Kd9jyS7SEJKuewFZ0QZk0yOHNOYFYu+bzWTW3liMZ2wfU+xAmrYD0n/ba+4tg8lEZ/5bGU8ivRu3HnUYe03XUUfbUz3WG7XxK1XlxOJXs2XHitB07Jk9q3dB0WJ9/qIedPwYtgGM8s72z6phg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 16:06:11.8694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d682a7b-f26d-4535-2718-08df400db4ab
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF000166C0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7533
X-Authority-Analysis: v=2.4 cv=KeRHIgYD c=1 sm=1 tr=0 ts=6af492a1 cx=c_pps
 a=ItoRIIcZIWT0tNr6APkIeA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=fnHOhm4f9TC7Z8SaAeEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: SxmEe4EvVTtL9S_4nM80tZDjysfwKXAR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MyBTYWx0ZWRfX26oQhhTFu1U/
 d1rUY4GNK3DuCmy5Z5VpA/GKv3asy+AOIwpUyXyPc68JrBqbWuSPeIsukYrT6URlGPobuFvFq0g
 1VRlxhIiuTtxNyamzShqFCU6WAZ6b5o47zzS+sG5pcpp37WGu0m6asMgsAJvS3VX0BNlucQKEAE
 jFkZgucDRkNciqT234l1qVu1/TdFaG2xT1LSJwFUbxGKsuybuNqJ0JQokOYLD3WsN4Qm3tgksp/
 b91c2LxWl1aQR2RM1gbqk31qYRXR7S2r2GW2etcx3HiJwtcg470v1/23IZrJqAXbJTxapTFGQ7N
 tXBc9AT3ymQoSFIB5B6KS1mYtxD9ZUcMEZNoRKQ1LQ6dTQkqFZV5gLS/wyjAGdSPx2TIf+Ind6R
 C2auMYBEXogsaWFu/ETGYQdCsJFGddQj5k1qEhiINbj/SOM+I8fqxjWALaFH4E8lU2Ae02OAoEV
 o2YFob22MMj1H6wE1cg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MyBTYWx0ZWRfX3F2RM6ATwQ3x
 0tImbK/dpMXn6EG0YVUxSFqDz8/MeS6kifT3SNJf79uNaEIXULu7HaFSxTTu6WXjsQcCvrzh5m2
 skZn1fQ894DXPPIWdIaTHne0vf3aVyI=
X-Proofpoint-GUID: SxmEe4EvVTtL9S_4nM80tZDjysfwKXAR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110063
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 11 Nov 2026 16:07:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20530



On 11/11/2026 4:13 AM, Rahul Sharma wrote:
> Add U-Boot environment configuration to enable OLDI display output
> on the AM62Pxx EVM. This includes:
> 
> - Create tisdk-uenv bbappend for am62pxx machine
> - Add uEnv.txt with OLDI simplefb device tree overlay
> 
> The configuration loads k3-am62p5-sk-oldi-simplefb.dtbo overlay
> to enable display output through the OLDI interface.
> 
> Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
> ---
>   .../recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend     |  5 +++++
>   .../tisdk-uenv/tisdk-uenv/am62pxx-evm/uEnv.txt       | 12 ++++++++++++
>   2 files changed, 17 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend
>   create mode 100644 meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv/am62pxx-evm/uEnv.txt
> 
> diff --git a/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend b/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend
> new file mode 100644
> index 00000000..bc061b1c
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend
> @@ -0,0 +1,5 @@
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/${MACHINE}:"
> +
> +SRC_URI:append:am62pxx = "\
> +    file://uEnv.txt \
> +"
> diff --git a/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv/am62pxx-evm/uEnv.txt b/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv/am62pxx-evm/uEnv.txt
> new file mode 100644
> index 00000000..0ffda50d
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv/am62pxx-evm/uEnv.txt
> @@ -0,0 +1,12 @@
> +# This uEnv.txt file can contain additional environment settings that you
> +# want to set in U-Boot at boot time.  This can be simple variables such
> +# as the serverip or custom variables.  The format of this file is:
> +#    variable=value
> +# NOTE: This file will be evaluated after the bootcmd is run and the
> +#       bootcmd must be set to load this file if it exists (this is the
> +#       default on all newer U-Boot images.  This also means that some
> +#       variables such as bootdelay cannot be changed by this file since
> +#       it is not evaluated until the bootcmd is run.
> +
> +optargs=vt.global_cursor_default=0
> +name_overlays=ti/k3-am62p5-sk-oldi-simplefb.dtbo

NAK.  You are modifying a file in meta-ti-bsp that is owned by 
meta-arago.  The BSP layer should not be changing something from a 
distro layer.  You should just send a patch to the meta-arago list to 
change this.

But I need to ask, why are we trying to change things like this in the 
uenv file?  Is no better way of doing this in the defconfig for building 
uboot on this platform?


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

