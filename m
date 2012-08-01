Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6482DE01351
	for <meta-ti@yoctoproject.org>; Wed,  1 Aug 2012 14:51:49 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q71LpmXN022882
	for <meta-ti@yoctoproject.org>; Wed, 1 Aug 2012 16:51:48 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q71LpmD8028215
	for <meta-ti@yoctoproject.org>; Wed, 1 Aug 2012 16:51:48 -0500
Received: from DFLE30.ent.ti.com ([fe80::648b:2220:c6fb:4e6]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Wed, 1 Aug 2012 16:51:48 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [branch: master][PATCHES] Porting netbase interfaces file from
	oe-classic v2
Thread-Index: Ac1wGNivcFQPZ4euQjaH4CrcFRxxnAAFty6w
Date: Wed, 1 Aug 2012 21:51:47 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C27E9EC@DFLE30.ent.ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C27E75F@DFLE30.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C27E75F@DFLE30.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [branch: master][PATCHES] Porting netbase interfaces file from oe-classic v2
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
X-List-Received-Date: Wed, 01 Aug 2012 21:51:49 -0000
X-Groupsio-MsgNum: 1398
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_005_8F29D6B095ED194EA1980491A5E029710C27E9ECDFLE30entticom_"

--_005_8F29D6B095ED194EA1980491A5E029710C27E9ECDFLE30entticom_
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C27E9ECDFLE30entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C27E9ECDFLE30entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please use these patches instead of the previous set of patches sent. I had=
 to make a minor adjustment.

From: Cooper Jr., Franklin
Sent: Wednesday, August 01, 2012 2:07 PM
To: meta-ti@yoctoproject.org
Cc: Cooper Jr., Franklin
Subject: [branch: master][PATCHES] Porting netbase interfaces file from oe-=
classic

Attached patches are for porting the netbase interface file used in arago/o=
e-classic to meta-ti.

The difference between my interfaces file and the one in beagleboard direct=
ory seems very minor. Would it be ok to combine the changes from both files=
 into a single file? The auto usb0 looks like it might be an issue if we co=
mbined the two files. Would it make sense to append that line to the interf=
ace file during do_install_append step only for the beagleboard platform an=
d consolidate the rest of the differences?

diff beagleboard/interfaces interfaces
13a14,17
> iface tiwlan0 inet dhcp
>    wireless_mode managed
>    wireless_essid any
>
18a23,24
>         pre-up /bin/grep -v -e "ip=3D[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" =
/proc/cmdline > /dev/null
>
21,22c27,28
< # Ethernet/RNDIS gadget (g_ether) or LAN9514 on BeagleBoard xM
< auto usb0
---
> # Ethernet/RNDIS gadget (g_ether)
> # ... or on host side, usbnet and random hwaddr


Regards,
Franklin Cooper Jr.
Texas Instruments
Application Engineer
fcooper@ti.com<mailto:fcooper@ti.com>


--_000_8F29D6B095ED194EA1980491A5E029710C27E9ECDFLE30entticom_
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
es instead of the previous set of patches sent. I had to make a minor adjus=
tment.
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
<b>Sent:</b> Wednesday, August 01, 2012 2:07 PM<br>
<b>To:</b> meta-ti@yoctoproject.org<br>
<b>Cc:</b> Cooper Jr., Franklin<br>
<b>Subject:</b> [branch: master][PATCHES] Porting netbase interfaces file f=
rom oe-classic<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Attached patches are for porting the netbase interfa=
ce file used in arago/oe-classic to meta-ti.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The difference between my interfaces file and the on=
e in beagleboard directory seems very minor. Would it be ok to combine the =
changes from both files into a single file? The auto usb0 looks like it mig=
ht be an issue if we combined the
 two files. Would it make sense to append that line to the interface file d=
uring do_install_append step only for the beagleboard platform and consolid=
ate the rest of the differences?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><span style=3D"font-family:&quot;Courier New&quot=
;">diff beagleboard/interfaces interfaces<o:p></o:p></span></b></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:&quot;Courier New&quot;">13a14,17<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:&quot;Courier New&quot;">&gt; iface tiwlan0 inet dhcp<o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:&quot;Courier New&quot;">&gt; &nbsp;&nbsp; wireless_mode managed<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:&quot;Courier New&quot;">&gt; &nbsp;&nbsp; wireless_essid any<o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:&quot;Courier New&quot;">&gt;
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:&quot;Courier New&quot;">18a23,24<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:&quot;Courier New&quot;">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; pre-up /bin/grep -v -e &quot;ip=3D[0-9]\&#43;\.[0-9]\&#43;\.[0-9]\&=
#43;\.[0-9]\&#43;&quot; /proc/cmdline &gt; /dev/null<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:&quot;Courier New&quot;">&gt;
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:&quot;Courier New&quot;">21,22c27,28<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:&quot;Courier New&quot;">&lt; # Ethernet/RNDIS gadget (g_ether) or LAN=
9514 on BeagleBoard xM<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:&quot;Courier New&quot;">&lt; auto usb0<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:&quot;Courier New&quot;">---<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:&quot;Courier New&quot;">&gt; # Ethernet/RNDIS gadget (g_ether)<o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:&quot;Courier New&quot;">&gt; # ... or on host side, usbnet and random=
 hwaddr<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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

--_000_8F29D6B095ED194EA1980491A5E029710C27E9ECDFLE30entticom_--

--_005_8F29D6B095ED194EA1980491A5E029710C27E9ECDFLE30entticom_
Content-Type: application/octet-stream;
	name="0001-netbase-Add-base-interface-file.patch"
Content-Description: 0001-netbase-Add-base-interface-file.patch
Content-Disposition: attachment;
	filename="0001-netbase-Add-base-interface-file.patch"; size=2014;
	creation-date="Wed, 01 Aug 2012 21:50:18 GMT";
	modification-date="Wed, 01 Aug 2012 21:54:39 GMT"
Content-Transfer-Encoding: base64

RnJvbSA0NTExZDYzNzcxNDYxOGNmYWFjMDE2YTlkYzVjMTdiMTdkMTMyMjFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGcmFua2xpbiBTIENvb3BlciBKciA8ZmNvb3BlckB0aS5jb20+
CkRhdGU6IFdlZCwgMSBBdWcgMjAxMiAxMzo0Njo1MyAtMDUwMApTdWJqZWN0OiBbUEFUQ0ggMS8y
XSBuZXRiYXNlOiBBZGQgYmFzZSBpbnRlcmZhY2UgZmlsZQoKKiBBZGQgUFJfYXBwZW5kCiogUHVs
bCBpbiB0aGUgYmFzZSBpbnRlcmZhY2UgZmlsZSBmcm9tIG9lLWNvcmUKKiBVcGRhdGUgdG8gdXNl
IHRoZSBuZXcgc3ludGF4IGZvciBleHRlbmRpbmcgdGhlIGZpbGUgc2VhcmNoIHBhdGgKClNpZ25l
ZC1vZmYtYnk6IEZyYW5rbGluIFMgQ29vcGVyIEpyIDxmY29vcGVyQHRpLmNvbT4KLS0tCiByZWNp
cGVzLWNvcmUvbmV0YmFzZS9uZXRiYXNlLTUuMC9pbnRlcmZhY2VzIHwgICAzMSArKysrKysrKysr
KysrKysrKysrKysrKysrKysKIHJlY2lwZXMtY29yZS9uZXRiYXNlL25ldGJhc2VfNS4wLmJiYXBw
ZW5kICAgfCAgICA1ICsrLQogMiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMtY29yZS9uZXRiYXNlL25ldGJh
c2UtNS4wL2ludGVyZmFjZXMKCmRpZmYgLS1naXQgYS9yZWNpcGVzLWNvcmUvbmV0YmFzZS9uZXRi
YXNlLTUuMC9pbnRlcmZhY2VzIGIvcmVjaXBlcy1jb3JlL25ldGJhc2UvbmV0YmFzZS01LjAvaW50
ZXJmYWNlcwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi4wYWNmNGNmCi0tLSAv
ZGV2L251bGwKKysrIGIvcmVjaXBlcy1jb3JlL25ldGJhc2UvbmV0YmFzZS01LjAvaW50ZXJmYWNl
cwpAQCAtMCwwICsxLDMxIEBACisjIC9ldGMvbmV0d29yay9pbnRlcmZhY2VzIC0tIGNvbmZpZ3Vy
YXRpb24gZmlsZSBmb3IgaWZ1cCg4KSwgaWZkb3duKDgpCisgCisjIFRoZSBsb29wYmFjayBpbnRl
cmZhY2UKK2F1dG8gbG8KK2lmYWNlIGxvIGluZXQgbG9vcGJhY2sKKworIyBXaXJlbGVzcyBpbnRl
cmZhY2VzCitpZmFjZSB3bGFuMCBpbmV0IGRoY3AKKwl3aXJlbGVzc19tb2RlIG1hbmFnZWQKKwl3
aXJlbGVzc19lc3NpZCBhbnkKKwl3cGEtZHJpdmVyIHdleHQKKwl3cGEtY29uZiAvZXRjL3dwYV9z
dXBwbGljYW50LmNvbmYKKworaWZhY2UgYXRtbDAgaW5ldCBkaGNwCisKKyMgV2lyZWQgb3Igd2ly
ZWxlc3MgaW50ZXJmYWNlcworYXV0byBldGgwCitpZmFjZSBldGgwIGluZXQgZGhjcAoraWZhY2Ug
ZXRoMSBpbmV0IGRoY3AKKworIyBFdGhlcm5ldC9STkRJUyBnYWRnZXQgKGdfZXRoZXIpCisjIC4u
LiBvciBvbiBob3N0IHNpZGUsIHVzYm5ldCBhbmQgcmFuZG9tIGh3YWRkcgoraWZhY2UgdXNiMCBp
bmV0IHN0YXRpYworCWFkZHJlc3MgMTkyLjE2OC43LjIKKwluZXRtYXNrIDI1NS4yNTUuMjU1LjAK
KwluZXR3b3JrIDE5Mi4xNjguNy4wCisJZ2F0ZXdheSAxOTIuMTY4LjcuMQorCisjIEJsdWV0b290
aCBuZXR3b3JraW5nCitpZmFjZSBibmVwMCBpbmV0IGRoY3AKKwpkaWZmIC0tZ2l0IGEvcmVjaXBl
cy1jb3JlL25ldGJhc2UvbmV0YmFzZV81LjAuYmJhcHBlbmQgYi9yZWNpcGVzLWNvcmUvbmV0YmFz
ZS9uZXRiYXNlXzUuMC5iYmFwcGVuZAppbmRleCA0YjhkMGU2Li41YzQ1YWQ1IDEwMDY0NAotLS0g
YS9yZWNpcGVzLWNvcmUvbmV0YmFzZS9uZXRiYXNlXzUuMC5iYmFwcGVuZAorKysgYi9yZWNpcGVz
LWNvcmUvbmV0YmFzZS9uZXRiYXNlXzUuMC5iYmFwcGVuZApAQCAtMSwzICsxLDQgQEAKLVRISVNE
SVIgOj0gIiR7QG9zLnBhdGguZGlybmFtZShiYi5kYXRhLmdldFZhcignRklMRScsIGQsIFRydWUp
KX0iCi1GSUxFU1BBVEggPS4gIiR7QGJhc2Vfc2V0X2ZpbGVzcGF0aChbIiR7VEhJU0RJUn0vJHtQ
Tn0iXSwgZCl9OiIKKyMgbG9vayBmb3IgZmlsZXMgaW4gdGhpcyBsYXllciBmaXJzdAorRklMRVNF
WFRSQVBBVEhTX3ByZXBlbmQgOj0gIiR7VEhJU0RJUn0vJHtQTn06IgogCitQUl9hcHBlbmQgPSAi
LXRpMCIKLS0gCjEuNy4wLjQKCg==

--_005_8F29D6B095ED194EA1980491A5E029710C27E9ECDFLE30entticom_
Content-Type: application/octet-stream;
	name="0002-netbase-Update-interface-file.patch"
Content-Description: 0002-netbase-Update-interface-file.patch
Content-Disposition: attachment;
	filename="0002-netbase-Update-interface-file.patch"; size=1357;
	creation-date="Wed, 01 Aug 2012 21:50:18 GMT";
	modification-date="Wed, 01 Aug 2012 21:54:39 GMT"
Content-Transfer-Encoding: base64

RnJvbSA4MTY0MGE2YWE4M2Q1NDMxNTQ3ZGEzMTRlYTgyOThmNmZhMmNhYjkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGcmFua2xpbiBTIENvb3BlciBKciA8ZmNvb3BlckB0aS5jb20+
CkRhdGU6IFdlZCwgMSBBdWcgMjAxMiAxMzo0ODoxOCAtMDUwMApTdWJqZWN0OiBbUEFUQ0ggMi8y
XSBuZXRiYXNlOiBVcGRhdGUgaW50ZXJmYWNlIGZpbGUKCiogVXBkYXRlIGludGVyZmFjZSBmaWxl
IGJhc2VkIG9uIGNoYW5nZXMgbWFkZSB0byB0aGUgaW50ZXJmYWNlIGZpbGUKICBpbiBhcmFnbwoK
U2lnbmVkLW9mZi1ieTogRnJhbmtsaW4gUyBDb29wZXIgSnIgPGZjb29wZXJAdGkuY29tPgotLS0K
IHJlY2lwZXMtY29yZS9uZXRiYXNlL25ldGJhc2UtNS4wL2ludGVyZmFjZXMgfCAgIDEyICsrKysr
KystLS0tLQogMSBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvcmVjaXBlcy1jb3JlL25ldGJhc2UvbmV0YmFzZS01LjAvaW50ZXJmYWNl
cyBiL3JlY2lwZXMtY29yZS9uZXRiYXNlL25ldGJhc2UtNS4wL2ludGVyZmFjZXMKaW5kZXggMGFj
ZjRjZi4uMTViYzMxYyAxMDA2NDQKLS0tIGEvcmVjaXBlcy1jb3JlL25ldGJhc2UvbmV0YmFzZS01
LjAvaW50ZXJmYWNlcworKysgYi9yZWNpcGVzLWNvcmUvbmV0YmFzZS9uZXRiYXNlLTUuMC9pbnRl
cmZhY2VzCkBAIC0xMSwyMCArMTEsMjIgQEAgaWZhY2Ugd2xhbjAgaW5ldCBkaGNwCiAJd3BhLWRy
aXZlciB3ZXh0CiAJd3BhLWNvbmYgL2V0Yy93cGFfc3VwcGxpY2FudC5jb25mCiAKK2lmYWNlIHRp
d2xhbjAgaW5ldCBkaGNwCisJd2lyZWxlc3NfbW9kZSBtYW5hZ2VkCisJd2lyZWxlc3NfZXNzaWQg
YW55CisKIGlmYWNlIGF0bWwwIGluZXQgZGhjcAogCiAjIFdpcmVkIG9yIHdpcmVsZXNzIGludGVy
ZmFjZXMKIGF1dG8gZXRoMAogaWZhY2UgZXRoMCBpbmV0IGRoY3AKKyAgICAgICAgcHJlLXVwIC9i
aW4vZ3JlcCAtdiAtZSAiaXA9WzAtOV1cK1wuWzAtOV1cK1wuWzAtOV1cK1wuWzAtOV1cKyIgL3By
b2MvY21kbGluZSA+IC9kZXYvbnVsbAorCiBpZmFjZSBldGgxIGluZXQgZGhjcAogCiAjIEV0aGVy
bmV0L1JORElTIGdhZGdldCAoZ19ldGhlcikKICMgLi4uIG9yIG9uIGhvc3Qgc2lkZSwgdXNibmV0
IGFuZCByYW5kb20gaHdhZGRyCi1pZmFjZSB1c2IwIGluZXQgc3RhdGljCi0JYWRkcmVzcyAxOTIu
MTY4LjcuMgotCW5ldG1hc2sgMjU1LjI1NS4yNTUuMAotCW5ldHdvcmsgMTkyLjE2OC43LjAKLQln
YXRld2F5IDE5Mi4xNjguNy4xCitpZmFjZSB1c2IwIGluZXQgZGhjcAogCiAjIEJsdWV0b290aCBu
ZXR3b3JraW5nCiBpZmFjZSBibmVwMCBpbmV0IGRoY3AKLS0gCjEuNy4wLjQKCg==

--_005_8F29D6B095ED194EA1980491A5E029710C27E9ECDFLE30entticom_--
