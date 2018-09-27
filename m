Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5DE88E00754; Thu, 27 Sep 2018 12:11:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41894E00519
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 12:11:24 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RJBORX077438
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 14:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538075484;
	bh=7b3s0jBU9/s1j2btjVNJclJZsyJ8pZLVf+oj4K0NxtU=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=qh9tYQ/yTdpuiWVyGDWFlqLXL3Jyw47rJrncYnNhdSVUJAWYce4ehnCXAR/9vNNWi
	TJiE1UnR9sdsKsTLU7CAgD+TGPhPMU1ULXtWvPTZRS2CZWnnCO7Wjpz3AD6+7O45xY
	4B1AxgRGeEUWB47KV7bJSa765k1WluyERElzNWiY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RJBOYs031224
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 14:11:24 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 14:11:24 -0500
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1466.003; Thu, 27 Sep 2018 14:11:23 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [EXTERNAL] [meta-ti] [rocko/master][PATCH 18/30] udma-lld-rtos:
	Added support for udma-lld on rtos (initial version)
Thread-Index: AQHUVn/rC2tY4ViVy0+JhPR0etLIEaUEfmTw
Date: Thu, 27 Sep 2018 19:11:23 +0000
Message-ID: <9885e39a94cd4c9ca5afa69eff105796@ti.com>
References: <1538061764-54977-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538061764-54977-19-git-send-email-m-radhakrishnan2@ti.com>
	<10f13a26-c8e9-b7f3-ef70-1be7576a56e5@ti.com>
In-Reply-To: <10f13a26-c8e9-b7f3-ef70-1be7576a56e5@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.117.116]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [rocko/master][PATCH 18/30] udma-lld-rtos: Added support for udma-lld on rtos (initial version)
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
X-List-Received-Date: Thu, 27 Sep 2018 19:11:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBTdGlmZmxlciwgSmFjb2IgDQpT
ZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDI3LCAyMDE4IDEyOjM0IFBNDQpUbzogUmFkaGFrcmlz
aG5hbiwgTWFoZXNoOyBtZXRhLXRpQHlvY3RvcHJvamVjdC5vcmcNClN1YmplY3Q6IFJlOiBbRVhU
RVJOQUxdIFttZXRhLXRpXSBbcm9ja28vbWFzdGVyXVtQQVRDSCAxOC8zMF0gdWRtYS1sbGQtcnRv
czogQWRkZWQgc3VwcG9ydCBmb3IgdWRtYS1sbGQgb24gcnRvcyAoaW5pdGlhbCB2ZXJzaW9uKQ0K
DQoNCg0KT24gOS8yNy8yMDE4IDExOjIyIEFNLCBNYWhlc2ggUmFkaGFrcmlzaG5hbiB3cm90ZToN
Cj4gU2lnbmVkLW9mZi1ieTogTWFoZXNoIFJhZGhha3Jpc2huYW4gPG0tcmFkaGFrcmlzaG5hbjJA
dGkuY29tPg0KPiAtLS0NCj4gICByZWNpcGVzLWJzcC91ZG1hLWxsZC91ZG1hLWxsZC1ydG9zX2dp
dC5iYiB8IDgxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hh
bmdlZCwgODEgaW5zZXJ0aW9ucygrKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCByZWNpcGVzLWJz
cC91ZG1hLWxsZC91ZG1hLWxsZC1ydG9zX2dpdC5iYg0KPg0KPiBkaWZmIC0tZ2l0IGEvcmVjaXBl
cy1ic3AvdWRtYS1sbGQvdWRtYS1sbGQtcnRvc19naXQuYmIgYi9yZWNpcGVzLWJzcC91ZG1hLWxs
ZC91ZG1hLWxsZC1ydG9zX2dpdC5iYg0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAw
MDAwMDAwLi4xYTY4YWE5DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvcmVjaXBlcy1ic3AvdWRt
YS1sbGQvdWRtYS1sbGQtcnRvc19naXQuYmINCj4gQEAgLTAsMCArMSw4MSBAQA0KPiArU1VNTUFS
WSA9ICJUSSBSVE9TIGxvdyBsZXZlbCBkcml2ZXIgZm9yIFVETUEiDQo+ICtERVNDUklQVElPTiA9
ICJUSSBSVE9TIGxvdyBsZXZlbCBkcml2ZXIgZm9yIFVuaXZlcnNhbCBETUEgbW9kdWxlICINCj4g
Kw0KPiAraW5oZXJpdCB0aS1wZGsNCj4gKw0KPiArTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UiDQo+
ICtMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly91ZG1hLmg7YmVnaW5saW5lPTE7ZW5kbGluZT0z
MTttZDU9ODNkMTc3Y2YzZGY1NWMxNmIyN2FlNDEwMmI2YWRlOWEiDQo+ICsNCj4gK0NPTVBBVElC
TEVfTUFDSElORSA9ICJrMyINCj4gK1BBQ0tBR0VfQVJDSCA9ICIke01BQ0hJTkVfQVJDSH0iDQo+
ICsNCj4gK1VETUFfTExEX0dJVF9VUkkgPSAiZ2l0Oi8vZ2l0LnRpLmNvbS9rZXlzdG9uZS1ydG9z
L3VkbWEtbGxkLmdpdCINCj4gK1VETUFfTExEX0dJVF9QUk9UT0NPTCA9ICJnaXQiDQo+ICtVRE1B
X0xMRF9HSVRfQlJBTkNIID0gIm1hc3RlciINCj4gKw0KPiArIyBCZWxvdyBjb21taXQgSUQgY29y
cmVzcG9uZHMgdG8gIkRFVi5VRE1BX0xMRC4wMS4wMC4wMC4wMCINCj4gK1VETUFfTExEX1NSQ1JF
ViA9ICI3NDVmN2QzZmExMmNjYTY1MDc4MjE0ODk0NTFmZmUwY2ZhZDQ2MDllIg0KPiArDQo+ICtC
UkFOQ0ggPSAiJHtVRE1BX0xMRF9HSVRfQlJBTkNIfSINCj4gK1NSQ19VUkkgPSAiJHtVRE1BX0xM
RF9HSVRfVVJJfTtwcm90b2NvbD0ke1VETUFfTExEX0dJVF9QUk9UT0NPTH07YnJhbmNoPSR7QlJB
TkNIfSINCj4gKw0KPiArU1JDUkVWID0gIiR7VURNQV9MTERfU1JDUkVWfSINCj4gK1BWID0gIjAx
LjAwLjAwLjAwIg0KPiArUFIgPSAicjAiDQo+ICsNCj4gK0RFUEVORFNfYXBwZW5kID0gIiBvc2Fs
LXJ0b3MgXA0KPiArICAgICAgICAgICAgICAgICAgIHNjaWNsaWVudC1ydG9zIFwNCj4gKyINCj4g
Kw0KPiArIyBCdWlsZCB3aXRoIG1ha2UgaW5zdGVhZCBvZiBYREMNCj4gK1RJX1BES19YRENNQUtF
ID0gIjAiDQo+ICsNCj4gK1VETUFfUEFDS0FHRV9CQVNFICAgPSAiJHtTfS8uLi91ZG1hX2Jhc2Ui
DQo+ICtVRE1BX0xMRF9ST09UUEFUSCA9ICIke1VETUFfUEFDS0FHRV9CQVNFfS9wYWNrYWdlL2Fs
bC9wZGtfL3BhY2thZ2VzL3RpL2Rydi91ZG1hIg0KPiArDQo+ICtleHBvcnQgUERLX0lOU1RBTExf
UEFUSCA9ICIke1BES19JTlNUQUxMX0RJUn0vcGFja2FnZXMiDQo+ICtleHBvcnQgUERLX1VETUFf
Uk9PVF9QQVRIID0gIiR7VURNQV9QQUNLQUdFX0JBU0V9L3BhY2thZ2UvYWxsL3Bka18vcGFja2Fn
ZXMiDQo+ICsNCj4gK0xJTVNPQ1MgPSAiIg0KPiArTElNU09DU19hbTY1eHgtZXZtID0gImFtNjV4
eCINCj4gKw0KPiArTElNQk9BUkRTID0gIiINCj4gK0xJTUJPQVJEU19hbTY1eHgtZXZtID0gImFt
NjV4eF9ldm0iDQoNCkNhbiB0aGVzZSBkZWZpbml0aW9ucyBiZSBhZGRlZCB0byB0aGUgbWFjaGlu
ZSBjb25maWd1cmF0aW9uIGFzIHdhcyBkb25lIA0KZm9yIGFsbCBvdGhlcnM/DQpUaGlzIHdvdWxk
IG1lYW4sIGRlZmluaW5nIGFzIGJlbG93LCBjb3JyZWN0Pw0KTElNU09DU19rMyA9ICJhbTY1eHgi
DQpMSU1CT0FSRFNfazMgPSAiYW02NXh4X2V2bSINCkJPQVJEX1BBQ0tBR0VfazMgPSAiYW02NXh4
X2V2bSINCg0KDQo+ICsNCj4gK0JPQVJEX1BBQ0tBR0UgPSAiIg0KPiArQk9BUkRfUEFDS0FHRV9h
bTY1eHgtZXZtID0gImFtNjV4eF9ldm0iDQo+ICsNCj4gKyMgSFRNTCBkb2MgbGluayBwYXJhbXMN
Cj4gK1BES19DT01QX0xJTktfVEVYVCA9ICJVRE1BIExMRCINCj4gKw0KPiArZG9fY29uZmlndXJl
KCkgew0KPiArDQo+ICsgICAjIHJlbW92ZSBhbnkgcHJldmlvdXMgcGFja2FnZQ0KPiArICAgIHJt
IC1yZiAke1VETUFfUEFDS0FHRV9CQVNFfQ0KPiArDQo+ICsgICAgY2QgJHtTfQ0KPiArDQo+ICsg
ICAgIyBtYWtlIHRoZSByZWxlYXNlIHBhY2thZ2UgYmVmb3JlIGJ1aWxkaW5nIGl0DQo+ICsgICAg
bWFrZSBwYWNrYWdlIEJPQVJEPSR7Qk9BUkRfUEFDS0FHRX0gREVTVF9ST09UPSR7VURNQV9QQUNL
QUdFX0JBU0V9IFBES19VRE1BX0NPTVBfUEFUSD0ke1N9DQo+ICt9DQo+ICsNCj4gK2RvX2NvbXBp
bGUoKSB7DQo+ICsNCj4gKyAgICBjZCAke1VETUFfTExEX1JPT1RQQVRIfQ0KPiArDQo+ICsgICAg
IyBCdWlsZCBhbTY1eHggbGlicmFyaWVzDQo+ICsgICAgbWFrZSBjbGVhbiBsaWIgeGRjX21ldGEg
ZG94eWdlbiBMSU1JVF9TT0NTPSIke0xJTVNPQ1N9IiBMSU1JVF9CT0FSRFM9IiR7TElNQk9BUkRT
fSINCj4gKw0KPiArICAgICNhcmNoaXZlDQo+ICsgICAgdGFyIC1jZiB1ZG1hX2xsZC50YXIgLS1l
eGNsdWRlPScqLnRhcicgLi8qDQo+ICt9DQo+ICsNCj4gK2RvX2luc3RhbGwoKSB7DQo+ICsgICAg
Y2QgJHtVRE1BX0xMRF9ST09UUEFUSH0NCj4gKyAgICBpbnN0YWxsIC1kICR7RH0ke1BES19JTlNU
QUxMX0RJUl9SRUNJUEV9L3BhY2thZ2VzL3RpL2Rydi91ZG1hDQo+ICsgICAgZmluZCAtbmFtZSAi
Ki50YXIiIC1leGVjIHRhciB4ZiB7fSAtLW5vLXNhbWUtb3duZXIgLUMgJHtEfSR7UERLX0lOU1RB
TExfRElSX1JFQ0lQRX0vcGFja2FnZXMvdGkvZHJ2L3VkbWEgXDsNCj4gK30NCj4gKw0KPiArRklM
RVNfJHtQTn0gKz0gIiR7UERLX0lOU1RBTExfRElSX1JFQ0lQRX0vcGFja2FnZXMiDQo+ICsNCj4g
K0lOU0FORV9TS0lQXyR7UE59ID0gImFyY2ggbGRmbGFncyINCg0K

