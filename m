Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.996.1603908144874866865
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 11:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=w1PQhkeF;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: g-tammana@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id A1EA538C11F9
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2020 11:02:24 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09SI2OFQ090676
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2020 13:02:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603908144;
	bh=4T4pIaUqfJU+ST7ZaiyeCupHjjZTXrrE5x27MptlbVs=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=w1PQhkeF+JZ9L4s6S1Q9Ahml7FeD/kGBTw/gjJI7DnTgr/a/lng+EH8GhoXN+wjlA
	 D0f4Tjhlt5IkDxm+IG1m7OCViCQWRC+bB2h547tXikmBCAiqAYmbc3tdnxz6s1bCC7
	 XZFeLrHAcmEFHAjZUoKmaVv0w+TGq/KGbUYyqgys=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09SI2OaM043658
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2020 13:02:24 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 28
 Oct 2020 13:02:23 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
 DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
 15.01.1979.003; Wed, 28 Oct 2020 13:02:23 -0500
From: "Gowtham Tammana" <g-tammana@ti.com>
To: "Murphy, Dan" <dmurphy@ti.com>,
        "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>,
        "Dmytriyenko, Denys" <denys@ti.com>
Subject: Re: [meta-ti][dunfell/master][PATCH v2] ti-img-rogue-driver: pull general toolchain support
Thread-Topic: [meta-ti][dunfell/master][PATCH v2] ti-img-rogue-driver: pull
 general toolchain support
Thread-Index: AQHWrVDS4JnSLu+8nEass6Xi5N/7Jamtn9MA//+s87A=
Date: Wed, 28 Oct 2020 18:02:23 +0000
Message-ID: <3cd9303eba6e4ea19d7310cea8387ca0@ti.com>
References: <20201028173608.10421-1-g-tammana@ti.com>
 <562ed28b-b53a-c87f-3c8e-359aa8adbfa4@ti.com>
In-Reply-To: <562ed28b-b53a-c87f-3c8e-359aa8adbfa4@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.16.212]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IE11cnBoeSwgRGFuDQo+U2Vu
dDogV2VkbmVzZGF5LCBPY3RvYmVyIDI4LCAyMDIwIDEyOjU0IFBNDQo+VG86IFRhbW1hbmEsIEdv
d3RoYW0gPGctdGFtbWFuYUB0aS5jb20+OyBtZXRhLXRpQHlvY3RvcHJvamVjdC5vcmc7DQo+RG15
dHJpeWVua28sIERlbnlzIDxkZW55c0B0aS5jb20+DQo+U3ViamVjdDogUmU6IFttZXRhLXRpXVtk
dW5mZWxsL21hc3Rlcl1bUEFUQ0ggdjJdIHRpLWltZy1yb2d1ZS1kcml2ZXI6IHB1bGwNCj5nZW5l
cmFsIHRvb2xjaGFpbiBzdXBwb3J0DQo+DQo+R293dGhhbQ0KPg0KPk9uIDEwLzI4LzIwIDEyOjM2
IFBNLCBHb3d0aGFtIFRhbW1hbmEgd3JvdGU6DQo+PiBUaGUgcGF0Y2ggZm9yIHN1cHBvcnRpbmcg
dGhlIGdlbmVyYWwgdG9vbGNoYWluIGlzIHB1bGxlZCBpbnRvIHRoZSByZXBvLg0KPj4gUmVtb3Zp
bmcgaXQgaGVyZSBmcm9tIHRoZSByZWNpcGUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogR293dGhh
bSBUYW1tYW5hIDxnLXRhbW1hbmFAdGkuY29tPg0KPj4gLS0tDQo+PiB2MjogZml4IGVtYWlsIGlu
IHNpZ25vZmYNCj4+DQo+PiAgIC4uLi8wMDAxLWttLXN1cHBvcnQtZ2VuZXJhbC10b29sY2hhaW4u
cGF0Y2ggICB8IDU2IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4NCj5EaWQgeW91IHVzZSAiZ2l0IHJt
IiB0byByZW1vdmUgdGhlIGZpbGU/IFRoaXMgbG9va3Mgd2VpcmQgdGhhdCB0aGUgZmlsZQ0KPmNo
YW5nZWQgdGhlbiBnb3QgZGVsZXRlZA0KDQpZZXMsIGRpZCB1c2UgJ2dpdCBybScgdG8gcmVtb3Zl
IHRoZSBmaWxlLiBIYXZlbid0IHBhaWQgYXR0ZW50aW9uIHRvIHRoZQ0KaG93IHRoZSBjaGFuZ2Vz
IGFyZSBzdHJ1Y3R1cmVkIGJlZm9yZS4gRG8geW91IHNlZSBhbnkgaXNzdWVzIHdpdGggYW0sIEkg
d2FzDQpqdXN0IHRyeWluZyBpdCBoZXJlIGFnYWluIGFuZCBpdCBhcHBsaWVzIGNsZWFubHkuDQoN
Ckdvd3RoYW0gDQoNCj4NCj5HZW5lcmFsbHkgd2Ugc2hvdWxkIGp1c3Qgc2VlDQo+DQo+ICBkZWxl
dGUgbW9kZSAxMDA2NDQgcmVjaXBlcy1ic3AvcG93ZXJ2ci1kcml2ZXJzL3RpLWltZy1yb2d1ZS1k
cml2ZXIvMDAwMS0NCj5rbS1zdXBwb3J0LWdlbmVyYWwtdG9vbGNoYWluLnBhdGNoDQo+DQo+RGFu
DQo+DQoNCg==
