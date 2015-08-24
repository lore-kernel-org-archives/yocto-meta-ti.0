Return-Path: <b.bimmermann@yahoo.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D32C7E00C00; Mon, 24 Aug 2015 15:28:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (b.bimmermann[at]yahoo.de)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [212.82.96.202 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from nm15-vm5.bullet.mail.ir2.yahoo.com
	(nm15-vm5.bullet.mail.ir2.yahoo.com [212.82.96.202])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18C35E00BBA
	for <meta-ti@yoctoproject.org>; Mon, 24 Aug 2015 15:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
	t=1440455313; bh=YTvE/p3pi+NZP4eEcVzBkketyvk+kgpqG6+xNZpf+9c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From:Subject;
	b=ObZSGETRm13AOqAaOW4oVi5p5TGgxG5mX72mZU6gNCkLYQlsN5ofd3/ByPMT4xltmyqtaGd09bpOMTQG4EC9oTfRfQxt54aYEOrn4+kLKY0tulaL92PvnT7fcKEXrnMgtSQjqH4jO65jZB3TeJTiBZWYLC7xVbOEV/nLVSJk6aqgKGv+PcvkhhBZUEDpWXLNZMimyTOYJ+FAHT0SSoYMZ0PR2heGK+Y6+jbpjcX1yVrzUxDpYtnDwvuJL1PgdJm6HBb68lrcsE3Pq7lU9CTKzbi/ev873SR/WecUF6VVmTWlipGgRiL4tGS0Z4/Eulp+gJJx+a2qcm6R7r+xYufHrg==
Received: from [212.82.98.124] by nm15.bullet.mail.ir2.yahoo.com with NNFMP;
	24 Aug 2015 22:28:33 -0000
Received: from [46.228.39.103] by tm17.bullet.mail.ir2.yahoo.com with NNFMP;
	24 Aug 2015 22:28:33 -0000
Received: from [127.0.0.1] by smtp140.mail.ir2.yahoo.com with NNFMP;
	24 Aug 2015 22:28:33 -0000
X-Yahoo-Newman-Id: 413781.59107.bm@smtp140.mail.ir2.yahoo.com
Message-ID: <413781.59107.bm@smtp140.mail.ir2.yahoo.com>
X-Yahoo-Newman-Property: ymail-3
X-YMail-OSG: 8Wvws3kVM1nd4yCyGwTVmIvX0D0._nZMTwIxLPIumWDCziN
	m50ScvSc_U5VBtPFHc5sWdbpO7DQhSUyzXFv8qupHdes8v3jkUQKEvTSm8zN
	pZSrw0D0OvWBLZzX_LKBJsXLTga_8EasYnd1Jhmfw4GES41HN8i9MA1yqpOU
	6DiAhr2Cz9d8.XJlM4Twt5bYWergpVy6NSosKMjMdp5bP6Sz.HK2uznQ4JEf
	gzRpY68laX30uiy41OLD8HaPcQbUk08epRjpssfpJ4uaaPtsOotlWYW2tTxf
	.AkakZGzGcFPZ7pMIQ9i7al5usHt_6kGkneVSEFut9fmYCXsZbaaaTUScoM6
	5qynpt38KKX1P78pzm65VGqEuPcOiLUcSPQxuzBP0WzFi0vSWWJftQIzeWrm
	liQIVKb8zKwYR_Bdbykvx5VZhfhCW4yZNrOQOwDirydnS.yno.1gREBcNztO
	wUSePVAZZeGbF6wujntgW2t5wfMR3jNUAES8LQnmJKhM8CgwKzCuIPOzFF8t
	98ww30y3.S3MqPE_fJXGTI0g8mDaoxmi8El4H4fhUYjXmiuxJ4HdUTpGzkfK
	cFDKQlW_bdNWZLpu8LLiAF_tTEVdhU9wHYjg8dQivSB1Q5HVfIbCNbXWpis.
	NtnRxyZRpB022mQ--
X-Yahoo-SMTP: QRtRgFiswBDPIjAPyRh4GXvXyYhlMyXtnw--
MIME-Version: 1.0
From: <b.bimmermann@yahoo.de>
To: =?utf-8?Q?Denys_Dmytriyenko?= <denys@ti.com>, 
	=?utf-8?Q?Robert_Nelson?= <robertcnelson@gmail.com>
Importance: Normal
Date: Mon, 24 Aug 2015 22:14:35 +0000
In-Reply-To: <20150824195017.GY6542@edge>
References: <20150818221434.GH6542@edge>
	<2062145486.7469712.1439977584428.JavaMail.yahoo@mail.yahoo.com>
	<CAOCHtYjt6i2WpvrtfBE7sTkWi-xW-UN=-z42F6BGXwGijcfPBg@mail.gmail.com>
	<20150824193527.GW6542@edge>
	<CAOCHtYiNgvSgz3p2zC+AdGevGaOEQ98qqFvw6HDQW+rhsd05Kg@mail.gmail.com>,
	<20150824195017.GY6542@edge>
Cc: "=?utf-8?Q?meta-ti@yoctoproject.org?=" <meta-ti@yoctoproject.org>
Subject: Re: libgles-omap3 error | BeagleBoneBlack | sgx-omap.h: No such file or directory
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
X-List-Received-Date: Mon, 24 Aug 2015 22:28:38 -0000
Content-Type: multipart/alternative;
	boundary="_BD034D02-B72D-45F3-AA2B-142CBB69333E_"

--_BD034D02-B72D-45F3-AA2B-142CBB69333E_
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"

PlRoaXMgd29yayBpcyBjb21pbmcgd2l0aGluIG5leHQgZmV3IHdlZWtzIGFuZCBpdCB3aWxsIGJl
IGEgcmVwbGFjZW1lbnQgZm9yIA0KPmxpYmdsZXMtb21hcDMuDQo+DQo+LS0gDQo+RGVueXMNCg0K
DQoNClRoYW5rcyBmb3IgdGhhdCBJbmZvcm1hdGlvbi4gDQoNCk1heWJlIHRoYXQgaXMgYSBzdHVw
aWQgcXVlc3Rpb24sIGJ1dCB5b3Ugc2F5IHRoYXQgaXQgd2lsbCByZXBsYWNlIGxpYmdsZXMtb21h
cDMuIA0KDQpDYW4geW91IG1heWJlIHRlbGwgbWUgdGhlIG5ldyBuYW1lLCBzbyBJIGNhbiBtYWtl
IGFuIEUtTWFpbCBmaWx0ZXIgZm9yIHRoYXQuDQoNCg0KDQo+ID4+DQo+ID4+IGh0dHBzOi8vZ2l0
aHViLmNvbS9Sb2JlcnRDTmVsc29uL3RpLWxpbnV4LWtlcm5lbC1kZXYvdHJlZS90aS1saW51eC00
LjEueS9wYXRjaGVzL3NneA0KPiA+DQoNCg0KVGhhbmtzIGEgbG90IGZvciB0aGF0LiBJIHdpbGwg
dHJ5IGl0IGFzIHNvb24gYXMgcG9zc2libGUuDQoNCkNhbiB5b3UgcG9zc2libGUgaGVscCBtZSB0
byBhZGQgaXQgdG8gYSB5b2N0by1idWlsZC4NCg0KSSB0aGluayBpIG11c3QgY3JlYXRlIGEgbGF5
ZXIgYW5kIHRoZW4g4oCmID8g4oCmIEkgd2lsbCBHb29nbGUg4oCmLi4gOz0pDQoNCklmIHlvdSBj
YW4gaGVscCBtZSwgaXQgd291bGQgYmUgc28gbmljZS4NCg0KDQoNClRIQU5LIFlPVSBBTEwgQSBM
T1QgISEhISEhDQpUSEFOS1Mh

--_BD034D02-B72D-45F3-AA2B-142CBB69333E_
Content-Transfer-Encoding: base64
Content-Type: text/html; charset="utf-8"

CjxodG1sPgo8aGVhZD4KPG1ldGEgbmFtZT0iZ2VuZXJhdG9yIiBjb250ZW50PSJXaW5kb3dzIE1h
aWwgMTcuNS45NjAwLjIwOTExIj4KPHN0eWxlIHR5cGU9InRleHQvY3NzIj48IS0taHRtbCB7IGZv
bnQtZmFtaWx5OiAiQ29sb3IgRW1vamkiLCAiQ2FsaWJyaSIsICJTZWdvZSBVSSIsICJNZWlyeW8i
LCAiTWljcm9zb2Z0IFlhSGVpIFVJIiwgIk1pY3Jvc29mdCBKaGVuZ0hlaSBVSSIsICJNYWxndW4g
R290aGljIiwgInNhbnMtc2VyaWYiOyB9LS0+PC9zdHlsZT48c3R5bGUgZGF0YS1leHRlcm5hbHN0
eWxlPSJ0cnVlIj48IS0tCnAuTXNvTGlzdFBhcmFncmFwaCwgbGkuTXNvTGlzdFBhcmFncmFwaCwg
ZGl2Lk1zb0xpc3RQYXJhZ3JhcGggewptYXJnaW4tdG9wOjBpbjsKbWFyZ2luLXJpZ2h0OjBpbjsK
bWFyZ2luLWJvdHRvbTowaW47Cm1hcmdpbi1sZWZ0Oi41aW47Cm1hcmdpbi1ib3R0b206LjAwMDFw
dDsKfQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNvTm9ybWFsIHsKbWFyZ2luOjBp
bjsKbWFyZ2luLWJvdHRvbTouMDAwMXB0Owp9CnAuTXNvTGlzdFBhcmFncmFwaEN4U3BGaXJzdCwg
bGkuTXNvTGlzdFBhcmFncmFwaEN4U3BGaXJzdCwgZGl2Lk1zb0xpc3RQYXJhZ3JhcGhDeFNwRmly
c3QsIApwLk1zb0xpc3RQYXJhZ3JhcGhDeFNwTWlkZGxlLCBsaS5Nc29MaXN0UGFyYWdyYXBoQ3hT
cE1pZGRsZSwgZGl2Lk1zb0xpc3RQYXJhZ3JhcGhDeFNwTWlkZGxlLCAKcC5Nc29MaXN0UGFyYWdy
YXBoQ3hTcExhc3QsIGxpLk1zb0xpc3RQYXJhZ3JhcGhDeFNwTGFzdCwgZGl2Lk1zb0xpc3RQYXJh
Z3JhcGhDeFNwTGFzdCB7Cm1hcmdpbi10b3A6MGluOwptYXJnaW4tcmlnaHQ6MGluOwptYXJnaW4t
Ym90dG9tOjBpbjsKbWFyZ2luLWxlZnQ6LjVpbjsKbWFyZ2luLWJvdHRvbTouMDAwMXB0OwpsaW5l
LWhlaWdodDoxMTUlOwp9Ci0tPjwvc3R5bGU+PC9oZWFkPgo8Ym9keSBkaXI9Imx0ciI+CjxkaXYg
ZGF0YS1leHRlcm5hbHN0eWxlPSJmYWxzZSIgZGlyPSJsdHIiIHN0eWxlPSJmb250LWZhbWlseTog
J0NhbGlicmknLCAnU2Vnb2UgVUknLCAnTWVpcnlvJywgJ01pY3Jvc29mdCBZYUhlaSBVSScsICdN
aWNyb3NvZnQgSmhlbmdIZWkgVUknLCAnTWFsZ3VuIEdvdGhpYycsICdzYW5zLXNlcmlmJztmb250
LXNpemU6MTJwdDsiPjxkaXY+Jmd0O1RoaXMgd29yayBpcyBjb21pbmcgd2l0aGluIG5leHQgZmV3
IHdlZWtzIGFuZCBpdCB3aWxsIGJlIGEgcmVwbGFjZW1lbnQgZm9yIDxicj4mZ3Q7bGliZ2xlcy1v
bWFwMy48YnI+Jmd0Ozxicj4mZ3Q7LS0gPGJyPiZndDtEZW55czxicj48L2Rpdj48ZGl2IGRhdGEt
c2lnbmF0dXJlYmxvY2s9InRydWUiPjxicj48L2Rpdj48ZGl2IGRhdGEtc2lnbmF0dXJlYmxvY2s9
InRydWUiPlRoYW5rcyBmb3IgdGhhdCBJbmZvcm1hdGlvbi4gPC9kaXY+PGRpdiBkYXRhLXNpZ25h
dHVyZWJsb2NrPSJ0cnVlIj5NYXliZSB0aGF0IGlzIGEgc3R1cGlkIHF1ZXN0aW9uLCBidXQmbmJz
cDt5b3Ugc2F5IHRoYXQgaXQmbmJzcDt3aWxsIHJlcGxhY2UgbGliZ2xlcy1vbWFwMy4gPC9kaXY+
PGRpdiBkYXRhLXNpZ25hdHVyZWJsb2NrPSJ0cnVlIj5DYW4geW91IG1heWJlIHRlbGwgbWUgdGhl
IG5ldyBuYW1lLCBzbyBJIGNhbiBtYWtlIGFuIEUtTWFpbCBmaWx0ZXIgZm9yIHRoYXQuPC9kaXY+
PGRpdiBkYXRhLXNpZ25hdHVyZWJsb2NrPSJ0cnVlIj48YnI+PC9kaXY+PGRpdiBkYXRhLXNpZ25h
dHVyZWJsb2NrPSJ0cnVlIj48YnI+PC9kaXY+PGRpdiBkYXRhLXNpZ25hdHVyZWJsb2NrPSJ0cnVl
Ij4mZ3Q7ICZndDsmZ3Q7PGJyPiZndDsgJmd0OyZndDsgaHR0cHM6Ly9naXRodWIuY29tL1JvYmVy
dENOZWxzb24vdGktbGludXgta2VybmVsLWRldi90cmVlL3RpLWxpbnV4LTQuMS55L3BhdGNoZXMv
c2d4PGJyPiZndDsgJmd0OzwvZGl2PjxkaXYgZGF0YS1zaWduYXR1cmVibG9jaz0idHJ1ZSI+PGJy
PjwvZGl2PjxkaXYgZGF0YS1zaWduYXR1cmVibG9jaz0idHJ1ZSI+VGhhbmtzIGEgbG90IGZvciB0
aGF0LiBJIHdpbGwgdHJ5IGl0IGFzIHNvb24gYXMgcG9zc2libGUuPC9kaXY+PGRpdiBkYXRhLXNp
Z25hdHVyZWJsb2NrPSJ0cnVlIj5DYW4geW91IHBvc3NpYmxlIGhlbHAgbWUgdG8gYWRkIGl0IHRv
IGEmbmJzcDt5b2N0by1idWlsZC48L2Rpdj48ZGl2IGRhdGEtc2lnbmF0dXJlYmxvY2s9InRydWUi
PkkgdGhpbmsgaSBtdXN0IGNyZWF0ZSBhIGxheWVyIGFuZCB0aGVuIOKApiA/IOKApiBJIHdpbGwg
R29vZ2xlIOKApi4uIDs9KTwvZGl2PjxkaXYgZGF0YS1zaWduYXR1cmVibG9jaz0idHJ1ZSI+SWYg
eW91IGNhbiBoZWxwIG1lLCBpdCB3b3VsZCBiZSBzbyBuaWNlLjxicj48L2Rpdj48ZGl2IGRhdGEt
c2lnbmF0dXJlYmxvY2s9InRydWUiPjxicj48L2Rpdj48ZGl2IGRhdGEtc2lnbmF0dXJlYmxvY2s9
InRydWUiPlRIQU5LIFlPVSBBTEwgQSBMT1QgISEhISEhPGJyPlRIQU5LUyE8YnI+PC9kaXY+PC9k
aXY+CjwvYm9keT4KPC9odG1sPgo=

--_BD034D02-B72D-45F3-AA2B-142CBB69333E_--
