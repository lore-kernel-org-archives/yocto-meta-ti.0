Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A632AE01351
	for <meta-ti@yoctoproject.org>; Wed,  1 Aug 2012 14:49:50 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q71LnnK1000547
	for <meta-ti@yoctoproject.org>; Wed, 1 Aug 2012 16:49:49 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q71LnnNA026062
	for <meta-ti@yoctoproject.org>; Wed, 1 Aug 2012 16:49:49 -0500
Received: from DFLE30.ent.ti.com ([fe80::648b:2220:c6fb:4e6]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Wed, 1 Aug 2012 16:49:49 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [branch: denzil] [PATCHES] Porting netbase interfaces file
	from oe-classic v2
Thread-Index: Ac1wGuiP3OkzGA8iSsah6Ah++x0jPwAFGoKQ
Date: Wed, 1 Aug 2012 21:49:48 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C27E9A6@DFLE30.ent.ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C27E7C5@DFLE30.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C27E7C5@DFLE30.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [branch: denzil] [PATCHES] Porting netbase interfaces file from oe-classic v2
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
X-List-Received-Date: Wed, 01 Aug 2012 21:49:50 -0000
X-Groupsio-MsgNum: 1397
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_005_8F29D6B095ED194EA1980491A5E029710C27E9A6DFLE30entticom_"

--_005_8F29D6B095ED194EA1980491A5E029710C27E9A6DFLE30entticom_
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C27E9A6DFLE30entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C27E9A6DFLE30entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please use these patches instead of the previous set of patches sent.. Had =
to make a minor adjustment.

From: Cooper Jr., Franklin
Sent: Wednesday, August 01, 2012 2:22 PM
To: meta-ti@yoctoproject.org
Cc: Cooper Jr., Franklin
Subject: [branch: denzil] [PATCHES] Porting netbase interfaces file from oe=
-classic

These patches are very similar to the ones I sent before  except these are =
for the denzil branch. The denzil branch is currently using netbase 4.47 wh=
ile the master branch is using netbase 5.0 which is why two different patch=
 submissions are needed.

Regards,
Franklin Cooper Jr.
Texas Instruments
Application Engineer
fcooper@ti.com<mailto:fcooper@ti.com>


--_000_8F29D6B095ED194EA1980491A5E029710C27E9A6DFLE30entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
-->
</style><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Please use these patch=
es instead of the previous set of patches sent.. Had to make a minor adjust=
ment.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Cooper J=
r., Franklin
<br>
<b>Sent:</b> Wednesday, August 01, 2012 2:22 PM<br>
<b>To:</b> meta-ti@yoctoproject.org<br>
<b>Cc:</b> Cooper Jr., Franklin<br>
<b>Subject:</b> [branch: denzil] [PATCHES] Porting netbase interfaces file =
from oe-classic<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">These patches are very similar to the ones I sent be=
fore &nbsp;except these are for the denzil branch. The denzil branch is cur=
rently using netbase 4.47 while the master branch is using netbase 5.0 whic=
h is why two different patch submissions
 are needed. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Franklin Cooper Jr.<o:p></o:p></p>
<p class=3D"MsoNormal">Texas Instruments<o:p></o:p></p>
<p class=3D"MsoNormal">Application Engineer<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"mailto:fcooper@ti.com">fcooper@ti.com</a>=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_8F29D6B095ED194EA1980491A5E029710C27E9A6DFLE30entticom_--

--_005_8F29D6B095ED194EA1980491A5E029710C27E9A6DFLE30entticom_
Content-Type: application/octet-stream;
	name="0001-netbase-Add-base-interface-file.patch"
Content-Description: 0001-netbase-Add-base-interface-file.patch
Content-Disposition: attachment;
	filename="0001-netbase-Add-base-interface-file.patch"; size=2020;
	creation-date="Wed, 01 Aug 2012 21:47:04 GMT";
	modification-date="Wed, 01 Aug 2012 21:50:43 GMT"
Content-Transfer-Encoding: base64

RnJvbSAxNDhhNzBlODZiNzhkNTM3NWZiNTIxZGMwZjRhNDk1OWY2NjljMzkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGcmFua2xpbiBTIENvb3BlciBKciA8ZmNvb3BlckB0aS5jb20+
CkRhdGU6IE1vbiwgMzAgSnVsIDIwMTIgMTQ6NDg6MjIgLTA1MDAKU3ViamVjdDogW1BBVENIIDEv
Ml0gbmV0YmFzZTogQWRkIGJhc2UgaW50ZXJmYWNlIGZpbGUKCiogQWRkIFBSX2FwcGVuZAoqIFB1
bGwgaW4gYmFzZSBpbnRlcmZhY2UgZmlsZSBmcm9tIG9lLWNvcmUKKiBVcGRhdGUgdG8gdXNlIHRo
ZSBuZXcgc3ludGF4IGZvciBleHRlbmRpbmcgdGhlIGZpbGUgc2VhcmNoIHBhdGgKClNpZ25lZC1v
ZmYtYnk6IEZyYW5rbGluIFMgQ29vcGVyIEpyIDxmY29vcGVyQHRpLmNvbT4KLS0tCiByZWNpcGVz
LWNvcmUvbmV0YmFzZS9uZXRiYXNlLTQuNDcvaW50ZXJmYWNlcyB8ICAgMzEgKysrKysrKysrKysr
KysrKysrKysrKysrKysKIHJlY2lwZXMtY29yZS9uZXRiYXNlL25ldGJhc2VfNC40Ny5iYmFwcGVu
ZCAgIHwgICAgNSArKy0KIDIgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCByZWNpcGVzLWNvcmUvbmV0YmFzZS9uZXRiYXNl
LTQuNDcvaW50ZXJmYWNlcwoKZGlmZiAtLWdpdCBhL3JlY2lwZXMtY29yZS9uZXRiYXNlL25ldGJh
c2UtNC40Ny9pbnRlcmZhY2VzIGIvcmVjaXBlcy1jb3JlL25ldGJhc2UvbmV0YmFzZS00LjQ3L2lu
dGVyZmFjZXMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uMGFjZjRjZgotLS0g
L2Rldi9udWxsCisrKyBiL3JlY2lwZXMtY29yZS9uZXRiYXNlL25ldGJhc2UtNC40Ny9pbnRlcmZh
Y2VzCkBAIC0wLDAgKzEsMzEgQEAKKyMgL2V0Yy9uZXR3b3JrL2ludGVyZmFjZXMgLS0gY29uZmln
dXJhdGlvbiBmaWxlIGZvciBpZnVwKDgpLCBpZmRvd24oOCkKKyAKKyMgVGhlIGxvb3BiYWNrIGlu
dGVyZmFjZQorYXV0byBsbworaWZhY2UgbG8gaW5ldCBsb29wYmFjaworCisjIFdpcmVsZXNzIGlu
dGVyZmFjZXMKK2lmYWNlIHdsYW4wIGluZXQgZGhjcAorCXdpcmVsZXNzX21vZGUgbWFuYWdlZAor
CXdpcmVsZXNzX2Vzc2lkIGFueQorCXdwYS1kcml2ZXIgd2V4dAorCXdwYS1jb25mIC9ldGMvd3Bh
X3N1cHBsaWNhbnQuY29uZgorCitpZmFjZSBhdG1sMCBpbmV0IGRoY3AKKworIyBXaXJlZCBvciB3
aXJlbGVzcyBpbnRlcmZhY2VzCithdXRvIGV0aDAKK2lmYWNlIGV0aDAgaW5ldCBkaGNwCitpZmFj
ZSBldGgxIGluZXQgZGhjcAorCisjIEV0aGVybmV0L1JORElTIGdhZGdldCAoZ19ldGhlcikKKyMg
Li4uIG9yIG9uIGhvc3Qgc2lkZSwgdXNibmV0IGFuZCByYW5kb20gaHdhZGRyCitpZmFjZSB1c2Iw
IGluZXQgc3RhdGljCisJYWRkcmVzcyAxOTIuMTY4LjcuMgorCW5ldG1hc2sgMjU1LjI1NS4yNTUu
MAorCW5ldHdvcmsgMTkyLjE2OC43LjAKKwlnYXRld2F5IDE5Mi4xNjguNy4xCisKKyMgQmx1ZXRv
b3RoIG5ldHdvcmtpbmcKK2lmYWNlIGJuZXAwIGluZXQgZGhjcAorCmRpZmYgLS1naXQgYS9yZWNp
cGVzLWNvcmUvbmV0YmFzZS9uZXRiYXNlXzQuNDcuYmJhcHBlbmQgYi9yZWNpcGVzLWNvcmUvbmV0
YmFzZS9uZXRiYXNlXzQuNDcuYmJhcHBlbmQKaW5kZXggNGI4ZDBlNi4uNWM0NWFkNSAxMDA2NDQK
LS0tIGEvcmVjaXBlcy1jb3JlL25ldGJhc2UvbmV0YmFzZV80LjQ3LmJiYXBwZW5kCisrKyBiL3Jl
Y2lwZXMtY29yZS9uZXRiYXNlL25ldGJhc2VfNC40Ny5iYmFwcGVuZApAQCAtMSwzICsxLDQgQEAK
LVRISVNESVIgOj0gIiR7QG9zLnBhdGguZGlybmFtZShiYi5kYXRhLmdldFZhcignRklMRScsIGQs
IFRydWUpKX0iCi1GSUxFU1BBVEggPS4gIiR7QGJhc2Vfc2V0X2ZpbGVzcGF0aChbIiR7VEhJU0RJ
Un0vJHtQTn0iXSwgZCl9OiIKKyMgbG9vayBmb3IgZmlsZXMgaW4gdGhpcyBsYXllciBmaXJzdAor
RklMRVNFWFRSQVBBVEhTX3ByZXBlbmQgOj0gIiR7VEhJU0RJUn0vJHtQTn06IgogCitQUl9hcHBl
bmQgPSAiLXRpMCIKLS0gCjEuNy4wLjQKCg==

--_005_8F29D6B095ED194EA1980491A5E029710C27E9A6DFLE30entticom_
Content-Type: application/octet-stream;
	name="0002-netbase-Update-interface-file.patch"
Content-Description: 0002-netbase-Update-interface-file.patch
Content-Disposition: attachment;
	filename="0002-netbase-Update-interface-file.patch"; size=1363;
	creation-date="Wed, 01 Aug 2012 21:47:04 GMT";
	modification-date="Wed, 01 Aug 2012 21:50:43 GMT"
Content-Transfer-Encoding: base64

RnJvbSBkMGEyZGU5OWE0OWNhYzZhNThiNWM1ZDhmZDdhYzRhYzg5NjMxYmViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGcmFua2xpbiBTIENvb3BlciBKciA8ZmNvb3BlckB0aS5jb20+
CkRhdGU6IE1vbiwgMzAgSnVsIDIwMTIgMTU6MDE6MDAgLTA1MDAKU3ViamVjdDogW1BBVENIIDIv
Ml0gbmV0YmFzZTogVXBkYXRlIGludGVyZmFjZSBmaWxlCgoqIFVwZGF0ZSBpbnRlcmZhY2UgZmls
ZSBiYXNlZCBvbiBjaGFuZ2VzIG1hZGUgdG8gdGhlIGludGVyZmFjZSBmaWxlCiAgaW4gYXJhZ28K
ClNpZ25lZC1vZmYtYnk6IEZyYW5rbGluIFMgQ29vcGVyIEpyIDxmY29vcGVyQHRpLmNvbT4KLS0t
CiByZWNpcGVzLWNvcmUvbmV0YmFzZS9uZXRiYXNlLTQuNDcvaW50ZXJmYWNlcyB8ICAgMTIgKysr
KysrKy0tLS0tCiAxIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9yZWNpcGVzLWNvcmUvbmV0YmFzZS9uZXRiYXNlLTQuNDcvaW50ZXJm
YWNlcyBiL3JlY2lwZXMtY29yZS9uZXRiYXNlL25ldGJhc2UtNC40Ny9pbnRlcmZhY2VzCmluZGV4
IDBhY2Y0Y2YuLjE1YmMzMWMgMTAwNjQ0Ci0tLSBhL3JlY2lwZXMtY29yZS9uZXRiYXNlL25ldGJh
c2UtNC40Ny9pbnRlcmZhY2VzCisrKyBiL3JlY2lwZXMtY29yZS9uZXRiYXNlL25ldGJhc2UtNC40
Ny9pbnRlcmZhY2VzCkBAIC0xMSwyMCArMTEsMjIgQEAgaWZhY2Ugd2xhbjAgaW5ldCBkaGNwCiAJ
d3BhLWRyaXZlciB3ZXh0CiAJd3BhLWNvbmYgL2V0Yy93cGFfc3VwcGxpY2FudC5jb25mCiAKK2lm
YWNlIHRpd2xhbjAgaW5ldCBkaGNwCisJd2lyZWxlc3NfbW9kZSBtYW5hZ2VkCisJd2lyZWxlc3Nf
ZXNzaWQgYW55CisKIGlmYWNlIGF0bWwwIGluZXQgZGhjcAogCiAjIFdpcmVkIG9yIHdpcmVsZXNz
IGludGVyZmFjZXMKIGF1dG8gZXRoMAogaWZhY2UgZXRoMCBpbmV0IGRoY3AKKyAgICAgICAgcHJl
LXVwIC9iaW4vZ3JlcCAtdiAtZSAiaXA9WzAtOV1cK1wuWzAtOV1cK1wuWzAtOV1cK1wuWzAtOV1c
KyIgL3Byb2MvY21kbGluZSA+IC9kZXYvbnVsbAorCiBpZmFjZSBldGgxIGluZXQgZGhjcAogCiAj
IEV0aGVybmV0L1JORElTIGdhZGdldCAoZ19ldGhlcikKICMgLi4uIG9yIG9uIGhvc3Qgc2lkZSwg
dXNibmV0IGFuZCByYW5kb20gaHdhZGRyCi1pZmFjZSB1c2IwIGluZXQgc3RhdGljCi0JYWRkcmVz
cyAxOTIuMTY4LjcuMgotCW5ldG1hc2sgMjU1LjI1NS4yNTUuMAotCW5ldHdvcmsgMTkyLjE2OC43
LjAKLQlnYXRld2F5IDE5Mi4xNjguNy4xCitpZmFjZSB1c2IwIGluZXQgZGhjcAogCiAjIEJsdWV0
b290aCBuZXR3b3JraW5nCiBpZmFjZSBibmVwMCBpbmV0IGRoY3AKLS0gCjEuNy4wLjQKCg==

--_005_8F29D6B095ED194EA1980491A5E029710C27E9A6DFLE30entticom_--
