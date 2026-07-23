Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BB3C531D0
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 20:03:42 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5393.1784837017317196891
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Jul 2026 13:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=c6eHChID;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=PnZFX6ti;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66NIo4Kd1010093;
	Thu, 23 Jul 2026 15:03:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=EnFxIe0PzsKxH0P
	TDm15TB+TV4XmJd3+mywJAeV69v0=; b=c6eHChIDesUY6pCAD5XKdJ8zxsvUA0B
	cIofaVovfT1in/ktD0JdDmxVgxgjjqkjgd9UCjQEd1A6L/Wt7bUaLZm6FdZBqA1h
	iqV8VJ1vLzrEp0I1Jhf2/K5UYvm/2JoyVIJSys0Cv0q7Qd7x9kazOeLx7UcF+pnp
	bgdadM5qjqfdR77jdj4n+NhZHoWPod6fnrHaSyMiRRkDZryqKg6eZM5OItWHv1za
	91BUWlwGYt+0rgBUO/i5tiMlWyM+XRoPl6EzsX4YfPm42326K/6PNb7YYIZpk8Xy
	npRkdtkrerJyF1P0diF4XrNG19AqhcMSUefnq1Mx7z/raUaqTO6zZiQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011064.outbound.protection.outlook.com [40.107.208.64])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fkhvuu1ph-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 15:03:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9IaJApoDIaT9LaD15n1TJctt9p+WfJ2O83UAYK4k42Jw2dOlMxOv2ued+k1ol6KxPBhkbKje6fuglrB/KJ5L4yGWLmo0feH4wieuXxYgSD9qE9tAtmCGyiHhofYAMjKrdsUHLsDyIJoR0mqbuWJo2EA9MvllNoRxh3LVTVb0lctduUQwzukxHfguvcNXkJqzrE2r6wmxjDxSkaBzDKVKumSAQWqbJSSUmMGMGhu7kIMgiwMYb77BWbjAQY7u4kW6yBxHiYD0Kcs6LX5/BNDe7sgIjtgUxAX1F0h/xj2kYanywqmVP0XgzWxqB+taQEo/SkbK2IWN0AqN3vgKXHaMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnFxIe0PzsKxH0PTDm15TB+TV4XmJd3+mywJAeV69v0=;
 b=t5VQhqaaFgmKo1dodDJ9YPUdRl8UScJJHo488bXfih54APDsbRFPRElq2nXD28tP256B4Bk0ndK33oBvIr5kNbb6OI8nqYFyj/wFMWkjQKClJRHqHlqa+5FZBhXWtZlYxGuK9oTD0aTgp6vn7AVjE/+R0zS2uZbIVNDuzTc3MgsYBAHX3RrDGhfh1v0CIeozE5rmkGl9nzJWR4dbNivXEwVk1oXuXmJueLwrhZYFtSVVeIy5pzDLTPw3B6ix4BKFtvhLCK3DlVlNgA64MnHJYMRo+z+fJwv0fI26jz5BiboNvtixQaGGW9zP/p+ArdznPkjunQ0QiGqHNmWo549okQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnFxIe0PzsKxH0PTDm15TB+TV4XmJd3+mywJAeV69v0=;
 b=PnZFX6til8mdCCs9W4kCFFMeB6Nh0Pye7FbL7cruClcm4DUGJldlioDGqfgar+LnCQGwwY52cET2hx5Y3f0fg8NV1aUIigH2k5yXbMM6Oo1Bl1WGEDyUx3Z59vtDrrNajnvPZHzWJlAmRKwHd/se0pyG1hegBuyvAOKMYxz1ulA=
Received: from BN9PR03CA0352.namprd03.prod.outlook.com (2603:10b6:408:f6::27)
 by SJ0PR10MB5597.namprd10.prod.outlook.com (2603:10b6:a03:3d4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 20:03:28 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:f6:cafe::49) by BN9PR03CA0352.outlook.office365.com
 (2603:10b6:408:f6::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 20:03:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 20:03:26 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 15:03:06 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 15:03:06 -0500
Received: from DFLE202.ent.ti.com ([fe80::e17a:6d1d:c1b4:f547]) by
 DFLE202.ent.ti.com ([fe80::e17a:6d1d:c1b4:f547%15]) with mapi id
 15.02.2562.037; Thu, 23 Jul 2026 15:03:06 -0500
From: "Christidis, Antonios" <a-christidis@ti.com>
To: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "antoine.gouby@gmail.com" <antoine.gouby@gmail.com>
CC: "francesco@dolcini.it" <francesco@dolcini.it>
Subject: Re: [meta-ti][master] build issue on mesa-pvr
Thread-Topic: [meta-ti][master] build issue on mesa-pvr
Thread-Index: AQHdGOYdZolj/K7y6UWJSNVOPmZSCbZ7g1/Y
Date: Thu, 23 Jul 2026 20:03:06 +0000
Message-ID: <8f955e24b16f4113aabf3edb1a6c19ed@ti.com>
References: <CAL2HtgxQHThnmV=HfXAFAC0_52BHw73sPsym_AebCXM5Z_tvZA@mail.gmail.com>
In-Reply-To: <CAL2HtgxQHThnmV=HfXAFAC0_52BHw73sPsym_AebCXM5Z_tvZA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.75.243]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: multipart/alternative;
	boundary="_000_8f955e24b16f4113aabf3edb1a6c19edticom_"
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|SJ0PR10MB5597:EE_
X-MS-Office365-Filtering-Correlation-Id: 289fbade-64f3-4f74-710e-08dee8f5754e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|56012099006|5023799004|10067099003|3023799007|8096899003|22082099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	XI0uQK0G0JJ8UnJ/Q1yg6yq1YlWWVp+HdGtaCW8Lm+kiPGtVPOjmRspO+8bGyW/0WNFgdTN843vHWKRgF8hzRlIfrl4DRn4fnmUTrNb+Q2HSVBCQoF8pE1iuMzRopKU0866R0R3UCJLMJhlfQGBwqJUEkYdCLFPCO1nZ8peMHjy5jCvG262oY5XfrL4ThZmbD+YBXSh65YPM6M9vCr39IoTpFiE5fwwbc81gGBmbWYduvOW7wIQajJwXMtusy+CFPZ2oGe1n6VHz2a+xdORQQTEpPr8XZgz5wzX//8Kclp62yCC9d/p8p1VdYPAxxYcSHAkXuDkwejFIgNeRiV59GO0UQAQJ6NGQYzMWeVkhQ4tn6fmUg3t8UXikJ0GhWJy21qC5PDVLBHPE8k4EMQRxRlGVKXWJ8BzEcH6k0aRH8a/SC6j6Coj/NxeBjZzUJUBpXWbS6opUmQ5CJrOCptgETimN3yh2Thqyy757cGSmSzYtKgGC5EsPtPL6Mvx+eztY84p1zk7A3QwV3cIPJmtoZnOji1suGqXMUoYRu3ZS5dK7WwNgYmk06tZXxYOzldx2xWJn6D/6JdW8Ab+Hm4hgyNANZUfh8MHLkFdUPNEB9N6OtJXNR7jrrjLnjdrVD1GzkU1oHTLPwyUuWmloeGTb/w==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(56012099006)(5023799004)(10067099003)(3023799007)(8096899003)(22082099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	x5Ku7IOXX6JSplWbEE4wzyH6masSh3yAo/QFFyCMpBseDk998To/0N7fyw8Uqr8nPpXB//etjPmilkpf3g7toje3iL+hfqRoDHkONUyKExakO6IQJ6ENX14PhZjJ7QMfvt/n9sKDU8l9/Bn/G/LMKhYTRp6B6sO6uK99lS+6n2TllPvWW15W7p/m+x0wJaIf41nVu4L/o12RphKjgWQPmmU0N3lojZh+4aOMuZYvhMrNE21/wRynk5NjzwiaqRy+7rB/RpEBL7VKJ0V86rskVbIl13ChA6ySUwWvpHJTuTzRgL/BQlspBjtz4l1Xa1S1hNTG5JPVEfkc4XfGE9Uz8oHLQI5fXr+3XKu0diibkcJ6HqGCW5l7S9LBFXNd+RcotBnllmKIRefelXY7buybND/AoJDZWIL1szh8P2maj3JvWjI4GfEaFyNiknyXMFL3
X-Exchange-RoutingPolicyChecked: 
	jwyzYS10iw91YAj4kPoYZyPpfW8irD/VULCVs5SFw7gB++tjKumm+4vwtemlqgUFb861rTfCqcFFb2zi5uL+LXRuHHTwvs+Rsi4Lxc0HaZVJ2iYop76rBTGiAaaX3konWlqhb0vvlZwDii2ZwqItiZXGfXXzwPQghBwFG3rXVxeIPNPNARDNzp0WshWtvw/Ywz13nNLSXDDbmXeYisAazKDi7lDdclS/MJTVyU4Xog5wSaroTz4tyYixCs5Eb/ZfGZ1ULIUWSouTG4Xdeofac3Mj+9rFXcfGf83Yq9xfIWzZ1aQOoMbfQ26tw6PdGoo4PM5Lb7qtBHf3VM6fxb4DeQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 20:03:26.4795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 289fbade-64f3-4f74-710e-08dee8f5754e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5597
X-Authority-Analysis: v=2.4 cv=I6VVgtgg c=1 sm=1 tr=0 ts=6a627392 cx=c_pps
 a=9jnBlOlZf5MLgdYWwawaCQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=xqWC_Br6kY4A:10 a=yf0l7cggFFsA:10
 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=NEAV23lmAAAA:8
 a=e5mUnYsNAAAA:8 a=iGHA9ds3AAAA:8 a=jd7Z0sh3qavwikr7PP4A:9 a=CjuIK1q_8ugA:10
 a=ZChNQdpvFsX9r6vZ:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE5NCBTYWx0ZWRfX2+x1nJT0MViA
 GLuFFPM6d1NwBCb6scP8cKbG6MZI8ejfzv+TppS3mSfKFYLoJdvmT0EmreN1HSXOvRw54wqy8xV
 ivNsbKj3NYLpETYtvXk8A0pABnFJybM=
X-Proofpoint-GUID: 0W2CANr0ZU0EahYUlRBQKQdtCm7AuCep
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE5NCBTYWx0ZWRfXyfNnlD7NWr+b
 1i4addK9DSX/aeYnIY8bt6J8MACFca7toLoZzyA61cXl/M4locBywhxOfZQWRcn+hBOjcIVxui4
 XVxNiUjXkiSYmVrj64wVzmwXIlSfLLf6nbhctZFq7c1TvOW+xcZNrlaHIHjgiUnD1xIORDqimpt
 rVxNHycwpVuQYJyCKllrYiBLwKlGgs2L0eXqdmuWBITtyH8tdxiY2M/CbRZbNwlgp4jI1bKe/z6
 vE9p3qSTGLji5IhECcMreHQKg8+bMBvt2SD2zbXC3t1xPit4D1lp89gzj9UcUKA+SSkzBZKtQi1
 WAM5NO4hhGVCd/zyujlS1O9IIq054SpVF2NIGLVHHAOQvok+wc+faNSf+Camn8ooTmXCJ2Webtx
 i24jDWaXKPqjlFPNOn+t7MuynRGXyxsPp4lJjw6PNgaKz/aZQo2nvlsajBFCJF7bB7irdyfnkIk
 PDwQ1zsM9Q0CgA/F8Wg==
X-Proofpoint-ORIG-GUID: 0W2CANr0ZU0EahYUlRBQKQdtCm7AuCep
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230194
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Jul 2026 20:03:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20191

--_000_8f955e24b16f4113aabf3edb1a6c19edticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear Antoine,


Thank you for reporting and sending in the fix. I've tested it and it looks=
 good.

I'll go ahead and push the change at https://github.com/TexasInstruments/me=
sa/tree/powervr/25.2.8. Following that, I'll send a patch to this mailing l=
ist to update the SRCREV for the recipe.


Appreciate your contribution!


Kind Regards,

Antonios

________________________________
From: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org> on be=
half of Antoine Gouby via lists.yoctoproject.org <antoine.gouby=3Dgmail.com=
@lists.yoctoproject.org>
Sent: Tuesday, July 21, 2026 2:53:45 AM
To: meta-ti@lists.yoctoproject.org
Cc: francesco@dolcini.it
Subject: [meta-ti][master] build issue on mesa-pvr

Hello,

Since couple of days we have a build issue on master with mesa-pvr.
It seems to be a race condition, is this a known error or any ideas about i=
t?

07-20:04:08:10  | FAILED: [code=3D1]
src/gallium/drivers/pvr/libpvr.a.p/pvr_mesa_dispatch.c.o
07-20:04:08:10  | aarch64-tdx-linux-gcc -mbranch-protection=3Dstandard
-fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat
-Wformat-security -Werror=3Dformat-security
--sysroot=3D/workdir/oe/tmp/work/aquila_am69-tdx-linux/mesa-pvr/25.2.8/reci=
pe-sysroot
-Isrc/gallium/drivers/pvr/libpvr.a.p -Isrc/gallium/drivers/pvr
-I../sources/mesa-pvr-25.2.8/src/gallium/drivers/pvr -Isrc/mapi
-I../sources/mesa-pvr-25.2.8/src/mapi -Isrc/mesa
-I../sources/mesa-pvr-25.2.8/src/mesa
-I../sources/mesa-pvr-25.2.8/src/gallium/include
-Isrc/gallium/auxiliary
-I../sources/mesa-pvr-25.2.8/src/gallium/auxiliary
-Isrc/gallium/winsys -I../sources/mesa-pvr-25.2.8/src/gallium/winsys
-Iinclude -I../sources/mesa-pvr-25.2.8/include -Isrc
-I../sources/mesa-pvr-25.2.8/src -Isrc/util/format
-I/workdir/oe/tmp/work/aquila_am69-tdx-linux/mesa-pvr/25.2.8/recipe-sysroot=
/usr/include/libdrm
-fvisibility=3Dhidden -fdiagnostics-color=3Dalways -DNDEBUG
-D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -std=3Dc11
-D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
'-DPACKAGE_VERSION=3D"25.2.8"'
'-DPACKAGE_BUGREPORT=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issues"'
-DHAVE_OPENGL=3D1 -DHAVE_OPENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1
-DHAVE_LLVMPIPE -DHAVE_SOFTPIPE -DHAVE_VIRGL -DHAVE_ZINK -DHAVE_PVR
-DHAVE_SWRAST -DVIDEO_CODEC_VC1DEC=3D0 -DVIDEO_CODEC_H264DEC=3D0
-DVIDEO_CODEC_H264ENC=3D0 -DVIDEO_CODEC_H265DEC=3D0
-DVIDEO_CODEC_H265ENC=3D0 -DVIDEO_CODEC_AV1DEC=3D1 -DVIDEO_CODEC_AV1ENC=3D1
-DVIDEO_CODEC_VP9DEC=3D1 -DEGL_WITH_OPENGL -DHAVE_WAYLAND_PLATFORM
-DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DHAVE_DRM_PLATFORM
-DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=3D0 -DGLX_INDIRECT_RENDERING
-DGLX_DIRECT_RENDERING -DGLX_USE_DRM
-DGLAPI_EXPORT_PROTO_ENTRY_POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0
-DENABLE_SHADER_CACHE -DHAVE___BUILTIN_BSWAP32
-DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_CLZLL
-DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS
-DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT
-DHAVE___BUILTIN_POPCOUNTLL -DHAVE___BUILTIN_UNREACHABLE
-DHAVE___BUILTIN_TYPES_COMPATIBLE_P -DHAVE_FUNC_ATTRIBUTE_CONST
-DHAVE_FUNC_ATTRIBUTE_FLATTEN -DHAVE_FUNC_ATTRIBUTE_MALLOC
-DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIBUTE_UNUSED
-DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_WEAK
-DHAVE_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED
-DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS
-DHAVE_FUNC_ATTRIBUTE_NORETURN -DHAVE_FUNC_ATTRIBUTE_OPTIMIZE
-DHAVE_FUNC_ATTRIBUTE_VISIBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY
-DHAVE_FMEMOPEN -D_GNU_SOURCE -DUSE_GCC_ATOMIC_BUILTINS
-DUSE_AARCH64_ASM -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H
-DHAS_SCHED_GETAFFINITY -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H
-DHAVE_DLFCN_H -DHAVE_SYS_SHM_H -DHAVE_SYS_INOTIFY_H
-DHAVE_LINUX_UDMABUF_H -DHAVE_STRTOF -DHAVE_MKOSTEMP
-DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOCK -DHAVE_STRTOK_R
-DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV
-DHAVE_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC
-DHAVE_PROGRAM_INVOCATION_NAME -DHAVE_ISSIGNALING
-DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE_STRTOD_L
-DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DHAVE_ZLIB -DHAVE_ZSTD
-DHAVE_COMPRESSION -DHAVE_PTHREAD -DHAVE_PTHREAD_SETAFFINITY
-DHAVE_LIBDRM '-DMESA_LLVM_VERSION_STRING=3D"22.1.8"' -DLLVM_IS_SHARED=3D1
-DLLVM_AVAILABLE=3D1 -DDRAW_LLVM_AVAILABLE=3D1 -DAMD_LLVM_AVAILABLE=3D1
-DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOLS -DUSE_LIBELF
-DTHREAD_SANITIZER=3D0 -DWL_HIDE_DEPRECATED
-DHAVE_WL_DISPATCH_QUEUE_TIMEOUT -DHAVE_WL_CREATE_QUEUE_WITH_NAME
-DHAVE_X11_DRM -DHAVE_DRI -DHAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC
-DHAVE_DRISW_KMS -mtls-dialect=3Ddesc
-Werror=3Dimplicit-function-declaration -Werror=3Dmissing-prototypes
-Werror=3Dreturn-type -Werror=3Dempty-body
-Werror=3Dincompatible-pointer-types -Werror=3Dint-conversion
-Wimplicit-fallthrough -Wmisleading-indentation
-Wno-missing-field-initializers -Wno-format-truncation
-Wno-nonnull-compare -fno-math-errno -fno-trapping-math -fno-common
-Wno-unknown-pragmas -Wno-unused-function -Werror=3Dformat
-Wformat-security -ffunction-sections -fdata-sections -O2 -g
-fno-omit-frame-pointer
-ffile-prefix-map=3D/workdir/oe/tmp/work/aquila_am69-tdx-linux/mesa-pvr/25.=
2.8/sources/mesa-pvr-25.2.8=3D/usr/src/debug/mesa-pvr/25.2.8
-ffile-prefix-map=3D/workdir/oe/tmp/work/aquila_am69-tdx-linux/mesa-pvr/25.=
2.8/build=3D/usr/src/debug/mesa-pvr/25.2.8
-ffile-prefix-map=3D/workdir/oe/tmp/work/aquila_am69-tdx-linux/mesa-pvr/25.=
2.8/recipe-sysroot=3D
-ffile-prefix-map=3D/workdir/oe/tmp/work/aquila_am69-tdx-linux/mesa-pvr/25.=
2.8/recipe-sysroot-native=3D
-pipe -fPIC -pthread -DGALLIUM_PVR -MD -MQ
src/gallium/drivers/pvr/libpvr.a.p/pvr_mesa_dispatch.c.o -MF
src/gallium/drivers/pvr/libpvr.a.p/pvr_mesa_dispatch.c.o.d -o
src/gallium/drivers/pvr/libpvr.a.p/pvr_mesa_dispatch.c.o -c
../sources/mesa-pvr-25.2.8/src/gallium/drivers/pvr/pvr_mesa_dispatch.c
07-20:04:08:10  |
../sources/mesa-pvr-25.2.8/src/gallium/drivers/pvr/pvr_mesa_dispatch.c:31:1=
0:
fatal error: glapi/gen/dispatch.h: No such file or directory
07-20:04:08:10  |    31 | #include "glapi/gen/dispatch.h"
07-20:04:08:10  |       |          ^~~~~~~~~~~~~~~~~~~~~~
07-20:04:08:10  | compilation terminated.

A quick ChatGPT inquiry suggests this fix, but I don't have the time
to look into it.

diff --git a/src/gallium/drivers/pvr/meson.build
b/src/gallium/drivers/pvr/meson.build
index .......... .. ..........
--- a/src/gallium/drivers/pvr/meson.build
+++ b/src/gallium/drivers/pvr/meson.build
@@ -24,6 +24,7 @@ libpvr_compile_args =3D [

 libpvr_dependencies =3D [
   dep_libdrm,
+  idep_dispatch_h,
   idep_mesautil,
 ]

Thanks,
Antoine

--_000_8f955e24b16f4113aabf3edb1a6c19edticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p>Dear Antoine,&nbsp;</p>
<p><br>
</p>
<p>Thank you for reporting and sending in the fix. I've tested it and it lo=
oks good.&nbsp;</p>
<p>I'll go ahead and push the change at&nbsp;<a href=3D"https://github.com/=
TexasInstruments/mesa/tree/powervr/25.2.8" class=3D"x_OWAAutoLink" id=3D"LP=
lnk439199">https://github.com/TexasInstruments/mesa/tree/powervr/25.2.8</a>=
. Following that, I'll send a patch to this
 mailing list to update the SRCREV for the recipe.</p>
<p><br>
</p>
<p><span>Appreciate your contribution!</span><br>
</p>
<p><br>
</p>
<p>Kind Regards,</p>
<p>Antonios</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> meta-ti@lists.yocto=
project.org &lt;meta-ti@lists.yoctoproject.org&gt; on behalf of Antoine Gou=
by via lists.yoctoproject.org &lt;antoine.gouby=3Dgmail.com@lists.yoctoproj=
ect.org&gt;<br>
<b>Sent:</b> Tuesday, July 21, 2026 2:53:45 AM<br>
<b>To:</b> meta-ti@lists.yoctoproject.org<br>
<b>Cc:</b> francesco@dolcini.it<br>
<b>Subject:</b> [meta-ti][master] build issue on mesa-pvr</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Hello,<br>
<br>
Since couple of days we have a build issue on master with mesa-pvr.<br>
It seems to be a race condition, is this a known error or any ideas about i=
t?<br>
<br>
07-20:04:08:10&nbsp; | FAILED: [code=3D1]<br>
src/gallium/drivers/pvr/libpvr.a.p/pvr_mesa_dispatch.c.o<br>
07-20:04:08:10&nbsp; | aarch64-tdx-linux-gcc -mbranch-protection=3Dstandard=
<br>
-fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat<br>
-Wformat-security -Werror=3Dformat-security<br>
--sysroot=3D/workdir/oe/tmp/work/aquila_am69-tdx-linux/mesa-pvr/25.2.8/reci=
pe-sysroot<br>
-Isrc/gallium/drivers/pvr/libpvr.a.p -Isrc/gallium/drivers/pvr<br>
-I../sources/mesa-pvr-25.2.8/src/gallium/drivers/pvr -Isrc/mapi<br>
-I../sources/mesa-pvr-25.2.8/src/mapi -Isrc/mesa<br>
-I../sources/mesa-pvr-25.2.8/src/mesa<br>
-I../sources/mesa-pvr-25.2.8/src/gallium/include<br>
-Isrc/gallium/auxiliary<br>
-I../sources/mesa-pvr-25.2.8/src/gallium/auxiliary<br>
-Isrc/gallium/winsys -I../sources/mesa-pvr-25.2.8/src/gallium/winsys<br>
-Iinclude -I../sources/mesa-pvr-25.2.8/include -Isrc<br>
-I../sources/mesa-pvr-25.2.8/src -Isrc/util/format<br>
-I/workdir/oe/tmp/work/aquila_am69-tdx-linux/mesa-pvr/25.2.8/recipe-sysroot=
/usr/include/libdrm<br>
-fvisibility=3Dhidden -fdiagnostics-color=3Dalways -DNDEBUG<br>
-D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -std=3Dc11<br>
-D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS<br>
'-DPACKAGE_VERSION=3D&quot;25.2.8&quot;'<br>
'-DPACKAGE_BUGREPORT=3D&quot;https://gitlab.freedesktop.org/mesa/mesa/-/iss=
ues&quot;'<br>
-DHAVE_OPENGL=3D1 -DHAVE_OPENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1<br>
-DHAVE_LLVMPIPE -DHAVE_SOFTPIPE -DHAVE_VIRGL -DHAVE_ZINK -DHAVE_PVR<br>
-DHAVE_SWRAST -DVIDEO_CODEC_VC1DEC=3D0 -DVIDEO_CODEC_H264DEC=3D0<br>
-DVIDEO_CODEC_H264ENC=3D0 -DVIDEO_CODEC_H265DEC=3D0<br>
-DVIDEO_CODEC_H265ENC=3D0 -DVIDEO_CODEC_AV1DEC=3D1 -DVIDEO_CODEC_AV1ENC=3D1=
<br>
-DVIDEO_CODEC_VP9DEC=3D1 -DEGL_WITH_OPENGL -DHAVE_WAYLAND_PLATFORM<br>
-DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DHAVE_DRM_PLATFORM<br>
-DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=3D0 -DGLX_INDIRECT_RENDERING<br>
-DGLX_DIRECT_RENDERING -DGLX_USE_DRM<br>
-DGLAPI_EXPORT_PROTO_ENTRY_POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0<br>
-DENABLE_SHADER_CACHE -DHAVE___BUILTIN_BSWAP32<br>
-DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_CLZLL<br>
-DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS<br>
-DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT<br>
-DHAVE___BUILTIN_POPCOUNTLL -DHAVE___BUILTIN_UNREACHABLE<br>
-DHAVE___BUILTIN_TYPES_COMPATIBLE_P -DHAVE_FUNC_ATTRIBUTE_CONST<br>
-DHAVE_FUNC_ATTRIBUTE_FLATTEN -DHAVE_FUNC_ATTRIBUTE_MALLOC<br>
-DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIBUTE_UNUSED<br>
-DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_WEAK<br>
-DHAVE_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED<br>
-DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS<br>
-DHAVE_FUNC_ATTRIBUTE_NORETURN -DHAVE_FUNC_ATTRIBUTE_OPTIMIZE<br>
-DHAVE_FUNC_ATTRIBUTE_VISIBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY<br>
-DHAVE_FMEMOPEN -D_GNU_SOURCE -DUSE_GCC_ATOMIC_BUILTINS<br>
-DUSE_AARCH64_ASM -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H<br>
-DHAS_SCHED_GETAFFINITY -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H<br>
-DHAVE_DLFCN_H -DHAVE_SYS_SHM_H -DHAVE_SYS_INOTIFY_H<br>
-DHAVE_LINUX_UDMABUF_H -DHAVE_STRTOF -DHAVE_MKOSTEMP<br>
-DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOCK -DHAVE_STRTOK_R<br>
-DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV<br>
-DHAVE_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC<br>
-DHAVE_PROGRAM_INVOCATION_NAME -DHAVE_ISSIGNALING<br>
-DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE_STRTOD_L<br>
-DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DHAVE_ZLIB -DHAVE_ZSTD<br>
-DHAVE_COMPRESSION -DHAVE_PTHREAD -DHAVE_PTHREAD_SETAFFINITY<br>
-DHAVE_LIBDRM '-DMESA_LLVM_VERSION_STRING=3D&quot;22.1.8&quot;' -DLLVM_IS_S=
HARED=3D1<br>
-DLLVM_AVAILABLE=3D1 -DDRAW_LLVM_AVAILABLE=3D1 -DAMD_LLVM_AVAILABLE=3D1<br>
-DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOLS -DUSE_LIBELF<br>
-DTHREAD_SANITIZER=3D0 -DWL_HIDE_DEPRECATED<br>
-DHAVE_WL_DISPATCH_QUEUE_TIMEOUT -DHAVE_WL_CREATE_QUEUE_WITH_NAME<br>
-DHAVE_X11_DRM -DHAVE_DRI -DHAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC<br>
-DHAVE_DRISW_KMS -mtls-dialect=3Ddesc<br>
-Werror=3Dimplicit-function-declaration -Werror=3Dmissing-prototypes<br>
-Werror=3Dreturn-type -Werror=3Dempty-body<br>
-Werror=3Dincompatible-pointer-types -Werror=3Dint-conversion<br>
-Wimplicit-fallthrough -Wmisleading-indentation<br>
-Wno-missing-field-initializers -Wno-format-truncation<br>
-Wno-nonnull-compare -fno-math-errno -fno-trapping-math -fno-common<br>
-Wno-unknown-pragmas -Wno-unused-function -Werror=3Dformat<br>
-Wformat-security -ffunction-sections -fdata-sections -O2 -g<br>
-fno-omit-frame-pointer<br>
-ffile-prefix-map=3D/workdir/oe/tmp/work/aquila_am69-tdx-linux/mesa-pvr/25.=
2.8/sources/mesa-pvr-25.2.8=3D/usr/src/debug/mesa-pvr/25.2.8<br>
-ffile-prefix-map=3D/workdir/oe/tmp/work/aquila_am69-tdx-linux/mesa-pvr/25.=
2.8/build=3D/usr/src/debug/mesa-pvr/25.2.8<br>
-ffile-prefix-map=3D/workdir/oe/tmp/work/aquila_am69-tdx-linux/mesa-pvr/25.=
2.8/recipe-sysroot=3D<br>
-ffile-prefix-map=3D/workdir/oe/tmp/work/aquila_am69-tdx-linux/mesa-pvr/25.=
2.8/recipe-sysroot-native=3D<br>
-pipe -fPIC -pthread -DGALLIUM_PVR -MD -MQ<br>
src/gallium/drivers/pvr/libpvr.a.p/pvr_mesa_dispatch.c.o -MF<br>
src/gallium/drivers/pvr/libpvr.a.p/pvr_mesa_dispatch.c.o.d -o<br>
src/gallium/drivers/pvr/libpvr.a.p/pvr_mesa_dispatch.c.o -c<br>
../sources/mesa-pvr-25.2.8/src/gallium/drivers/pvr/pvr_mesa_dispatch.c<br>
07-20:04:08:10&nbsp; |<br>
../sources/mesa-pvr-25.2.8/src/gallium/drivers/pvr/pvr_mesa_dispatch.c:31:1=
0:<br>
fatal error: glapi/gen/dispatch.h: No such file or directory<br>
07-20:04:08:10&nbsp; |&nbsp;&nbsp;&nbsp; 31 | #include &quot;glapi/gen/disp=
atch.h&quot;<br>
07-20:04:08:10&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~~~~~~~~~<br>
07-20:04:08:10&nbsp; | compilation terminated.<br>
<br>
A quick ChatGPT inquiry suggests this fix, but I don't have the time<br>
to look into it.<br>
<br>
diff --git a/src/gallium/drivers/pvr/meson.build<br>
b/src/gallium/drivers/pvr/meson.build<br>
index .......... .. ..........<br>
--- a/src/gallium/drivers/pvr/meson.build<br>
&#43;&#43;&#43; b/src/gallium/drivers/pvr/meson.build<br>
@@ -24,6 &#43;24,7 @@ libpvr_compile_args =3D [<br>
<br>
&nbsp;libpvr_dependencies =3D [<br>
&nbsp;&nbsp; dep_libdrm,<br>
&#43;&nbsp; idep_dispatch_h,<br>
&nbsp;&nbsp; idep_mesautil,<br>
&nbsp;]<br>
<br>
Thanks,<br>
Antoine<br>
</div>
</span></font>
</body>
</html>

--_000_8f955e24b16f4113aabf3edb1a6c19edticom_--

