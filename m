Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41179C61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 15:29:15 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3410.1787930952015210227
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 08:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=O4AXOB2x;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=hLK+v2fz;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: gehariprasath@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67SDPArN1611221;
	Fri, 28 Aug 2026 10:29:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=BX2iNAZpJv2jhgU5k4LcrKJ4fCcqKW/NMV0N2EmEK
	Y0=; b=O4AXOB2xctrbv8UWJ5eyrNC0dBY/RlPhxgiI+rdCbordVusTZxqw7C8bq
	NZ9baoqxO6JmjSLXp79RWZu76NM01k66n0SVy2AYL9HNvUFhiD4/+GUu6GhtTBMR
	wiifZnDFg2gfww3mArU+pNu7/Nf2sDEvVUNT8p0CRNJ9ajtSNHdwU7zxXzsUCWSC
	0il9pLYIZmRbAK3MrvkyH0Fb75eiLgpNfqstUE6uYQaoSu89TJqhm3z0JYYu48w1
	muiu82bxa1wJr1EL2wUycopwSF24vLrHpTT0pWLtN0gwGFiN14ovJpEnkAyT1odv
	tm6OhOY99hOAFza9VA/YASFNXCZUw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011067.outbound.protection.outlook.com [52.101.62.67])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gb5kdjsab-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 10:29:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghtv7bizqY7r0Dzo2WcrKCkgUZfXRQ64nTquYnN+jG77T16GuF+i0KIy4FdwCLljqfAfKaw9xawpKgb597w578DYdl3hGTjQ1LGsGIIjI41tQXGgwQMfMp9wUWc6jxHz7uWPrZB4E2RLCNxVz6imfFwrUEUNwtdraSiMwU6S97fzTdLyspQA6J2q3cjFLIbrHOMeyj2Gslazn6UnxfRjazapAEZU8Ny7FaJaUdACyVMKKq9HUOwVvtY5Tnhc8uw6yqe/HtLECqitGrOOqf7soKwdJkRfP9SM+Sn7JYKZUATnmUi93fsNkNCaOptAbu5j4+TcLCm9ikwDdohpfOdueA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BX2iNAZpJv2jhgU5k4LcrKJ4fCcqKW/NMV0N2EmEKY0=;
 b=bf+JbtFQqaP6sd0IoH73f9aEy+lk8DX/s2Pvg+t2uMukOEoL8Dx9cvgaMi2IBZypJ5eqTrVGrKhVg+KaDfJOz+Pu4riQNWe+5zOapgghL4XcBd8Dh/0e/VAy8m4xB+ld95Ytha1dowoyzYxeGERX6RM+D4ZcmdlWAg/7W3KtOsBVH8ezJsJ1bURAjmREbHM1qjyL/mWzLyboVQ1UC61UgzKsIbLSYgHexSnLLOMavnA0IRSB5le4WhLKi3xC6/Q90DxT0Fm3Xt9U3hcY7tnJ6zrPRqdMI73ppVPW9+mWYep85irPjBQZgzrKoPk1qh5aymE2M0C26fvcRWJZk2mqEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BX2iNAZpJv2jhgU5k4LcrKJ4fCcqKW/NMV0N2EmEKY0=;
 b=hLK+v2fzxaWhIxaK+f6/7d0Qzzzke+3GGoaTskS80GP9ZP3sNJJ4mt2WVIwpOq4ORdwe8R82JcLr9aoZBSiwlIU6AM9WKK51y4BIGvpAejus5Cg7rytM4XDaOgx3drixs5/8dMg/8hkcVioKq/IC7jsHBqjN5Wflte6WVdn8csY=
Received: from BN0PR04CA0190.namprd04.prod.outlook.com (2603:10b6:408:e9::15)
 by CO1PR10MB4705.namprd10.prod.outlook.com (2603:10b6:303:96::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Fri, 28 Aug
 2026 15:29:04 +0000
Received: from BN5PEPF0004698B.namprd02.prod.outlook.com
 (2603:10b6:408:e9:cafe::21) by BN0PR04CA0190.outlook.office365.com
 (2603:10b6:408:e9::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 15:29:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN5PEPF0004698B.mail.protection.outlook.com (10.167.245.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 15:29:03 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 10:28:16 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 10:28:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 10:28:15 -0500
Received: from [10.249.138.105] ([10.249.138.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67SFSDv23035588;
	Fri, 28 Aug 2026 10:28:13 -0500
Message-ID: <9cf277f4-715f-4236-94dd-5056c7c0685c@ti.com>
Date: Fri, 28 Aug 2026 20:58:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] ti-vendor-kernel-headers: add recipe
 for TI-only dma-heap.h ioctl
To: Andrew Davis <afd@ti.com>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        <s-kapoor@ti.com>, <p-gupta5@ti.com>, <u-kumar1@ti.com>
References: <20260828080757.1160553-1-gehariprasath@ti.com>
 <ce24a4bc-5100-471f-8ef1-09e8d879d3d8@ti.com>
Content-Language: en-US
From: Hari Prasath G E <gehariprasath@ti.com>
In-Reply-To: <ce24a4bc-5100-471f-8ef1-09e8d879d3d8@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698B:EE_|CO1PR10MB4705:EE_
X-MS-Office365-Filtering-Correlation-Id: 6107b7da-37e3-42cd-becb-08df05191733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|18002099003|22082099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	kn3gg9pv7kDKnZQYNpInnDW4XNn/Q775ui/ExYtxjjPE0kIfDPTHxDfJZHMJHDB3ARzdgsg+KLnLoqeRZ5990YDL+PB5N4pCiKK6wYKqabPXtUToZLb9sjCe9ZswsYVXPyBFZWGrRfd9LIP2xgTrawvYogAsgvALvGsIJcQsozp8NQEhyhnK1VN5vNMYNhIGaE3gPufdQNuk5WPS5blgYWo2Khgvl1mS9cVZGvOHaxSyl2c9nPV86d2GyIM9ucmBgsSYv8+NoBrHE1neXSAWhAOhfuhnxQmlolnb/5A8AQsUMbXg7UnvQ3H/ajz7EwZsc6N7dps0WocukSdbqejeKywWharWBdHpT7T3c7lYuyLMrGauflTkgFQrte7lTaKeXNLcw+BKBeUHL5mWbz9gA2EFSiVHLG3xMywligD01yDPFsJxvLF2AbzOLPThOzlgxXkec5GJsud53lXBypZbS5TBX8yTUs+fgOIQnS9PKEptDQX9H/X/qKOZJTknteJyyCFtviM/5zT1F2F99qgwtv3pd+vl+V3gbwfjZth5u6aAFofn7ld0mRowIp4RvMhedGq8D6iSzUyDmdpLG/i1fDenWnYyDhkWsaissvDu3GKh3SIlDWqGy8+9NHuythCoe93HHEm2/al0R4EtVjiIgkKsa6NAygUDunth27qN8HSkDvwsuoSoIDuRS2XwkwnUqMtGsVdJXLXlH5+wyc2mug==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	laDxEjN0XJfNChgOP33uTdOTNs8IWBSmPRd6jtAIpK2AOcIJuDeO2wzMALs/TRYoSXR2BLZO8u7mDwUzXH5c22wBKLAnjJJLoLi7lS0EwNmLc62TpSDucmdaF77cGXH1BLIx6yQbIXRD8XQ1riXTYOc3fThiwPzMZjZjG1UziwzCDPt49n2tfEFB46mNOdQuM5b/rHS0jvckoNCk/h0lfGOvExkt6uOwGB6Hrm4qM4URYv4T11nSOVYRgX3z0FSx6KSRxwGqnP21/xtExUnJo/nlOB/L2PKO0aa2WXKrK+xr0QJd1pfeHZXHXHIzJ09rBzpox8OEnMRJOWlqH48Nm3kO/cIFV3IoWXCtSKrQJsEsPMXk/iVBsn8cvto0QiO1TbjwzK4mZIjnbF1PZ4WjTx7RRoYuYaj4shGXnPtL2KVENlwnfXXNwHPalmuF496m
X-Exchange-RoutingPolicyChecked: 
	qQpnOIMVk3JZZPXaClAK4uvGJqHHwpPJxWbJ722kzSDWfmf1VrVM0JhLmvEBeEeaRw4uMG9xWUdZBPygFVBepXZK7oKzPGV0PwnOrOJp8gAmIq+YFHrjO9iExBdK+i5eVoavRlZTnMZ2/3r+9MhnHT5V1hF/j/NuyYHpaA0uhEfwyQgph1lEgr+3j8+EgYhMZL8xLXF49WJEAhADd7AlQWv4nd6LjU51eIHwGv4oR8786HRRZcVzlrY0DcZO3DjoU2XlqKgERA8vPOJQM+SnfmECIhvnxi/LB80PsWz0AZsb3g8IQNyJlrgI1cCK7Iw3hd2tI2Sul2YVh9DWni+jLg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:29:03.0263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6107b7da-37e3-42cd-becb-08df05191733
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN5PEPF0004698B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4705
X-Proofpoint-ORIG-GUID: BE4R5mMbWedeUcob8WCb7CAbP8F2CtdN
X-Proofpoint-GUID: BE4R5mMbWedeUcob8WCb7CAbP8F2CtdN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEzNSBTYWx0ZWRfXybAGtlis2Bkw
 U9Klln0NHyF781q0KKnkmB0lquLfbNRdkNXgQtxVK76BryCyfw4bfc9FMaCwMyTzHynqesU4l+R
 VXeXYgxch8mjOVekV1Tl3RO3uQUlGJA=
X-Authority-Analysis: v=2.4 cv=UPPt2ify c=1 sm=1 tr=0 ts=6a91a946 cx=c_pps
 a=GcdpE1at2Es8HfJfZlkF2Q==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=_fJ02rDoW22QxXiHdsUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEzNSBTYWx0ZWRfX2Ch1/v3um+wg
 2QK+EICsXk0Ynu3zhLUYCS3s+9iNZUggzkjcOtrZWA/aGzJQmGIzi6CbCIPS7ISGnaPTCR9H4xe
 tY4oVPt4uNVyCpkoKGhxmdGv/myqv/YR8B3Jt0P7WeyhijTk1rU5LOm4JmvLauSvWeHBjjzlgUR
 bJXFxyK740tBFLDfhBTwbbnEeZHbg2lq+3PoSNu9VwPsSQnSJVqgSYDZ7Hz7ZaF3euDLqEGLcc3
 E7e7m9ntYgtMc1P/X3r4qTtxG9pCcPVUI7iw0SeARP2LCOPLg5bQlmsnewcR1T7Vrw13hvCSyvd
 rauBB5n6i7uCfNUB2mAjBV6NOzxNJAoIlBKAXPmrH72053Oep9wss65rccYq6CLShcNF/Kis3Kl
 klbI08b2inYkj3cfzTpJIRWZFvU8AXBa6H6FrFKy8RqEKwNR2H8qgKDohgJhCH03kEwhY/vG1CY
 WOSHgQdOHbldd4i40Yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280135
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0380145.ppops.net id 67SDPArN1611221
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Aug 2026 15:29:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20305

Hello Andrew,

Thanks for the reviews.

On 8/28/2026 8:12 PM, Andrew Davis wrote:
> On 8/28/26 3:07 AM, Hari Prasath Gujulan Elango wrote:
>> The TI vendor kernel's dma-heap.h carries DMA_HEAP_IOCTL_EXPORT in
>> downstream.The standard header provided by linux-libc-headers' wouldn'=
t
>=20
> Add a space after end of sentences "."

ACK

>=20
>> have the custom changes.Copy it straight from the kernel's staged
>> source tree (STAGING_KERNEL_DIR)into a separate /usr/include/ti/linux
>> path instead, for userspace code that needs it.
>>
>> Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
>> ---
>> =C2=A0 .../ti-vendor-kernel-headers_1.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 +++++++++++++++++
>> =C2=A0 1 file changed, 17 insertions(+)
>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-kernel/ti-vendor-kernel-=
=20
>> headers/ti-vendor-kernel-headers_1.0.bb
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-=20
>> vendor-kernel-headers_1.0.bb b/meta-ti-bsp/recipes-kernel/ti-vendor-=20
>> kernel-headers/ti-vendor-kernel-headers_1.0.bb
>> new file mode 100644
>> index 000000000..bf7dcc3a5
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-=20
>> kernel-headers_1.0.bb
>> @@ -0,0 +1,17 @@
>> +SUMMARY =3D "TI vendor kernel uapi headers not present in mainline=20
>> linux-libc-headers"
>> +DESCRIPTION =3D "Copies select uapi headers straight from the TI vend=
or=20
>> kernel source \
>=20
> s/uapi/UAPI as it is acronym (Userspace Application Programing Interfac=
e)
>=20

ACK

>> +tree into a TI-specific include path (/usr/include/ti/linux), for=20
>> userspace code \
>> +that needs them but can't rely on linux-libc-headers carrying TI-only=
=20
>> additions."
>> +LICENSE =3D "GPL-2.0-only"
>> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/GPL-2.0-=20
>> only;md5=3D801f80980d171dd6425610833a22dbe6"
>> +
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> +
>> +do_configure[depends] +=3D "virtual/kernel:do_shared_workdir"
>> +do_install[depends] +=3D "virtual/kernel:do_shared_workdir"
>> +
>> +do_install() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${includedir}/ti/linux
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${STAGING_KERNEL_DIR}/include/uapi=
/linux/dma-=20
>> heap.h ${D}${includedir}/ti/linux/dma-heap.h
>> +}
>> +
>=20
> I don't have an huge issue with this series, but let's make sure we kno=
w=20
> the alternatives
> first. If only a couple applications need this header, they can bundle =
a=20
> copy of the
> DMA_HEAP_IOCTL_EXPORT definition inside their own source.
>=20
> That does have the downside of if the definition in kernel changes the=20
> application will not
> get the update automatically when rebuilt against the new kernel. But=20
> this is already the big
> issue with using custom UAPI like this in the first place, if the kerne=
l=20
> gets updated the
> applications can stop working. The upstream kernel never breaks existin=
g=20
> UAPI, but our
> downstream can and does.
>=20
> As said, this patch looks fine as-is, just something to think about.

We could certainly explore this option, but as you have highlighted=20
syncing that with the kernel would be a challenge. I need more time to=20
discuss with the concerned team how best we can manage this.I would say=20
let's take this patch in considering the SDK release for Ford.

Regards,
Hari

>=20
> Andrew


