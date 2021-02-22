Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.1352.1614020567190161109
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Feb 2021 11:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FA9WBrQF;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: g-tammana@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id F10C938C07D7
	for <meta-ti@yoctoproject.org>; Mon, 22 Feb 2021 19:02:46 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11MJ2kuJ047171
	for <meta-ti@yoctoproject.org>; Mon, 22 Feb 2021 13:02:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614020566;
	bh=tBJtSMamZSbv1/cX8XG+DqMXzfvu42E2Q4eh00iaDVs=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=FA9WBrQFjq4Nf5111swhlBQJ+QHb911YUq4B0+VShUD5uHviPdEgbQ0oAu9JjXxlk
	 ClArG7tiA1c58OOKB6nje9Ss8K2aJUKDDjtZchZRiSFUjGHGytAo1b0g6ISxmU4DcI
	 /ebJfP1U3OS/uWav8H1izBOnM5S42ir/KkI0Hwfg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11MJ2kIg100748
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 22 Feb 2021 13:02:46 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 22
 Feb 2021 13:02:45 -0600
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
 DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
 15.01.1979.003; Mon, 22 Feb 2021 13:02:45 -0600
From: "Gowtham Tammana" <g-tammana@ti.com>
To: "Bajjuri, Praneeth" <praneeth@ti.com>,
        "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Subject: Re: [meta-ti][master/dunfell][PATCH 2/2] ti-img-rogue-umlibs: Update artifacts to 1.13.5776728
Thread-Topic: [meta-ti][master/dunfell][PATCH 2/2] ti-img-rogue-umlibs: Update
 artifacts to 1.13.5776728
Thread-Index: AQHXCUv7cj8LIqgq9kmsthFnrcXhM6pk68GA//+cEGA=
Date: Mon, 22 Feb 2021 19:02:45 +0000
Message-ID: <862d072ffb8c4b1ca6042d9c5f17d223@ti.com>
References: <20210222185312.22981-1-g-tammana@ti.com>
 <20210222185312.22981-2-g-tammana@ti.com>
 <b3c43225-2483-9320-549f-b368db470465@ti.com>
In-Reply-To: <b3c43225-2483-9320-549f-b368db470465@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.235.199]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEJhamp1cmksIFByYW5lZXRo
DQo+U2VudDogTW9uZGF5LCBGZWJydWFyeSAyMiwgMjAyMSAxOjAwIFBNDQo+VG86IFRhbW1hbmEs
IEdvd3RoYW0gPGctdGFtbWFuYUB0aS5jb20+OyBtZXRhLXRpQHlvY3RvcHJvamVjdC5vcmcNCj5T
dWJqZWN0OiBSZTogW21ldGEtdGldW21hc3Rlci9kdW5mZWxsXVtQQVRDSCAyLzJdIHRpLWltZy1y
b2d1ZS11bWxpYnM6DQo+VXBkYXRlIGFydGlmYWN0cyB0byAxLjEzLjU3NzY3MjgNCj4NCj4NCj4N
Cj5PbiAyLzIyLzIwMjEgMTI6NTMgUE0sIEdvd3RoYW0gVGFtbWFuYSB3cm90ZToNCj4+IFVwZGF0
ZSBHTEVTIGJpbmFyeSBhcnRpZmFjdHMgdG8gbGF0ZXN0IHZlcnNpb24gMS4xMy41Nzc2NzI4Lg0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IEdvd3RoYW0gVGFtbWFuYSA8Zy10YW1tYW5hQHRpLmNvbT4N
Cj4+IC0tLQ0KPj4gICAuLi5fMS4xMC41MzcxNTczLmJiID0+IHRpLWltZy1yb2d1ZS11bWxpYnNf
MS4xMy41Nzc2NzI4LmJifSB8IDYgKysrLS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+PiAgIHJlbmFtZSByZWNpcGVzLWdyYXBoaWNzL2xp
YmdsZXMve3RpLWltZy1yb2d1ZS11bWxpYnNfMS4xMC41MzcxNTczLmJiID0+DQo+dGktaW1nLXJv
Z3VlLXVtbGlic18xLjEzLjU3NzY3MjguYmJ9ICg5NSUpDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Jl
Y2lwZXMtZ3JhcGhpY3MvbGliZ2xlcy90aS1pbWctcm9ndWUtdW1saWJzXzEuMTAuNTM3MTU3My5i
Yg0KPmIvcmVjaXBlcy1ncmFwaGljcy9saWJnbGVzL3RpLWltZy1yb2d1ZS11bWxpYnNfMS4xMy41
Nzc2NzI4LmJiDQo+PiBzaW1pbGFyaXR5IGluZGV4IDk1JQ0KPj4gcmVuYW1lIGZyb20gcmVjaXBl
cy1ncmFwaGljcy9saWJnbGVzL3RpLWltZy1yb2d1ZS11bWxpYnNfMS4xMC41MzcxNTczLmJiDQo+
PiByZW5hbWUgdG8gcmVjaXBlcy1ncmFwaGljcy9saWJnbGVzL3RpLWltZy1yb2d1ZS11bWxpYnNf
MS4xMy41Nzc2NzI4LmJiDQo+PiBpbmRleCBmOWQ1ZWQ5Yy4uZjc2OTc3YmEgMTAwNjQ0DQo+PiAt
LS0gYS9yZWNpcGVzLWdyYXBoaWNzL2xpYmdsZXMvdGktaW1nLXJvZ3VlLXVtbGlic18xLjEwLjUz
NzE1NzMuYmINCj4+ICsrKyBiL3JlY2lwZXMtZ3JhcGhpY3MvbGliZ2xlcy90aS1pbWctcm9ndWUt
dW1saWJzXzEuMTMuNTc3NjcyOC5iYg0KPj4gQEAgLTEwLDEzICsxMCwxMyBAQCBSRVFVSVJFRF9N
QUNISU5FX0ZFQVRVUkVTID0gImdwdSINCj4+ICAgUEFDS0FHRV9BUkNIID0gIiR7TUFDSElORV9B
UkNIfSINCj4+ICAgQ09NUEFUSUJMRV9NQUNISU5FID0gImo3Ig0KPj4NCj4+IC1QUiA9ICJyOSIN
Cj4+ICtQUiA9ICJyMSINCj4NCj5yMTA/DQoNClBWIGNoYW5nZWQsIHNvIFBSIGdldHMgcmVmcmVz
aGVkLg0KDQotR293dGhhbQ0KDQo+DQo+Pg0KPj4gLUJSQU5DSCA9ICJsaW51eHdzL3pldXMvazUu
NC8ke1BWfSINCj4+ICtCUkFOQ0ggPSAibGludXh3cy9kdW5mZWxsL2s1LjQvJHtQVn0iDQo+Pg0K
Pj4gICBTUkNfVVJJID0gImdpdDovL2dpdC50aS5jb20vZ3JhcGhpY3MvdGktaW1nLXJvZ3VlLQ0K
PnVtbGlicy5naXQ7YnJhbmNoPSR7QlJBTkNIfSINCj4+DQo+PiAtU1JDUkVWID0gIjhkM2QxODkx
MTg2ZWQzZjM5N2JiOTBmNGY4YzUxOGM2Yzk5NzA0NzkiDQo+PiArU1JDUkVWID0gIjJiZGNhYjUy
ZWVjYmJlZjRjNzBlM2I1OGM1ZjM4NTQ2NjBhYmI4ZDQiDQo+Pg0KPj4gICBQVlJfU09DID89ICJq
NzIxZV9saW51eCINCj4+ICAgUFZSX0JVSUxEID89ICJyZWxlYXNlIg0KPj4NCg==
