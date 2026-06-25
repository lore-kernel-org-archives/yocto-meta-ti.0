Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6024CDE000
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 16:23:24 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15244.1782404598864589902
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 09:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=iBujZmMA;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=E52cjCbi;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: afd@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFd8xc3683313;
	Thu, 25 Jun 2026 11:23:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=rDdxlPPc5CrNssSkIasjG1ch5jfH+P8E8zKNgL3+U
	WY=; b=iBujZmMA06hq6h+XROkLNbLP/CPyO/Kt6quTtOfJscUwH3zF7qQxHnqcj
	gzIl+iYxgwvs60w+oLSBiz0w+t5rwGqDfuzSrxDbwa+GNGRq3AASEC+pa50UFA+A
	JuU2QRG0Q6aafCtndlRqkL/kuBFZYdjvXNA3PoIntE5kSoIKUyLYAvFjgID1j3D2
	uHLSDFJ2m+yMfXQJcX8/5nJYwMu5UK0B2xmnm4xVZ9hLuwvpjUPeg/qIUMmTFSLO
	f6FLOndHIO+wyzCcRBgtqv8tRHs1pgMcFBDb3qn2zbWlFvfkQHoFcp1vksR6/eSX
	AdKExnXkiBYOf9x1tOjTSq2S+JiNg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013006.outbound.protection.outlook.com [40.107.201.6])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f13a0svhx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 11:23:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=onzgGBGgwAgJjR3cLbWpY6N8qxTKn0lI2l91rLfTh14+rtRqN5cqX7bQTkMu823GbwRo1UOWT962WCI+7FzlB6BClNFOml6SXftpeK9mk/X7bElZUvRBb/s7YY53Qw/2PCf4qJDmBvJcIy3I601MYy5d+i2IVd8ipjYYk3Pysidb1qHHPu5kfKBmmmbVLTxzhtRxWpd8D27qkGfn1EJJY1LgcIySNeObYD8MOT/Y1Fgurwxd4dmUmeamNFCUvYVexFox3fqEZW2LttSyyESUzsvGNuun8ZXwDCkzUrJhJLXHVxpiA+rFOQtb+KRGgqE3kUbT3N+h3jddPbf5zD8Rmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDdxlPPc5CrNssSkIasjG1ch5jfH+P8E8zKNgL3+UWY=;
 b=arx5ja4mgfYRguaTfyjMKs1H7vHJ9nFnid+sraHcBGf7Vk7oC/LAqlO6r+k8ovQPoHybRn3wBBWrXvrHJLaxPe6c+uzyaXbRyPQLcGrqrbNIykRBmiBlRrOIDefegoNzl+PjfOTVz8tD3YNw+mR8fyRm78iT1MFUOmvL2Xcsa+BjOK6YNu2+xDoDFGqjt6HzFRsZDugNoS8MtCyTWOoMNoP06d9AoElwEh+pI7q8INI+8IAYgGsqAJpsJxKkIMNfAur2b+FnQ9QG2vMmkWjBWlp/H6kM3hOAM31POJV2ff18Q5jRvi87K5P/SSXjr+3netJBqY3pEg+3Pa8eUz/5Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDdxlPPc5CrNssSkIasjG1ch5jfH+P8E8zKNgL3+UWY=;
 b=E52cjCbim6PjXuXZvPWsVDrjIp95V97rS2bOf81dIQ4ZfvvBNRO1nd7JELwj9mp/P5lhZjhyniILBeQotnONlY7NUvUILcgRWKdhurf5y1JB4huVjaFesqSpvfhkJv+wowGaRAkaEY/AkE95SihrLkc5lkdhoInvKPVUHpcMsYM=
Received: from BN9PR03CA0094.namprd03.prod.outlook.com (2603:10b6:408:fd::9)
 by DS0PR10MB6822.namprd10.prod.outlook.com (2603:10b6:8:11d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 25 Jun
 2026 16:23:13 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::90) by BN9PR03CA0094.outlook.office365.com
 (2603:10b6:408:fd::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Thu,
 25 Jun 2026 16:23:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 16:23:09 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 11:23:08 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 11:23:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 11:23:07 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PGN7SV3127493;
	Thu, 25 Jun 2026 11:23:07 -0500
Message-ID: <acd7bdc0-0eb0-4c6c-9080-a19df731928c@ti.com>
Date: Thu, 25 Jun 2026 11:23:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH] linux-firmware: Move recipe from
 meta-arago
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20260625155800.28627-1-afd@ti.com>
 <9c82f77a-2c48-4cae-be34-cc5ad14d3d66@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <9c82f77a-2c48-4cae-be34-cc5ad14d3d66@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|DS0PR10MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: 59fcd358-b6cb-421e-e262-08ded2d60be8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	jOLpbcb//M4F5hUkQa3whrbsDgSvoY/xYzCBB5hu6vCfnZWoCo2ihnqPeHf2rboqoLZayMZ49be3M1ggzfEII3FGOH/ayF2PXkXh7GGr8dzBYXh1WToWdbx8JGCmrwBdrnDfv1wUyzv1iO95G2iDYilGWG4QbPIkcxREIzlIjXbsOUJ5myPSlKOh7hKOb/oJ6lk4pD86EGWpu/91Lgybl8DUsjNNLkds9F3+z72kFkCz1N+dW9XcIHmaWhH8VYxg3pxrLFyY9xFHTUoXgngI53F3srspa0jVjtma3qlSqPad83Sce1zFP9oBNrqGnZ/pjKGoXo/AfwZcIcFk6r0hmP+fm7Q3ccc52a5EzBKphrwCk/dDDho/4o5WcIDcBJhfIkHhgIk3UITmfvipGcGVnBX+2DfY9dR253RSuBnYtTv2nYNkx5esqryfOwlVOW0BCANaeHSydNYx1oxhsyWNtbTw1MorXb8obmgsmiGfCmZ/kwnqyp6XQwpukSXyX4/vNOzwyzCRE/yoXMszTpjeBM6d09uTJOZDxk4abH1aIBNeNw9hmigDcfN+/xVm/kHPK/EhQTZR21ZuyNPkZqjDCy7cNxmAuVmbFj2vqoa/xmX83n5I47f7izDUmxEl9FAymQNbeUDz9AxG40JFcJp/hFqEpgg2wml7i2LBPnyrkxkztmYAeGNgNBJ3d7n3vTM0pO3ubS4RiY+EjR9pTj2ZoA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	GJUW/gEDjHuX200LtrIKqniy0C+geAoFrscA/OmJlMtOi/hPKRPIq9awlsREEuv/MZi8QqzSZqtWchHQ3yqoQ/EONJZC2+I59kscaGkZdf9NauN0LhmGb3CsrxVL/uqEccWDIluHeBtI3pwhKkqErzOzMM3KbUG9CpP+Kjp8+Lh7/hIhZ+bBEWV3SJyOmAIYeepP1ZkusGD+yhQh2AQQUDPzDWX/++Cx+b4rTYfhlr8ZEOZP0S9O0bYrgP+SDK/1Q51YY2/bf0KuHIA4cOFTIGrBTMwWcqtbrBV9l5piSIDS0rMN0o8VIPg1+pSAvUabc9Er4dLErQy5gya7sKLFsW5fQuOwRyf13Ac8e8T3RBkiBu0J/TwYCjVE0EX4aQ3jVfuj/WYF5t6ahLNhS1rIEaaQ+C7hnTOOLET6D8ZJlymVcE0HFVwoC+zlHH/88549
X-Exchange-RoutingPolicyChecked: 
	Om/NWMw09ZK7vwaRqX2As+WbTnnhzvCDDRcF+wkwdfpTbg33UIvg6o9jjryNTbiPez4y/PMnCOuHaoenxClnevU+aihzOUbi9KF1gm0G3VqErbJidaI/lgyVtCiSgtOIcI+2QVRpa98K/GZdHAVgi+7IPQaq4ySa+1bu39MmT9TxSHaGhKrOrEZ2g2BfFnxKbN8MG6bk8UgRk2WOuXE2FieGuYzf2p7GIU1qcdbCaBjQDqFIUO4/23pSH5DkArXQaVA4fct9rgtZg10AcTI3FQvELa0MX5KHK0uLCqhzXW+ZRxpoMMFvKoL4s6NGHsteJsaYCzjqiCJGSDks5aTv0g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 16:23:09.6652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fcd358-b6cb-421e-e262-08ded2d60be8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6822
X-Authority-Analysis: v=2.4 cv=WrAb99fv c=1 sm=1 tr=0 ts=6a3d55f5 cx=c_pps
 a=1QNZTIC90Jmhh4/qmb3rWg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=tESQB3aALeKnJz3P8N4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: z_qXATN0gWmz4-A47PRNURqGF5sJHF11
X-Proofpoint-GUID: z_qXATN0gWmz4-A47PRNURqGF5sJHF11
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE0MCBTYWx0ZWRfXwuS+HYRK9Jiv
 4SR2HyomvmdsTeowAwI5X+eMl+bk1F1LYayr7n/CgnNjcJdwxip7O1Ut2HbnA+GGjd8LC2Mj1md
 ay2ADzb0YG5fn3vGcSBSVe+8Y9FP6lc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE0MCBTYWx0ZWRfX5PW7N/LBrVNI
 nFuUv2g2PRl3QXWMVko6CTViv0o3K4vCkvUdA5cGtzR9ary0XNi1097bSyp+JlupV3oJNKvzaLv
 bPceh8xeddSEGmjmGjaixYDC/XAa5g/qtAtxQvmVCOJ2l1Ux8D3xCFN/03jRrF1jaZVPWGUiSg2
 WKESZ/IggfSxGj3jl9W0tSQ2Zi9HmkuyuAZuyFqemveRvHt+AFoCRKtlMEvSlE2QW4AQiehStqv
 p1Dprv1jvjfxVqiZPylmni8xJ2FP/aOKFUYwihIqvKqGsblFE7ZvbapI5ofPKmv1NOEDkbvfd0j
 AhOpiU4rjB1UtXd0aW9a+itKniKzXwuGyRXLPakIMErSxSf5BdMrAj0RMQj0gksql+3xkmYqMeL
 XEobhk6PmjhbiuQ20+Eiofs6aBcUzCt04DUAEBYV61bOrMXFUzElcgGoo3hUftY1UM+M67lWM7B
 VNhoXjBo7qprZUjQI9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250140
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 65PFd8xc3683313
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 Jun 2026 16:23:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20095

On 6/25/26 11:14 AM, Ryan Eatmon wrote:
>=20
> Is there a good reason that you dropped the guard structure that meta-a=
rago had when you ported it over to meta-ti?=C2=A0 Even though what you a=
re doing is technically ok, it still stands out versus almost all other b=
bappend patterns that we have in both repos.
>=20

It just felt unnecessary to do that two file indirection thing that some
other bbappends do on such a simple update, perhaps some other bbappends
should look more like this one instead..

And this isn't the only bbappend like this in meta-ti, see

  - binutils-cross-canadian_%.bbappend
  - eudev_%.bbappend

Andrew

>=20
> On 6/25/2026 10:58 AM, Andrew Davis wrote:
>> The conflicting firmware packages that necessitate this bbappend are
>> all here in meta-ti-bsp, so this will be needed by any distro using
>> this layer. Move this bbappend out of meta-arago to this layer.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>> =C2=A0 .../linux-firmware/linux-firmware_%.bbappend=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7 +++++=
++
>> =C2=A0 1 file changed, 7 insertions(+)
>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-kernel/linux-firmware/li=
nux-firmware_%.bbappend
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_=
%.bbappend b/meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.b=
bappend
>> new file mode 100644
>> index 00000000..b37bec7a
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbapp=
end
>> @@ -0,0 +1,7 @@
>> +PR:append:ti-soc =3D ".tisoc1"
>> +
>> +# meta-ti-bsp packages newer versions on these
>> +do_install:append:ti-soc() {
>> +=C2=A0=C2=A0=C2=A0 rm -rf ${D}${nonarch_base_libdir}/firmware/ti-conn=
ectivity/
>> +=C2=A0=C2=A0=C2=A0 rm -rf ${D}${nonarch_base_libdir}/firmware/cadence=
/
>> +}
>=20


