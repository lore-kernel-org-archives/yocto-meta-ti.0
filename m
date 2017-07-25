Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B0DCAE00BFD; Tue, 25 Jul 2017 07:49:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B713AE00B76
	for <meta-ti@yoctoproject.org>; Tue, 25 Jul 2017 07:49:52 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6PEnpoW028096
	for <meta-ti@yoctoproject.org>; Tue, 25 Jul 2017 09:49:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500994192;
	bh=7lVA3sL3qtSce4ZFcFoPudGKMeQUKpZBp9rugIn6P2w=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=dKdA8eMRYnnEYPjhghh8Y15ddmyQHjapKi0EFmX4gjGTBQA9pMMOPXnqX/fjG3BRH
	AEt/6LZ+nMF3EikMU2pAtkCsgHc1QEc/+XXUBvTDiEWnFwLjL0Xf53VsRqQavwmjHT
	hBv/qJsD2n1/0X86Wgo3RvHuhTr0bBYRaEoStPpU=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6PEnpN7017744
	for <meta-ti@yoctoproject.org>; Tue, 25 Jul 2017 09:49:51 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Tue, 25 Jul 2017 09:49:51 -0500
From: "Pang, Ivan" <i-pang@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 3/4] mad-utils-rtos: added recipe for MAD utils
Thread-Index: AQHTBMyfGsq85bD1YES0ArB5aLXn4qJk7rUA//+wzaA=
Date: Tue, 25 Jul 2017 14:49:50 +0000
Message-ID: <C45960711C772449A33A51ED1374F08A406287C3@DFLE08.ent.ti.com>
References: <1500935470-11179-1-git-send-email-i-pang@ti.com>
	<1500935470-11179-3-git-send-email-i-pang@ti.com>
	<e924bf12-8207-df2d-d17d-6fada235e684@ti.com>
In-Reply-To: <e924bf12-8207-df2d-d17d-6fada235e684@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] mad-utils-rtos: added recipe for MAD utils
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Jul 2017 14:49:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBTdGlmZmxlciwgSmFjb2IgDQpT
ZW50OiBUdWVzZGF5LCBKdWx5IDI1LCAyMDE3IDk6MjggQU0NClRvOiBQYW5nLCBJdmFuOyBtZXRh
LXRpQHlvY3RvcHJvamVjdC5vcmcNClN1YmplY3Q6IFJlOiBbbWV0YS10aV0gW1BBVENIIDMvNF0g
bWFkLXV0aWxzLXJ0b3M6IGFkZGVkIHJlY2lwZSBmb3IgTUFEIHV0aWxzDQoNCg0KDQpPbiA3LzI0
LzIwMTcgNjozMSBQTSwgSXZhbiBQYW5nIHdyb3RlOg0KPiBUaGlzIHJlY2lwZSBhZGRzIHRoZSBN
dWx0aWNvcmUgQXBwbGljYXRpb24gRGVwbG95bWVudCAoTUFEKSB1dGlsaXR5IA0KPiBmb3IgYzY2
NXgtZXZtIGFuZCBjNjY3eC1ldm0uDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEl2YW4gUGFuZyA8aS1w
YW5nQHRpLmNvbT4NCj4gLS0tDQo+ICAgcmVjaXBlcy1ic3AvbWFkLXV0aWxzL21hZC11dGlscy1y
dG9zX2dpdC5iYiB8IDY2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKykNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcmVjaXBl
cy1ic3AvbWFkLXV0aWxzL21hZC11dGlscy1ydG9zX2dpdC5iYg0KPg0KPiBkaWZmIC0tZ2l0IGEv
cmVjaXBlcy1ic3AvbWFkLXV0aWxzL21hZC11dGlscy1ydG9zX2dpdC5iYiANCj4gYi9yZWNpcGVz
LWJzcC9tYWQtdXRpbHMvbWFkLXV0aWxzLXJ0b3NfZ2l0LmJiDQo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQo+IGluZGV4IDAwMDAwMDAuLjBmYWI2MTANCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9y
ZWNpcGVzLWJzcC9tYWQtdXRpbHMvbWFkLXV0aWxzLXJ0b3NfZ2l0LmJiDQo+IEBAIC0wLDAgKzEs
NjYgQEANCj4gK0xJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIg0KPiArTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vUkVBRE1FLnR4dDttZDU9NDRiMjE4MGFlYzA2NTdmNmIwZTQyZTU2MTFjMGJhZmIi
DQo+ICsNCj4gK3JlcXVpcmUgcmVjaXBlcy10aS9pbmNsdWRlcy90aS1wYXRocy5pbmMNCj4gKw0K
PiArREVQRU5EUyA9ICJ0aS1jZ3Q2eC03LW5hdGl2ZSINCj4gKw0KPiArUEFDS0FHRV9BUkNIID0g
IiR7TUFDSElORV9BUkNIfSINCj4gK0NPTVBBVElCTEVfTUFDSElORSA9ICJjNjZ4Ig0KPiArDQo+
ICtDTEVBTkJST0tFTiA9ICIxIg0KDQpJcyBDTEVBTkJST0tFTiBuZWVkZWQ/IEkgZG8gbm90IHNl
ZSBhIE1ha2VmaWxlIGluIHRoZSAnUycgZGlyZWN0b3J5Lg0KW0l2YW5dIEkgYWRkZWQgQ0xFQU5C
Uk9LRU4gYmVjYXVzZSBvZiB0aGUgc2VkIGRvbmUgaW4gZG9fY29tcGlsZSgpLiBJIGNhbiByZW1v
dmUgdGhpcyAoc2FtZSBmb3IgaWJsLWJvb3QtcnRvcykuDQoNCj4gKw0KPiArQlJBTkNIID0gIm1h
c3RlciINCj4gK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0LnRpLmNvbS9rZXlzdG9uZS1ydG9zL21hZC11
dGlscy5naXQ7cHJvdG9jb2w9Z2l0O2JyYW5jaD0ke0JSQU5DSH0iDQo+ICtTUkNSRVYgPSAiMjQ1
ODUxMGY3NmVkZGZhODM3YzJiODM0NDg5NjVlMjMzMTU2OTQ0YiINCj4gK1BSID0gInIwIg0KPiAr
DQo+ICtTID0gIiR7V09SS0RJUn0vZ2l0Ig0KPiArDQo+ICtleHBvcnQgQzZYX0JBU0VfRElSPSIk
e1RJX0NHVDZYXzdfSU5TVEFMTF9ESVJ9Ig0KPiArDQo+ICtERVZJQ0UgPSAiIg0KPiArREVWSUNF
X2M2NjV4LWV2bSA9ICJDNjY1NyINCj4gK0RFVklDRV9jNjY3eC1ldm0gPSAiQzY2NzgiDQo+ICsN
Cj4gK0VORElBTiA9ICIiDQo+ICtFTkRJQU5fYzY2NXgtZXZtID0gImxpdHRsZSBiaWciDQo+ICtF
TkRJQU5fYzY2N3gtZXZtID0gImxpdHRsZSBiaWciDQo+ICsNCj4gK2RvX2NvbXBpbGUoKSB7DQo+
ICsgICAgY2QgbWFkLWxvYWRlcg0KPiArICAgIGNwIG1hbC9tYWxMaWIvYnVpbGQvTWFrZWZpbGUg
bWFsL21hbExpYi9idWlsZC9NYWtlZmlsZV9zYXZlDQo+ICsgICAgc2VkIC1pICJzQGNsNnhAJHtD
NlhfQkFTRV9ESVJ9L2Jpbi9jbDZ4QGciIG1hbC9tYWxMaWIvYnVpbGQvTWFrZWZpbGUNCj4gKyAg
ICBzZWQgLWkgInNAYXI2eEAke0M2WF9CQVNFX0RJUn0vYmluL2FyNnhAZyIgbWFsL21hbExpYi9i
dWlsZC9NYWtlZmlsZQ0KPiArICAgIHNlZCAtaSAic0BzdHJpcDZ4QCR7QzZYX0JBU0VfRElSfS9i
aW4vc3RyaXA2eEBnIiBtYWwvbWFsTGliL2J1aWxkL01ha2VmaWxlDQo+ICsgICAgY3AgbWFsL21h
bEFwcC9idWlsZC9NYWtlZmlsZSBtYWwvbWFsQXBwL2J1aWxkL01ha2VmaWxlX3NhdmUNCj4gKyAg
ICBzZWQgLWkgInNAY2w2eEAke0M2WF9CQVNFX0RJUn0vYmluL2NsNnhAZyIgbWFsL21hbEFwcC9i
dWlsZC9NYWtlZmlsZQ0KPiArICAgIHNlZCAtaSAic0BhcjZ4QCR7QzZYX0JBU0VfRElSfS9iaW4v
YXI2eEBnIiBtYWwvbWFsQXBwL2J1aWxkL01ha2VmaWxlDQo+ICsgICAgc2VkIC1pICJzQHN0cmlw
NnhAJHtDNlhfQkFTRV9ESVJ9L2Jpbi9zdHJpcDZ4QGciIG1hbC9tYWxBcHAvYnVpbGQvTWFrZWZp
bGUNCj4gKyAgICBjcCBubWxMb2FkZXIvYnVpbGQvTWFrZWZpbGUgbm1sTG9hZGVyL2J1aWxkL01h
a2VmaWxlX3NhdmUNCj4gKyAgICBzZWQgLWkgInNAY2w2eEAke0M2WF9CQVNFX0RJUn0vYmluL2Ns
NnhAZyIgbm1sTG9hZGVyL2J1aWxkL01ha2VmaWxlDQo+ICsgICAgc2VkIC1pICJzQGFyNnhAJHtD
NlhfQkFTRV9ESVJ9L2Jpbi9hcjZ4QGciIG5tbExvYWRlci9idWlsZC9NYWtlZmlsZQ0KPiArICAg
IHNlZCAtaSAic0BzdHJpcDZ4QCR7QzZYX0JBU0VfRElSfS9iaW4vc3RyaXA2eEBnIiANCj4gK25t
bExvYWRlci9idWlsZC9NYWtlZmlsZQ0KDQpJIHRoaW5rIHRoYXQgaXQgd291bGQgYmUgY2xlYW5l
ciB0byBwcmVwZW5kIFBBVEggd2l0aCAnJHtDNlhfQkFTRV9ESVJ9L2JpbicuIFRoZW4geW91IGRv
IG5vdCBuZWVkIHRvIG1vZGlmeSB0aGUgbWFrZWZpbGUgYW5kIHRoZW4gdW5kbyB0aGUgbW9kaWZp
Y2F0aW9ucy4NCltJdmFuXSBJIHdhbnRlZCB0byByZWZyYWluIGZyb20gYWRkaW5nIGFuIG9sZGVy
IHRvb2xjaGFpbiAoaW4gdGhpcyBjYXNlLCBUSSBDR1Q2eCA3LjQuMTYpIGludG8gdGhlIFBBVEgu
IEknbGwgc2VlIGlmIEkgY2FuIHRpZHkgdGhpcyB1cC4gDQoNCj4gKyAgICBmb3IgZSBpbiAke0VO
RElBTn0NCj4gKyAgICBkbw0KPiArICAgICAgICBta2RpciAtcCBiaW4vJHtERVZJQ0V9LyR7ZX0N
Cj4gKyAgICAgICAgbWFrZSAtQyBtYWwvbWFsTGliL2J1aWxkIGNsZWFuIGFsbCBERVZJQ0U9JHtE
RVZJQ0V9IEVORElBTj0ke2V9IENfRElSPSR7QzZYX0JBU0VfRElSfQ0KPiArICAgICAgICBtYWtl
IC1DIG1hbC9tYWxBcHAvYnVpbGQgY2xlYW4gYWxsIERFVklDRT0ke0RFVklDRX0gRU5ESUFOPSR7
ZX0gQ19ESVI9JHtDNlhfQkFTRV9ESVJ9DQo+ICsgICAgICAgIGNwIG1hbC9tYWxBcHAvYnVpbGQv
bWFsX2FwcC5leGUgYmluLyR7REVWSUNFfS8ke2V9DQo+ICsgICAgICAgIG1ha2UgLUMgbm1sTG9h
ZGVyL2J1aWxkIGNsZWFuIGFsbCBERVZJQ0U9JHtERVZJQ0V9IEVORElBTj0ke2V9IENfRElSPSR7
QzZYX0JBU0VfRElSfQ0KPiArICAgICAgICBjcCBubWxMb2FkZXIvYnVpbGQvbm1sLmV4ZSBiaW4v
JHtERVZJQ0V9LyR7ZX0NCj4gKyAgICBkb25lDQo+ICsgICAgbXYgLWYgbWFsL21hbExpYi9idWls
ZC9NYWtlZmlsZV9zYXZlIG1hbC9tYWxMaWIvYnVpbGQvTWFrZWZpbGUNCj4gKyAgICBtdiAtZiBt
YWwvbWFsQXBwL2J1aWxkL01ha2VmaWxlX3NhdmUgbWFsL21hbEFwcC9idWlsZC9NYWtlZmlsZQ0K
PiArICAgIG12IC1mIG5tbExvYWRlci9idWlsZC9NYWtlZmlsZV9zYXZlIG5tbExvYWRlci9idWls
ZC9NYWtlZmlsZQ0KPiArICAgIGNkIC0NCj4gK30NCj4gKw0KPiArZG9faW5zdGFsbCgpIHsNCj4g
KyAgICBpbnN0YWxsIC1kICR7RH0ke1BES19JTlNUQUxMX0RJUl9SRUNJUEV9L3BhY2thZ2VzL3Rp
L2Jvb3QvbWFkLXV0aWxzDQo+ICsgICAgY3AgLXIgKiAke0R9JHtQREtfSU5TVEFMTF9ESVJfUkVD
SVBFfS9wYWNrYWdlcy90aS9ib290L21hZC11dGlscw0KPiArfQ0KPiArDQo+ICtGSUxFU18ke1BO
fSArPSAiJHtQREtfSU5TVEFMTF9ESVJfUkVDSVBFfS9wYWNrYWdlcy90aS9ib290L21hZC11dGls
cyINCj4gKw0KPiArSU5TQU5FX1NLSVBfJHtQTn0gKz0gImFyY2ggc3RhdGljZGV2IGxkZmxhZ3Mg
ZmlsZS1yZGVwcyINCg0K

