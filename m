Return-Path: <anandb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779A9CD3439
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 04:35:47 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.522.1695098137092751728
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Sep 2023 21:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=K2YFG4BX;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: anandb@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38J4ZVtk026387;
	Mon, 18 Sep 2023 23:35:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695098131;
	bh=bkSwrxCAMAXwobY5rh9lEZOuv8RKZozBxZcstdxlNpk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=K2YFG4BXodDaxCQIFOPyWRsWu6ZMMUq7prUDInSHvHKOBIH+QnU2rQaNOyXBJeKWi
	 UNyLpO7pP3u1L5OCAQbUGXaR+4wqScvrnieXbybdP5nQk2S7RN5gdShDy52nOqzCbx
	 u83TF19LOLkqpCGBBWifVnHE3L1AbyFee4aC5q7o=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38J4ZVfT016794
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Sep 2023 23:35:31 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 18
 Sep 2023 23:35:30 -0500
Received: from DLEE106.ent.ti.com ([fe80::8d93:1ed8:6156:7891]) by
 DLEE106.ent.ti.com ([fe80::8d93:1ed8:6156:7891%17]) with mapi id
 15.01.2507.023; Mon, 18 Sep 2023 23:35:31 -0500
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: "Bajjuri, Praneeth" <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Eatmon, Ryan" <reatmon@ti.com>,
        "Adivi, Sai Sree Kartheek" <s-adivi@ti.com>,
        "Gupta, Gyan" <g-gupta@ti.com>,
        "Khasim, Syed Mohammed" <khasim@ti.com>,
        "Pothukuchi, Vijay" <vijayp@ti.com>
Subject: RE: [EXTERNAL] Re: [meta-ti] [RFC|kirkstone] linux-ti-staging: add
 config preempt for am335x and am437x
Thread-Topic: [EXTERNAL] Re: [meta-ti] [RFC|kirkstone] linux-ti-staging: add
 config preempt for am335x and am437x
Thread-Index: AQHZ5y5neqGv50s820uRzkLhur8+NbAavHOJgABhWECAAUfTgIAFMKAg
Date: Tue, 19 Sep 2023 04:35:30 +0000
Message-ID: <cfe86ebae4374412817e3c4c2c4fc423@ti.com>
References: <20230914171026.3014887-1-anandb@ti.com>
 <1784DB091C7C28F5.22721@lists.yoctoproject.org>
 <20230914195514.GO3359@denix.org> <2cf51220b2cd4976bb8531d3cceced5a@ti.com>
 <b0597336-8bd5-027e-4e96-c86463189e96@ti.com>
In-Reply-To: <b0597336-8bd5-027e-4e96-c86463189e96@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.64.104]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 19 Sep 2023 04:35:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16990

UHJhbmVldGgsDQoNCnNyY3JldiBpbiBrZXJuZWwgcmVjaXBlIGZvciBraXJrc3RvbmUgYnJhbmNo
IG5lZWRzIHRvIGJlIGJ1bXBlZC4gVGhlIGxhc3QgQ0lDRCBidWlsZCB3YXMgNi1TZXAgLSBhbHNv
IGEgZ29vZCBpZGVhIHRvIHRyaWdnZXIgYW5vdGhlciBmdWxsIGJ1aWxkLg0KDQpSZWdhcmRzLA0K
QW5hbmQNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEJhamp1cmksIFByYW5l
ZXRoIDxwcmFuZWV0aEB0aS5jb20+IA0KU2VudDogRnJpZGF5LCBTZXB0ZW1iZXIgMTUsIDIwMjMg
OTo0NyBQTQ0KVG86IEJhbGFnb3BhbGFrcmlzaG5hbiwgQW5hbmQgPGFuYW5kYkB0aS5jb20+OyBE
ZW55cyBEbXl0cml5ZW5rbyA8ZGVuaXNAZGVuaXgub3JnPg0KQ2M6IG1ldGEtdGlAbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZzsgRWF0bW9uLCBSeWFuIDxyZWF0bW9uQHRpLmNvbT47IEFkaXZpLCBTYWkg
U3JlZSBLYXJ0aGVlayA8cy1hZGl2aUB0aS5jb20+OyBHdXB0YSwgR3lhbiA8Zy1ndXB0YUB0aS5j
b20+OyBLaGFzaW0sIFN5ZWQgTW9oYW1tZWQgPGtoYXNpbUB0aS5jb20+OyBQb3RodWt1Y2hpLCBW
aWpheSA8dmlqYXlwQHRpLmNvbT4NClN1YmplY3Q6IFJlOiBbRVhURVJOQUxdIFJlOiBbbWV0YS10
aV0gW1JGQ3xraXJrc3RvbmVdIGxpbnV4LXRpLXN0YWdpbmc6IGFkZCBjb25maWcgcHJlZW1wdCBm
b3IgYW0zMzV4IGFuZCBhbTQzN3gNCg0KDQoNCk9uIDkvMTQvMjAyMyA4OjQ3IFBNLCBCYWxhZ29w
YWxha3Jpc2huYW4sIEFuYW5kIHdyb3RlOg0KPiBIaSBEZW55cywNCj4gDQo+IFRoaXMgaXMgb25s
eSBuZWVkZWQgZm9yIHY3IHBsYXRmb3JtcyBsaWtlIEFNMyAvIEFNNCBhbmQgcG9zc2libHkgQU01
N3ggYWxzby4gQ09ORklHX1BSRUVNUFQgaXMgZW5hYmxlZCBieSBkZWZhdWx0IG9uIGFybTY0IHBs
YXRmb3JtcyBsaWtlIEFNNjV4Lg0KPiANCj4gUHJhbmVldGggd2lsbCBzZW5kIGEga2VybmVsIHBh
dGNoIGZvciBUSSBrZXJuZWwuIFRoaXMgbWV0YS10aSBwYXRjaCBpcyBtZWFudCB0byB1bmJsb2Nr
IGFueW9uZSB3aG8gd2FudHMgdG8gZW5hYmxlIFNHWCBkcml2ZSBpbiB0aGUgbWVhbndoaWxlLg0K
DQoNClRoaXMgcGF0Y2ggY2FuIGJlIGFiYW5kb25lZCAuDQpodHRwczovL2dpdC50aS5jb20vY2dp
dC90aS1saW51eC1rZXJuZWwvdGktbGludXgta2VybmVsL2NvbW1pdC8/aD10aS1saW51eC02LjEu
eS1jaWNkJmlkPWUwMjVlMzExMjZmZmYwMWRlZDU5ZDkwMWFmOTE2YWJlODc2NDZjYTYgDQplbmFi
bGVzIENPTkZJR19QUkVFTVBUDQoNCg0KPiANCj4gUmVnYXJkcywNCj4gQW5hbmQNCj4gDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERlbnlzIERteXRyaXllbmtvIDxkZW5p
c0BkZW5peC5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDE1LCAyMDIzIDE6MjUgQU0N
Cj4gVG86IEJhbGFnb3BhbGFrcmlzaG5hbiwgQW5hbmQgPGFuYW5kYkB0aS5jb20+DQo+IENjOiBt
ZXRhLXRpQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc7IEVhdG1vbiwgUnlhbiA8cmVhdG1vbkB0aS5j
b20+OyBBZGl2aSwgU2FpIFNyZWUgS2FydGhlZWsgPHMtYWRpdmlAdGkuY29tPjsgR3VwdGEsIEd5
YW4gPGctZ3VwdGFAdGkuY29tPjsgS2hhc2ltLCBTeWVkIE1vaGFtbWVkIDxraGFzaW1AdGkuY29t
PjsgUG90aHVrdWNoaSwgVmlqYXkgPHZpamF5cEB0aS5jb20+OyBCYWpqdXJpLCBQcmFuZWV0aCA8
cHJhbmVldGhAdGkuY29tPg0KPiBTdWJqZWN0OiBbRVhURVJOQUxdIFJlOiBbbWV0YS10aV0gW1JG
Q3xraXJrc3RvbmVdIGxpbnV4LXRpLXN0YWdpbmc6IGFkZCBjb25maWcgcHJlZW1wdCBmb3IgYW0z
MzV4IGFuZCBhbTQzN3gNCj4gDQo+IE9uIFRodSwgU2VwIDE0LCAyMDIzIGF0IDAzOjM2OjE4UE0g
LTA0MDAsIERlbnlzIERteXRyaXllbmtvIHdyb3RlOg0KPj4gT24gVGh1LCBTZXAgMTQsIDIwMjMg
YXQgMTA6NDA6MjZQTSArMDUzMCwgQW5hbmQgQmFsYWdvcGFsYWtyaXNobmFuIHZpYSBsaXN0cy55
b2N0b3Byb2plY3Qub3JnIHdyb3RlOg0KPj4+IFNHWCBuZWVkcyBhIHByZWVtcHRpYmxlIGtlcm5l
bC4gQ09ORklHX1BSRUVNUFQgaGFzIGFsd2F5cyBiZWVuDQo+Pj4gZW5hYmxlZCBvbiBUSSBMaW51
eCBrZXJuZWxzIHVwdG8gSzUuMS4NCj4+Pg0KPj4+IFRoaXMgaXMgZW5hYmxlZCBvbiBBTTY1eCBi
eSBkZWZhdWx0IGJ1dCBtaXNzZWQgb3V0IEFNMzM1eCBhbmQgQU00Mzd4Lg0KPj4+IEFkZCBhIGtl
cm5lbCBjb25maWcgZnJhZ21lbnQgdG8gZW5hYmxlIGNvbmZpZyBwcmVlbXB0Lg0KPj4NCj4+IEhp
LCBBbmFuZCwNCj4+DQo+PiBJcyB0aGlzIG9ubHkgbmVlZGVkIGZvciBhbTMzNXggYW5kIGFtNDM3
eCwgYXMgdGhlIHN1YmplY3Qgc3VnZ2VzdHM/IElmDQo+PiBzbywgd2h5IHRoZSBjb2RlIGFkZHMg
dGhlIGNvbmZpZyBmcmFnbWVudCB0byBhbGwgcGxhdGZvcm1zPw0KPj4NCj4+IFNlY29uZCBxdWVz
dGlvbiAtIGhpc3RvcmljYWxseSB0aGlzIGhhcyBiZWVuIGVuYWJsZWQgaW4gdGhlIFRJIGtlcm5l
bCBpdHNlbGYuDQo+PiBXaHkgbm90IGRvIGl0IGxpa2UgdGhhdCBhZ2Fpbiwgd2h5IGFkZCB0aGUg
ZnJhZ21lbnQgdG8gdGhlIE9FIG1ldGFkYXRhDQo+PiBpbnN0ZWFkIG9mIGtlZXBpbmcgaXQgaW4t
dHJlZT8gSG93IHRoZSBkaXN0cm8tYWdub3N0aWMgYXBwcm9hY2ggd291bGQgYmUgaGFuZGxlZD8N
Cj4+DQo+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEFuYW5kIEJhbGFnb3BhbGFrcmlzaG5hbiA8YW5h
bmRiQHRpLmNvbT4NCj4+PiAtLS0NCj4+PiAgIC4uLi9saW51eC9maWxlcy9jb25maWdzL2NvbmZp
Zy1wcmVlbXB0LmNmZyAgICAgICAgICAgfCAxMiArKysrKysrKysrKysNCj4+PiAgIC4uLi9yZWNp
cGVzLWtlcm5lbC9saW51eC9saW51eC10aS1zdGFnaW5nXzYuMS5iYiAgICAgfCAgMSArDQo+Pj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCj4+PiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NA0KPj4+IG1ldGEtdGktYnNwL3JlY2lwZXMta2VybmVsL2xpbnV4L2ZpbGVzL2NvbmZpZ3Mv
Y29uZmlnLXByZWVtcHQuY2ZnDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0DQo+Pj4gYS9tZXRhLXRpLWJz
cC9yZWNpcGVzLWtlcm5lbC9saW51eC9maWxlcy9jb25maWdzL2NvbmZpZy1wcmVlbXB0LmNmZw0K
Pj4+IGIvbWV0YS10aS1ic3AvcmVjaXBlcy1rZXJuZWwvbGludXgvZmlsZXMvY29uZmlncy9jb25m
aWctcHJlZW1wdC5jZmcNCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4+IGluZGV4IDAwMDAw
MDAwLi5jMWU1YWQ3ZA0KPj4+IC0tLSAvZGV2L251bGwNCj4+PiArKysgYi9tZXRhLXRpLWJzcC9y
ZWNpcGVzLWtlcm5lbC9saW51eC9maWxlcy9jb25maWdzL2NvbmZpZy1wcmVlbXB0Lg0KPj4+ICsr
KyBjZmcNCj4+DQo+PiBUaGlzIGlzIG5vdCB0aGUgcmlnaHQgbG9jYXRpb24gZm9yIHRoZSBmaWxl
LiBZb3Ugd2FudCB0byBhZGQgdG8gdGhlDQo+PiBsaW51eC10aS1zdGFnaW5nLXJ0LTYuMS8gZGly
ZWN0b3J5LCBzaW5jZSB5b3UgYXJlIG9ubHkgdXNpbmcgaXQgZnJvbQ0KPj4gdGhlIGNvcnJlc3Bv
bmRpbmcgbGludXgtdGktc3RhZ2luZ182LjEuYmIgcmVjaXBlLg0KPiANCj4gU29ycnksIHR5cG8g
aGVyZSAtIGxpbnV4LXRpLXN0YWdpbmctNi4xLyBkaXJlY3RvcnksIGlmIGl0J3Mgbm90IFJULXNw
ZWNpZmljLg0KPiANCj4+DQo+Pj4gQEAgLTAsMCArMSwxMiBAQA0KPj4+ICtDT05GSUdfUFJFRU1Q
VF9CVUlMRD15DQo+Pj4gKyMgQ09ORklHX1BSRUVNUFRfTk9ORSBpcyBub3Qgc2V0DQo+Pj4gK0NP
TkZJR19QUkVFTVBUPXkNCj4+PiArQ09ORklHX1BSRUVNUFRfQ09VTlQ9eQ0KPj4+ICtDT05GSUdf
UFJFRU1QVElPTj15DQo+Pj4gK0NPTkZJR19QUkVFTVBUX1JDVT15DQo+Pj4gK0NPTkZJR19UQVNL
U19SQ1VfR0VORVJJQz15DQo+Pj4gK0NPTkZJR19UQVNLU19SQ1U9eQ0KPj4+ICtDT05GSUdfVU5J
TkxJTkVfU1BJTl9VTkxPQ0s9eQ0KPj4+ICsjIENPTkZJR19DRUNfR1BJTyBpcyBub3Qgc2V0DQo+
Pj4gK0NPTkZJR19ERUJVR19QUkVFTVBUPXkNCj4+PiArIyBDT05GSUdfUFJFRU1QVF9UUkFDRVIg
aXMgbm90IHNldA0KPj4+IGRpZmYgLS1naXQNCj4+PiBhL21ldGEtdGktYnNwL3JlY2lwZXMta2Vy
bmVsL2xpbnV4L2xpbnV4LXRpLXN0YWdpbmdfNi4xLmJiDQo+Pj4gYi9tZXRhLXRpLWJzcC9yZWNp
cGVzLWtlcm5lbC9saW51eC9saW51eC10aS1zdGFnaW5nXzYuMS5iYg0KPj4+IGluZGV4IDhhODgz
ODc4Li4wZWU2MzM1OCAxMDA2NDQNCj4+PiAtLS0gYS9tZXRhLXRpLWJzcC9yZWNpcGVzLWtlcm5l
bC9saW51eC9saW51eC10aS1zdGFnaW5nXzYuMS5iYg0KPj4+ICsrKyBiL21ldGEtdGktYnNwL3Jl
Y2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXRpLXN0YWdpbmdfNi4xLmJiDQo+Pj4gQEAgLTMzLDYg
KzMzLDcgQEAgUFIgPSAiJHtNQUNISU5FX0tFUk5FTF9QUn0iDQo+Pj4gICANCj4+PiAgIEtFUk5F
TF9HSVRfVVJJID89ICJnaXQ6Ly9naXQudGkuY29tL2dpdC90aS1saW51eC1rZXJuZWwvdGktbGlu
dXgta2VybmVsLmdpdCINCj4+PiAgIEtFUk5FTF9HSVRfUFJPVE9DT0wgPSAiaHR0cHMiDQo+Pj4g
K0tFUk5FTF9DT05GSUdfRlJBR01FTlRTICs9ICIke1dPUktESVJ9L2NvbmZpZy1wcmVlbXB0LmNm
ZyINCj4+DQo+PiBTaW5jZSB0aGlzIGZpbGUgaXMgb3V0LW9mLXRyZWUgYW5kIGluIHRoZSBPRSBt
ZXRhZGF0YSwgaXQgd291bGQgYWxzbw0KPj4gcmVxdWlyZSBsaXN0aW5nIGl0IGluIFNSQ19VUkku
DQo+Pg0KPj4NCj4+PiAgIFNSQ19VUkkgKz0gIiR7S0VSTkVMX0dJVF9VUkl9O3Byb3RvY29sPSR7
S0VSTkVMX0dJVF9QUk9UT0NPTH07YnJhbmNoPSR7QlJBTkNIfSBcDQo+Pj4gICAgICAgICAgICAg
ICBmaWxlOi8vZGVmY29uZmlnIg0KPj4+ICAgDQo+Pj4gLS0NCj4+PiAyLjM0LjENCg==

