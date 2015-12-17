Return-Path: <jdvdt2@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68D38E00C1C; Thu, 17 Dec 2015 05:41:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (jdvdt2[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 625ADE005B7
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2015 05:41:44 -0800 (PST)
Received: by mail-vk0-f41.google.com with SMTP id a189so46419417vkh.2
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2015 05:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=fwnVfz67y/M76XUoKRie9EjewO3r7y/Xf7sfoIpMd/c=;
	b=YOt4d/RtA/3A723mNqSzX/DeA5wrACPpYj0+pxRv7NZunG6vSp7y6ZHuMU2PZrElZk
	0fokMX8BQ18JgpZSnsz3+/jBzlZnG5GU1AJ/+pDBFOdFEhWKJoc7DAvfkeEygw/wrBIX
	pXV0paguOumIZ/x5NXkUdZzQV6xg5W3z+O78zu7bpxbO2SVQ7C66JRXnr4BuJkEPeL4D
	lu59FvHZ0qKhZBw+DyuiJKaJmGHJnz5CI1O4s/FrURF/6EYIxz2yGFZHLeAJyz1QqEk1
	E7H2feKSnZdIEcT0UzY8KdcwgDLCdSIZoR1i77xdagxWSQpXbANacTWb8wXNDv3NmixR
	CH6A==
MIME-Version: 1.0
X-Received: by 10.31.49.147 with SMTP id x141mr38721542vkx.1.1450359703368;
	Thu, 17 Dec 2015 05:41:43 -0800 (PST)
Received: by 10.31.93.69 with HTTP; Thu, 17 Dec 2015 05:41:43 -0800 (PST)
Date: Thu, 17 Dec 2015 08:41:43 -0500
Message-ID: <CAAjA2MK=K-iL1-t-=O=h6YmmaOZPj=mdk=zEsCUbaKz1M6d=mQ@mail.gmail.com>
From: Joshua Vanderpool <jdvdt2@gmail.com>
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: u-boot update to support TPS650937
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
X-List-Received-Date: Thu, 17 Dec 2015 13:41:47 -0000
X-Groupsio-MsgNum: 7704
Content-Type: multipart/mixed; boundary=001a11438346eac5be0527182e0b

--001a11438346eac5be0527182e0b
Content-Type: multipart/alternative; boundary=001a11438346eac5b80527182e09

--001a11438346eac5b80527182e09
Content-Type: text/plain; charset=UTF-8

I do not know how best to incorporate this update for use in the TI
mainline but this is the patches we used for our design to make it work.
This update is needed to write to the DEV_CTRL.DEV_ON register at 0x1A0
which to write to needed to be byte swapped for the the proper write to the
register.

Josh

--001a11438346eac5b80527182e09
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I do not know how best to incorporate this update for use =
in the TI mainline but this is the patches we used for our design to make i=
t work.=C2=A0 This update is needed to write to the=C2=A0DEV_CTRL.DEV_ON re=
gister at 0x1A0 which to write to needed to be byte swapped for the the pro=
per write to the register.<div><br></div><div>Josh</div></div>

--001a11438346eac5b80527182e09--

--001a11438346eac5be0527182e0b
Content-Type: text/x-patch; charset=US-ASCII; name="palmas.patch"
Content-Disposition: attachment; filename="palmas.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iiaag1kv0

LS0tIGdpdC9pbmNsdWRlL3BhbG1hcy5oCTIwMTUtMTAtMTQgMTM6MzY6NTAuNTg5NjUwMTQxIC0w
NDAwCisrKyBnaXQvaW5jbHVkZS9wYWxtYXNfY29weS5oCTIwMTUtMTAtMTQgMTM6Mzk6MDAuMjc3
NjQ5Mzg5IC0wNDAwCkBAIC0xMTgsNiArMTE4LDExIEBAIHN0YXRpYyBpbmxpbmUgaW50IHBhbG1h
c19pMmNfcmVhZF91OCh1OAogCXJldHVybiBpMmNfcmVhZChjaGlwX25vLCByZWcsIDEsIHZhbCwg
MSk7CiB9CiAKK3N0YXRpYyBpbmxpbmUgaW50IHBhbG1hc19pMmNfd3JpdGVfdTE2KHU4IGNoaXBf
bm8sIHUxNiByZWcsIHU4IHZhbCkKK3sKKwlyZXR1cm4gaTJjX3dyaXRlKGNoaXBfbm8sIHJlZywg
MiwgJnZhbCwgMSk7Cit9CisKIHZvaWQgcGFsbWFzX2luaXRfc2V0dGluZ3Modm9pZCk7CiBpbnQg
cGFsbWFzX21tYzFfcG93ZXJvbl9sZG8odm9pZCk7CiBpbnQgdHdsNjAzeF9tbWMxX3NldF9sZG85
KHU4IHZzZWwpOwo=

--001a11438346eac5be0527182e0b
Content-Type: text/x-patch; charset=US-ASCII; name="raymond_gdm.patch"
Content-Disposition: attachment; filename="raymond_gdm.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iiaag7d11

SW5kZXg6IGdpdC9pbmNsdWRlL2NvbmZpZ3MvcmF5bW9uZF9nZG0uaAo9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLSAv
ZGV2L251bGwKKysrIGdpdC9pbmNsdWRlL2NvbmZpZ3MvcmF5bW9uZF9nZG0uaApAQCAtMCwwICsx
LDY2IEBACisvKgorICogKEMpIENvcHlyaWdodCAyMDE0CisgKiBUZXhhcyBJbnN0cnVtZW50cyBJ
bmNvcnBvcmF0ZWQuCisgKiBGZWxpcGUgQmFsYmkgPGJhbGJpQHRpLmNvbT4KKyAqCisgKiBDb25m
aWd1cmF0aW9uIHNldHRpbmdzIGZvciB0aGUgVEkgQmVhZ2xlIHgxNSBib2FyZC4KKyAqIFNlZSB0
aV9vbWFwNV9jb21tb24uaCBmb3Igb21hcDUgY29tbW9uIHNldHRpbmdzLgorICoKKyAqIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOglHUEwtMi4wKworICovCisKKyNpZm5kZWYgX19DT05GSUdfUkFZ
TU9ORF9HRE1fSAorI2RlZmluZSBfX0NPTkZJR19SQVlNT05EX0dETV9ICisKKyNkZWZpbmUgQ09O
RklHX0FNNTdYWAorCisjaWZkZWYgQ09ORklHX1NQTF9CVUlMRAorI2RlZmluZSBDT05GSUdfSU9E
RUxBWV9SRUNBTElCUkFUSU9OCisjZW5kaWYKKworI2RlZmluZSBDT05GSUdfTlJfRFJBTV9CQU5L
UwkJMgorCisjZGVmaW5lIENPTkZJR19FTlZfU0laRQkJCSg2NCA8PCAxMCkKKyNkZWZpbmUgQ09O
RklHX0VOVl9JU19JTl9GQVQKKyNkZWZpbmUgRkFUX0VOVl9JTlRFUkZBQ0UJCSJtbWMiCisjZGVm
aW5lIEZBVF9FTlZfREVWSUNFX0FORF9QQVJUCQkiMDoxIgorI2RlZmluZSBGQVRfRU5WX0ZJTEUJ
CQkidWJvb3QuZW52IgorCisjZGVmaW5lIENPTkZJR19DTURfU0FWRUVOVgorCisjZGVmaW5lIENP
TlNPTEVERVYJCQkidHR5TzIiCisjZGVmaW5lIENPTkZJR19TWVNfTlMxNjU1MF9DT00xCQlVQVJU
MV9CQVNFCS8qIEJhc2UgRVZNIGhhcyBVQVJUMCAqLworI2RlZmluZSBDT05GSUdfU1lTX05TMTY1
NTBfQ09NMgkJVUFSVDJfQkFTRQkvKiBVQVJUMiAqLworI2RlZmluZSBDT05GSUdfU1lTX05TMTY1
NTBfQ09NMwkJVUFSVDNfQkFTRQkvKiBVQVJUMyAqLworI2RlZmluZSBDT05GSUdfQkFVRFJBVEUJ
CQkxMTUyMDAKKworI2RlZmluZSBDT05GSUdfU1lTX09NQVBfQUJFX1NZU0NLCisKKy8qIERlZmlu
ZSB0aGUgZGVmYXVsdCBHUFQgdGFibGUgZm9yIGVNTUMgKi8KKyNkZWZpbmUgUEFSVFNfREVGQVVM
VCBcCisJInV1aWRfZGlzaz0ke3V1aWRfZ3B0X2Rpc2t9OyIgXAorCSJuYW1lPXJvb3RmcyxzdGFy
dD0yTWlCLHNpemU9LSx1dWlkPSR7dXVpZF9ncHRfcm9vdGZzfSIKKworI2luY2x1ZGUgPGNvbmZp
Z3MvdGlfb21hcDVfY29tbW9uLmg+CisKKy8qIEVuaGFuY2Ugb3VyIGVNTUMgc3VwcG9ydCAvIGV4
cGVyaWVuY2UuICovCisjZGVmaW5lIENPTkZJR19DTURfR1BUCisjZGVmaW5lIENPTkZJR19FRklf
UEFSVElUSU9OCisjZGVmaW5lIENPTkZJR19QQVJUSVRJT05fVVVJRFMKKyNkZWZpbmUgQ09ORklH
X0NNRF9QQVJUCisKKyNkZWZpbmUgQ09ORklHX1NVUFBPUlRfRU1NQ19CT09UCisKKy8qIFVTQiB4
SENJIEhPU1QgKi8KKyNkZWZpbmUgQ09ORklHX0NNRF9VU0IKKyNkZWZpbmUgQ09ORklHX1VTQl9E
V0MzCisjZGVmaW5lIENPTkZJR19VU0JfSE9TVAorI2RlZmluZSBDT05GSUdfVVNCX1hIQ0kKKyNk
ZWZpbmUgQ09ORklHX1VTQl9YSENJX09NQVAKKyNkZWZpbmUgQ09ORklHX1VTQl9TVE9SQUdFCisj
ZGVmaW5lIENPTkZJR19TWVNfVVNCX1hIQ0lfTUFYX1JPT1RfUE9SVFMgMQorCisjZGVmaW5lIENP
TkZJR19PTUFQX1VTQl9QSFkKKyNkZWZpbmUgQ09ORklHX09NQVBfVVNCM1BIWTFfSE9TVAorCisj
ZW5kaWYgLyogX19DT05GSUdfQkVBR0xFX1g1X0ggKi8KSW5kZXg6IGdpdC9pbmNsdWRlL2NvbmZp
Z3MvdGlfb21hcDVfY29tbW9uLmgKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0gZ2l0Lm9yaWcvaW5jbHVkZS9jb25m
aWdzL3RpX29tYXA1X2NvbW1vbi5oCisrKyBnaXQvaW5jbHVkZS9jb25maWdzL3RpX29tYXA1X2Nv
bW1vbi5oCkBAIC05Nyw2ICs5Nyw0MCBAQAogI2RlZmluZSBOQU5EQk9PVAogI2VuZGlmCiAKKyNk
ZWZpbmUgQ09ORklHX0NNRF9TRVRFWFBSCisKKyNkZWZpbmUgRU1NQ19QQVJUUyBcCisJInV1aWRf
Z3B0X2Rpc2s9IiBcCisJImRmMzM1YjgzLWI2OWItNDczMS1hYTZkLThmMTYxYzhkZWEwMlwwIiBc
CisJInV1aWRfZ3B0X3Jvb3Rmcz0iIFwKKwkiZWEwMGZlZDMtYmYxZS00ZTU4LTk2YzItY2E1NDg4
ZTYwODYzXDAiIFwKKwkidXVpZF9ncHRfZGF0YT0iIFwKKwkiYmEwMGZlZDMtYmYxZS00ZTU4LTk2
YzItY2E1NDg4ZTYwODY0XDAiIFwKKwkidXVpZF9ncHRfYm9vdD0iIFwKKwkiYmEwMGZlZDMtYmYx
ZS00ZTU4LTk2YzItY2E1NDg4ZTYwODY1XDAiIFwKKwkicGFydGl0aW9ucz0iIFwKKwkidXVpZF9k
aXNrPSR7dXVpZF9ncHRfZGlza307bmFtZT1ib290LHN0YXJ0PTJNaUIsdXVpZD0ke3V1aWRfZ3B0
X2Jvb3R9LHNpemU9MTAwTWlCO25hbWU9cm9vdGZzLHNpemU9MTgwME1pQix1dWlkPSR7dXVpZF9n
cHRfcm9vdGZzfTtuYW1lPWRhdGEsc2l6ZT0tLHV1aWQ9JHt1dWlkX2dwdF9kYXRhfVwwIgorCisj
ZGVmaW5lIEVNTUNfVVBEQVRFIFwKKwkiZW1tY191cGRhdGU9IiBcCisJImdwdCB3cml0ZSBtbWMg
MSAke3BhcnRpdGlvbnN9OyIgXAorCSJtbWMgZGV2IDA7IiBcCisJIm1tYyByZXNjYW47IiBcCisJ
Im1tYyBkZXYgMTsiIFwKKwkibG9hZCBtbWMgMDoxICR7bG9hZGFkZHJ9IE1MTzsiIFwKKwkibW1j
IHdyaXRlICR7bG9hZGFkZHJ9IDB4MTAwIDB4MTAwOyIgXAorCSJtbWMgd3JpdGUgJHtsb2FkYWRk
cn0gMHgyMDAgMHgxMDA7IiBcCisJImxvYWQgbW1jIDA6MSAke2xvYWRhZGRyfSB1LWJvb3QuaW1n
OyIgXAorCSJtbWMgd3JpdGUgJHtsb2FkYWRkcn0gMHgzMDAgMHg0MDA7IiBcCisJImxvYWQgbW1j
IDA6MiAke2xvYWRhZGRyfSBib290LmZhdDsiIFwKKwkic2V0ZXhwciBjb3VudCAweCR7ZmlsZXNp
emV9ICsgMHgyMDA7IiBcCisJInNldGV4cHIgY291bnQgMHgke2NvdW50fSAvIDB4MjAwOyIgXAor
CSJtbWMgd3JpdGUgJHtsb2FkYWRkcn0gMHgxMDAwIDB4JHtjb3VudH07IiBcCisJImxvYWQgbW1j
IDA6MiAke2xvYWRhZGRyfSByb290ZnMuZXh0NDsiIFwKKwkic2V0ZXhwciBjb3VudCAweCR7Zmls
ZXNpemV9ICsgMHgyMDA7IiBcCisJInNldGV4cHIgY291bnQgMHgke2NvdW50fSAvIDB4MjAwOyIg
XAorCSJtbWMgd3JpdGUgJHtsb2FkYWRkcn0gMHgzMzAwMCAweCR7Y291bnR9XDAiCisKICNkZWZp
bmUgREZVX0FMVF9JTkZPX01NQyBcCiAJImRmdV9hbHRfaW5mb19tbWM9IiBcCiAJImJvb3QgcGFy
dCAwIDE7IiBcCkBAIC0xNDMsNyArMTY3LDcgQEAKIAlERUZBVUxUX0xJTlVYX0JPT1RfRU5WIFwK
IAkiY29uc29sZT0iIENPTlNPTEVERVYgIiwxMTUyMDBuOFwwIiBcCiAJImZkdGZpbGU9dW5kZWZp
bmVkXDAiIFwKLQkiYm9vdHBhcnQ9MDoyXDAiIFwKKwkiYm9vdHBhcnQ9MToxXDAiIFwKIAkiYm9v
dGRpcj0vYm9vdFwwIiBcCiAJImJvb3RmaWxlPXpJbWFnZVwwIiBcCiAJInVzYnR0eT1jZGNfYWNt
XDAiIFwKQEAgLTE1MSw3ICsxNzUsNyBAQAogCSJwYXJ0aXRpb25zPSIgUEFSVFNfREVGQVVMVCAi
XDAiIFwKIAkib3B0YXJncz1cMCIgXAogCSJtbWNkZXY9MFwwIiBcCi0JIm1tY3Jvb3Q9L2Rldi9t
bWNibGswcDIgcndcMCIgXAorCSJtbWNyb290PVBBUlRVVUlEPWQzZmUwMGVhLTFlYmYtNTg0ZS05
NmMyLWNhNTQ4OGU2MDg2MyByb1wwIiBcCiAJIm1tY3Jvb3Rmc3R5cGU9ZXh0NCByb290d2FpdFww
IiBcCiAJIm1tY2FyZ3M9c2V0ZW52IGJvb3RhcmdzIGNvbnNvbGU9JHtjb25zb2xlfSAiIFwKIAkJ
IiR7b3B0YXJnc30gIiBcCkBAIC0xNjcsNyArMTkxLDcgQEAKIAkiYm9vdHNjcmlwdD1lY2hvIFJ1
bm5pbmcgYm9vdHNjcmlwdCBmcm9tIG1tYyR7bW1jZGV2fSAuLi47ICIgXAogCQkic291cmNlICR7
bG9hZGFkZHJ9XDAiIFwKIAkiYm9vdGVudj11RW52LnR4dFwwIiBcCi0JImxvYWRib290ZW52PWZh
dGxvYWQgbW1jICR7bW1jZGV2fSAke2xvYWRhZGRyfSAke2Jvb3RlbnZ9XDAiIFwKKwkibG9hZGJv
b3RlbnY9bG9hZCBtbWMgJHtib290cGFydH0gJHtsb2FkYWRkcn0gJHtib290ZW52fVwwIiBcCiAJ
ImltcG9ydGJvb3RlbnY9ZWNobyBJbXBvcnRpbmcgZW52aXJvbm1lbnQgZnJvbSBtbWMke21tY2Rl
dn0gLi4uOyAiIFwKIAkJImVudiBpbXBvcnQgLXQgJHtsb2FkYWRkcn0gJHtmaWxlc2l6ZX1cMCIg
XAogCSJsb2FkaW1hZ2U9bG9hZCBtbWMgJHtib290cGFydH0gJHtsb2FkYWRkcn0gJHtib290ZGly
fS8ke2Jvb3RmaWxlfVwwIiBcCkBAIC0yMDUsMTggKzIyOSwyNSBAQAogCQkJInNldGVudiBmZHRm
aWxlIGRyYTcyLWV2bS5kdGI7IGZpOyIgXAogCQkiaWYgdGVzdCAkYm9hcmRfbmFtZSA9IGJlYWds
ZV94MTU7IHRoZW4gIiBcCiAJCQkic2V0ZW52IGZkdGZpbGUgYW01N3h4LWJlYWdsZS14MTUuZHRi
OyBmaTsiIFwKKwkJImlmIHRlc3QgJGJvYXJkX25hbWUgPSByYXltb25kX2dkbTsgdGhlbiAiIFwK
KwkJCSJpZiBncGlvIGlucHV0IDU4OyB0aGVuICIgXAorCQkJCSJzZXRlbnYgZmR0ZmlsZSBhbTU3
eHgtcmF5bW9uZC1nZG0uZHRiOyIgXAorCQkJImVsc2Ugc2V0ZW52IGZkdGZpbGUgYW01N3h4LXJh
eW1vbmQtZ2RtLWxjZDIuZHRiOyBmaTsiIFwKKwkJImZpOyIgXAogCQkiaWYgdGVzdCAkZmR0Zmls
ZSA9IHVuZGVmaW5lZDsgdGhlbiAiIFwKIAkJCSJlY2hvIFdBUk5JTkc6IENvdWxkIG5vdCBkZXRl
cm1pbmUgZGV2aWNlIHRyZWUgdG8gdXNlOyBmaTsgXDAiIFwKIAkibG9hZGZkdD1sb2FkIG1tYyAk
e2Jvb3RwYXJ0fSAke2ZkdGFkZHJ9ICR7Ym9vdGRpcn0vJHtmZHRmaWxlfTtcMCIgXAogCU5BTkRB
UkdTIFwKIAlERlVBUkdTIFwKKwlFTU1DX1BBUlRTIFwKKwlFTU1DX1VQREFURSBcCiAKICNkZWZp
bmUgQ09ORklHX0JPT1RDT01NQU5EIFwKIAkicnVuIGZpbmRmZHQ7ICIgXAogCSJydW4gbW1jYm9v
dDsiIFwKIAkic2V0ZW52IG1tY2RldiAxOyAiIFwKLQkic2V0ZW52IGJvb3RwYXJ0IDE6MjsgIiBc
Ci0JInNldGVudiBtbWNyb290IC9kZXYvbW1jYmxrMHAyIHJ3OyAiIFwKKwkic2V0ZW52IGJvb3Rw
YXJ0IDE6MTsgIiBcCisJInNldGVudiBtbWNyb290IFBBUlRVVUlEPWQzZmUwMGVhLTFlYmYtNTg0
ZS05NmMyLWNhNTQ4OGU2MDg2MyBybzsgIiBcCiAJInJ1biBtbWNib290OyIgXAogCU5BTkRCT09U
IFwKIAo=

--001a11438346eac5be0527182e0b--
