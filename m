Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9625.1794404500492197022
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Nov 2026 05:41:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=XiI39DlN;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=LZH/pDoo;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: devarsht@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCX5Pk4127679;
	Wed, 11 Nov 2026 07:41:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=MDwkpzX1DYkL6ppYh8777xHGg6q7MdXSKEh+eCWll
	Ps=; b=XiI39DlNMIjm7apl2sM94Qz+HTemuhxN2fJyne89487ztR80T30JlI31w
	7mwuopnGfmMjGp1rOxh1Z3ji2UmjeNiSFiZ1VxH7yWh6U3gH8afKyVJiWrEMQHqc
	pXJwuUfY7gtFV+BGGN2/CEHZxiEaLJmyFL873psMlLmCdQ65HpRQDmfRWa2pyEDW
	sdWF6IB8IL96G/FpgP1yT7ADDu9/fQraD3HR6SVfHBw1r/vS6tq4zkgeefSHSoBb
	Y4Pj7WQKir1m+1/5kFoL4UaOyy0dodRcw6JCjlZ0UBEDca6XGiPcaEsArgNLiVsy
	fyRdC9GKPlgbKlmypESdHAtacHSYw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010010.outbound.protection.outlook.com [52.101.201.10])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hvgsyjp8c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 07:41:38 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkAl9xrB1Yp2H1Nm5PHNvI7CfF5W3+QUlb2CDJJFKgIE0gZ7ewM5M5dW+3HemwUAC+/3pqm0DpvayE7o3tfcHz+kSVcH6DqH09VKg2/Fmz5i6+e6Uq2x7mkEgHZIM43bavnPESsKU4nItKNUrFVK53GmD0wNJgRb50/R6K1sFiQid9IaYFLWH6eOWVVEa9pzmjUkuL7qUPrIjHAAmHqnFkpTAx0G1zXg6Akq+XwR4jk9MRCA2yguVOajC1aAqlBYZPV5Rv3NopSf2ehqCq2SPvdWQVQ5MgVJpHjnTag9sq3Zjd9e8xdoN2phtUF7vpVnjlQaD3Hug1z2guhTSUrWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDwkpzX1DYkL6ppYh8777xHGg6q7MdXSKEh+eCWllPs=;
 b=M9Q5la1Xsh/UrYMFkXADb9BQJ1bEP2z5jW01t5oAYAWl38qrZxopofZu8dujFZa54BlMAPFeL+koF5G+Gfir6j0dr0YRD6T/bdScNRQU/QCcaZo2I8VtP8ldHvMC8WwlI4m9Y3qcgqxtE3BQVGHGxl3JPywc8JD12G7fVBM4Boe+U0qfgrtHilHAaNXw5ySKleUL3/GhikYDqYbsp64LUoM4YRbLRIy1CxHbD75r8VUKP54WmHsX3YPZpM9NRkHpbjRS9tD+RoIhn5c3o1v0LaFPO/NvEl/ldgZ84awHTnrmc9ivzDjNSBjaKoR4hpqlxpJJx3KLT3gcR+GgOw2ztw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ti.com; dmarc=pass action=none header.from=ti.com; dkim=pass
 header.d=ti.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDwkpzX1DYkL6ppYh8777xHGg6q7MdXSKEh+eCWllPs=;
 b=LZH/pDoo4fMmOjKqV5789mdHcPBUzXTY4cs2tqkYCrsLBKBwXcWi4hNxXvcEli6r/SWcKrbSnacObeiXb/cHMt9BurR72E/aksA1sqMtc8ppvHcoUw74s9gcvVmuZX/s40qcVcHLVoRSRzRbUtq5S4SahRtvqQl2ppXZ4rvaNvI=
Received: from BN8PR10MB3652.namprd10.prod.outlook.com (2603:10b6:408:ba::10)
 by DS0PR10MB6031.namprd10.prod.outlook.com (2603:10b6:8:cd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 13:41:36 +0000
Received: from BN8PR10MB3652.namprd10.prod.outlook.com
 ([fe80::86d1:377b:3bec:884a]) by BN8PR10MB3652.namprd10.prod.outlook.com
 ([fe80::86d1:377b:3bec:884a%4]) with mapi id 15.21.0592.010; Wed, 11 Nov 2026
 13:41:36 +0000
From: "Thakkar, Devarsh" <devarsht@ti.com>
To: "Sharma, Rahul" <r-sharma3@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
CC: "Eatmon, Ryan" <reatmon@ti.com>, "denys@konsulko.com" <denys@konsulko.com>
Subject: Re: [meta-ti] [wrynose][PATCH v2] Revert "am62lxx-evm: Add DSI config
 fragments for display support"
Thread-Topic: [meta-ti] [wrynose][PATCH v2] Revert "am62lxx-evm: Add DSI
 config fragments for display support"
Thread-Index: AQHdccpvOQ/2auirgEOhlaeUoOijHLco4SWA
Date: Wed, 11 Nov 2026 13:41:36 +0000
Message-ID: <7e2a757e-9afd-4665-a0f6-f7b0edd2d832@ti.com>
References: <20261111104927.3231132-1-r-sharma3@ti.com>
In-Reply-To: <20261111104927.3231132-1-r-sharma3@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ti.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR10MB3652:EE_|DS0PR10MB6031:EE_
x-ms-office365-filtering-correlation-id: 3a4e0b7f-14f9-4d1c-e920-08df3ff9818c
x-ld-processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|4022899009|38070700021|10067099003|56012099006|261022105027099003|261022075727099003|261021123027099003|261026140227099003|261028144727099003|261009223027099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 4I9YO+/yujSI0yCIiJk90HoTVsaFuOTZofQmKdN5dt2fm3cWQ7e5W2fThPpz2F9ftvknx9LYzQEd3epSl7gaH/THZwrEssyL4UdnsKYHv+flpHY/mfOpSMj3Hyw1LbQUIvaRLkRH+unQoOysGaak4xG9GT4M1g3HeDsUxReaf0AHj9PWE9M3JvY58yl3mBWnys0pyW1DkXtV5pX2If09GjX/d9y6Q+iQ8sHsQtTTAsv2FDctxksY/9QD1HcR/RE/g7E0SBsaYSvHN7t3UQdbpddTgp6fz8K0o7ZDUnpr2RGOIkYYwzMvrvkYYX7sALdMrnZ/BXwXYUc8hZUzgA8ztNUmrYkjT+a1O9fyDjXMo4LtHJIhQAzjLWS7ADWG3FS7ipku77Z6ACvjm18Am2vhOwzZTpK5LHldPBifUuqWG8ZGIcUx2m924acVhNLM3NQUSS5nHzMEZU87xIjEnmykBaEfJtVlPSyu+wDbVx5QuBa3Fs03FaS+iaJ/74V1VnxMDhPriChQ1vfFvvhq0B21zM68ry0QKpQv3rb3WgOcXmwazz+zLyKfsBLyNsRiG+8Uaw7msodj70mhPbl2FiS2DqJEpnT+irKUiPVMG6X9r0lN8zIsAKt7c8I4/oiEU6Y5O4uzeiVEEAf3s9COOsClmr4aFS66f3kDWcqJuPq6U/w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3652.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4022899009)(38070700021)(10067099003)(56012099006)(261022105027099003)(261022075727099003)(261021123027099003)(261026140227099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUp1UGkrQm81S3I2N1drZ1gxNGFmMVJLSDBtR0pRZVF3NFV4eXNhNVBZaCtU?=
 =?utf-8?B?T1B4djl1bGcwNk4xNVZjWEdwaEc4SXJqZElWZVB5VG1rTkpIc1BkOVdCdEll?=
 =?utf-8?B?dW51NDRremFPTzRKTzZVQlVHaDZicmxxd2tOaG54NEtpRWtZWitpM2MvMW0r?=
 =?utf-8?B?WUlTZlBPNzdoa1FiTm5NM25jaVFlU1FKN05xUk9HbUtjUmJQZ3h1cEtHc05R?=
 =?utf-8?B?MnU2VG0zMS9qVjRYZ0hGV2lCaVZjREhjQ2FHUlRocnZBc1JYeFV2L2VQL3cw?=
 =?utf-8?B?SDloaW1ZWUl5ckQ5MVZ6K3V4YnRFTG1uOHM0ZUxsRTRxeGJ4Q3RJWU5SV1NH?=
 =?utf-8?B?YzgrUEI2V2pBdVNXcGdYa2hsUW4xa2pGdklDMDh1ZDM0RUd6eFNyaHhYbVJR?=
 =?utf-8?B?L2xLb25oTmNiVk5VbndkUE42OThQS3NLL2dqZkNLUGJOWEE1WjZ2ZUpsTGlH?=
 =?utf-8?B?eVg2YzNONlR6Qm9JU3RsdVJmSURoUVAzaUhnZUpTVDJpb1dhWGpiTHJGVHhF?=
 =?utf-8?B?bjNWRWtVdUNHUkJpT0p0TlRzU2RwbkQwT214aUJudXpGQ2hDcW1JK1MzSGxP?=
 =?utf-8?B?VWZYRHBHUDNoYTA2NVNRUHBNTUplcytKYXJ6Y3EvemFBWHlYQXkzV1ovbTFQ?=
 =?utf-8?B?OTBkR1pveWVpbW5abE5lM3I3dXRTM3BSanEyaFQwWG1KUGhGbU9zNTQzaUNk?=
 =?utf-8?B?MXpPTmcvL3p4UE91Z1BaS093ZmlFTTN4dnEvNmJ5c2QrRjFOY1pLYTQ1aVh0?=
 =?utf-8?B?eFBRcGhiNzVra3lGVW5rRzZRemxMUGVhZGtyMFZqeDd3dFp1TzlJTXM5M2VT?=
 =?utf-8?B?WkdBUnJ4b2RZN0RlSFRjSUtOQ0xvdEcydkFPVHZzcHpMMVRBM3YvVTdOWjVS?=
 =?utf-8?B?bTF5M3puMDIyUVZ5a0w3NWlxV2JnVVBQSmhlOWdDeWhSdC9GbFZTVkQwUHNo?=
 =?utf-8?B?MnFoUk80MXBXalVUbjIvQWF5eFVzZUJBeFVIU3lwVUlxMTZXckowV1Vsckd5?=
 =?utf-8?B?WWVGcnR4RUJBUHZHSDJ2QWxVVUNCbFhvOGxxSFdJcmNjZFl0T3Zob1hiZDFu?=
 =?utf-8?B?dnFwdlNGQjRKNHd3MFJCSHhaTnM1K21hWHB4ak1WVXE3YjVtQTBSYVBpdkd6?=
 =?utf-8?B?N1dEL2tKZ0ZUUWQrV2tBWSt3OTJhV1l4eVpEMVJLRVBQdG5vRS9YVVdjZ1pa?=
 =?utf-8?B?NTI5THhpVmJSNUVQV0p4RWFMbFhIUVlwSm1ienBiZ2tIYWVzQnlnTFRaYmNq?=
 =?utf-8?B?QVBxY0JYZEVnK3dJd2tTRWFKVnRhci83ZzlBNm05TEJUS0FFbnJyVGJUa21O?=
 =?utf-8?B?ZDNVdERtNGQwQ28rbHJadzVvZGtKaWxzTEVOWklodDdUUCtDYk15dUdMT3hW?=
 =?utf-8?B?RHJVQ3loOHQwcWp1TXlnakJVTnRpNXdNS0lWb0l3eWRBd1ErUGhTOUcvdHZp?=
 =?utf-8?B?a0g5SVZRaWtjTkZZVU5qUUJpdm1QN25XYno5N3Y4Q1dYL3F0RDlXbFdkZ1hH?=
 =?utf-8?B?eVlZVVd6VU9hdnRnVUlLZW1UOEdHWEs4a3BTUk9TaUVUL3l1SCtvcFVKOURl?=
 =?utf-8?B?aXp1U0RPbU00dlExYXZkWWRvVFVZRUhER3d2NnUvQnlzeG5CS1VISXN3cVl6?=
 =?utf-8?B?OWhtNkxrOHMzSm1wYUI1U20vMVU2S1RiQnZoTEwyZm5WV3pRSmFteFRLYVAz?=
 =?utf-8?B?SXJ4eFd0bHNOdWRLSDZmYTJJLzFYaGtUUjFzaVhEWFZ2K3Q2a214Z21wT3lE?=
 =?utf-8?B?RHl1ZHhIdmdKbDlENVFTbkU1WngxZHdJWlA5U0lZTXZtZSs5VWdHTDYxUWpB?=
 =?utf-8?B?OEo0WGkrVDVVTDZXdUwzZVhQYnF3c05Rbys1Zkt2Z0lMdnp0cVdLTlF3SURY?=
 =?utf-8?B?THFiSXJER2M2eW14ZlVSQkpHMStBWncwcXcxSTRWMFhGTlU1d0FoZVN6dnpS?=
 =?utf-8?B?dG1LR1krS1JqRHV3YTlZMHJhRHhjekIrYnFDc0hyNG4rQ0x2RDVHVlgzNlp3?=
 =?utf-8?B?WFVjRmQrYUQwZHJ1azJvSU80VE8rWEprMmR3RFJvVm51NGFQY2JyNzJlVEdY?=
 =?utf-8?B?QnlobWJHYnZzUlpud1Bzb3lpVDdCTWpkMXhqazVJVjNmUVRzM3pkdldPNUFM?=
 =?utf-8?B?QzRwN1lBL2M0b0I2bTYyOG9aZ1hYTFhNME5DWTBNditwT1Q0aVRRL3JIMU5F?=
 =?utf-8?B?VU1EZXh5THJ1aGUwMkx4NU1rWW9yTnBGRkhuL0U2cjVaREtOLzNRWGphcTJv?=
 =?utf-8?B?N0RnVGxRTXBidXgzako3VEdKMFp6WjZJakFmVnhNMDFZOThsckNqNnlIcU5v?=
 =?utf-8?Q?F8EvQRi+Yre25mV9ZY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <15A113ED21BB70458C249F34DEB6453B@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: R0pjPFnTs6pvFOzP5Kfb8YbMeWic/baZAk7lO50SLxERXfLnqlPaQxxekJolFIa3mYCq95UjfZ8SHRqznoGknS83rPRuGOh7Z7/MK0lH3oz/UwuiNNrxcxpCOUIdDFE7fS6KhFfRTJX7hGnIhInuis+0jTJxpg+7PRHY5/8em/IgZgzW730deo/xy1g6ppObEae4OkoEaV4wjlN2i24AUKjIDDJ5hohxFnpPxLC0N8PjJVpzGJWsy1hR+q9ilKbDl1bMOKNMXBDPB/C+0c+ZoZd5uTf9kzIdOgVyKgNQY4OtfbNmpM0EN0Dgc9BdZKBFDVndiNEOjtvH4qQkd6s/qg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR10MB3652.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4e0b7f-14f9-4d1c-e920-08df3ff9818c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 13:41:36.1723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hYBoWfuBRL4tClTYVXRlJSJPGgCPbe1YN/Rfq2HCZXZc9QUb3bID4F30J//JIrBv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6031
X-Proofpoint-ORIG-GUID: XGO5gwnSLFQmHaQRVGURm3rWZ-rctv8B
X-Proofpoint-GUID: XGO5gwnSLFQmHaQRVGURm3rWZ-rctv8B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NCBTYWx0ZWRfX/Z+ITaREXuEM
 HIOUEcl7zv13n+OAxD0H7yduI+SEFFQNaV5qW+WoqlIP7YoFUmFzbi+T82ZyHsUazpjWFcuFZm0
 SDdHbDzDbNSnqqGc02sObngfBkWd99wqkl6DsylHtWTA48Dtb0hBit8l8GIrpSFhaeqMqzC35uA
 wPLSL1z9Eu0XmAq18QP/6A5H2AaPswCvjmw6yORVjqHvSmkTrsgMsHVL523op549pr29AQoowOk
 fxDugvkPCmaV+0no4AbZcq20iRZbZg99d1tldzcEpwzfIacnzMYMORTsLlZ9ohJB0YWRs4d/hWH
 1EDAPXQCE7Q6ZWT0slhNSKhxdCQvLKYfAEazLfvUVdvIP+Zo8OX75m/RWinpYJrJ4L3UdXBD57g
 i5fsu9wvHvx50BWSCSm2A2AuQziu0dztYWon/rP/Lm8fFFLpQMVWvFwiE/2FsK7n/azRQJ9Wvr+
 3+z0S8efme8rikD9IqA==
X-Authority-Analysis: v=2.4 cv=SpcFe/O0 c=1 sm=1 tr=0 ts=6af47092 cx=c_pps
 a=utU5wDo5Le20VJoxH2NzxQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=jbJ9lE3KVgSRV4_0y80A:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NCBTYWx0ZWRfX0Xt16LsqBKQY
 w07vCVTFFJToY5qW3AU0cBkctQRlvMz6dBRYXLZ2Dpf5ltg73+xevfpquStCNLIYey/XkEIwq6n
 Rg6M+dDmq1uepxWk/haYe7r1y9CGkzo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110054
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 11 Nov 2026 13:41:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20527

T24gMTEvMTEvMjAyNiA0OjE5IFBNLCBSYWh1bCBTaGFybWEgdmlhIG1ldGEtdGkgd3JvdGU6DQo+
IFRoaXMgcmV2ZXJ0cyBjb21taXQgY2U3ZTgwNzdmYTk4MGQ4ZTYzNGRiMzM0MGY2ZjllOGQ4MWEx
MjEyMy4NCj4gDQo+IEFNNjJMIExpbnV4IGJvb3QgaGFuZ3Mgd2l0aG91dCBzaW1wbGVmYiBvdmVy
bGF5IHdoZW4gdGhlIHNwbGFzaCBpcw0KPiBlbmFibGVkIG9uIEFNNjJMLiBEdWUgdG8gdGhpcywg
d2UgYXJlIG5vdCBlbmFibGluZyBzcGxhc2ggYnkgZGVmYXVsdCBpbg0KPiB0aGUgYnVpbGQuIEFs
c28sIHRoZSBtYWluIHJlYXNvbiBpcyB0aGUgY29uZmlnIGZyYWdtZW50cyBzaG91bGQgYmUNCj4g
aGFuZGxlZCBuYXRpdmVseSBieSB1Ym9vdCByZXBvLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUmFo
dWwgU2hhcm1hIDxyLXNoYXJtYTNAdGkuY29tPg0KDQpSZXZpZXdlZC1ieTogRGV2YXJzaCBUaGFr
a2FyIDxkZXZhcnNodEB0aS5jb20+DQoNClJlZ2FyZHMNCkRldmFyc2gNCg0KPiAtLS0NCj4gDQo+
IENoYW5nZS1sb2c6DQo+IHYxLSA+IHYyOg0KPiAgLSBVcGRhdGVkIGNvbW1pdCBtZXNzYWdlDQo+
ICAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtdGkv
dG9waWMvMTIyMjA3MzgxDQo+IA0KPiAgbWV0YS10aS1ic3AvY29uZi9tYWNoaW5lL2FtNjJseHgt
ZXZtLmNvbmYgfCAzIC0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvbWV0YS10aS1ic3AvY29uZi9tYWNoaW5lL2FtNjJseHgtZXZtLmNvbmYg
Yi9tZXRhLXRpLWJzcC9jb25mL21hY2hpbmUvYW02Mmx4eC1ldm0uY29uZg0KPiBpbmRleCAwNzk5
YmVjZC4uN2E0MjI2MTcgMTAwNjQ0DQo+IC0tLSBhL21ldGEtdGktYnNwL2NvbmYvbWFjaGluZS9h
bTYybHh4LWV2bS5jb25mDQo+ICsrKyBiL21ldGEtdGktYnNwL2NvbmYvbWFjaGluZS9hbTYybHh4
LWV2bS5jb25mDQo+IEBAIC0yNiw2ICsyNiwzIEBAIFVCT09UX0RUQl9MT0FEQUREUkVTUyA9ICIw
eDg0ZjAwMDAwIg0KPiAgVUJPT1RfRFRCT19MT0FEQUREUkVTUyA9ICIweDg0ZjgwMDAwIg0KPiAg
DQo+ICBURkFfQk9BUkQgPSAiYW02Mmx4LWV2bSINCj4gLQ0KPiAtIyBEU0kgY29uZmlnIGZyYWdt
ZW50cyBmb3IgZGlzcGxheSBzdXBwb3J0DQo+IC1VQk9PVF9GUkFHTUVOVFM6YXBwZW5kOmJzcC10
aS02XzE4ID0gIiBhbTYyeF9hNTNfc3BsYXNoc2NyZWVuLmNvbmZpZyBrM19hNTNfZHNpLmNvbmZp
ZyBhbTYybHhfZXZtX2RzaV9ycGlfcGFuZWwuY29uZmlnIg0KPiANCj4gDQo+IA0KPiAtPS09LT0t
PS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQg
dG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMyMDUyMCk6IGh0dHBzOi8vbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtdGkvbWVzc2FnZS8yMDUyMA0KPiBNdXRlIFRoaXMg
VG9waWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9tdC8xMjIyMDk2MjcvNjc0MDU5
OQ0KPiBHcm91cCBPd25lcjogbWV0YS10aStvd25lckBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+
IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9tZXRhLXRpL3Vu
c3ViIFtkZXZhcnNodEB0aS5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQoNCg==
