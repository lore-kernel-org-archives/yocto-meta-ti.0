Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 46BCCE00BFD; Tue, 25 Jul 2017 07:53:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A29DE00B76
	for <meta-ti@yoctoproject.org>; Tue, 25 Jul 2017 07:53:11 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6PErACA007319
	for <meta-ti@yoctoproject.org>; Tue, 25 Jul 2017 09:53:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500994390;
	bh=yARwrMXFtvmW2TiL0QLn/BDEftK55V1D0fEhVno5NnE=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=Id8DLmFCmXtwQ6GlsHz0B63Ryrk4+kWySlND3HV9+gFqlacc4CdhOQMdnxlv47kWg
	oBzOkDkJsssCUGhniDI16SgRCCsLknaEoRnFlHht7cGIPBIj0d9SCQJCYfVOcA/BiQ
	YKXYDsV6b6U0ha+yOn4nnPVFxEw9wc6Urr6VyjzI=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6PErARA015056
	for <meta-ti@yoctoproject.org>; Tue, 25 Jul 2017 09:53:10 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Tue, 25 Jul 2017 09:53:10 -0500
From: "Pang, Ivan" <i-pang@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 2/4] ti-cgt6x-7: added recipe for TI CGT6x 7.x.x
Thread-Index: AQHTBMynPC3F10V4PU6Vuvfpi6yMcqJk6v2A//+2OoA=
Date: Tue, 25 Jul 2017 14:53:09 +0000
Message-ID: <C45960711C772449A33A51ED1374F08A406287DA@DFLE08.ent.ti.com>
References: <1500935470-11179-1-git-send-email-i-pang@ti.com>
	<1500935470-11179-2-git-send-email-i-pang@ti.com>
	<3cbd5766-d1c7-f8e0-10aa-a072492e8565@ti.com>
In-Reply-To: <3cbd5766-d1c7-f8e0-10aa-a072492e8565@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] ti-cgt6x-7: added recipe for TI CGT6x 7.x.x
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
X-List-Received-Date: Tue, 25 Jul 2017 14:53:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVzLCB0aGlzIGNhbiBiZSBuYXRpdmUtb25seS4gSSBoYWQgYmFzZWQgdGhpcyByZWNpcGUgb24g
ZXhpc3RpbmcgQ0dUNnggNy54LnggcmVjaXBlcywgYnV0IHRoZSBvbmx5IHVzZSBpcyBkb25lIG5h
dGl2ZWx5LiBJJ2xsIHN1Ym1pdCBhIHYyLg0KDQpJdmFuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQpGcm9tOiBTdGlmZmxlciwgSmFjb2IgDQpTZW50OiBUdWVzZGF5LCBKdWx5IDI1LCAy
MDE3IDk6MTUgQU0NClRvOiBQYW5nLCBJdmFuOyBtZXRhLXRpQHlvY3RvcHJvamVjdC5vcmcNClN1
YmplY3Q6IFJlOiBbbWV0YS10aV0gW1BBVENIIDIvNF0gdGktY2d0NngtNzogYWRkZWQgcmVjaXBl
IGZvciBUSSBDR1Q2eCA3LngueA0KDQpUaGUgInRhcmdldCIgY2xhc3Mgb2YgdGhpcyByZWNpcGUg
ZG9lcyBub3QgYXBwZWFyIHRvIGJlIHN1cHBvcnRlZCAoaS5lLiANCm5vIEFSTSBiaW5hcnkgcGFj
a2FnZSkuIFNob3VkbCB0aGlzIGJlIG5hdGl2ZSBvbmx5LCBzaW1pbGFyIHRvIHRpLWNndC1hcm0/
DQoNCg0KT24gNy8yNC8yMDE3IDY6MzEgUE0sIEl2YW4gUGFuZyB3cm90ZToNCj4gVGhpcyByZWNp
cGUgc3BlY2lmaWNhbGx5IGluc3RhbGxzIHRoZSA3LngueCBzZXJpZXMgb2YgVEkgQ0dUNnguDQo+
DQo+IFNpZ25lZC1vZmYtYnk6IEl2YW4gUGFuZyA8aS1wYW5nQHRpLmNvbT4NCj4gLS0tDQo+ICAg
cmVjaXBlcy10aS9kZXZ0b29scy90aS1jZ3Q2eC03XzcuNC4xNi5iYiB8IDM4ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDM4IGluc2VydGlvbnMo
KykNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcmVjaXBlcy10aS9kZXZ0b29scy90aS1jZ3Q2eC03
XzcuNC4xNi5iYg0KPg0KPiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy10aS9kZXZ0b29scy90aS1jZ3Q2
eC03XzcuNC4xNi5iYiANCj4gYi9yZWNpcGVzLXRpL2RldnRvb2xzL3RpLWNndDZ4LTdfNy40LjE2
LmJiDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAuLjUxZDM1OWUNCj4g
LS0tIC9kZXYvbnVsbA0KPiArKysgYi9yZWNpcGVzLXRpL2RldnRvb2xzL3RpLWNndDZ4LTdfNy40
LjE2LmJiDQo+IEBAIC0wLDAgKzEsMzggQEANCj4gK0RFU0NSSVBUSU9OID0gIlRJIERTUCBDb2Rl
IEdlbmVyYXRpb24gVG9vbHMiDQo+ICtIT01FUEFHRSA9ICJodHRwczovL3d3dy1hLnRpLmNvbS9k
b3dubG9hZHMvc2RzX3N1cHBvcnQvVElDb2RlZ2VuZXJhdGlvblRvb2xzL2Rvd25sb2FkLmh0bSIN
Cj4gK0xJQ0VOU0UgPSAiVEkiDQo+ICsNCj4gK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0UudHh0O21kNT1iNjMxMTk2MjYzNWE0ZjE1NjMwZTM2ZWMyZDg3NWVjYSINCj4gKw0KPiAr
UEUgPSAiMCINCj4gK1BSID0gInIwIg0KPiArDQo+ICtTID0gIiR7V09SS0RJUn0vYzYwMDBfNy40
LjE2Ig0KPiArDQo+ICtyZXF1aXJlIHJlY2lwZXMtdGkvaW5jbHVkZXMvdGktcGF0aHMuaW5jIHJl
cXVpcmUgDQo+ICtyZWNpcGVzLXRpL2luY2x1ZGVzL3RpLXVucGFjay5pbmMNCj4gKw0KPiArQklO
RklMRSA9ICJ0aV9jZ3RfYzYwMDBfNy40LjE2X2xpbnV4X2luc3RhbGxlcl94ODYuYmluIg0KPiAr
QklORklMRV9OQU1FID0gImNndDZ4XzcuNC4xNl94ODZfaW5zdGFsbGVyIg0KPiArVElfQklOX1VO
UEtfQVJHUyA9ICItLXByZWZpeCAke1dPUktESVJ9IC0tbW9kZSB1bmF0dGVuZGVkIg0KPiArVElf
QklOX1VOUEtfQ01EUz0iIg0KPiArDQo+ICtTUkNfVVJJID0gImh0dHA6Ly9pbnN0YWxsLnNvdXJj
ZS5kaXIubG9jYWwvJHtCSU5GSUxFfTtuYW1lPSR7QklORklMRV9OQU1FfSINCj4gKw0KPiArU1JD
X1VSSVtjZ3Q2eF83LjQuMTZfeDg2X2luc3RhbGxlci5tZDVzdW1dID0gIjIxY2E1NWM1YjFmNmIy
ZDhkNGZiNzU3MGQ1ZWI1NTEzIg0KPiArU1JDX1VSSVtjZ3Q2eF83LjQuMTZfeDg2X2luc3RhbGxl
ci5zaGEyNTZzdW1dID0gImJhYTBkMWVmMjAzOTczODNmOTlmNDUwNjhhNmQxNjA5NjNhMDE0MTlk
NDJmYmJiODUxMjYzYjU0YzkxZGY4MmYiDQo+ICsNCj4gK2RvX2luc3RhbGwoKSB7DQo+ICsgICAg
aW5zdGFsbCAtZCAke0R9LyR7VElfQ0dUNlhfN19JTlNUQUxMX0RJUl9SRUNJUEV9DQo+ICsgICAg
Y3AgLXIgJHtXT1JLRElSfS9jNjAwMF83LjQuMTYvLiANCj4gKyR7RH0vJHtUSV9DR1Q2WF83X0lO
U1RBTExfRElSX1JFQ0lQRX0NCj4gK30NCj4gKw0KPiArRklMRVNfJHtQTn0gKz0gIiR7VElfQ0dU
NlhfN19JTlNUQUxMX0RJUl9SRUNJUEV9Ig0KPiArDQo+ICtJTlNBTkVfU0tJUF8ke1BOfSArPSAi
YXJjaCBzdGF0aWNkZXYiDQo+ICsNCj4gK0lOSElCSVRfUEFDS0FHRV9TVFJJUCA9ICIxIg0KPiAr
SU5ISUJJVF9TWVNST09UX1NUUklQID0gIjEiDQo+ICtJTkhJQklUX1BBQ0tBR0VfREVCVUdfU1BM
SVQgPSAiMSINCj4gKw0KPiArQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIg0KDQo=

