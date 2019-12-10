Received: from AUS01-SY3-obe.outbound.protection.outlook.com (AUS01-SY3-obe.outbound.protection.outlook.com [40.107.137.120])
 by mx.groups.io with SMTP id smtpd.web11.2815.1576008260759453429
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 12:04:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gallagher.com header.s=selector1 header.b=tMey8aCA;
 spf=permerror, err=syntax error for token:  (domain: gallagher.com, ip: 40.107.137.120, mailfrom: ankur.tyagi@gallagher.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2aA0/gQTS6Q6lak8kU0O1qhJRCB31tb5Q4Gl3lB29qwL5gNKzhMUdmfGKjjzT9njuxlgs9sV6BvI6rr4Eywv6gb7yBB+aV/DGyNWzce4hEpM/GLP207+6SOoGSRGMh8hBNnPmpcQUOas3oP1F65cVNjF2p54X+Zh8V5B6+j6L3QkoBwY3bi7zgFklVuMaBVm5vxquRDv2jvbGmbHSlIcaRrWU7J9WcqXDOBNEi7FSxC99wr7x5sn6w0QS3esXjAzG4NFdHYa7H2/ItaFTbYQ9SU7b6G6cz2QWC5jGOA3Ej5G79iQWP4c07jy88av+iTvpGgOM5uKee9OMwSgyG4bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTQgjNh5VLmaIfh1mRrXUDGla3efYMLTCGIEa2IB/oo=;
 b=S43518oDpbry7S6f98pOPRJ4jzIrTKOMP0ZkP4/LUAsUNKE0Jb6+dhwoEV8417ev8n5iPdlkprfj6A2RwNYMsnNCHENV5/MQBQLT5nCrHMj0ssJyxvRUAEQKUeCQljHEFV0fQIq8gSl4kfEgFzF+NbIiQkblsXSdKJkihk7fpa3gke9uFwDkZ2U3JPar1fk04Pl4LmHq5PDMG0JbdOqXdwDo9ogMx0nYYF2pP3OMgGYW4PxpTf4Dch8kqJM3Jo0APCRWX7suxNLFlrr4HLO9hJMK9Cb84OG+DTCVBQTkeTcy1rzinT+fs3W65rWG0c6C5khbwZymwCPvNYsHxCrGNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTQgjNh5VLmaIfh1mRrXUDGla3efYMLTCGIEa2IB/oo=;
 b=tMey8aCASrg9pXeAUe8lfiVVJb9OoKgVuMWyB3ND3Mpil0SxjqiptZof5EGOherdiQenjWCVy+DBRj7iPAVTAz+wKnTeT8kdx53/B6BDohdb8EF1Q6M/Lh0pI2KRBKHuU1F9GYPO/N5Yrw98rHV6oGkq/OkmoNsumuG/wSDxVBc=
Received: from SYCPR01MB4749.ausprd01.prod.outlook.com (20.178.186.212) by
 SYCPR01MB4509.ausprd01.prod.outlook.com (20.178.185.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Tue, 10 Dec 2019 20:04:16 +0000
Received: from SYCPR01MB4749.ausprd01.prod.outlook.com
 ([fe80::2db3:f324:1495:e20]) by SYCPR01MB4749.ausprd01.prod.outlook.com
 ([fe80::2db3:f324:1495:e20%7]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 20:04:16 +0000
From: "Ankur Tyagi" <ankur.tyagi@gallagher.com>
To: Denys Dmytriyenko <denys@ti.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH][thud,master] am335x-evm.conf: Use soft assignment for MKUBIFS_ARGS, UBINIZE_ARGS
Thread-Topic: [meta-ti] [PATCH][thud,master] am335x-evm.conf: Use soft
 assignment for MKUBIFS_ARGS, UBINIZE_ARGS
Thread-Index: AQHVr5FitgDV9wwwkkylmodNigfZ56ezxB4AgAAGgEA=
Date: Tue, 10 Dec 2019 20:04:16 +0000
Message-ID: 
 <SYCPR01MB4749F5CE48A0C9A2705C1A71E55B0@SYCPR01MB4749.ausprd01.prod.outlook.com>
References: <20191203052106.5254-1-ankur.tyagi@gallagher.com>
 <8881.1576006687300296709@lists.yoctoproject.org>
 <20191210194008.GJ11359@beryl>
In-Reply-To: <20191210194008.GJ11359@beryl>
Accept-Language: en-NZ, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Ankur.Tyagi@gallagher.com; 
x-originating-ip: [118.93.175.25]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df03ada6-2e96-4aab-52da-08d77dac22e1
x-ms-traffictypediagnostic: SYCPR01MB4509:
x-microsoft-antispam-prvs: 
 <SYCPR01MB450932C2883F86527FC637F6E55B0@SYCPR01MB4509.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:765;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: 
 SFV:NSPM;SFS:(10019020)(366004)(13464003)(189003)(199004)(7696005)(64756008)(55016002)(52536014)(8936002)(2906002)(81156014)(81166006)(4326008)(9686003)(186003)(76116006)(66946007)(33656002)(86362001)(498600001)(6916009)(26005)(966005)(53546011)(66446008)(66556008)(66476007)(5660300002)(71200400001)(6506007)(8676002)(142933001);DIR:OUT;SFP:1102;SCL:1;SRVR:SYCPR01MB4509;H:SYCPR01MB4749.ausprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: gallagher.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1CmCFlUQdoZwj29w+0z3vOzNpk8c3LKU1Q8SXfvNDlqAPhmTFo5TgJGVTe/xYZdQwWYwaKEp2hbFDVgGdJe6SByGpdu5op5wtPIJ6GnT9n9XeN7GoGHcJlGUUHco6GzJlI+5DvXxhCFiZV4SHwD4SsJVN/H8PQ95GgyVjxDCQcyq4higjpANBTDjCrUoC9GWi8uq5Mct8k3XpAs/TqfKnOMeTjSzDrltBsIjTChqO9CtOoOJoRrhgRlhuWHmcu0UVGHkpjhdEuyN+2BIgkNETenaaCcIr2ceUoV1ADWvLR4oWC0dEiVmQnKknejEGyenkpC1ZsfqvsJK89JQ/ryVJ4aONlLR10xdCNYnSQdhcRpbubZPs4wv0OeuTBVKc7xruqZZBnD0NUOG5Dh5T5R4rWaBWO9359VQD2p18uzOUC2v8mxJ3sUZzmdoJJswPxn66QsgyGHha4BuLe0GYbxg9HBT3T+MDvOUEnkm1fiMYMynM9DONREHGpMeLpeWOp8wnRBgjVC0DHG4r4b0ID1w/OzVc0cojp8HkhHIszulHgtiOSS3HOj15g1iA2GQ6/Xv
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df03ada6-2e96-4aab-52da-08d77dac22e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 20:04:16.8693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A3C+J9Lcnf1Xhk6ogGycNUBjY9Db60+6P0jHs764YAjrdleWQ++zI9rvgd1M8J6z8nKAtsOMTRnh9RC/KyQuoef0kApr1LW1dqMD83QNd/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYCPR01MB4509
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWhoLCB3YXMgd2FpdGluZyBmb3IgYSByZXBseSBhbmQgZGlkbid0IGNoZWNrZWQgaW4gdGhlIHJl
cG8g8J+Yig0KDQp0aGFua3MNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBEZW55cyBEbXl0cml5ZW5rbyA8ZGVueXNAdGkuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIDEx
IERlY2VtYmVyIDIwMTkgODo0MCBBTQ0KPiBUbzogQW5rdXIgVHlhZ2kgPEFua3VyLlR5YWdpQGdh
bGxhZ2hlci5jb20+DQo+IENjOiBtZXRhLXRpQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gU3Vi
amVjdDogUmU6IFttZXRhLXRpXSBbUEFUQ0hdW3RodWQsbWFzdGVyXSBhbTMzNXgtZXZtLmNvbmY6
IFVzZSBzb2Z0DQo+IGFzc2lnbm1lbnQgZm9yIE1LVUJJRlNfQVJHUywgVUJJTklaRV9BUkdTDQo+
DQo+IGh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL21ldGEtDQo+IHRp
L2NvbW1pdC8/aD10aHVkJmlkPTkwYzdiNjVjYjQ0YWVmMzcwMTYzMzgyZjY3YmVlZGFmNDJjNDM1
Y2YNCj4NCj4gT24gVHVlLCBEZWMgMTAsIDIwMTkgYXQgMTE6Mzg6MDdBTSAtMDgwMCwgQW5rdXIg
VHlhZ2kgd3JvdGU6DQo+ID4gcGluZw0KPiA+DQo+ID4gT24gTW9uLCBEZWMgMiwgMjAxOSBhdCAw
OToyMSBQTSwgQW5rdXIgVHlhZ2kgd3JvdGU6DQo+ID4NCj4gPiA+DQo+ID4gPiBUaGlzIGlzIGFs
bG93IHVzZXIgdG8gb3ZlcnJpZGUgdGhlbSBpbiB0aGVpciBjb25maWd1cmF0aW9uDQo+ID4gPg0K
PiA+ID4gU2lnbmVkLW9mZi1ieTogQW5rdXIgVHlhZ2kgPGFua3VyLnR5YWdpQGdhbGxhZ2hlci5j
b20+DQo+ID4gPiAtLS0NCj4gPiA+IGNvbmYvbWFjaGluZS9hbTMzNXgtZXZtLmNvbmYgfCA0ICsr
LS0NCj4gPiA+IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2NvbmYvbWFjaGluZS9hbTMzNXgtZXZtLmNvbmYN
Cj4gPiA+IGIvY29uZi9tYWNoaW5lL2FtMzM1eC1ldm0uY29uZiBpbmRleCA5MmU2Y2YwNS4uOGJm
YmVlODQgMTAwNjQ0DQo+ID4gPiAtLS0gYS9jb25mL21hY2hpbmUvYW0zMzV4LWV2bS5jb25mDQo+
ID4gPiArKysgYi9jb25mL21hY2hpbmUvYW0zMzV4LWV2bS5jb25mDQo+ID4gPiBAQCAtMjQsNyAr
MjQsNyBAQCBTRVJJQUxfQ09OU09MRVNfQ0hFQ0sgPSAiJHtTRVJJQUxfQ09OU09MRVN9Ig0KPiA+
ID4gIyBVQkk6IGxvZ2ljYWwgZXJhc2VibG9jayBzaXplOiAxMjY5NzYgYnl0ZXMgIyBmcm9tIHVi
aWF0dGFjaA0KPiA+ID4gc3Rkb3V0Og0KPiA+ID4gIyBVQkkgZGV2aWNlIG51bWJlciAwLCB0b3Rh
bCAxOTg4IExFQnMgLU1LVUJJRlNfQVJHUyA9ICItRiAtbSAyMDQ4DQo+ID4gPiAtZSAxMjY5NzYg
LWMgOTkwMCINCj4gPiA+ICtNS1VCSUZTX0FSR1MgPz0gIi1GIC1tIDIwNDggLWUgMTI2OTc2IC1j
IDk5MDAiDQo+ID4gPg0KPiA+ID4gIyBkbyB1YmlhdHRhY2ggL2Rldi91YmlfY3RybCAtbSA3IC1P
IDIwNDggIyBmcm9tIGRtZXNnOg0KPiA+ID4gQEAgLTMyLDQgKzMyLDQgQEAgTUtVQklGU19BUkdT
ID0gIi1GIC1tIDIwNDggLWUgMTI2OTc2IC1jIDk5MDAiDQo+ID4gPiAjIFVCSTogcGh5c2ljYWwg
ZXJhc2VibG9jayBzaXplOiAxMzEwNzIgYnl0ZXMgKDEyOCBLaUIpICMgVUJJOg0KPiA+ID4gc3Vi
LXBhZ2Ugc2l6ZTogNTEyICMgVUJJOiBWSUQgaGVhZGVyIG9mZnNldDogMjA0OCAoYWxpZ25lZCAy
MDQ4KQ0KPiA+ID4gLVVCSU5JWkVfQVJHUyA9ICItbSAyMDQ4IC1wIDEyOEtpQiAtcyA1MTIgLU8g
MjA0OCINCj4gPiA+ICtVQklOSVpFX0FSR1MgPz0gIi1tIDIwNDggLXAgMTI4S2lCIC1zIDUxMiAt
TyAyMDQ4Ig0KPiA+ID4gLS0NCj4gPiA+IDIuMTcuMQ0KPiA+ID4NCj4gPiA+DQo+ID4gPg0KPiAj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIw0KPiAjIyMNCj4gPiA+ICMjIyMjIyMNCj4gPiA+DQo+ID4gPiBUaGlzIGVtYWlsIGlz
IGNvbmZpZGVudGlhbCBhbmQgbWF5IGNvbnRhaW4gaW5mb3JtYXRpb24gc3ViamVjdCB0bw0KPiA+
ID4gbGVnYWwgcHJpdmlsZWdlLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50
IHBsZWFzZSBhZHZpc2UNCj4gPiA+IHVzIG9mIG91ciBlcnJvciBieSByZXR1cm4gZS1tYWlsIHRo
ZW4gZGVsZXRlIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2hlZCBmaWxlcy4NCj4gPiA+IFlvdSBt
YXkgbm90IGNvcHksIGRpc2Nsb3NlIG9yIHVzZSB0aGUgY29udGVudHMgaW4gYW55IHdheS4NCj4g
PiA+DQo+ID4gPiBUaGUgdmlld3MgZXhwcmVzc2VkIGluIHRoaXMgZW1haWwgbWF5IG5vdCBiZSB0
aG9zZSBvZiBHYWxsYWdoZXINCj4gPiA+IEdyb3VwIEx0ZCBvciBzdWJzaWRpYXJ5IGNvbXBhbmll
cyB0aGVyZW9mLg0KPiA+ID4NCj4gIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4gIyMjDQo+ID4gPiAjIyMjIyMjDQo+ID4g
Pg0KPg0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4gTGlua3M6IFlvdSByZWNlaXZl
IGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+ID4NCj4gPiBWaWV3L1JlcGx5IE9u
bGluZSAoIzEyNTYyKToNCj4gPiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9tZXRh
LXRpL21lc3NhZ2UvMTI1NjINCj4gPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZy9tdC82NTUyNDU5My8xMDUxNTQzDQo+ID4gR3JvdXAgT3duZXI6IG1ldGEt
dGkrb3duZXJAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiA+IFVuc3Vic2NyaWJlOiBodHRwczov
L2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9tZXRhLXRpL3Vuc3ViDQo+ID4gW2RlbnlzQHRpLmNv
bV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KIFRoaXMgZW1haWwgaXMgY29uZmlkZW50aWFsIGFuZCBtYXkgY29udGFpbiBp
bmZvcm1hdGlvbiBzdWJqZWN0IHRvIGxlZ2FsIHByaXZpbGVnZS4gSWYgeW91IGFyZSBub3QgdGhl
IGludGVuZGVkIHJlY2lwaWVudCBwbGVhc2UgYWR2aXNlIHVzIG9mIG91ciBlcnJvciBieSByZXR1
cm4gZS1tYWlsIHRoZW4gZGVsZXRlIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2hlZCBmaWxlcy4g
WW91IG1heSBub3QgY29weSwgZGlzY2xvc2Ugb3IgdXNlIHRoZSBjb250ZW50cyBpbiBhbnkgd2F5
LiBUaGUgdmlld3MgZXhwcmVzc2VkIGluIHRoaXMgZW1haWwgbWF5IG5vdCBiZSB0aG9zZSBvZiBH
YWxsYWdoZXIgR3JvdXAgTHRkIG9yIHN1YnNpZGlhcnkgY29tcGFuaWVzIHRoZXJlb2YuDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
