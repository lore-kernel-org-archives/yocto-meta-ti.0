Return-Path: <r-monk@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07EB4E013B7
	for <meta-ti@yoctoproject.org>; Fri, 18 May 2012 07:47:29 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4IElOBt010617;
	Fri, 18 May 2012 09:47:24 -0500
Received: from DNCE71.ent.ti.com (dnce71.ent.ti.com [137.167.131.20])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4IElOKn011172;
	Fri, 18 May 2012 09:47:24 -0500
Received: from DNCE05.ent.ti.com ([fe80::2868:e891:b6c7:394]) by
	DNCE71.ent.ti.com ([fe80::3dd1:4b04:86e6:bfd0%29]) with mapi id
	14.01.0323.003; Fri, 18 May 2012 16:47:23 +0200
From: "Monk, Roger" <r-monk@ti.com>
To: Thilo Fromm <fromm@dresearch-fe.de>, Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [meta-ti] [oe] ti81xx-psp-linux-2.6.37: broken kernel with gcc
	> 4.5
Thread-Index: AQHNNPVHjEiAG9HzJkacM3V/R2sPzpbPX68AgAAMOYCAAAOcAIAADVyAgAAi5RA=
Date: Fri, 18 May 2012 14:47:23 +0000
Message-ID: <4C82F39BABFE6A429733A300DEBF52240B76E56D@DNCE05.ent.ti.com>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
	<jp5gkp$2ip$1@dough.gmane.org>
	<CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
	<C1FD0ECD-98B9-4D93-8351-2A19519FFF2D@dominion.thruhere.net>
	<CADZ6=aux412Otdnf_YBJdJB1JUx2bD2sDXy7TNyaefHhq_YxtQ@mail.gmail.com>
	<331B3AEF-9CA7-4639-A316-43DBB4A03E0D@dominion.thruhere.net>
	<CADZ6=atZrjgogV7zopSvXEvev6kucn524KG-s3Au7ocQ-+Eyyw@mail.gmail.com>
In-Reply-To: <CADZ6=atZrjgogV7zopSvXEvev6kucn524KG-s3Au7ocQ-+Eyyw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] ti81xx-psp-linux-2.6.37: broken kernel with gcc	> 4.5
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
X-List-Received-Date: Fri, 18 May 2012 14:47:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBNYXkgMTgsIDIwMTIgYXQgMTU6NDA6MjUsIFRoaWxvIEZyb21tIHdyb3RlOg0KPiBD
YzogbWV0YS10aUB5b2N0b3Byb2plY3Qub3JnOw0KPiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW21ldGEtdGldIFtvZV0gdGk4MXh4LXBz
cC1saW51eC0yLjYuMzc6IGJyb2tlbiBrZXJuZWwNCj4gd2l0aCBnY2MgPiA0LjUNCj4NCj4gSGVs
bG8gS29lbiwNCj4NCj4gPj4+Pj4+IHNvcnJ5IGZvciB0aGUgY3Jvc3MtcG9zdCAob3BlbmVtYmVk
ZGVkLWRldmVsLCBtZXRhLXRpKSwgSSB0aGluaw0KPiA+Pj4+Pj4gdGhpcyBhZmZlY3RzIGJvdGgg
cHJvamVjdHMgb25lIHdheSBvciB0aGUgb3RoZXIuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gUmVjZW50
bHksIG1ldGEtb3BlbmVtYmVkZGVkL3Rvb2xjaGFpbi1sYXllciByZW1vdmVkIGdjYy00LjUuDQo+
IFRoaXMNCj4gPj4+Pj4+IG1lYW5zIHdpdGggb2UtY29yZSArIG1ldGEtb2UgeW91IG5vdyBjYW4g
Y2hvb3NlIGJldHdlZW4gZ2NjLTQuNg0KPiBhbmQgZ2NjLTQuNy4NCj4gPj4+Pj4+IEhvd2V2ZXIs
IGJvdGggY29tcGlsZXJzIGJyZWFrIHRoZSBrZXJuZWwgd2UncmUgdXNpbmcNCj4gPj4+Pj4+ICh0
aTgxeHgtcHNwLWxpbnV4LTIuNi4zNykuDQo+ID4+Pj4+DQo+ID4+Pj4+IFdoYXQgaGFwcGVucyB3
aGVuIHlvdSBkaXNhYmxlIHRoZSBtYWlsYm94PyBBSVVJIHlvdSBzaG91bGRuJ3QNCj4gbmVlZA0K
PiA+Pj4+PiB0aGF0IG9uIE5lL0NlLg0KPiA+Pj4+DQo+ID4+Pj4gSG93IGRvIEkgZGlzYWJsZSB0
aGUgbWFpbGJveD8NCj4gPj4+DQo+ID4+PiBJbiB0aGUgLmNvbmZpZw0KPiA+Pg0KPiA+PiBXYWl0
IHdhaXQgd2FpdCwgYWNjb3JkaW5nIHRvIGRyaXZlcnMvc3RhZ2luZy90aWRzcGJyaWRnZS9LY29u
ZmlnIHdlDQo+ID4+IG5lZWQgT01BUF9NQk9YX0ZXSyAoaS5lLiAidGhlIG1haWxib3giKSBpbiBv
cmRlciB0byB1c2UgdGhlIERTUA0KPiA+PiBicmlkZ2UuIERpc2FibGluZyBpdCB3b3VsZCBtZWFu
IGN1dHRpbmcgb2ZmIG91ciBEU1AuIE5vIHdheS4NCj4gPg0KPiA+IEFyZSB5b3UgYWN0dWFsbHkg
dXNpbmcgZHNwYnJpZGdlPyBPciBhcmUgeW91IHVzaW5nIGRzcGxpbmsgb3INCj4gc3lzbGluaz8N
Cj4NCj4gTm8sIEkgd2FzIHdyb25nLiBPTUFQX01CT1hfRldLIGlzIGZvcmNlZCB0byAiWSIgaW4g
b3VyIGNvbmZpZyBhbmQgSQ0KPiB0aG91Z2h0IERTUEJSSURHRSBmb3JjZWQgdGhpcy4gQnV0IERT
UEJSSURHRSBpc24ndCBldmVuIGFjdGl2ZSBpbiBvdXINCj4gY29uZmlndXJhdGlvbi4gSSBjYW5u
b3QgdHVybiBPTUFQX01CT1hfRldLIG9mZiwgaXQncyBmb3JjZWQgdG8gWSwgYW5kDQo+IEknbSBj
dXJyZW50bHkgdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgd2hpY2ggcGFydCBvZiB0aTgxeHgtcHNwLWxp
bnV4LQ0KPiAyLjYuMzcncyB3aWNrZWQgY29uZmlndXJhdGlvbiBpcyBjYXVzaW5nIHRoaXMuDQoN
CkNPTkZJR19TWVNMSU5LX05PVElGWSB0dXJucyB0aGlzIG9uLiAgU3lzbGluayB1c2VzIHRoZSBz
YW1lIG1ib3ggaW5mcmFzdHJ1Y3R1cmUuDQoNCj4NCj4gPj4+PiBXaGF0IGRvIHlvdSBtZWFuIGJ5
IE5lL0NlPw0KPiA+Pj4NCj4gPj4+IE5ldHJhL0NlbnRhdXJ1cywgZG04MXh4LCBjNmE4MXh4LCBh
bTM4eHgsIGFtMzl4eCBvciB3aGF0ZXZlciBUSSBpcw0KPiBjYWxsaW5nIGl0IG5vd2FkYXlzLg0K
PiA+Pg0KPiA+PiBXZSdyZSBvbiBhICJUSSBEYVZpbmNpIERNODE0OCIsIGZlYXR1cmluZyBhIGNv
cnRleC1hOCBjb21iaW5lZCB3aXRoDQo+IGENCj4gPj4gQzY3NHggRFNQLg0KPiA+DQo+ID4gU28g
YSBjZW50YXVydXMgZmFtaWx5IFNvQy4NCj4NCj4gVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlv
biA6KSBUSSBkaWRuJ3QgYXBwcm9hY2ggdXMgd2l0aCBhbnkgb2YgdGhlDQo+IHRlcm1zIHlvdSBt
ZW50aW9uZWQuIEl0J3MganVzdCBEYVZpbmNpIGZvciB0aGVtIHdoZW4gdGhleSdyZSB0YWxraW5n
DQo+IHdpdGggdXMuDQo+DQo+ID4NCj4gPj4gSSB0aGluayB0aGUgb25seSBvbmVzIGxlZnQgd2l0
aG91dCBEU1BzIGFyZSBBTS0uLi4NCj4gPj4gcHJvY2Vzc29ycy4gU28gbm8sIHRoZSBEU1AgYnJp
ZGdlIChhbmQgdGhlcmVmb3JlIG1haWxib3hpbmcpIG11c3QNCj4gPj4gc3RheS4NCj4gPg0KPiA+
IFNlZSB3aGF0IEkgc2FpZCBhYm92ZSwgSSBkb3VidCB5b3UncmUgdXNpbmcgZHNwYnJpZGdlLg0K
Pg0KPiBZb3UgbWF5IGJlIHJpZ2h0OyBJIGRpZG4ndCBkaWcgaW50byBEU1AgY29tbXVuaWNhdGlv
biBzbyBmYXIuIEFsc28sDQo+IERTUEJSSURHRSBkZXBlbmRzIG9uIE9NQVAzLCB3aGljaCB3ZSBk
b24ndCBoYXZlIChkbTgxNDggaXMgYQ0KPiAiT01BUDJQTFVTIikuIFNvIEkgd2FzIHdyb25nIHdp
dGggRFNQQlJJREdFIGZvcmNpbmcgT01BUF9NQk9YX0ZXSy4NCj4gT01BUF9NQk9YX0ZXSyBpcyBq
dXN0IGFjdGl2ZSBhbmQgSSBjYW4ndCBzd2l0Y2ggaXQgb2ZmLg0KPg0KPiBSZWdhcmRzLA0KPiBU
aGlsbw0KPg0KPiAtLQ0KPiBEaXBsLi1JbmcgKEZIKSBUaGlsbyBGcm9tbSwgTVNjLiwgRW1iZWRk
ZWQgU3lzdGVtcyBBcmNoaXRlY3QgRFJlc2VhcmNoDQo+IEZhaHJ6ZXVnZWxla3Ryb25payBHbWJI
IE90dG8tU2NobWlyZ2FsLVN0ci4gMywgRC0xMDMxOSBCZXJsaW4sIEdlcm1hbnkNCj4gVGVsOiAr
NDkgKDMwKSA1MTUgOTMyIDIyOCAgIG1haWx0bzpmcm9tbUBkcmVzZWFyY2gtZmUuZGUNCj4gRmF4
OiArNDkgKDMwKSA1MTUgOTMyIDc3ICAgIGh0dHA6Ly93d3cuZHJlc2VhcmNoLmRlDQo+IEFtdHNn
ZXJpY2h0OiBCZXJsaW4gQ2hhcmxvdHRlbmJ1cmcsIEhSQiAxMzAxMjAgQiBVc3QuLUlETnIuDQo+
IERFMjczOTUyMDU4DQo+IEdlc2Now6RmdHNmw7xocmVyOiBEci4gTS4gV2ViZXIsIFcuIE3Dtmds
ZQ0KPg0KVGV4YXMgSW5zdHJ1bWVudHMgTGltaXRlZCwgODAwIFBhdmlsaW9uIERyaXZlLCBOb3J0
aGFtcHRvbiwgTk40IDdZTC4gUmVnaXN0ZXJlZCBpbiBFbmdsYW5kICYgV2FsZXMgdW5kZXIgY29t
cGFueSBudW1iZXIgMDA1NzQxMDINCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4gbWV0YS10aSBtYWlsaW5nIGxpc3QNCj4gbWV0YS10aUB5b2N0b3By
b2plY3Qub3JnDQo+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9saXN0aW5mby9tZXRh
LXRpDQoNCg0KDQo=

