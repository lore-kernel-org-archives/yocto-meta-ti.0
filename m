Return-Path: <r-monk@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 611FDE01437
	for <meta-ti@yoctoproject.org>; Tue, 19 Jun 2012 15:27:21 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q5JMRGsM028471;
	Tue, 19 Jun 2012 17:27:16 -0500
Received: from DNCE71.ent.ti.com (dnce71.ent.ti.com [137.167.131.20])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q5JMRF1Z025281;
	Tue, 19 Jun 2012 17:27:16 -0500
Received: from DNCE05.ent.ti.com ([fe80::2868:e891:b6c7:394]) by
	DNCE71.ent.ti.com ([fe80::3dd1:4b04:86e6:bfd0%29]) with mapi id
	14.01.0323.003; Wed, 20 Jun 2012 00:27:15 +0200
From: "Monk, Roger" <r-monk@ti.com>
To: Thilo Fromm <fromm@dresearch-fe.de>
Thread-Topic: [meta-ti] [oe] ti81xx-psp-linux-2.6.37: broken kernel with gcc
	> 4.5
Thread-Index: AQHNTinlvsmx8iCVy0ivyQtXSa56lZcCNu4g
Date: Tue, 19 Jun 2012 22:27:14 +0000
Message-ID: <4C82F39BABFE6A429733A300DEBF52240B7ECAEB@DNCE05.ent.ti.com>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
	<jp5gkp$2ip$1@dough.gmane.org>
	<CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
	<C1FD0ECD-98B9-4D93-8351-2A19519FFF2D@dominion.thruhere.net>
	<CADZ6=aux412Otdnf_YBJdJB1JUx2bD2sDXy7TNyaefHhq_YxtQ@mail.gmail.com>
	<331B3AEF-9CA7-4639-A316-43DBB4A03E0D@dominion.thruhere.net>
	<4C82F39BABFE6A429733A300DEBF52240B76E4EE@DNCE05.ent.ti.com>
	<CADZ6=aspkP_NQy5j7-Jdsq0rXOmROrpt4AgCkkg_HXV=0a07VA@mail.gmail.com>
In-Reply-To: <CADZ6=aspkP_NQy5j7-Jdsq0rXOmROrpt4AgCkkg_HXV=0a07VA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] ti81xx-psp-linux-2.6.37: broken kernel with gcc > 4.5
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jun 2012 22:27:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gVGhpbG8sDQoNCj4NClRleGFzIEluc3RydW1lbnRzIExpbWl0ZWQsIDgwMCBQYXZpbGlv
biBEcml2ZSwgTm9ydGhhbXB0b24sIE5ONCA3WUwuIFJlZ2lzdGVyZWQgaW4gRW5nbGFuZCAmIFdh
bGVzIHVuZGVyIGNvbXBhbnkgbnVtYmVyIDAwNTc0MTAyDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+IEZyb206IFRoaWxvIEZyb21tIFttYWlsdG86ZnJvbW1AZHJlc2VhcmNoLWZlLmRl
XQ0KPiBTZW50OiAxOSBKdW5lIDIwMTIgMTU6NDMNCj4gVG86IE1vbmssIFJvZ2VyDQo+IENjOiBL
b2VuIEtvb2k7IG1ldGEtdGlAeW9jdG9wcm9qZWN0Lm9yZzsgb3BlbmVtYmVkZGVkLWRldmVsQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFttZXRhLXRpXSBbb2VdIHRpODF4
eC1wc3AtbGludXgtMi42LjM3OiBicm9rZW4ga2VybmVsIHdpdGggZ2NjID4gNC41DQo+DQo+IEhl
bGxvIFJvZ2VyLA0KPg0KPiA+PiA+Pj4+PiBzb3JyeSBmb3IgdGhlIGNyb3NzLXBvc3QgKG9wZW5l
bWJlZGRlZC1kZXZlbCwgbWV0YS10aSksIEkgdGhpbmsNCj4gPj4gPj4+Pj4gdGhpcyBhZmZlY3Rz
IGJvdGggcHJvamVjdHMgb25lIHdheSBvciB0aGUgb3RoZXIuDQo+ID4+ID4+Pj4+DQo+ID4+ID4+
Pj4+IFJlY2VudGx5LCBtZXRhLW9wZW5lbWJlZGRlZC90b29sY2hhaW4tbGF5ZXIgcmVtb3ZlZCBn
Y2MtNC41Lg0KPiA+PiA+Pj4+PiBUaGlzIG1lYW5zIHdpdGggb2UtY29yZSArIG1ldGEtb2UgeW91
IG5vdyBjYW4gY2hvb3NlIGJldHdlZW4NCj4gPj4gPj4+Pj4gZ2NjLTQuNiBhbmQgZ2NjLTQuNy4N
Cj4gPj4gPj4+Pj4gSG93ZXZlciwgYm90aCBjb21waWxlcnMgYnJlYWsgdGhlIGtlcm5lbCB3ZSdy
ZSB1c2luZw0KPiA+PiA+Pj4+PiAodGk4MXh4LXBzcC1saW51eC0yLjYuMzcpLg0KPiA+PiA+Pj4+
DQo+ID4+ID4+Pj4gV2hhdCBoYXBwZW5zIHdoZW4geW91IGRpc2FibGUgdGhlIG1haWxib3g/IEFJ
VUkgeW91IHNob3VsZG4ndA0KPiA+PiA+Pj4+IG5lZWQgdGhhdCBvbiBOZS9DZS4NCj4gPj4gPj4+
DQo+ID4+ID4+PiBIb3cgZG8gSSBkaXNhYmxlIHRoZSBtYWlsYm94Pw0KPiA+PiA+Pg0KPiA+PiA+
PiBJbiB0aGUgLmNvbmZpZw0KPiA+PiA+DQo+ID4+ID4gV2FpdCB3YWl0IHdhaXQsIGFjY29yZGlu
ZyB0byBkcml2ZXJzL3N0YWdpbmcvdGlkc3BicmlkZ2UvS2NvbmZpZyB3ZQ0KPiA+PiA+IG5lZWQg
T01BUF9NQk9YX0ZXSyAoaS5lLiAidGhlIG1haWxib3giKSBpbiBvcmRlciB0byB1c2UgdGhlIERT
UA0KPiA+PiA+IGJyaWRnZS4gRGlzYWJsaW5nIGl0IHdvdWxkIG1lYW4gY3V0dGluZyBvZmYgb3Vy
IERTUC4gTm8gd2F5Lg0KPiA+Pg0KPiA+PiBBcmUgeW91IGFjdHVhbGx5IHVzaW5nIGRzcGJyaWRn
ZT8gT3IgYXJlIHlvdSB1c2luZyBkc3BsaW5rIG9yIHN5c2xpbms/DQo+ID4+DQo+ID4+ID4+PiBX
aGF0IGRvIHlvdSBtZWFuIGJ5IE5lL0NlPw0KPiA+PiA+Pg0KPiA+PiA+PiBOZXRyYS9DZW50YXVy
dXMsIGRtODF4eCwgYzZhODF4eCwgYW0zOHh4LCBhbTM5eHggb3Igd2hhdGV2ZXIgVEkgaXMNCj4g
Pj4gY2FsbGluZyBpdCBub3dhZGF5cy4NCj4gPj4gPg0KPiA+PiA+IFdlJ3JlIG9uIGEgIlRJIERh
VmluY2kgRE04MTQ4IiwgZmVhdHVyaW5nIGEgY29ydGV4LWE4IGNvbWJpbmVkIHdpdGgNCj4gPj4g
PiBhIEM2NzR4IERTUC4NCj4gPj4NCj4gPj4gU28gYSBjZW50YXVydXMgZmFtaWx5IFNvQy4NCj4g
Pg0KPiA+IENhbiB5b3UgcHV0IHNvbWUgcHJpbnRrJ3MgaW4gb21hcF9tYm94X3JlZ2lzdGVyIChw
bGF0LW9tYXAvbWFpbGJveC5jKSB0byBwcmludCB0aGUgbGlzdCBvYmplY3RzLCBpbiBwYXJ0aWN1
bGFyIHRoZSBtYm94LT5uYW1lPw0KPiA+DQo+ID4gV291bGQgYWxzbyBiZSB1c2VmdWwgdG8gc2Vl
IHRoZSBzYW1lIGluIG9tYXBfbWJveF9nZXQoKSBiZWZvcmUgdGhlIGNhbGwgdG8gc3RyY21wKCku
DQo+DQo+IFNvIGRpZCB5b3UgcHV0IHlvdXIgcHJpbnRrcyBpbiB0aGVyZSBhbmQgdGhlbiBydW4g
dGhlIGNvZGU/IFdlcmUgeW91IGFibGUgdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZT8NCg0KSSdtIGFm
cmFpZCB0aGlzIGlzIG5vdCBhIHBsYXRmb3JtIHRoYXQgSSBhbSB3b3JraW5nIHdpdGggdW5mb3J0
dW5hdGVseSwgc28gSSdtIG5vdCBhYmxlIHRvIGhlbHAgZGlyZWN0bHkgd2l0aCB0aGlzIGlzc3Vl
LiAgTXkgcHJldmlvdXMgY29tbWVudHMgd2VyZSBpbiBhbiBhdHRlbXB0IHRvIHRyeSB0byBoZWxw
IHlvdSAob3Igb3RoZXJzKSB0byBwcm9ncmVzcyBmdXJ0aGVyIHdpdGggdGhlIGRlYnVnIG9mIHRo
aXMgaXNzdWUuDQoNCj4gUmVnYXJkcywNCj4gVGhpbG8NCj4gLS0NCj4gRGlwbC4tSW5nIChGSCkg
VGhpbG8gRnJvbW0sIE1TYy4sIEVtYmVkZGVkIFN5c3RlbXMgQXJjaGl0ZWN0IERSZXNlYXJjaCBG
YWhyemV1Z2VsZWt0cm9uaWsgR21iSCBPdHRvLVNjaG1pcmdhbC1TdHIuIDMsIEQtMTAzMTkgQmVy
bGluLCBHZXJtYW55DQo+IFRlbDogKzQ5ICgzMCkgNTE1IDkzMiAyMjggICBtYWlsdG86ZnJvbW1A
ZHJlc2VhcmNoLWZlLmRlDQo+IEZheDogKzQ5ICgzMCkgNTE1IDkzMiA3NyAgICBodHRwOi8vd3d3
LmRyZXNlYXJjaC5kZQ0KPiBBbXRzZ2VyaWNodDogQmVybGluIENoYXJsb3R0ZW5idXJnLCBIUkIg
MTMwMTIwIEIgVXN0Li1JRE5yLiBERTI3Mzk1MjA1OA0KPiBHZXNjaMOkZnRzZsO8aHJlcjogRHIu
IE0uIFdlYmVyLCBXLiBNw7ZnbGUNCg0K

