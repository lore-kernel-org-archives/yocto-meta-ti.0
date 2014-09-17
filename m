Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 62CD0E00853; Wed, 17 Sep 2014 14:01:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26FB0E007AA
	for <meta-ti@yoctoproject.org>; Wed, 17 Sep 2014 14:00:59 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8HL0xRM022067
	for <meta-ti@yoctoproject.org>; Wed, 17 Sep 2014 16:00:59 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8HL0w2H026839
	for <meta-ti@yoctoproject.org>; Wed, 17 Sep 2014 16:00:59 -0500
Received: from DLEE09.ent.ti.com ([fe80::d03e:3cf4:73ad:d589]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Wed, 17 Sep 2014 16:00:58 -0500
From: "Zhang, Hao" <hzhang@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [Boot Monitor secure device 1/2] boot monitor:
	un-comment	out commands to print sec block size
Thread-Index: AQHP0ro/INci8bSQrUSLaWTNiY8jQpwFzzkw
Date: Wed, 17 Sep 2014 21:00:57 +0000
Message-ID: <ECA334CFBA16F74DB2C66A2F1181F4D63F91AB45@DLEE09.ent.ti.com>
References: <1410987416-11236-1-git-send-email-hzhang@ti.com>
	<B0581B5571079145BA1CD78C126DBDE732104E4E@DLEE08.ent.ti.com>
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE732104E4E@DLEE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [Boot Monitor secure device 1/2] boot monitor: un-comment	out commands to print sec block size
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
X-List-Received-Date: Wed, 17 Sep 2014 21:01:07 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_ECA334CFBA16F74DB2C66A2F1181F4D63F91AB45DLEE09entticom_"

--_000_ECA334CFBA16F74DB2C66A2F1181F4D63F91AB45DLEE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry, I sent to the wrong list, please ignore this patch.

From: Dmytriyenko, Denys
Sent: Wednesday, September 17, 2014 4:59 PM
To: meta-ti@yoctoproject.org; Zhang, Hao
Subject: RE: [meta-ti] [Boot Monitor secure device 1/2] boot monitor: un-co=
mment out commands to print sec block size

Are you sure this is the right list?


Sent from my Android phone using TouchDown (www.nitrodesk.com<http://www.ni=
trodesk.com>)

-----Original Message-----
From: Zhang, Hao [hzhang@ti.com]
Received: Wednesday, 17 Sep 2014, 13:57
To: meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org> [meta-ti@yoct=
oproject.org]
Subject: [meta-ti] [Boot Monitor secure device 1/2] boot monitor: un-commen=
t out commands to print sec block size
From: Hao Zhang <hzhang@ti.com<mailto:hzhang@ti.com>>

Signed-off-by: Hao Zhang <hzhang@ti.com<mailto:hzhang@ti.com>>
---
 Docs/mksecuboot |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Docs/mksecuboot b/Docs/mksecuboot
index 22cc6bb..c99926e 100755
--- a/Docs/mksecuboot
+++ b/Docs/mksecuboot
@@ -59,7 +59,7 @@ $SECBIN -i $SEC_UBOOT_IMAGE \
         -r $KEYPATH/privkey.pem \
         -o $SIGNED_UBOOT_BM

-#echo -n "BM sec block size: ";
-#stat -c%s $BM_SEC_BLOCK;
+echo -n "BM sec block size: ";
+stat -c%s $BM_SEC_BLOCK;


--
1.7.9.5

--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_ECA334CFBA16F74DB2C66A2F1181F4D63F91AB45DLEE09entticom_
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
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
p.emailquote, li.emailquote, div.emailquote
	{mso-style-name:emailquote;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:1.0pt;
	border:none;
	padding:0in;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
span.EmailStyle20
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
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Sorry, I sent to the wron=
g list, please ignore this patch.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Dmytriye=
nko, Denys
<br>
<b>Sent:</b> Wednesday, September 17, 2014 4:59 PM<br>
<b>To:</b> meta-ti@yoctoproject.org; Zhang, Hao<br>
<b>Subject:</b> RE: [meta-ti] [Boot Monitor secure device 1/2] boot monitor=
: un-comment out commands to print sec block size<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:bla=
ck">Are you sure this is the right list?<br>
<br>
<br>
Sent from my Android phone using TouchDown (<a href=3D"http://www.nitrodesk=
.com">www.nitrodesk.com</a>)<br>
<br>
-----Original Message----- <br>
<b>From:</b> Zhang, Hao [hzhang@ti.com]<br>
<b>Received:</b> Wednesday, 17 Sep 2014, 13:57<br>
<b>To:</b> <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject=
.org</a> [meta-ti@yoctoproject.org]<br>
<b>Subject:</b> [meta-ti] [Boot Monitor secure device 1/2] boot monitor: un=
-comment out commands to print sec block size<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt">From: Hao Zhang &lt=
;<a href=3D"mailto:hzhang@ti.com">hzhang@ti.com</a>&gt;<br>
<br>
Signed-off-by: Hao Zhang &lt;<a href=3D"mailto:hzhang@ti.com">hzhang@ti.com=
</a>&gt;<br>
---<br>
&nbsp;Docs/mksecuboot |&nbsp;&nbsp;&nbsp; 4 &#43;&#43;--<br>
&nbsp;1 file changed, 2 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/Docs/mksecuboot b/Docs/mksecuboot<br>
index 22cc6bb..c99926e 100755<br>
--- a/Docs/mksecuboot<br>
&#43;&#43;&#43; b/Docs/mksecuboot<br>
@@ -59,7 &#43;59,7 @@ $SECBIN -i $SEC_UBOOT_IMAGE \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -r $KEYPATH/privkey.pem \<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -o $SIGNED_UBOOT_BM<br>
&nbsp;<br>
-#echo -n &quot;BM sec block size: &quot;;<br>
-#stat -c%s $BM_SEC_BLOCK;<br>
&#43;echo -n &quot;BM sec block size: &quot;;<br>
&#43;stat -c%s $BM_SEC_BLOCK;<br>
&nbsp;<br>
&nbsp;<br>
-- <br>
1.7.9.5<br>
<br>
-- <br>
_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.y=
octoproject.org/listinfo/meta-ti</a><o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_ECA334CFBA16F74DB2C66A2F1181F4D63F91AB45DLEE09entticom_--
