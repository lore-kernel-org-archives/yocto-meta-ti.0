Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.10603.1613059913907300652
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Feb 2021 08:11:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=UMJwNjzN;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nikhil.nd@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 8153838C06B0
	for <meta-ti@yoctoproject.org>; Thu, 11 Feb 2021 16:11:53 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11BGBqe8041914
	for <meta-ti@yoctoproject.org>; Thu, 11 Feb 2021 10:11:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1613059912;
	bh=2ev0BYuHyDV8f66QJJ5OT8+x3hs7P6Ng+1fx8XfnAvw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=UMJwNjzNuS0Sfx9HRy4FhvpOSw1RiVWcUWTfke2XBQUl8QfQaj3qpHc0a8eB4epWP
	 Weiqtay2CFOxmwcUO6Ilgn4v2gDYfQ4nNYHgTDbwayFF4AJ4gTHkukaeON2gE2Pq11
	 IJA3kIPva4t0grkC0kVQ5YvI537pGu/eV3DXTo3o=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11BGBqlR114404
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 11 Feb 2021 10:11:52 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Feb 2021 10:11:52 -0600
Received: from DFLE108.ent.ti.com ([fe80::c18:99ac:4a4:2ceb]) by
 DFLE108.ent.ti.com ([fe80::c18:99ac:4a4:2ceb%17]) with mapi id
 15.01.1979.003; Thu, 11 Feb 2021 10:11:52 -0600
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: "Vutla, Lokesh" <lokeshvutla@ti.com>,
        "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>,
        "Murphy, Dan" <dmurphy@ti.com>
CC: Kishon Vijay Abraham <kishon@ti.com>, "Nori, Sekhar" <nsekhar@ti.com>
Subject: Re: [meta-ti][dunfell PATCH] recipes-bsp: wl-fw: New recipe for WiLink firmwares
Thread-Topic: [meta-ti][dunfell PATCH] recipes-bsp: wl-fw: New recipe for
 WiLink firmwares
Thread-Index: AQHXAGPKV+HH7YAzdUuJIQS7wKV2b6pTd2aAgAACdgD//6Y0YA==
Date: Thu, 11 Feb 2021 16:11:52 +0000
Message-ID: <1bb49e5bb82e4147a87c3eea620c9a5b@ti.com>
References: <20210211105018.10470-1-nikhil.nd@ti.com>
 <53d3e34d-d202-988b-ac89-510e89933f32@ti.com>
 <c366cda2-08ee-f593-c1ab-d8d293f3e697@ti.com>
In-Reply-To: <c366cda2-08ee-f593-c1ab-d8d293f3e697@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.230.217]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQpPbiAxMS8wMi8yMSA4OjUzIHBtLCBMb2tlc2ggVnV0bGEgd3JvdGU6DQo+IA0KPiANCj4gT24g
MTEvMDIvMjEgNDoyMCBwbSwgTmlraGlsIERldnNoYXR3YXIgd3JvdGU6DQo+PiBBZGQgYSBuZXcg
cmVjaXBlIHdoaWNoIGluc3RhbGxzIHRoZSBXaUxpbmsgZmlybXdhcmUgZnJvbSB0aGUNCj4+IG9m
ZmljaWFsIHRpLWxpbnV4LWZpcm13YXJlIHJlcG8uDQo+Pg0KPj4gVGhpcyBpcyByZXF1aXJlZCBm
b3Igc3VwcG9ydGluZyB0aGUgV2lyZWxlc3MgZnVuY3Rpb25hbGl5IG9uDQo+PiB0aGUgYW02NHh4
LXNrIGJvYXJkLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE5pa2hpbCBEZXZzaGF0d2FyIDxuaWto
aWwubmRAdGkuY29tPg0KPiANCj4gSSBzZWUgdGhlIGZvbGxvd2luZyBuZXcgZmlybXdhcmVzIGFy
ZSBpbnN0YWxsZWQuDQo+IC1ydy1yLS1yLS0gMSBsb2tlc2ggbG9rZXNoICA1MEsgRmViIDExIDE2
OjQyIFRJSW5pdF82LjIuMzEuYnRzDQo+IC1ydy1yLS1yLS0gMSBsb2tlc2ggbG9rZXNoICAxNksg
RmViIDExIDE2OjQyIFRJSW5pdF82LjYuMTUuYnRzDQo+IC1ydy1yLS1yLS0gMSBsb2tlc2ggbG9r
ZXNoICA0OEsgRmViIDExIDE2OjQyIFRJSW5pdF83LjIuMzEuYnRzDQo+IC1ydy1yLS1yLS0gMSBs
b2tlc2ggbG9rZXNoIDE5MEsgRmViIDExIDE2OjQyIHdsMTI1MS1mdy5iaW4NCj4gLXJ3LXItLXIt
LSAxIGxva2VzaCBsb2tlc2ggIDc1MiBGZWIgMTEgMTY6NDIgd2wxMjUxLW52cy5iaW4NCj4gLXJ3
LXItLXItLSAxIGxva2VzaCBsb2tlc2ggMjY4SyBGZWIgMTEgMTY6NDIgd2wxMjcxLWZ3LTIuYmlu
DQo+IC1ydy1yLS1yLS0gMSBsb2tlc2ggbG9rZXNoIDI2N0sgRmViIDExIDE2OjQyIHdsMTI3MS1m
dy1hcC5iaW4NCj4gLXJ3LXItLXItLSAxIGxva2VzaCBsb2tlc2ggMjY2SyBGZWIgMTEgMTY6NDIg
d2wxMjcxLWZ3LmJpbg0KPiAtcnctci0tci0tIDEgbG9rZXNoIGxva2VzaCAyNzRLIEZlYiAxMSAx
Njo0MiB3bDEyN3gtZnctMy5iaW4NCj4gLXJ3LXItLXItLSAxIGxva2VzaCBsb2tlc2ggMjU1SyBG
ZWIgMTEgMTY6NDIgd2wxMjd4LWZ3LTQtbXIuYmluDQo+IC1ydy1yLS1yLS0gMSBsb2tlc2ggbG9r
ZXNoIDI1NksgRmViIDExIDE2OjQyIHdsMTI3eC1mdy00LXBsdC5iaW4NCj4gLXJ3LXItLXItLSAx
IGxva2VzaCBsb2tlc2ggMjcxSyBGZWIgMTEgMTY6NDIgd2wxMjd4LWZ3LTQtc3IuYmluDQo+IC1y
dy1yLS1yLS0gMSBsb2tlc2ggbG9rZXNoIDM0OUsgRmViIDExIDE2OjQyIHdsMTI3eC1mdy01LW1y
LmJpbg0KPiAtcnctci0tci0tIDEgbG9rZXNoIGxva2VzaCAzMzhLIEZlYiAxMSAxNjo0MiB3bDEy
N3gtZnctNS1wbHQuYmluDQo+IC1ydy1yLS1yLS0gMSBsb2tlc2ggbG9rZXNoIDM1NksgRmViIDEx
IDE2OjQyIHdsMTI3eC1mdy01LXNyLmJpbg0KPiAtcnctci0tci0tIDEgbG9rZXNoIGxva2VzaCAy
NjJLIEZlYiAxMSAxNjo0MiB3bDEyN3gtZnctcGx0LTMuYmluDQo+IC1ydy1yLS1yLS0gMSBsb2tl
c2ggbG9rZXNoICA5MTIgRmViIDExIDE2OjQyIHdsMTI3eC1udnMuYmluDQo+IC1ydy1yLS1yLS0g
MSBsb2tlc2ggbG9rZXNoIDI3OUsgRmViIDExIDE2OjQyIHdsMTI4eC1mdy0zLmJpbg0KPiAtcnct
ci0tci0tIDEgbG9rZXNoIGxva2VzaCAyNTlLIEZlYiAxMSAxNjo0MiB3bDEyOHgtZnctNC1tci5i
aW4NCj4gLXJ3LXItLXItLSAxIGxva2VzaCBsb2tlc2ggMjY0SyBGZWIgMTEgMTY6NDIgd2wxMjh4
LWZ3LTQtcGx0LmJpbg0KPiAtcnctci0tci0tIDEgbG9rZXNoIGxva2VzaCAyNzhLIEZlYiAxMSAx
Njo0MiB3bDEyOHgtZnctNC1zci5iaW4NCj4gLXJ3LXItLXItLSAxIGxva2VzaCBsb2tlc2ggMzU0
SyBGZWIgMTEgMTY6NDIgd2wxMjh4LWZ3LTUtbXIuYmluDQo+IC1ydy1yLS1yLS0gMSBsb2tlc2gg
bG9rZXNoIDM0NksgRmViIDExIDE2OjQyIHdsMTI4eC1mdy01LXBsdC5iaW4NCj4gLXJ3LXItLXIt
LSAxIGxva2VzaCBsb2tlc2ggMzY1SyBGZWIgMTEgMTY6NDIgd2wxMjh4LWZ3LTUtc3IuYmluDQo+
IC1ydy1yLS1yLS0gMSBsb2tlc2ggbG9rZXNoIDI2MEsgRmViIDExIDE2OjQyIHdsMTI4eC1mdy1h
cC5iaW4NCj4gLXJ3LXItLXItLSAxIGxva2VzaCBsb2tlc2ggMjY3SyBGZWIgMTEgMTY6NDIgd2wx
Mjh4LWZ3LmJpbg0KPiAtcnctci0tci0tIDEgbG9rZXNoIGxva2VzaCAyNjZLIEZlYiAxMSAxNjo0
MiB3bDEyOHgtZnctcGx0LTMuYmluDQo+IC1ydy1yLS1yLS0gMSBsb2tlc2ggbG9rZXNoIDEuMUsg
RmViIDExIDE2OjQyIHdsMTI4eC1udnMuYmluDQo+IC1ydy1yLS1yLS0gMSBsb2tlc2ggbG9rZXNo
IDYyNUsgRmViIDExIDE2OjQyIHdsMTh4eC1mdy0yLmJpbg0KPiAtcnctci0tci0tIDEgbG9rZXNo
IGxva2VzaCA2NThLIEZlYiAxMSAxNjo0MiB3bDE4eHgtZnctMy5iaW4NCj4gLXJ3LXItLXItLSAx
IGxva2VzaCBsb2tlc2ggNzI4SyBGZWIgMTEgMTY6NDIgd2wxOHh4LWZ3LTQuYmluDQo+IC1ydy1y
LS1yLS0gMSBsb2tlc2ggbG9rZXNoIDQwNUsgRmViIDExIDE2OjQyIHdsMTh4eC1mdy5iaW4NCj4g
DQo+IA0KPiBEbyB3ZSBuZWVkIGFsbCB0aGVzZSBmaXJtd2FyZXM/DQoNCkFjdHVhbGx5LCBJIGFt
IHVuYXdhcmUgYnV0IExva2VzaCBhc2tlZCBtZSB0byBjb3B5IGFsbCB0aGUgZmlybXdhcmVzLg0K
S2lzaG9uLCBzaG91bGQgdGhpcyBiZSBhIHNob3J0ZXIgbGlzdD8gTGV0IG1lIGtub3cgYW5kIEkg
c2hhbGwgdXBkYXRlIHRoYXQNCg0KUmVnYXJkcywNCk5pa2hpbCBEDQoNCj4gDQo+PiAtLS0NCj4+
ICByZWNpcGVzLWJzcC93bC1mdy93bC1md19naXQuYmIgfCAyNyArKysrKysrKysrKysrKysrKysr
KysrKysrKysNCj4+ICAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQ0KPj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCByZWNpcGVzLWJzcC93bC1mdy93bC1md19naXQuYmINCg0KQWxzbywgc2hv
dWxkbid0IHRoaXMgYmUgc2ltaWxhciB0bw0KcmVjaXBlcy1jb25uZWN0aXZpdHkvd2xjb25mL3ds
Y29uZl84LjcuMy5iYiA/DQoNClRoYW5rcyBhbmQgcmVnYXJkcywNCkxva2VzaA0KDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL3JlY2lwZXMtYnNwL3dsLWZ3L3dsLWZ3X2dpdC5iYiBiL3JlY2lwZXMtYnNw
L3dsLWZ3L3dsLWZ3X2dpdC5iYg0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAw
MDAwMDAwLi4wMWQ4ZTU4Yg0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvcmVjaXBlcy1ic3Av
d2wtZncvd2wtZndfZ2l0LmJiDQo+PiBAQCAtMCwwICsxLDI3IEBADQo+PiArREVTQ1JJUFRJT04g
PSAiRmlybXdhcmUgZmlsZXMgZm9yIFdpbGluayINCj4+ICtMSUNFTlNFID0gIlRJLVRTUEEiDQo+
PiArTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5DRS50aS1jb25uZWN0aXZpdHk7bWQ1
PWM1ZTAyYmU2MzNmMTQ5OWMxMDlkMTY1MjUxNGQ4NWVjIg0KPj4gKw0KPj4gK1BWID0gIjcuMytn
aXQke1NSQ1BWfSINCj4gDQo+IERhbiwgdGhpcyBjYW1lIHVwIGluIG9uZSBvZiBvdXIgZGlzY3Vz
c2lvbnMuIElzbid0IHRoZSBwcmVmZXJyZWQgd2F5IGlzIHRvIHB1dA0KPiBQViBpbiBmaWxlIG5h
bWU/DQo+IA0KPiBUaGFua3MgYW5kIHJlZ2FyZHMsDQo+IExva2VzaA0KPiANCj4+ICsNCj4+ICtT
UkNSRVYgPSAiYjY2ZWU5YWUwMjBjMzFkNzEzOGYwYWYzODUxODgyM2JiNGY1NzkxZSINCj4+ICtC
UkFOQ0ggPSAidGktbGludXgtZmlybXdhcmUiDQo+PiArU1JDX1VSSSA9ICJnaXQ6Ly9naXQudGku
Y29tL3Byb2Nlc3Nvci1maXJtd2FyZS90aS1saW51eC1maXJtd2FyZS5naXQ7YnJhbmNoPSR7QlJB
TkNIfSINCj4+ICsNCj4+ICtDT01QQVRJQkxFX01BQ0hJTkUgPSAiazMiDQo+PiArUEFDS0FHRV9B
UkNIID0gIiR7TUFDSElORV9BUkNIfSINCj4+ICsNCj4+ICtDTEVBTkJST0tFTiA9ICIxIg0KPj4g
Kw0KPj4gK1MgPSAiJHtXT1JLRElSfS9naXQiDQo+PiArDQo+PiArZG9fY29tcGlsZSgpIHsNCj4+
ICsgICAgOg0KPj4gK30NCj4+ICsNCj4+ICtkb19pbnN0YWxsKCkgew0KPj4gKyAgICBpbnN0YWxs
IC1kICR7RH0ke2Jhc2VfbGliZGlyfS9maXJtd2FyZS90aS1jb25uZWN0aXZpdHkNCj4+ICsgICAg
aW5zdGFsbCAtbSA2NDQgJHtTfS90aS1jb25uZWN0aXZpdHkvKiAke0R9JHtiYXNlX2xpYmRpcn0v
ZmlybXdhcmUvdGktY29ubmVjdGl2aXR5Lw0KPj4gK30NCj4+ICsNCj4+ICtGSUxFU18ke1BOfSAr
PSAiJHtiYXNlX2xpYmRpcn0vZmlybXdhcmUvdGktY29ubmVjdGl2aXR5LyoiDQo+Pg0K
