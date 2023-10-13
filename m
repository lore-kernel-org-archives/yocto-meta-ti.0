Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9E3CDB474
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 03:38:17 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.31280.1697168294583118187
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 20:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=zK7IDBOi;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39D3cDV0084014
	for <meta-ti@lists.yoctoproject.org>; Thu, 12 Oct 2023 22:38:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697168293;
	bh=soZpCaQEWZM9O3qPr+0JRS690L/sW430LL2aQipmyxY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=zK7IDBOiVl/S8LJb3DRVn3AaPgbxZyBcS68sMYFP/9ZUbh7bUtOug5kxKc/6GSdJ1
	 uMfMXHoGMbXAO1WB/FXL8pnZgdziK/7eBUt4kz1imYHSY3kEN9+gewEx46f0KwplJh
	 pYCywRLRwSyxUogm2aTwh9sVD1jfkaWGI3qYVwyA=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39D3cDgr058334
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 12 Oct 2023 22:38:13 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 12
 Oct 2023 22:38:13 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
 DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
 15.01.2507.023; Thu, 12 Oct 2023 22:38:12 -0500
From: "Limaye, Aniket" <a-limaye@ti.com>
To: "Davis, Andrew" <afd@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
CC: "Eatmon, Ryan" <reatmon@ti.com>, "Gole, Dhruva" <d-gole@ti.com>,
        "Shilwant, Chirag" <c-shilwant@ti.com>,
        "Adivi, Sai Sree Kartheek"
	<s-adivi@ti.com>,
        "Raghavendra, Vignesh" <vigneshr@ti.com>
Subject: RE: [meta-ti][master/kirkstone][PATCH 1/2] ti-sci-fw: Remove
 COMPATIBLE_MACHINE and extend recipe to k3 machines
Thread-Topic: [meta-ti][master/kirkstone][PATCH 1/2] ti-sci-fw: Remove
 COMPATIBLE_MACHINE and extend recipe to k3 machines
Thread-Index: AQHZ/THEP5QqXslJY0aw9A/338DC6bBG+WsAgAAZFPA=
Date: Fri, 13 Oct 2023 03:38:12 +0000
Message-ID: <f902e28bfd21435a9b11abd44af2425f@ti.com>
References: <20231012172947.1359231-1-a-limaye@ti.com>
 <20231012172947.1359231-2-a-limaye@ti.com>
 <8a2741b3-6fc5-46fc-bed2-c1528c407308@ti.com>
In-Reply-To: <8a2741b3-6fc5-46fc-bed2-c1528c407308@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.128.249]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Oct 2023 03:38:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17100

SGkgQW5kcmV3LA0KDQpXZSBuZWVkIHRob3NlIGZpbGVzIHRvIGJlIHBhY2thZ2VkIGluIHRoZSB0
aXNkay1jb3JlLWJ1bmRsZS4uLiBTbyB0aGF0IGl0IGNhbiBiZSBwYWNrYWdlZCBpbiB0aGUgaW5z
dGFsbGVyIHdlIHJlbGVhc2Ugb24gdGkuY29tLiBXZSBwYWNrYWdlIHRoZXNlLCB0aS1kbSBhbmQg
dGhlIHUtYm9vdCBzb3VyY2VzIHVzZWQsIHRvIGVuYWJsZSB1LWJvb3QgYnVpbGRzIGluIHRoZSBp
bnN0YWxsZXIgd2l0aCB0aGUgc2FtZSBzb3VyY2VzIHVzZWQgZm9yIG91ciBidWlsZC4NCg0KUmVn
YXJkcywNCkFuaWtldA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogRGF2aXMs
IEFuZHJldyA8YWZkQHRpLmNvbT4gDQpTZW50OiBGcmlkYXksIE9jdG9iZXIgMTMsIDIwMjMgMjoz
NyBBTQ0KVG86IExpbWF5ZSwgQW5pa2V0IDxhLWxpbWF5ZUB0aS5jb20+OyBtZXRhLXRpQGxpc3Rz
LnlvY3RvcHJvamVjdC5vcmcNCkNjOiBFYXRtb24sIFJ5YW4gPHJlYXRtb25AdGkuY29tPjsgR29s
ZSwgRGhydXZhIDxkLWdvbGVAdGkuY29tPjsgU2hpbHdhbnQsIENoaXJhZyA8Yy1zaGlsd2FudEB0
aS5jb20+OyBBZGl2aSwgU2FpIFNyZWUgS2FydGhlZWsgPHMtYWRpdmlAdGkuY29tPjsgUmFnaGF2
ZW5kcmEsIFZpZ25lc2ggPHZpZ25lc2hyQHRpLmNvbT4NClN1YmplY3Q6IFJlOiBbbWV0YS10aV1b
bWFzdGVyL2tpcmtzdG9uZV1bUEFUQ0ggMS8yXSB0aS1zY2ktZnc6IFJlbW92ZSBDT01QQVRJQkxF
X01BQ0hJTkUgYW5kIGV4dGVuZCByZWNpcGUgdG8gazMgbWFjaGluZXMNCg0KT24gMTAvMTIvMjMg
MTI6MjkgUE0sIEFuaWtldCBMaW1heWUgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgd3JvdGU6
DQo+IFJldmVydCBlYmNmMTViZjBmMzEyMDhlODdjZTYwYTQ2OTZlNTg1OTQwYjQ2Nzc3IDoNCj4g
ICAgInJlY2lwZXMtYnNwOnRpLXNjaS1mdzogQWRkIGszcjUgYXMgQ09NUEFUSUJMRV9NQUNISU5F
Ig0KPiANCj4gRXh0ZW5kIHJlY2lwZSB0byBrMyBtYWNoaW5lcyB0b28sIHRvIHByb3ZpZGUgdGkt
ZnMtc3R1Yi0qIGZpcm13YXJlIGZvciANCj4gdS1ib290IGFhcmNoNjQgYnVpbGQuDQo+IA0KPiBV
cGRhdGUgZG9fZGVwbG95KCkgdG8gYWxsb3cgbXVsdGljb25maWcgYnVpbGRzIGZvciBrMyBtYWNo
aW5lcw0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5pa2V0IExpbWF5ZSA8YS1saW1heWVAdGkuY29t
Pg0KPiAtLS0NCj4gICBtZXRhLXRpLWJzcC9yZWNpcGVzLWJzcC90aS1zY2ktZncvdGktc2NpLWZ3
X2dpdC5iYiB8IDYgKysrKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhLXRpLWJzcC9yZWNpcGVzLWJz
cC90aS1zY2ktZncvdGktc2NpLWZ3X2dpdC5iYiANCj4gYi9tZXRhLXRpLWJzcC9yZWNpcGVzLWJz
cC90aS1zY2ktZncvdGktc2NpLWZ3X2dpdC5iYg0KPiBpbmRleCA4MDFjODc2OC4uMmFkOTNhNWQg
MTAwNjQ0DQo+IC0tLSBhL21ldGEtdGktYnNwL3JlY2lwZXMtYnNwL3RpLXNjaS1mdy90aS1zY2kt
ZndfZ2l0LmJiDQo+ICsrKyBiL21ldGEtdGktYnNwL3JlY2lwZXMtYnNwL3RpLXNjaS1mdy90aS1z
Y2ktZndfZ2l0LmJiDQo+IEBAIC00LDcgKzQsNiBAQCBpbmhlcml0IGRlcGxveQ0KPiAgIA0KPiAg
IHJlcXVpcmUgcmVjaXBlcy1ic3AvdGktbGludXgtZncvdGktbGludXgtZncuaW5jDQo+ICAgDQo+
IC1DT01QQVRJQkxFX01BQ0hJTkUgPSAiazNyNSINCj4gICBQQUNLQUdFX0FSQ0ggPSAiJHtNQUNI
SU5FX0FSQ0h9Ig0KPiAgIA0KPiAgIENGTEFHU1t1bmV4cG9ydF0gPSAiMSINCj4gQEAgLTI2LDcg
KzI1LDEwIEBAIGRvX2luc3RhbGwoKSB7DQo+ICAgDQo+ICAgRklMRVM6JHtQTn0gPSAiJHtub25h
cmNoX2Jhc2VfbGliZGlyfS9maXJtd2FyZSINCj4gICANCj4gLWRvX2RlcGxveSgpIHsNCj4gK2Rv
X2RlcGxveSgpew0KPiArfQ0KPiArDQo+ICtkb19kZXBsb3k6azNyNSgpIHsNCj4gICAJaW5zdGFs
bCAtZCAke0RFUExPWURJUn0vdGktc3lzZncNCj4gICAJaW5zdGFsbCAtbSA2NDQgJHtTfS90aS1z
eXNmdy90aS1zY2ktZmlybXdhcmUtKiAke0RFUExPWURJUn0vdGktc3lzZncNCj4gICAJaW5zdGFs
bCAtbSA2NDQgJHtTfS90aS1zeXNmdy90aS1mcy1maXJtd2FyZS0qICR7REVQTE9ZRElSfS90aS1z
eXNmdw0KDQpXaHkgZG8gd2UgbmVlZCB0byBkZXBsb3kgdGhlc2UgZmlsZXMgaW4gJHtERVBMT1lE
SVJ9LyBhdCBhbGw/DQoNCkFuZHJldw0KDQo+IA0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0t
PS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdy
b3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzE3MDk3KTogDQo+IGh0dHBzOi8vbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZy9nL21ldGEtdGkvbWVzc2FnZS8xNzA5Nw0KPiBNdXRlIFRoaXMgVG9waWM6
IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9tdC8xMDE5MjMyNzIvMzYxOTczMw0KPiBH
cm91cCBPd25lcjogbWV0YS10aStvd25lckBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+IFVuc3Vi
c2NyaWJlOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9tZXRhLXRpL3Vuc3ViIA0K
PiBbYWZkQHRpLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQo=

