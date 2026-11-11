Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7567.1794397082975149040
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Nov 2026 03:38:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Yxu1kSYp;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=GuiZW9Jd;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: devarsht@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AB7HrJx941808;
	Wed, 11 Nov 2026 05:38:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=uONZQIPpLxy+FsMtZ+pqKRWOvsrZEt9o7Zlz4C+9e
	bs=; b=Yxu1kSYprkzvMGh4CPMrekaaTeLeplQDRAw5kGurFIG2agtXDAAWrqjet
	pfrt2oC4zjRJqk2gVOvpl9nZI09fr3k2DNgkxPhkRJWqzv5Udpebhe4QdGEQRMjd
	twXmOl0jLacDvfEzzW43be+R3MbuYmep9TWdmdhPuWQST1CK9aQbe80bcOIpBRZB
	xF8p/qXN0XkanxDUikCdCKcMYSuo5eQbs+n4Sr4STJXC2UeFON4HuBCRQWJjMYFU
	CsKqL1RpBY70ORXWySNdpQOdwTieycavGEgvbfjKN0mGGNXEjplNgNeTOM7xosDY
	vau7CZ6Ux8od72P6nZgWb0+Tfw6yw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011010.outbound.protection.outlook.com [40.93.194.10])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hveygtq6a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 05:38:00 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncEMII9UZdFm94geDC4+VnBoO6Ff28PlYZ4+efgWCHthu+lCwTJKfcJHZVcdthQbr3eFybRDWRPhG8F6wVvf22v6DHPIZcLDetjix/dRStbG3QRWt1vP74464u9maPzbtAyfUdLXTbOSz0IDL38cs0AhJ470SIbisWVuH1LR2KAPNB1+CNtsw/E8ds8P+2YFKtYnEOmc8JTiPQ2mtk36+20IpYJyvmJ4L+INWagiD297rszFu9Yg8Xk35c3MZXG6jxiLjYaYfR1jpiOCGZ4r6Quqbyuy+sE11dj9n5uJL2IkyPWe2+mU51QihG4l4VyDhwDnUTOmuwZLA9yXtXg+8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uONZQIPpLxy+FsMtZ+pqKRWOvsrZEt9o7Zlz4C+9ebs=;
 b=B4XLxALR+c0n68oL6u9k6PAJAmdb73j9l2BduHVecgOFWFen0z5Do2axtF5Lyt2LhktAvo1K/HfIvKpxG4G7hCF7OQW+strr7krE1Rr4nvrGfi5eo/3lcZy6m5cfCBGzjBAJu2vOtCqD57XCWPOQBQbkdgINSWttUCNHQgr48YS+NPVMo2NPJGEU2cz2ffyHbdPlhbvn8XpYQy6trlzeaucbqy4I/PNKsVL0M9O1TRGU8EYRI9gChqoh2N4EjHNhRuWklKM/iGAkoMrcgZGi8iSGQ6Dv0P3pbStQetmshaCijRUDB4E5sXzkry2vZbOLFQgmJmfNx+UNhbFGZrNy0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ti.com; dmarc=pass action=none header.from=ti.com; dkim=pass
 header.d=ti.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uONZQIPpLxy+FsMtZ+pqKRWOvsrZEt9o7Zlz4C+9ebs=;
 b=GuiZW9JdeW82Gc61+4XYjE1+GcfYVAjwJtAE1ekeFbnTGeG8ywuC7IykUK+aAob6mILhdmm6sUa0iRZWdZmfksmkq1SIInyX/biYLOlHNS2cXIT29QZTwalzSzGhcsPYI1y3BGaer+I7VGG2ud9lTZLfG8Rl/J8DqaPKaA8XUkw=
Received: from BN8PR10MB3652.namprd10.prod.outlook.com (2603:10b6:408:ba::10)
 by DM4PR10MB6744.namprd10.prod.outlook.com (2603:10b6:8:10c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 11:37:58 +0000
Received: from BN8PR10MB3652.namprd10.prod.outlook.com
 ([fe80::86d1:377b:3bec:884a]) by BN8PR10MB3652.namprd10.prod.outlook.com
 ([fe80::86d1:377b:3bec:884a%4]) with mapi id 15.21.0592.010; Wed, 11 Nov 2026
 11:37:57 +0000
From: "Thakkar, Devarsh" <devarsht@ti.com>
To: "Sharma, Rahul" <r-sharma3@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
CC: "Eatmon, Ryan" <reatmon@ti.com>, "denys@konsulko.com" <denys@konsulko.com>
Subject: Re: [meta-ti] [wrynose][PATCH] am62pxx-evm: Add tisdk-uenv
 configuration for display support
Thread-Topic: [meta-ti] [wrynose][PATCH] am62pxx-evm: Add tisdk-uenv
 configuration for display support
Thread-Index: AQHdccVufd5Tvbt9TkuNmOFJi8suvLcovqSA
Date: Wed, 11 Nov 2026 11:37:56 +0000
Message-ID: <4afc4916-6110-4ff4-911e-626c8aba258a@ti.com>
References: <20261111101358.3203148-1-r-sharma3@ti.com>
In-Reply-To: <20261111101358.3203148-1-r-sharma3@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ti.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR10MB3652:EE_|DM4PR10MB6744:EE_
x-ms-office365-filtering-correlation-id: 1a3d85d8-f01d-42fa-858b-08df3fe83b50
x-ld-processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|4022899009|261009223027099003|38070700021|10067099003|261026121527099003|261026140227099003|261022115727099003|56012099006|261022075727099003|261022105027099003|261021123027099003|261021121427099003|261028144727099003|261102123227099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info: pnMpeI7IsIN2Rb3TUM6JSeuTHD/fcq1YiPn4Z+VB4VF8+S4TXycXF4xbwV4WioBcTqp3HTazbu0Ld586A61R/jZ4iguT0RXVxQF0UlMTNDk/CX6Yrk7ErRNoqmS5dGI+LF9QHvDFlHDZ4yeizsCnFdNJy6Pb0ZFyN3kwXrZsl7GtPnlUfdrUP/DD6QYO4WhxlGZbE5c5ZbjBEfQVM925E7cVvHzZljf+t79ovucUAnoI4NfMnLMtQid0J1e6gmZOTaC2FC+jv3Ictc0BOYaumiJbmyvdAKTEeR6zfmLR4ihbKOH88Ur5XbKyjZ4aDU9WQWeRtx8myDeBo7IO09NrJNlUEYkjBauY2t0R5gzjG4J60fbTvWLyzzE1+g4IWLV28tBY+8A0aqla8zNk3elNqB/Hsu7YQVcBe1YPNfQhtsjAVDS6jOCXAoBm7Povji01TF/+F/qFQa1Ef+YYCQH7lzCmhrq1rl8ALo99TBHfcC4Ck74OskxfZQGKjvc0U3djuCehgr+q44o+I0synTUAy7O6RsFMhVh3mGutzTfjn3B00dkAOWEe2smZEUe69JVGCu6s/xNkaEG2tkxEdRRDzzVYZrLUYwjyXB7Ujy1/X1jRuLZeb0n4qptL6JhHYx7i8CBQXRxCsCu8nOYU+w19yNfGQP02qAJjXWev4eVmB4I=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3652.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4022899009)(261009223027099003)(38070700021)(10067099003)(261026121527099003)(261026140227099003)(261022115727099003)(56012099006)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFQzOXhXQk5KTnBZQ1grNEtVclVmUjl6czQ2WEZzamlZOGlYTE5jbU9vaVk1?=
 =?utf-8?B?bWFXM2FWNzFkb2J6MG9JcWFSUDlmRHpoQzNTMkE2eERBYjV6Sk0vcVhPS0cr?=
 =?utf-8?B?NGtRVThoeXRuT0ZDZWNwNFNmeFlodUZxSExUZ0pZc1E4cXNnaVZ5QWMzbTRa?=
 =?utf-8?B?aG5iNEd4b3Z0am45V3JRRTh6TXlNVTVxY1loYnp0czg5MkpvWk9ySHNWYUFk?=
 =?utf-8?B?a1ZxS3l6ZFFkcWFMYUh3ZWJZNU5Qck83R2pINWhzb0x0YktmNVJLMjUrS2Nh?=
 =?utf-8?B?aDk2NUpSVW9BY0FyT09ITHN4bklQRkNVcGVNRU1mT3hMUXJkbDBtUWVic1Ix?=
 =?utf-8?B?RDBNck44VHpZZUxlRVNtaGdNQjN5NVNoOUZDRWMwZmt2UFNXYUNYUmZRdnlB?=
 =?utf-8?B?dnpRQUtNekJZR0JTK0xQbk56a2pzaDFiUCt5cE16M1BoeEZOaE9xaS9nWU9U?=
 =?utf-8?B?VVo0NmVSZG9NRHB3UnFoK2EvckV5Y2ZFcmdsNENGcEN3S3NFRFg5ZTNxcWQ2?=
 =?utf-8?B?RGFhMzFMQkg2YVRnSWRwTEdOQ1Q0d0tSZHlUV2JPbzB6dElPWnRzalV4VW1z?=
 =?utf-8?B?NTFYODE3RUpSQkxXN21KRjVUajl0bXB6eTY1cytGZXVTS01WbldsMmJOQWp1?=
 =?utf-8?B?ZnM3bmJaRjdFa2lPTXZKMUV5bmtMVjFTbmhYMXFGVUcvR3piU05TQTVkK0Qw?=
 =?utf-8?B?MmdDMWRDbFRIY205NDIvSFczcDk2YnBJWHJqOHA0MEs1bGx1bW5vQVRSWDlw?=
 =?utf-8?B?citJcGxsaytmNUYzNEkvZ2w0bjR2cTByV1IzUithc0FKQUhqczdkSmpaaDli?=
 =?utf-8?B?MC92WkovazJ0bWxWK2FzTmh1WTZROUtoOGpwZG1jMXZSdXR3T0NIREQ3aDdq?=
 =?utf-8?B?NDZvUU5Gazgvd3JYZzgwYXFsMG1VdnNUOHA1eS9GV2MzZG8wRGR3bFNSdWtQ?=
 =?utf-8?B?N1BGaDUwNjZvT0dITFpKK2VSTjJSdWMrSDNWU0oyTjlCRG1jajBrTkZHQVVQ?=
 =?utf-8?B?dFRRbDFXVUpPaHZLZWIwbm1zL2FXc3A4RkhoQWs3WVZRTUZVK1NZSnhBaldM?=
 =?utf-8?B?ZC84VnRseXNCVmJKU01Nd2tSVlM0Y1A1VUQ5NnF4cFFxTHhIbG1DaHJ3NWV1?=
 =?utf-8?B?bmMxYlJBMU0rcHNBZ2p6bkp5bEllbFAveWxjVndZWFpxSDBVZ2IzeVNnR0VL?=
 =?utf-8?B?SllPUWltb3BHcWd2RG1JOUlVQlgxK3pnZHo0TGtXRS9Yd1hiVFpYQVI2VHRl?=
 =?utf-8?B?Q0E0Yk5zak9TOFZUMlRjYWRCTFFOamRGK1ZPSmlHUjY0dWxjRG5NOW15Zk5E?=
 =?utf-8?B?OVdBR0U4WnlXQkZ4QXlieE1kWDRPWGdaazROZEhIUDRQM3ppemNybjBnbWJZ?=
 =?utf-8?B?UXpDU1g3Rk9YVU0xMEgwZmlRU25GVE1hR0k4NjRleVdsNm1DeFlTRXAzeXh4?=
 =?utf-8?B?N2wzWjhRMXB3c1BvUjh6RDBHbXcrMDVwL1pVSC9Ua1B3T3FjT1RjM3lhT1Ja?=
 =?utf-8?B?NktpMUxNbVZtMlRUT3pQZk53N2ZvODIxWHNrRW1QUWZzNTNuaHRvRklDWDBx?=
 =?utf-8?B?TGhBdUZMalMwQ1NJdUV6QnVLM0FaUVQ4NWhCVTlKWmVJQytOM01iU3h5QjBv?=
 =?utf-8?B?aVFyWGM2UGVrMFROb2MwL1NZZDI4OEljemU4TXRZYlJsT0pPRm9taXdjMnlC?=
 =?utf-8?B?RGlCYTFsZ1EyUG9iSlhHRkkwU1F3TnI2OE9Pd0NtVG01dVB3WVBMUzNML1dK?=
 =?utf-8?B?OFNVc012d3dXbURLYVZXaHhZUWwySldrd0pTaFpMUFVCVVZWZHpvVzVsaVY3?=
 =?utf-8?B?cWY2M01vVUJHbC94K0V3ZXF1bGhTQ0MwdnY0RWJNZHBYcVVYYUhlTVlGZVRI?=
 =?utf-8?B?UFF2VUFjL3ZQY1FidGhSRkVBSkZ6UVVHTE14VUJhcFlObEM5a0xYUVZtVks0?=
 =?utf-8?B?SzBqUjhBVVJCQzVzWnY4Y2F6d2c5TXZJUU53UVpsZ21mVjBJV1BTQnJuR2w4?=
 =?utf-8?B?NHFBMEhOUW9vU2VDeWppV1Z0MExhRzk3SUFxUU10ZnJ4eEJHYTJ1ekQ5dzZs?=
 =?utf-8?B?eTc4bWMyK251ZHkvSzNDQXI0RTBQbmdZRWlteGRhcU9yRVZWMDZWNlBjVzlS?=
 =?utf-8?B?WEhlQ0UxbHhKR3RGZk9QaDczQWVPcWdCcjduTDRLNzdDU2JxZHJvdnB5LzdC?=
 =?utf-8?B?MWlaaG1OWlNZbENRN21MS2g0TVB0akJOWTFqWWZJdmxKN1RBRkpJaERKWWd2?=
 =?utf-8?B?aGtFSjNmQ1B5R3AzaTJKc0FsWVc4dS90Q25ZRUl2aGxIN0FKS2lpZ3U4cmtO?=
 =?utf-8?Q?dLtpbBWRN6DxkT++in?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A25B2304C2487E4FA5218639B31FE6AE@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sUNqwGy+wRPhuh8LvPn2DFJpb2J+jW+p/Q+gdn2iXOsoI6tpYdo8oi166joM8FwC16mrlvxQqG1s0Z4LXEW5sUNAm5GyVCrLUfgZjuRNj6Xe6Qec3Fm3S+3qbGVRoPdyR2MKTbhHwSRyeaBye62eH4/rjcyOSaeflilp+k4S/39mMcSDoixMTEx6g/pQsFPiSgIMp0xVw1+h6aMbjlvumZPIMLeu2rs+An3yC+prrOf82Ix9FeEavx7rmjKJtUsbshHVdb0CDwyJTo6gpg2DPLAKjQa6HTeoNKvyjikiN0nRikljvtxNiZ+fJwOnxmvXUjjEW/GSeghsjLWre1It6g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR10MB3652.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3d85d8-f01d-42fa-858b-08df3fe83b50
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 11:37:56.9892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4C31D8TxreyiJthwaBZJxsFEMz+MgXvnn4uGd9/8duvCYpLgcmXwwX6NAQcSJIBL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6744
X-Proofpoint-GUID: IOLtdQPcqCbFIp_Og8KSKIAMWwZzwzWZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0NiBTYWx0ZWRfX68vN5td1NoSj
 I7mL4JSv2brrDPnNUQTwte3gpLyOncZDSsVEzxcVxve/LwPRKEdKQnbZ9PPus4VHx7mv4O8sq1K
 qioui67SW73mDkWtZZRTXjcDI9UsBzk=
X-Proofpoint-ORIG-GUID: IOLtdQPcqCbFIp_Og8KSKIAMWwZzwzWZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0NiBTYWx0ZWRfX/oZXRmLb/J9d
 0/CNkohy9tn5hC4rtg8bofO0xh+zAPViRADgZvw4/6/nTIB1CBLh+Sb3wtA8+xwuYAFsYaazlGs
 xgnRsb4uT7puKU6N2rY+Q/qixEMYSVfBJKRt2c00Vh1Bpb9x+ClMkfQJ7bKIMGcoYEez/APe1eH
 t3ZpmBu0wFgcbh0HAM3K4zalS+UfljvfIJPOU5m7G7Pbtl991VttPRN6zUSMkeDAQVEP+iOA3Ru
 0iosXZPHnWG72nnLYJFJv4Km9Vc7QBtl/OKRoaxX/cXfEGmJSbzFNs9UFmTP04PA+McxKsLqON+
 Qij557lMEmICmzW5NQmWrx5BjA5Ux248VKaq5REsYlIXBtP4rDcYeZdH77q/x4hvz9O35tLC8kJ
 Tw4zQSoEbHXW/OKKYRtyof6+BvHVobHy78aS06PhyqAvtbxB4U5LTUGGjhrMQRuxLWmGfb0j4UL
 dChey66jbko03nELcTQ==
X-Authority-Analysis: v=2.4 cv=FpaQbGrq c=1 sm=1 tr=0 ts=6af45399 cx=c_pps
 a=PJn3dW4q50A9PoMJtOr6Ng==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=XsAeKW46kDZrsmzwEF4A:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110046
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 11 Nov 2026 11:38:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20524

T24gMTEvMTEvMjAyNiAzOjQzIFBNLCBSYWh1bCBTaGFybWEgdmlhIG1ldGEtdGkgd3JvdGU6DQo+
IEFkZCBVLUJvb3QgZW52aXJvbm1lbnQgY29uZmlndXJhdGlvbiB0byBlbmFibGUgT0xESSBkaXNw
bGF5IG91dHB1dA0KPiBvbiB0aGUgQU02MlB4eCBFVk0uIFRoaXMgaW5jbHVkZXM6DQo+IA0KPiAt
IENyZWF0ZSB0aXNkay11ZW52IGJiYXBwZW5kIGZvciBhbTYycHh4IG1hY2hpbmUNCj4gLSBBZGQg
dUVudi50eHQgd2l0aCBPTERJIHNpbXBsZWZiIGRldmljZSB0cmVlIG92ZXJsYXkNCj4gDQo+IFRo
ZSBjb25maWd1cmF0aW9uIGxvYWRzIGszLWFtNjJwNS1zay1vbGRpLXNpbXBsZWZiLmR0Ym8gb3Zl
cmxheQ0KPiB0byBlbmFibGUgZGlzcGxheSBvdXRwdXQgdGhyb3VnaCB0aGUgT0xESSBpbnRlcmZh
Y2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBTaGFybWEgPHItc2hhcm1hM0B0aS5jb20+
DQo+IC0tLQ0KPiAgLi4uL3JlY2lwZXMtdGlzZGsvdGlzZGstdWVudi90aXNkay11ZW52LmJiYXBw
ZW5kICAgICB8ICA1ICsrKysrDQo+ICAuLi4vdGlzZGstdWVudi90aXNkay11ZW52L2FtNjJweHgt
ZXZtL3VFbnYudHh0ICAgICAgIHwgMTIgKysrKysrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDE3IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXRpLWJzcC9yZWNp
cGVzLXRpc2RrL3Rpc2RrLXVlbnYvdGlzZGstdWVudi5iYmFwcGVuZA0KPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IG1ldGEtdGktYnNwL3JlY2lwZXMtdGlzZGsvdGlzZGstdWVudi90aXNkay11ZW52L2Ft
NjJweHgtZXZtL3VFbnYudHh0DQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS10aS1ic3AvcmVjaXBl
cy10aXNkay90aXNkay11ZW52L3Rpc2RrLXVlbnYuYmJhcHBlbmQgYi9tZXRhLXRpLWJzcC9yZWNp
cGVzLXRpc2RrL3Rpc2RrLXVlbnYvdGlzZGstdWVudi5iYmFwcGVuZA0KPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMC4uYmMwNjFiMWMNCj4gLS0tIC9kZXYvbnVsbA0KPiAr
KysgYi9tZXRhLXRpLWJzcC9yZWNpcGVzLXRpc2RrL3Rpc2RrLXVlbnYvdGlzZGstdWVudi5iYmFw
cGVuZA0KPiBAQCAtMCwwICsxLDUgQEANCj4gK0ZJTEVTRVhUUkFQQVRIUzpwcmVwZW5kIDo9ICIk
e1RISVNESVJ9LyR7UE59LyR7TUFDSElORX06Ig0KPiArDQo+ICtTUkNfVVJJOmFwcGVuZDphbTYy
cHh4ID0gIlwNCj4gKyAgICBmaWxlOi8vdUVudi50eHQgXA0KPiArIg0KPiBkaWZmIC0tZ2l0IGEv
bWV0YS10aS1ic3AvcmVjaXBlcy10aXNkay90aXNkay11ZW52L3Rpc2RrLXVlbnYvYW02MnB4eC1l
dm0vdUVudi50eHQgYi9tZXRhLXRpLWJzcC9yZWNpcGVzLXRpc2RrL3Rpc2RrLXVlbnYvdGlzZGst
dWVudi9hbTYycHh4LWV2bS91RW52LnR4dA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRl
eCAwMDAwMDAwMC4uMGZmZGE1MGQNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhLXRpLWJz
cC9yZWNpcGVzLXRpc2RrL3Rpc2RrLXVlbnYvdGlzZGstdWVudi9hbTYycHh4LWV2bS91RW52LnR4
dA0KPiBAQCAtMCwwICsxLDEyIEBADQo+ICsjIFRoaXMgdUVudi50eHQgZmlsZSBjYW4gY29udGFp
biBhZGRpdGlvbmFsIGVudmlyb25tZW50IHNldHRpbmdzIHRoYXQgeW91DQo+ICsjIHdhbnQgdG8g
c2V0IGluIFUtQm9vdCBhdCBib290IHRpbWUuICBUaGlzIGNhbiBiZSBzaW1wbGUgdmFyaWFibGVz
IHN1Y2gNCj4gKyMgYXMgdGhlIHNlcnZlcmlwIG9yIGN1c3RvbSB2YXJpYWJsZXMuICBUaGUgZm9y
bWF0IG9mIHRoaXMgZmlsZSBpczoNCj4gKyMgICAgdmFyaWFibGU9dmFsdWUNCj4gKyMgTk9URTog
VGhpcyBmaWxlIHdpbGwgYmUgZXZhbHVhdGVkIGFmdGVyIHRoZSBib290Y21kIGlzIHJ1biBhbmQg
dGhlDQo+ICsjICAgICAgIGJvb3RjbWQgbXVzdCBiZSBzZXQgdG8gbG9hZCB0aGlzIGZpbGUgaWYg
aXQgZXhpc3RzICh0aGlzIGlzIHRoZQ0KPiArIyAgICAgICBkZWZhdWx0IG9uIGFsbCBuZXdlciBV
LUJvb3QgaW1hZ2VzLiAgVGhpcyBhbHNvIG1lYW5zIHRoYXQgc29tZQ0KPiArIyAgICAgICB2YXJp
YWJsZXMgc3VjaCBhcyBib290ZGVsYXkgY2Fubm90IGJlIGNoYW5nZWQgYnkgdGhpcyBmaWxlIHNp
bmNlDQo+ICsjICAgICAgIGl0IGlzIG5vdCBldmFsdWF0ZWQgdW50aWwgdGhlIGJvb3RjbWQgaXMg
cnVuLg0KPiArDQo+ICtvcHRhcmdzPXZ0Lmdsb2JhbF9jdXJzb3JfZGVmYXVsdD0wDQoNCkkgZG9u
J3QgdGhpbmsgYWJvdmUgaXMgcmVsYXRlZCB0byB0aGlzIHBhdGNoLiBMZXQncyByZW1vdmUgaXQg
Zm9yIG5vdw0KYW5kIGtlZXAgdGhlIGN1cnNvciBlbmFibGVkLg0KDQpXaXRoIGFib3ZlIGNoYW5n
ZSwNClJldmlld2VkLWJ5OiBEZXZhcnNoIFRoYWtrYXIgPGRldmFyc2h0QHRpLmNvbT4NCg0KUmVn
YXJkcw0KRGV2YXJzaA0KDQo+ICtuYW1lX292ZXJsYXlzPXRpL2szLWFtNjJwNS1zay1vbGRpLXNp
bXBsZWZiLmR0Ym8NCj4gDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlu
a3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcv
UmVwbHkgT25saW5lICgjMjA1MTgpOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9t
ZXRhLXRpL21lc3NhZ2UvMjA1MTgNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLnlv
Y3RvcHJvamVjdC5vcmcvbXQvMTIyMjA5NDA3LzY3NDA1OTkNCj4gR3JvdXAgT3duZXI6IG1ldGEt
dGkrb3duZXJAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9s
aXN0cy55b2N0b3Byb2plY3Qub3JnL2cvbWV0YS10aS91bnN1YiBbZGV2YXJzaHRAdGkuY29tXQ0K
PiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KDQo=
