Return-Path: <b.bimmermann@yahoo.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51C55E00D66; Sat, 12 Sep 2015 02:13:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (b.bimmermann[at]yahoo.de)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [212.82.97.62 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from nm28-vm2.bullet.mail.ir2.yahoo.com
	(nm28-vm2.bullet.mail.ir2.yahoo.com [212.82.97.62])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67323E00B37
	for <meta-ti@yoctoproject.org>; Sat, 12 Sep 2015 02:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
	t=1442049204; bh=LajvoI3SKWUbclhNoCRNm5BPHIDn+P9GL4ojXU/aFRI=;
	h=Date:Subject:In-Reply-To:From:To:Cc:From:Subject;
	b=m5Pneu4HJYFxebMJc+tW+YOYMArjF9GcUeLaV0qcXi87zqYK8d7gRAWEY7kGzacXm1MbEoNDrV/8MFxbmUG+iJdZRPW8k3G/1bV2Ku+kDt2FLDgFlP7LTAzcWLbzFPA/Wihj0/gUIId5X6GQJ2QTM43W0v8QeNjHG/KmuVdRH5HKh3xqvobsrXvq3e8IvjKe6xk4qtTGdng1Yb7XJeq9f4Vm9X1N7P1X8p33RQLZt8l9bf5E8xfOsEXQVc8HKbTfabvCWooVKvFwZw3HqxJ2pth7e3cC38AkXocQgBCzoM7/hTWI4P4+E71Fay6XVy1URBQt0OGPTsamYwrJuEzacw==
Received: from [212.82.98.63] by nm28.bullet.mail.ir2.yahoo.com with NNFMP;
	12 Sep 2015 09:13:24 -0000
Received: from [46.228.39.107] by tm16.bullet.mail.ir2.yahoo.com with NNFMP;
	12 Sep 2015 09:13:24 -0000
Received: from [127.0.0.1] by smtp144.mail.ir2.yahoo.com with NNFMP;
	12 Sep 2015 09:13:24 -0000
X-Yahoo-Newman-Id: 147653.88352.bm@smtp144.mail.ir2.yahoo.com
X-Yahoo-Newman-Property: ymail-3
X-YMail-OSG: FScvv7EVM1mCGAxyQGpegoGvn8X0DzQUVBL4f4QTVUCFrUn
	m3URPqr93etBLZhkzWSAbhn27OcGL.BlHa2WIIg0_nXh8wDLEmKvLAgmkvVg
	C5K.XDZhOoSkmfbEQ4zgeSKmppDL1wc_mRx9u36PokkZfMcLbRdp79T6isEV
	IICtoBQKQJTldcPPDPj5K1oglW_VZgaO3eZBHGvz7hYIKyMlkhRFOExdXrgR
	Jv4EedSGvi8hsEaA4B5GWo0PAbE4rcASxmJGIdoWs5L76dm9aVFxt7vB3VQX
	g07zVSgiv8NqbUd1HtC.ZJCO99wEjlRjj1OEHXHuA8S3RCfKkxdSN.PC1Kgk
	MxHAGq2qoIpIPntvirbR7sf9X4FGIGaAG8VPCAnLjcWWrWw8k3Owj09_AOs2
	1l8W2jacYLsXiONDQgCOHp4Dp6vSYXL3ej95rlYHbYSwtRVAiuadSqNeex3E
	mKmIEeSFqFyPm7qWavmwpeQdNDc9q2J6Kg.oP0Co6aMsKofuO5TPgEioqNT7
	DlVNrk2KIE5Qg9wCpkZysgcsnuuDAL8IAjKQlurUZ3h3wAioZ4oEpp4UW35U
	xzWNforbG3SYT
X-Yahoo-SMTP: QRtRgFiswBDPIjAPyRh4GXvXyYhlMyXtnw--
Date: Sat, 12 Sep 2015 11:13:21 +0200
Message-ID: <14159d41-dd91-48ee-92e4-bea3be6cd68d@email.android.com>
X-Android-Message-ID: <14159d41-dd91-48ee-92e4-bea3be6cd68d@email.android.com>
In-Reply-To: <20150911183957.GP18085@edge>
From: Benjamin Bimmermann <b.bimmermann@yahoo.de>
To: Denys Dmytriyenko <denys@ti.com>
MIME-Version: 1.0
Cc: meta-ti@yoctoproject.org
Subject: Re: Graphics_SDK_setuplinux_hardfp_5_01_01_02.bin | checksum mismatch
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
X-List-Received-Date: Sat, 12 Sep 2015 09:13:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SSAgaGF2ZSByZWRvd25sb2FkZWQgdGhlIGxheWVyIGFuZCByZWJ1aWxkIHRoZSBJbWFnZS4gTm93
IGV2ZXJ5dGhpbmcgd29ya3MgZmluZS4KCkRvbid0IGtub3cgd2h5IEkgaGFzIHRoaXMgZXJyb3Iu
IAoKVGhhbmtzIGZvciB5b3VyIHJlc3BvbnNlLiAKCkFtIDExLjA5LjIwMTUgMjA6Mzkgc2Nocmll
YiBEZW55cyBEbXl0cml5ZW5rbyA8ZGVueXNAdGkuY29tPjoKPgo+IFNvbWV0aGluZyBpcyB3cm9u
ZyBvbiB5b3VyIGVuZCwgdGhlcmUgd2VyZSBubyBjaGVja3N1bSBjaGFuZ2VzOiAKPgo+ICQgd2dl
dCBodHRwOi8vc29mdHdhcmUtZGwudGkuY29tL2RzcHMvZHNwc19wdWJsaWNfc3cvZ2Z4c2RrLzVf
MDFfMDFfMDIvZXhwb3J0cy9HcmFwaGljc19TREtfc2V0dXBsaW51eF9oYXJkZnBfNV8wMV8wMV8w
Mi5iaW4gCj4gJCBtZDVzdW0gR3JhcGhpY3NfU0RLX3NldHVwbGludXhfaGFyZGZwXzVfMDFfMDFf
MDIuYmluIAo+IDk0YmNiMzFlYTdlYjUwZGYxZGZhNDAzNzA1NWI2MzhlwqAgR3JhcGhpY3NfU0RL
X3NldHVwbGludXhfaGFyZGZwXzVfMDFfMDFfMDIuYmluIAo+Cj4KPgo+IE9uIEZyaSwgU2VwIDEx
LCAyMDE1IGF0IDA5OjA1OjQyQU0gKzAwMDAsIEJlbmphbWluIEJpbW1lcm1hbm4gd3JvdGU6IAo+
ID4gSGVsbG8sIAo+ID4gSSBoYXZlIGEgY2hlY2tzdW0gbWlzbWF0Y2guIEhhdmUgeW91IHVwZ3Jh
ZGUgdG8gYSBuZXcgVmVyc2lvbiB3aXRob3V0IGNoYW5nZSB0aGUgY2hlY2tzdW0gPyAKPiA+IFNl
Y29uZCBxdWVzdGlvbiA6IElmIHlvdSBoYXZlIHVwZGF0ZSB0aGUgb21hcDMsIGhhcyBvbWFwMyBu
b3cgV2F5bGFuZCBzdXBwb3J0IGFuZCBpcyBvbWFwMyBub3cgcmVhZHkgZm9yIHRoZSBLZXJuZWwg
NC4xLlggPyAKPiA+IEhhdmUgYSBuaWNlIGRheS4gCj4gPiAKPiA+IGxvZyA6IAo+ID4gV0FSTklO
RzogUmVuYW1pbmcgRElSL2J1aWxkX25ldy9kb3dubG9hZHMvR3JhcGhpY3NfU0RLX3NldHVwbGlu
dXhfaGFyZGZwXzVfMDFfMDFfMDIuYmluIHRvIERJUi9idWlsZF9uZXcvZG93bmxvYWRzL0dyYXBo
aWNzX1NES19zZXR1cGxpbnV4X2hhcmRmcF81XzAxXzAxXzAyLmJpbl9iYWQtY2hlY2tzdW1fZTcx
YmMwZDY4MDQ4ZjVmOWYxN2M2ZWM4OTllM2M5ZjQgCj4gPiBFUlJPUjogRmV0Y2hlciBmYWlsdXJl
IGZvciBVUkw6ICdodHRwOi8vc29mdHdhcmUtZGwudGkuY29tL2RzcHMvZHNwc19wdWJsaWNfc3cv
Z2Z4c2RrLzVfMDFfMDFfMDIvZXhwb3J0cy9HcmFwaGljc19TREtfc2V0dXBsaW51eF9oYXJkZnBf
NV8wMV8wMV8wMi5iaW4nLiBDaGVja3N1bSBtaXNtYXRjaCEgCj4gPiBGaWxlOiAnRElSL2J1aWxk
X25ldy9kb3dubG9hZHMvR3JhcGhpY3NfU0RLX3NldHVwbGludXhfaGFyZGZwXzVfMDFfMDFfMDIu
YmluJyBoYXMgbWQ1IGNoZWNrc3VtIGU3MWJjMGQ2ODA0OGY1ZjlmMTdjNmVjODk5ZTNjOWY0IHdo
ZW4gOTRiY2IzMWVhN2ViNTBkZjFkZmE0MDM3MDU1YjYzOGUgd2FzIGV4cGVjdGVkIAo+ID4gRmls
ZTogJ0RJUi9idWlsZF9uZXcvZG93bmxvYWRzL0dyYXBoaWNzX1NES19zZXR1cGxpbnV4X2hhcmRm
cF81XzAxXzAxXzAyLmJpbicgaGFzIHNoYTI1NiBjaGVja3N1bSBlNzJlMWViNTEyY2I2NmE1Mzkw
YjY3NWE5MDIyOGE3NjJkMDI2ZTcxZmExYmIyZjExZjIzNWQ5MTk4NjQ1Mjc3IHdoZW4gNTQ2NDEy
MjJjZGI0OWIwM2Y5OTZjYmQ2NDEyZGUyMjcxOThkOWUwODRmNTY0N2Q3MDZiYmY0MjE3ZThjZGIw
NyB3YXMgZXhwZWN0ZWQgCj4gPiBJZiB0aGlzIGNoYW5nZSBpcyBleHBlY3RlZCAoZS5nLiB5b3Ug
aGF2ZSB1cGdyYWRlZCB0byBhIG5ldyB2ZXJzaW9uIHdpdGhvdXQgdXBkYXRpbmcgdGhlIGNoZWNr
c3VtcykgdGhlbiB5b3UgY2FuIHVzZSB0aGVzZSBsaW5lcyB3aXRoaW4gdGhlIHJlY2lwZTogCj4g
PiBTUkNfVVJJW21kNXN1bV0gPSAiZTcxYmMwZDY4MDQ4ZjVmOWYxN2M2ZWM4OTllM2M5ZjQiIAo+
ID4gU1JDX1VSSVtzaGEyNTZzdW1dID0gImU3MmUxZWI1MTJjYjY2YTUzOTBiNjc1YTkwMjI4YTc2
MmQwMjZlNzFmYTFiYjJmMTFmMjM1ZDkxOTg2NDUyNzciIAo+ID4gT3RoZXJ3aXNlIHlvdSBzaG91
bGQgcmV0cnkgdGhlIGRvd25sb2FkIGFuZC9vciBjaGVjayB3aXRoIHVwc3RyZWFtIHRvIGRldGVy
bWluZSBpZiB0aGUgZmlsZSBoYXMgYmVjb21lIGNvcnJ1cHRlZCBvciBvdGhlcndpc2UgdW5leHBl
Y3RlZGx5IG1vZGlmaWVkLiAKPiA+IAo+ID4gRVJST1I6IEZ1bmN0aW9uIGZhaWxlZDogRmV0Y2hl
ciBmYWlsdXJlIGZvciBVUkw6ICdodHRwOi8vc29mdHdhcmUtZGwudGkuY29tL2RzcHMvZHNwc19w
dWJsaWNfc3cvZ2Z4c2RrLzVfMDFfMDFfMDIvZXhwb3J0cy9HcmFwaGljc19TREtfc2V0dXBsaW51
eF9oYXJkZnBfNV8wMV8wMV8wMi5iaW4nLiBVbmFibGUgdG8gZmV0Y2ggVVJMIGZyb20gYW55IHNv
dXJjZS4gCj4gPiBFUlJPUjogTG9nZmlsZSBvZiBmYWlsdXJlIHN0b3JlZCBpbjogRElSL2J1aWxk
X25ldy90bXAvd29yay9iZWFnbGVib25lLXBva3ktbGludXgtZ251ZWFiaS9vbWFwMy1zZ3gtbW9k
dWxlcy81LjAxLjAxLjAyLXIyMmIvdGVtcC9sb2cuZG9fZmV0Y2guMjIzMjQgCj4gPiBFUlJPUjog
VGFzayAyOTE4IChESVIvbWV0YS10aS9yZWNpcGVzLWJzcC9wb3dlcnZyLWRyaXZlcnMvb21hcDMt
c2d4LW1vZHVsZXNfNS4wMS4wMS4wMi5iYiwgZG9fZmV0Y2gpIGZhaWxlZCB3aXRoIGV4aXQgY29k
ZSAnMScgCj4gPiBOT1RFOiBUYXNrcyBTdW1tYXJ5OiBBdHRlbXB0ZWQgMTE0NiB0YXNrcyBvZiB3
aGljaCAwIGRpZG4ndCBuZWVkIHRvIGJlIHJlcnVuIGFuZCAxIGZhaWxlZC4gCj4gPiBXYWl0aW5n
IGZvciAwIHJ1bm5pbmcgdGFza3MgdG8gZmluaXNoOiAKPiA+IAo+ID4gU3VtbWFyeTogMSB0YXNr
IGZhaWxlZDogCj4gPiDCoCBESVIvbWV0YS10aS9yZWNpcGVzLWJzcC9wb3dlcnZyLWRyaXZlcnMv
b21hcDMtc2d4LW1vZHVsZXNfNS4wMS4wMS4wMi5iYiwgZG9fZmV0Y2ggCj4gPiAK


