Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.2482.1613105965765356197
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Feb 2021 20:59:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=esx1HKxf;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nikhil.nd@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 9A20138C06A1
	for <meta-ti@yoctoproject.org>; Fri, 12 Feb 2021 04:59:24 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11C4xN9L032739
	for <meta-ti@yoctoproject.org>; Thu, 11 Feb 2021 22:59:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1613105963;
	bh=7x8j6XCTEof8O8xbqqKOvzHtRFo02c/lmOFXCgvD+6E=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=esx1HKxfHe/2baMNUnJ00i+lGhPlAUB/hJIO9U9Imennz+v4bV7rO/+NGuMIfqhpq
	 4GE4VyUEnc2Y7Md65ULTIR3BImofbgdqLt38BgNUlZPbMDoHLzb95ZGpPbc7pjf2Ew
	 cHr2asqcN8zwll+P5Um0fo6Y9vPeIOCVuAfCuV2M=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11C4xN98118459
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 11 Feb 2021 22:59:23 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Feb 2021 22:59:23 -0600
Received: from DFLE108.ent.ti.com ([fe80::c18:99ac:4a4:2ceb]) by
 DFLE108.ent.ti.com ([fe80::c18:99ac:4a4:2ceb%17]) with mapi id
 15.01.1979.003; Thu, 11 Feb 2021 22:59:23 -0600
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
        "Vutla, Lokesh"
	<lokeshvutla@ti.com>,
        "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
        "Murphy, Dan" <dmurphy@ti.com>
CC: Kishon Vijay Abraham <kishon@ti.com>, "Nori, Sekhar" <nsekhar@ti.com>
Subject: Re: [meta-ti][dunfell PATCH] recipes-bsp: wl-fw: New recipe for WiLink firmwares
Thread-Topic: [meta-ti][dunfell PATCH] recipes-bsp: wl-fw: New recipe for
 WiLink firmwares
Thread-Index: AQHXAGPKV+HH7YAzdUuJIQS7wKV2b6pTd2aAgAACdgD//6Y0YIAA1pfQ
Date: Fri, 12 Feb 2021 04:59:23 +0000
Message-ID: <eed0ccbb564a4eb0a290f1f1201b7198@ti.com>
References: <20210211105018.10470-1-nikhil.nd@ti.com>
 <53d3e34d-d202-988b-ac89-510e89933f32@ti.com>
 <c366cda2-08ee-f593-c1ab-d8d293f3e697@ti.com>
 <1662BD72176DD822.24722@lists.yoctoproject.org>
In-Reply-To: <1662BD72176DD822.24722@lists.yoctoproject.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.230.217]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIDExLzAyLzIxIDg6NTMgcG0sIExva2VzaCBWdXRsYSB3cm90ZToNCj4gDQo+IA0KPiBP
biAxMS8wMi8yMSA0OjIwIHBtLCBOaWtoaWwgRGV2c2hhdHdhciB3cm90ZToNCj4+IEFkZCBhIG5l
dyByZWNpcGUgd2hpY2ggaW5zdGFsbHMgdGhlIFdpTGluayBmaXJtd2FyZSBmcm9tIHRoZSBvZmZp
Y2lhbCANCj4+IHRpLWxpbnV4LWZpcm13YXJlIHJlcG8uDQo+Pg0KPj4gVGhpcyBpcyByZXF1aXJl
ZCBmb3Igc3VwcG9ydGluZyB0aGUgV2lyZWxlc3MgZnVuY3Rpb25hbGl5IG9uIHRoZSANCj4+IGFt
NjR4eC1zayBib2FyZC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBOaWtoaWwgRGV2c2hhdHdhciA8
bmlraGlsLm5kQHRpLmNvbT4NCj4gDQo+IEkgc2VlIHRoZSBmb2xsb3dpbmcgbmV3IGZpcm13YXJl
cyBhcmUgaW5zdGFsbGVkLg0KPiAtcnctci0tci0tIDEgbG9rZXNoIGxva2VzaCAgNTBLIEZlYiAx
MSAxNjo0MiBUSUluaXRfNi4yLjMxLmJ0cw0KPiAtcnctci0tci0tIDEgbG9rZXNoIGxva2VzaCAg
MTZLIEZlYiAxMSAxNjo0MiBUSUluaXRfNi42LjE1LmJ0cw0KPiAtcnctci0tci0tIDEgbG9rZXNo
IGxva2VzaCAgNDhLIEZlYiAxMSAxNjo0MiBUSUluaXRfNy4yLjMxLmJ0cw0KPiAtcnctci0tci0t
IDEgbG9rZXNoIGxva2VzaCAxOTBLIEZlYiAxMSAxNjo0MiB3bDEyNTEtZncuYmluDQo+IC1ydy1y
LS1yLS0gMSBsb2tlc2ggbG9rZXNoICA3NTIgRmViIDExIDE2OjQyIHdsMTI1MS1udnMuYmluDQo+
IC1ydy1yLS1yLS0gMSBsb2tlc2ggbG9rZXNoIDI2OEsgRmViIDExIDE2OjQyIHdsMTI3MS1mdy0y
LmJpbg0KPiAtcnctci0tci0tIDEgbG9rZXNoIGxva2VzaCAyNjdLIEZlYiAxMSAxNjo0MiB3bDEy
NzEtZnctYXAuYmluDQo+IC1ydy1yLS1yLS0gMSBsb2tlc2ggbG9rZXNoIDI2NksgRmViIDExIDE2
OjQyIHdsMTI3MS1mdy5iaW4NCj4gLXJ3LXItLXItLSAxIGxva2VzaCBsb2tlc2ggMjc0SyBGZWIg
MTEgMTY6NDIgd2wxMjd4LWZ3LTMuYmluDQo+IC1ydy1yLS1yLS0gMSBsb2tlc2ggbG9rZXNoIDI1
NUsgRmViIDExIDE2OjQyIHdsMTI3eC1mdy00LW1yLmJpbg0KPiAtcnctci0tci0tIDEgbG9rZXNo
IGxva2VzaCAyNTZLIEZlYiAxMSAxNjo0MiB3bDEyN3gtZnctNC1wbHQuYmluDQo+IC1ydy1yLS1y
LS0gMSBsb2tlc2ggbG9rZXNoIDI3MUsgRmViIDExIDE2OjQyIHdsMTI3eC1mdy00LXNyLmJpbg0K
PiAtcnctci0tci0tIDEgbG9rZXNoIGxva2VzaCAzNDlLIEZlYiAxMSAxNjo0MiB3bDEyN3gtZnct
NS1tci5iaW4NCj4gLXJ3LXItLXItLSAxIGxva2VzaCBsb2tlc2ggMzM4SyBGZWIgMTEgMTY6NDIg
d2wxMjd4LWZ3LTUtcGx0LmJpbg0KPiAtcnctci0tci0tIDEgbG9rZXNoIGxva2VzaCAzNTZLIEZl
YiAxMSAxNjo0MiB3bDEyN3gtZnctNS1zci5iaW4NCj4gLXJ3LXItLXItLSAxIGxva2VzaCBsb2tl
c2ggMjYySyBGZWIgMTEgMTY6NDIgd2wxMjd4LWZ3LXBsdC0zLmJpbg0KPiAtcnctci0tci0tIDEg
bG9rZXNoIGxva2VzaCAgOTEyIEZlYiAxMSAxNjo0MiB3bDEyN3gtbnZzLmJpbg0KPiAtcnctci0t
ci0tIDEgbG9rZXNoIGxva2VzaCAyNzlLIEZlYiAxMSAxNjo0MiB3bDEyOHgtZnctMy5iaW4NCj4g
LXJ3LXItLXItLSAxIGxva2VzaCBsb2tlc2ggMjU5SyBGZWIgMTEgMTY6NDIgd2wxMjh4LWZ3LTQt
bXIuYmluDQo+IC1ydy1yLS1yLS0gMSBsb2tlc2ggbG9rZXNoIDI2NEsgRmViIDExIDE2OjQyIHds
MTI4eC1mdy00LXBsdC5iaW4NCj4gLXJ3LXItLXItLSAxIGxva2VzaCBsb2tlc2ggMjc4SyBGZWIg
MTEgMTY6NDIgd2wxMjh4LWZ3LTQtc3IuYmluDQo+IC1ydy1yLS1yLS0gMSBsb2tlc2ggbG9rZXNo
IDM1NEsgRmViIDExIDE2OjQyIHdsMTI4eC1mdy01LW1yLmJpbg0KPiAtcnctci0tci0tIDEgbG9r
ZXNoIGxva2VzaCAzNDZLIEZlYiAxMSAxNjo0MiB3bDEyOHgtZnctNS1wbHQuYmluDQo+IC1ydy1y
LS1yLS0gMSBsb2tlc2ggbG9rZXNoIDM2NUsgRmViIDExIDE2OjQyIHdsMTI4eC1mdy01LXNyLmJp
bg0KPiAtcnctci0tci0tIDEgbG9rZXNoIGxva2VzaCAyNjBLIEZlYiAxMSAxNjo0MiB3bDEyOHgt
ZnctYXAuYmluDQo+IC1ydy1yLS1yLS0gMSBsb2tlc2ggbG9rZXNoIDI2N0sgRmViIDExIDE2OjQy
IHdsMTI4eC1mdy5iaW4NCj4gLXJ3LXItLXItLSAxIGxva2VzaCBsb2tlc2ggMjY2SyBGZWIgMTEg
MTY6NDIgd2wxMjh4LWZ3LXBsdC0zLmJpbg0KPiAtcnctci0tci0tIDEgbG9rZXNoIGxva2VzaCAx
LjFLIEZlYiAxMSAxNjo0MiB3bDEyOHgtbnZzLmJpbg0KPiAtcnctci0tci0tIDEgbG9rZXNoIGxv
a2VzaCA2MjVLIEZlYiAxMSAxNjo0MiB3bDE4eHgtZnctMi5iaW4NCj4gLXJ3LXItLXItLSAxIGxv
a2VzaCBsb2tlc2ggNjU4SyBGZWIgMTEgMTY6NDIgd2wxOHh4LWZ3LTMuYmluDQo+IC1ydy1yLS1y
LS0gMSBsb2tlc2ggbG9rZXNoIDcyOEsgRmViIDExIDE2OjQyIHdsMTh4eC1mdy00LmJpbg0KPiAt
cnctci0tci0tIDEgbG9rZXNoIGxva2VzaCA0MDVLIEZlYiAxMSAxNjo0MiB3bDE4eHgtZncuYmlu
DQo+IA0KPiANCj4gRG8gd2UgbmVlZCBhbGwgdGhlc2UgZmlybXdhcmVzPw0KDQpBY3R1YWxseSwg
SSBhbSB1bmF3YXJlIGJ1dCAqS2lzaG9uKiBhc2tlZCBtZSB0byBjb3B5IGFsbCB0aGUgZmlybXdh
cmVzLg0KS2lzaG9uLCBzaG91bGQgdGhpcyBiZSBhIHNob3J0ZXIgbGlzdD8gTGV0IG1lIGtub3cg
YW5kIEkgc2hhbGwgdXBkYXRlIHRoYXQNCg0KXl4gQ29ycmVjdGlvbiBhYm92ZQ0KDQpSZWdhcmRz
LA0KTmlraGlsIEQNCg0KPiANCj4+IC0tLQ0KPj4gIHJlY2lwZXMtYnNwL3dsLWZ3L3dsLWZ3X2dp
dC5iYiB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyNyBpbnNlcnRpb25zKCspDQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMtYnNwL3ds
LWZ3L3dsLWZ3X2dpdC5iYg0KDQpBbHNvLCBzaG91bGRuJ3QgdGhpcyBiZSBzaW1pbGFyIHRvDQpy
ZWNpcGVzLWNvbm5lY3Rpdml0eS93bGNvbmYvd2xjb25mXzguNy4zLmJiID8NCg0KVGhhbmtzIGFu
ZCByZWdhcmRzLA0KTG9rZXNoDQoNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1ic3Avd2wt
Zncvd2wtZndfZ2l0LmJiIA0KPj4gYi9yZWNpcGVzLWJzcC93bC1mdy93bC1md19naXQuYmIgbmV3
IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXggDQo+PiAwMDAwMDAwMC4uMDFkOGU1OGINCj4+IC0tLSAv
ZGV2L251bGwNCj4+ICsrKyBiL3JlY2lwZXMtYnNwL3dsLWZ3L3dsLWZ3X2dpdC5iYg0KPj4gQEAg
LTAsMCArMSwyNyBAQA0KPj4gK0RFU0NSSVBUSU9OID0gIkZpcm13YXJlIGZpbGVzIGZvciBXaWxp
bmsiDQo+PiArTElDRU5TRSA9ICJUSS1UU1BBIg0KPj4gK0xJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOQ0UudGktY29ubmVjdGl2aXR5O21kNT1jNWUwMmJlNjMzZjE0OTljMTA5ZDE2NTI1
MTRkODVlYyINCj4+ICsNCj4+ICtQViA9ICI3LjMrZ2l0JHtTUkNQVn0iDQo+IA0KPiBEYW4sIHRo
aXMgY2FtZSB1cCBpbiBvbmUgb2Ygb3VyIGRpc2N1c3Npb25zLiBJc24ndCB0aGUgcHJlZmVycmVk
IHdheSANCj4gaXMgdG8gcHV0IFBWIGluIGZpbGUgbmFtZT8NCj4gDQo+IFRoYW5rcyBhbmQgcmVn
YXJkcywNCj4gTG9rZXNoDQo+IA0KPj4gKw0KPj4gK1NSQ1JFViA9ICJiNjZlZTlhZTAyMGMzMWQ3
MTM4ZjBhZjM4NTE4ODIzYmI0ZjU3OTFlIg0KPj4gK0JSQU5DSCA9ICJ0aS1saW51eC1maXJtd2Fy
ZSINCj4+ICtTUkNfVVJJID0gImdpdDovL2dpdC50aS5jb20vcHJvY2Vzc29yLWZpcm13YXJlL3Rp
LWxpbnV4LWZpcm13YXJlLmdpdDticmFuY2g9JHtCUkFOQ0h9Ig0KPj4gKw0KPj4gK0NPTVBBVElC
TEVfTUFDSElORSA9ICJrMyINCj4+ICtQQUNLQUdFX0FSQ0ggPSAiJHtNQUNISU5FX0FSQ0h9Ig0K
Pj4gKw0KPj4gK0NMRUFOQlJPS0VOID0gIjEiDQo+PiArDQo+PiArUyA9ICIke1dPUktESVJ9L2dp
dCINCj4+ICsNCj4+ICtkb19jb21waWxlKCkgew0KPj4gKyAgICA6DQo+PiArfQ0KPj4gKw0KPj4g
K2RvX2luc3RhbGwoKSB7DQo+PiArICAgIGluc3RhbGwgLWQgJHtEfSR7YmFzZV9saWJkaXJ9L2Zp
cm13YXJlL3RpLWNvbm5lY3Rpdml0eQ0KPj4gKyAgICBpbnN0YWxsIC1tIDY0NCAke1N9L3RpLWNv
bm5lY3Rpdml0eS8qIA0KPj4gKyR7RH0ke2Jhc2VfbGliZGlyfS9maXJtd2FyZS90aS1jb25uZWN0
aXZpdHkvDQo+PiArfQ0KPj4gKw0KPj4gK0ZJTEVTXyR7UE59ICs9ICIke2Jhc2VfbGliZGlyfS9m
aXJtd2FyZS90aS1jb25uZWN0aXZpdHkvKiINCj4+DQo=
