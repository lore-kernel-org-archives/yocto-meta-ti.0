Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D47BC982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 07:33:00 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1847.1790148775196684637
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 00:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=GMI0RaAR;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=YBm45+H/;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68N77eNj1464852;
	Wed, 23 Sep 2026 02:32:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ejX4ydjHGSUcaCxylju593MTDCobLrCA1w76SC7K2
	6s=; b=GMI0RaAR3KZ2lRhwyxkc0+qBoW9z42nPvKbthFVX/Wz9+d86nodyEK6yd
	zTHBhLTZo3QKb6bL90BM+q4mK0z1U+J4z80Md3vlOSABEXNthbajfgAIFVmDO16u
	oz5O0+AYQEwBEX6nQ/tuUNWuBAJ5a521IXQlKkbLL/+0h3l8Z1PPIFZl1/HpQFgc
	P7Hswv5ZPzchAKeR2eyiKlRSJUMjkCK2oJyjrmQJVWcce1vvpntZd3Z61EYbc2nD
	QDOR8324Gl0/m8EEHKW6Pv/WhmZo0imN9N7ec7GFthDEAGB+UmiU++sR7RaQdPCA
	m8JIot4h672q7y4AzEBBhJgXQ76ZQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012035.outbound.protection.outlook.com [40.107.200.35])
	by m0384305.ppops.net (PPS) with ESMTPS id 4guwpm4p86-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 02:32:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmLVBpVMmdZuQU/31muo9MOxP3JJ/ZcANwVVwm6eZHEYkJhRUwbnr3qm7nyoYL52X4CxX331LLQI0CZ8VFeut05AlDv8ucdS6iYV5LJpZhLbAdmO8oDMrw9wzVz1QWNXVeHiKLIy5cGL42HvFFvy0MjsED16TSj1Hiii9eZNiKUOfC+DmA/TtN2YCbQHnWaVWXcMYrjo8f3mleJVwZMpCXsV2/JZmRsPZjPVsynFOTAWgJYK51ao+xn24ShlTyfpAAyh1sP03yLynQptLUGCmMPRcIKuNKtmKqFae4ruVCsD1BVEcVZ52rV2+8WIYizcR8lTabzkb2Kd+1B3cN5VPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejX4ydjHGSUcaCxylju593MTDCobLrCA1w76SC7K26s=;
 b=C75nSEsIoakRXeDZtJpMZVzAwoR9QIev7ab+5r2XsuxxP7gMgTjG+m/fdMaLtui5vAVx6LlIlqH4Bp8wqm5A2oMOmoF1IdqxWQclVtOvtq+BWLvP/95hSXslyQBRi9BhtEFYkbL1/KmpGO9/mN1VnVd4nT4x9F6AFNV4sMfrGVyjvqj43aL2cJcqa1turGr+5QEfFeSK6NzA3REPO7SjgQLEb880uSIfWrnyS5Jsd841SSNCQIGTU14QY4F4isrNPUslA/HQYB9E4ejqe4/7ShjhMkGC2RLsHhGhQKG4swQxnmgQvsmO5qh/sirKQKzrNLt2sC7OQ72Vr+utUqKXQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejX4ydjHGSUcaCxylju593MTDCobLrCA1w76SC7K26s=;
 b=YBm45+H/vnczMY8yyNPvWNlljS4vz5k3aOSX/0eRF7f2O95nCUlbe+uHmZS5YFY4xE5w5guA45f8u3sNIgQmO4w6gk5LGiRLd3uIKtFeAri56+mj6TEjvMGQUB/KmvLgxoL6BEBkJ6/+8Ye3yxk2ADaFRdoaXF9wErR8H65kvIM=
Received: from CH0PR03CA0261.namprd03.prod.outlook.com (2603:10b6:610:e5::26)
 by SA2PR10MB4428.namprd10.prod.outlook.com (2603:10b6:806:fa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 07:32:47 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::8d) by CH0PR03CA0261.outlook.office365.com
 (2603:10b6:610:e5::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 07:32:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 07:32:45 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 02:32:40 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 02:32:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 02:32:40 -0500
Received: from [10.24.52.241] (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68N7WaYK1577918;
	Wed, 23 Sep 2026 02:32:37 -0500
Message-ID: <df233001-5b8e-48d3-9e19-20f560041761@ti.com>
Date: Wed, 23 Sep 2026 13:02:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/wrynose][PATCH] recipes-multimedia: Add PipeWire bbappend
 for config files
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <s-kapoor@ti.com>,
        <s-sinha@ti.com>, <sen@ti.com>, <y-hegde@ti.com>
References: <20260922103002.3723697-1-p-bhagat@ti.com>
 <edb0e4e5-f125-4bf7-9292-c15b1be85ecc@ti.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <edb0e4e5-f125-4bf7-9292-c15b1be85ecc@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|SA2PR10MB4428:EE_
X-MS-Office365-Filtering-Correlation-Id: e062cea5-650d-4c2e-e6fd-08df1944dc6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|6133799003|56012099006|4143699003|3023799007|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	GNEbmK29I4KRmZQmv5gILX2kxQtfh/zG1jM4geYW60MHPQLAsPJSHtzxFeoYFHIx2bi7ITxPj7pd44YevU+lOzDqWZgv1OcE4YGuqY0kNvQuaulYScyKcOG/s/BX5VQBGBzuxCJUJJqDdorndIX+Y/5aMIdyDS3BJXReXA8JfTrZchg231U4ZScoEhj1t4grgc7sneg4EOBUUFRjFW2oBFc1kCslCUPOg0lkzMjsc0BHpSeNLZ5FqzrlEUR1CC+4bi1g6rnwGniRUO1zw70VnH4Iak1Gy20XKC2rtTzuPrV9belTFIMfos7cvJ+EYySIONtUCfwfx/asY/49aEdYe/tUMvwJ7a4EB3184YStkCaFbpus2bMYF3Lkje3/shmQDK8omfkQVLMBb9+JSlqccGKfr/Y1uTgqTILg1di/NzX7/qvqK6BSgm8JwfAdabjJ9hrTGk/X+Qsuc1K3b3eTO+UJe52GwTt3Fjin2GyBQs/0VQKtY1fz3U/cm0c+mLgLqItidBYH7IVyfWUkR8bXuPcw6Os6G680m4CKGAwwK6BKP/MbIsxo16XyzwfB4Bdn5Z0tHt9sZxZdkAR4Ao8XchbkFxBaGFpfQVJ5skVrJOpvbD14MDoolWBRKJxfT2xmqp/PZK25CIkKPL9S6WeCHIZ8PBd2xRV7ZSRlLx/MuMRkQq9cdEhx07r5XvM6Lms6UkxohaZ9yqK+5cVUo3FZJA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(6133799003)(56012099006)(4143699003)(3023799007)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SZn7lbxaRSlRQ+vND9UHuHyThxfYuQTo8Chf509kJXWfpLk4aWm4kq+NFPrJb4CusU8oDvzfXSsJfHDsIIhQWuOn2eKXfSCUnpl13UsoG0fHv6KoPaUKErQBAv3OHDgTzMCH9+otyiuT/3GhmqizGVf9VKYmFEKSIlAbiddh5cO8em/oQpj4FC2fu7bnreH9W9sgLboINhDq9igSzO0ozNqScb/PSajPXTTC08wYhJxqQgo1OkxFmVpSwaFl2RU7II/nrw5pa+ux7BzvYjAPS8fdleiQhL/Pj7D35WvtzRQoThJl5FMf0DFKeUtB3EgX1Y15emM22PFZbuZy6mTB3Eg0wXn2dIj0z19YRT+jDiCd2wW1OTg8UQjPXx0aawOYxD6VvHgDwqRcOEbiwBPFkSRM+meLd/ZIDLLcsTb6e9q795sysPnxXtimeTmONlg8
X-Exchange-RoutingPolicyChecked: 
	LdbjZ2mborVKTOGhzaQSZgX58R2kp1CkFjA/+Cun5GfEingMq5Um/yhdc8tGe1uT0Jqq2Ti6mT4ue6l3KiI97OPClc59kzpShrGI8oSqTilulVFktsvTJCA5IQqYrQgEDUy3HlzKlH6QaxohcS0Uxl+ZuaEyWqZxChg41ao4N4rDpSwcuCAITDMbodpnq6piPzo6pphlZdR0NauuTKq0k4JZrwVerk2ICjBn0IytmKebtVwpDeKij8AhHGp4Pw21g+kNsRil4/9OKjhEwP3c3B5cz0TrU0r+s9+JlamoG4C8gX6RqjWTntR21ErO5qW0t12gw5Y8mAOL8rwbsfreUA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 07:32:45.5506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e062cea5-650d-4c2e-e6fd-08df1944dc6c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4428
X-Authority-Analysis: v=2.4 cv=apMnmiZV c=1 sm=1 tr=0 ts=6ab380a4 cx=c_pps
 a=3Rvb9JmgCdrss5EpqVD9LA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=1bKiQ6-4rZQRQ-X2CjYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyOSBTYWx0ZWRfX6pYk4/Q65OCm
 oMDDmikTja72/l/9hx/62q330WfczEzPaghMhLTtQJJbWdNkF6q/X4TAxLFGgULiKhKflO1hDi+
 SlqdjgT/ivrHKBhDRac/Q5NWUrBlb3I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyOSBTYWx0ZWRfXzSEYMBkKnpmr
 2ijWVkSW4y3M8gpm5uFsYh+nSEewDg7wmOOYgG4YPNWmUN8NpWogQlAWoHm2+tcSTV2FrLrB2R0
 /R23MGzDd4sfOg5PVyflnb4Wli9BPu0xokmIcIhP2otwBrRr1phrpXL+mvztiHxAgXbBtB22gkR
 /YNyYPxb+LyY+I0u04HUY0bmuyHd97E2J4tzGimWexDFS9hgkg4H5mIRpd1++8bjKrGRrhJdEOo
 U54F5V1AfFC2BoN5B3QM986CsDrY+UP18hb10gr6becNO6PAo23EAPqL7FtlgO/xdthaXLsHp3R
 LIQhppdXjhImXYHLwIMQ8qD6Camk+ZWodqQi1L7RsXzV8tsqB7YyZeRnr5zfQO1veyN/wVaH2NE
 sSj5z+EaJuj10pX3gqMoxwWhhAYP7Jha3HRDXNqR7Zj7BbUlu34VKgDI6BFx4l9SSIVRRZpZRkd
 a7qKOuF4D5J39flSwgw==
X-Proofpoint-ORIG-GUID: 3sqcDjfp02qmxO4KkotBn1Z9bryZMXIJ
X-Proofpoint-GUID: 3sqcDjfp02qmxO4KkotBn1Z9bryZMXIJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230029
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by m0384305.ppops.net id 68N77eNj1464852
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Sep 2026 07:33:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20400

SGkgUnlhbiwNCg0KDQpPbiAyMy8wOS8yNiAwMjo1MywgUnlhbiBFYXRtb24gd3JvdGU6DQo+
DQo+IE9rLsKgIERlbnlzIGFuZCBJIHdlcmUgZGlzY3Vzc2luZyB0aGlzIGFuZCB3ZSBoYXZl
IGEgZmV3IGNoYW5nZXMgZm9yIA0KPiB0aGlzIHBhdGNoIHNlcmllcyB0aGF0IHdlIHdvdWxk
IGxpa2UgdG8gc2VlLg0KPg0KPiAxKSBUaGlzIGNhbiBtb3ZlIHRvIG1ldGEtdGktYnNwIHNv
IHRoYXQgaXMgZWFzaWVyIHRvIGdldCBpbnRvIHVzZXJzJyANCj4gaGFuZHMuDQo+IDIpIFdo
ZW4gaXQgbW92ZXMgdG8gbWV0YS10aS1ic3AgbW92ZSBpdCBpbnRvIGEgZHluYW1pYy1sYXll
ciBmb3IgDQo+IG11bHRpbWVkaWEtbGF5ZXIgYW5kIGFkZCBtdWx0aW1lZGlhLWxheWVyIHRv
IHRoZSANCj4gTEFZRVJSRUNPTU1FTkRTX21ldGEtdGktYnNwIHNldCBvZiBsYXllcnMuDQo+
IDMpIE1ha2Ugc3VyZSB0byBsYXllciB0aGUgY2hhbmdlcyBpbnRvIG11bHRpcGxlIHBhdGNo
ZXMgYW5kIG5vdCBqdXN0IA0KPiBnbG9iIHRoZW0gYWxsIGludG8gb25lLg0KPiDCoCBhKSBD
cmVhdGUgdGhlIGR5bmFtaWMgbGF5ZXIgZGlyZWN0b3J5IGFuZCB1cGRhdGUgbGF5ZXIuY29u
Zg0KPiDCoCBiKSBBZGQgdGhlIHBpcGV3aXJlIGJiYXBwZW5kICh0aGUgY3VycmVudCBwYXRj
aCkgdG8gdGhlIGR5bmFtaWMgDQo+IGxheWVyIGRpcmVjdG9yeS4NCj4NCj4gSSB0aGluayB0
aGF0IHdpbGwgYmUgY2xlYW5lc3QgZm9ybWF0aW9uIGZvciB0aGlzLg0KPg0KPiBEbyBhbGwg
dGhhdCBmb3IgYSB2MiBwbGVhc2UuDQoNCg0KVGhlcmUgaXMgb25lIHNtYWxsIGlzc3VlLiBB
biBlbXB0eSBtdWx0aW1lZGlhLWxheWVyIGRpcmVjdG9yeSB3aWxsIG5vdCANCmJlIHRyYWNr
ZWQgYnkgZ2l0LiBFaXRoZXIgaSB3aWxsIGhhdmUgc3F1YXNoIGludG8gb25lIGNvbW1pdCBv
ciBvbmx5IGFkZCANCmxheWVyLmNvbmYgaW4gZmlyc3QgcGF0Y2guDQoNCg0KPg0KPg0KPiBP
biA5LzIyLzIwMjYgNTozMCBBTSwgUGFyZXNoIEJoYWdhdCB3cm90ZToNCj4+IEV4dGVuZCB0
aGUgUGlwZVdpcmUgcmVjaXBlIHRvIGFkZCBwbGF0Zm9ybS1zcGVjaWZpYyBBTFNBIGNvbmZp
Z3VyYXRpb24uDQo+PiBBZGQgc2luayBhbmQgc291cmNlIGNvbmZpZ3VyYXRpb24gZm9yIDgt
Y2hhbm5lbCBhdWRpbyBwbGF5YmFjayBhbmQNCj4+IGNhcHR1cmUgb24gdGhlIEFNNjJEMkVW
TSBhcyB0aGUgZGVmYXVsdCBjb25maWd1cmF0aW9uIGlzIDItY2hhbm5lbC4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBQYXJlc2ggQmhhZ2F0IDxwLWJoYWdhdEB0aS5jb20+DQo+PiAtLS0N
Cj4+IMKgIC4uLi9waXBld2lyZS9waXBld2lyZS10aS5pbmPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHwgMjAgKysrKysrKysrKysrKysrKysrKw0KPj4gwqAgLi4uL2Ft
NjJkeHgtZXZtLzkwLXBpcGV3aXJlLXNpbmsuY29uZsKgwqDCoMKgwqDCoMKgwqAgfCAxNyAr
KysrKysrKysrKysrKysrDQo+PiDCoCAuLi4vYW02MmR4eC1ldm0vOTEtcGlwZXdpcmUtc291
cmNlLmNvbmbCoMKgwqDCoMKgwqAgfCAxNyArKysrKysrKysrKysrKysrDQo+PiDCoCAuLi4v
cGlwZXdpcmUvcGlwZXdpcmVfJS5iYmFwcGVuZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoCA0ICsrKysNCj4+IMKgIDQgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKQ0K
Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IA0KPj4gbWV0YS10aS1leHRyYXMvcmVjaXBlcy1t
dWx0aW1lZGlhL3BpcGV3aXJlL3BpcGV3aXJlLXRpLmluYw0KPj4gwqAgY3JlYXRlIG1vZGUg
MTAwNjQ0IA0KPj4gbWV0YS10aS1leHRyYXMvcmVjaXBlcy1tdWx0aW1lZGlhL3BpcGV3aXJl
L3BpcGV3aXJlL2FtNjJkeHgtZXZtLzkwLXBpcGV3aXJlLXNpbmsuY29uZg0KPj4gwqAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IA0KPj4gbWV0YS10aS1leHRyYXMvcmVjaXBlcy1tdWx0aW1lZGlh
L3BpcGV3aXJlL3BpcGV3aXJlL2FtNjJkeHgtZXZtLzkxLXBpcGV3aXJlLXNvdXJjZS5jb25m
DQo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgDQo+PiBtZXRhLXRpLWV4dHJhcy9yZWNpcGVz
LW11bHRpbWVkaWEvcGlwZXdpcmUvcGlwZXdpcmVfJS5iYmFwcGVuZA0KPj4NCj4+IGRpZmYg
LS1naXQgDQo+PiBhL21ldGEtdGktZXh0cmFzL3JlY2lwZXMtbXVsdGltZWRpYS9waXBld2ly
ZS9waXBld2lyZS10aS5pbmMgDQo+PiBiL21ldGEtdGktZXh0cmFzL3JlY2lwZXMtbXVsdGlt
ZWRpYS9waXBld2lyZS9waXBld2lyZS10aS5pbmMNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+PiBpbmRleCAwMDAwMDAwMC4uNjVhODI2NzENCj4+IC0tLSAvZGV2L251bGwNCj4+ICsr
KyBiL21ldGEtdGktZXh0cmFzL3JlY2lwZXMtbXVsdGltZWRpYS9waXBld2lyZS9waXBld2ly
ZS10aS5pbmMNCj4+IEBAIC0wLDAgKzEsMjAgQEANCj4+ICtQUjphcHBlbmQgPSAiLnRpMCIN
Cj4+ICsNCj4+ICtGSUxFU0VYVFJBUEFUSFM6cHJlcGVuZCA6PSAiJHtUSElTRElSfS9waXBl
d2lyZToiDQo+PiArDQo+PiArIyBBTTYyRC1zcGVjaWZpYyBjb25maWcgZmlsZXMNCj4+ICtT
UkNfVVJJOmFwcGVuZDphbTYyZHh4LWV2bSA9ICIgXA0KPj4gK8KgwqDCoCBmaWxlOi8vOTAt
cGlwZXdpcmUtc2luay5jb25mIFwNCj4+ICvCoMKgwqAgZmlsZTovLzkxLXBpcGV3aXJlLXNv
dXJjZS5jb25mIFwNCj4+ICsiDQo+PiArDQo+PiArZG9faW5zdGFsbDphcHBlbmQ6YW02MmR4
eC1ldm0oKSB7DQo+PiArwqDCoMKgIGluc3RhbGwgLWQgJHtEfSR7c3lzY29uZmRpcn0vcGlw
ZXdpcmUvcGlwZXdpcmUuY29uZi5kDQo+PiArwqDCoMKgIGluc3RhbGwgLW0gMDY0NCAke1VO
UEFDS0RJUn0vOTAtcGlwZXdpcmUtc2luay5jb25mIA0KPj4gJHtEfSR7c3lzY29uZmRpcn0v
cGlwZXdpcmUvcGlwZXdpcmUuY29uZi5kLw0KPj4gK8KgwqDCoCBpbnN0YWxsIC1tIDA2NDQg
JHtVTlBBQ0tESVJ9LzkxLXBpcGV3aXJlLXNvdXJjZS5jb25mIA0KPj4gJHtEfSR7c3lzY29u
ZmRpcn0vcGlwZXdpcmUvcGlwZXdpcmUuY29uZi5kLw0KPj4gK30NCj4+ICsNCj4+ICtGSUxF
Uzoke1BOfTphcHBlbmQ6YW02MmR4eC1ldm0gPSAiIFwNCj4+ICsgJHtzeXNjb25mZGlyfS9w
aXBld2lyZS9waXBld2lyZS5jb25mLmQvOTAtcGlwZXdpcmUtc2luay5jb25mIFwNCj4+ICsg
JHtzeXNjb25mZGlyfS9waXBld2lyZS9waXBld2lyZS5jb25mLmQvOTEtcGlwZXdpcmUtc291
cmNlLmNvbmYgXA0KPj4gKyINCj4+IGRpZmYgLS1naXQgDQo+PiBhL21ldGEtdGktZXh0cmFz
L3JlY2lwZXMtbXVsdGltZWRpYS9waXBld2lyZS9waXBld2lyZS9hbTYyZHh4LWV2bS85MC1w
aXBld2lyZS1zaW5rLmNvbmYgDQo+PiBiL21ldGEtdGktZXh0cmFzL3JlY2lwZXMtbXVsdGlt
ZWRpYS9waXBld2lyZS9waXBld2lyZS9hbTYyZHh4LWV2bS85MC1waXBld2lyZS1zaW5rLmNv
bmYgDQo+Pg0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwLi44
NTdjMzQ0ZQ0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIA0KPj4gYi9tZXRhLXRpLWV4dHJh
cy9yZWNpcGVzLW11bHRpbWVkaWEvcGlwZXdpcmUvcGlwZXdpcmUvYW02MmR4eC1ldm0vOTAt
cGlwZXdpcmUtc2luay5jb25mDQo+PiBAQCAtMCwwICsxLDE3IEBADQo+PiArIyBQaXBlV2ly
ZSBzaW5rIGNvbmZpZ3VyYXRpb24gZm9yIEFNNjJELg0KPj4gKw0KPj4gK2NvbnRleHQub2Jq
ZWN0cyA9IFsNCj4+ICvCoMKgwqAgew0KPj4gK8KgwqDCoMKgwqDCoMKgIGZhY3RvcnkgPSBh
ZGFwdGVyDQo+PiArwqDCoMKgwqDCoMKgwqAgYXJncyA9IHsNCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGZhY3RvcnkubmFtZcKgwqDCoMKgwqDCoMKgwqDCoMKgID0gYXBpLmFsc2Eu
cGNtLnNpbmsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5vZGUubmFtZcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgID0gImFsc2FfYXVkaW9fc2luayINCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG5vZGUuZGVzY3JpcHRpb27CoMKgwqDCoMKgwqAgPSAiQXVkaW8gT3V0
cHV0Ig0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVkaWEuY2xhc3PCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgID0gIkF1ZGlvL1NpbmsiDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBhcGkuYWxzYS5wYXRowqDCoMKgwqDCoMKgwqDCoMKgID0gImh3OkFNNjJEMkVWTSwwIg0K
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXVkaW8ucmF0ZcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCA9IDQ4MDAwDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhdWRpby5jaGFu
bmVsc8KgwqDCoMKgwqDCoMKgwqAgPSA4DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBh
dWRpby5wb3NpdGlvbsKgwqDCoMKgwqDCoMKgwqAgPSBbIEZMIEZSIEZDIExGRSBSTCBSUiBT
TCBTUiBdDQo+PiArwqDCoMKgwqDCoMKgwqAgfQ0KPj4gK8KgwqDCoCB9DQo+PiArXQ0KPj4g
ZGlmZiAtLWdpdCANCj4+IGEvbWV0YS10aS1leHRyYXMvcmVjaXBlcy1tdWx0aW1lZGlhL3Bp
cGV3aXJlL3BpcGV3aXJlL2FtNjJkeHgtZXZtLzkxLXBpcGV3aXJlLXNvdXJjZS5jb25mIA0K
Pj4gYi9tZXRhLXRpLWV4dHJhcy9yZWNpcGVzLW11bHRpbWVkaWEvcGlwZXdpcmUvcGlwZXdp
cmUvYW02MmR4eC1ldm0vOTEtcGlwZXdpcmUtc291cmNlLmNvbmYgDQo+Pg0KPj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwLi5hYzc2MzVkZQ0KPj4gLS0tIC9k
ZXYvbnVsbA0KPj4gKysrIA0KPj4gYi9tZXRhLXRpLWV4dHJhcy9yZWNpcGVzLW11bHRpbWVk
aWEvcGlwZXdpcmUvcGlwZXdpcmUvYW02MmR4eC1ldm0vOTEtcGlwZXdpcmUtc291cmNlLmNv
bmYNCj4+IEBAIC0wLDAgKzEsMTcgQEANCj4+ICsjIFBpcGVXaXJlIHNvdXJjZSBjb25maWd1
cmF0aW9uIGZvciBBTTYyRC4NCj4+ICsNCj4+ICtjb250ZXh0Lm9iamVjdHMgPSBbDQo+PiAr
wqDCoMKgIHsNCj4+ICvCoMKgwqDCoMKgwqDCoCBmYWN0b3J5ID0gYWRhcHRlcg0KPj4gK8Kg
wqDCoMKgwqDCoMKgIGFyZ3MgPSB7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmYWN0
b3J5Lm5hbWXCoMKgwqDCoMKgwqDCoMKgwqDCoCA9IGFwaS5hbHNhLnBjbS5zb3VyY2UNCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5vZGUubmFtZcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgID0gImFsc2FfYXVkaW9fc291cmNlIg0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgbm9kZS5kZXNjcmlwdGlvbsKgwqDCoMKgwqDCoCA9ICJBdWRpbyBJbnB1dCINCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1lZGlhLmNsYXNzwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA9ICJBdWRpby9Tb3VyY2UiDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhcGkuYWxz
YS5wYXRowqDCoMKgwqDCoMKgwqDCoMKgID0gImh3OkFNNjJEMkVWTSwwIg0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYXVkaW8ucmF0ZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA9
IDQ4MDAwDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhdWRpby5jaGFubmVsc8KgwqDC
oMKgwqDCoMKgwqAgPSA4DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhdWRpby5wb3Np
dGlvbsKgwqDCoMKgwqDCoMKgwqAgPSBbIEZMIEZSIEZDIExGRSBSTCBSUiBTTCBTUiBdDQo+
PiArwqDCoMKgwqDCoMKgwqAgfQ0KPj4gK8KgwqDCoCB9DQo+PiArXQ0KPj4gZGlmZiAtLWdp
dCANCj4+IGEvbWV0YS10aS1leHRyYXMvcmVjaXBlcy1tdWx0aW1lZGlhL3BpcGV3aXJlL3Bp
cGV3aXJlXyUuYmJhcHBlbmQgDQo+PiBiL21ldGEtdGktZXh0cmFzL3JlY2lwZXMtbXVsdGlt
ZWRpYS9waXBld2lyZS9waXBld2lyZV8lLmJiYXBwZW5kDQo+PiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPj4gaW5kZXggMDAwMDAwMDAuLmY4MDZkMjhmDQo+PiAtLS0gL2Rldi9udWxsDQo+
PiArKysgYi9tZXRhLXRpLWV4dHJhcy9yZWNpcGVzLW11bHRpbWVkaWEvcGlwZXdpcmUvcGlw
ZXdpcmVfJS5iYmFwcGVuZA0KPj4gQEAgLTAsMCArMSw0IEBADQo+PiArUElQRVdJUkVfVEkg
PSAiIg0KPj4gK1BJUEVXSVJFX1RJOnRpLXNvYyA9ICJwaXBld2lyZS10aS5pbmMiDQo+PiAr
DQo+PiArcmVxdWlyZSAke1BJUEVXSVJFX1RJfQ0KPg0K

