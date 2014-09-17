Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C4436E00853; Wed, 17 Sep 2014 13:59:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58169E007AA
	for <meta-ti@yoctoproject.org>; Wed, 17 Sep 2014 13:59:20 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8HKxJJM020306
	for <meta-ti@yoctoproject.org>; Wed, 17 Sep 2014 15:59:19 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8HKxIjr024863
	for <meta-ti@yoctoproject.org>; Wed, 17 Sep 2014 15:59:19 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Wed, 17 Sep 2014 15:59:18 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Zhang, Hao"
	<hzhang@ti.com>
Thread-Topic: [meta-ti] [Boot Monitor secure device 1/2] boot monitor:
	un-comment	out commands to print sec block size
Thread-Index: AQHP0roBvWOL1EF6YECkJMNJXsoJ85wFzwr4
Date: Wed, 17 Sep 2014 20:59:18 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE732104E4E@DLEE08.ent.ti.com>
References: <1410987416-11236-1-git-send-email-hzhang@ti.com>
In-Reply-To: <1410987416-11236-1-git-send-email-hzhang@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
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
X-List-Received-Date: Wed, 17 Sep 2014 20:59:30 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE732104E4EDLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE732104E4EDLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Are you sure this is the right list?


Sent from my Android phone using TouchDown (www.nitrodesk.com)

-----Original Message-----
From: Zhang, Hao [hzhang@ti.com]
Received: Wednesday, 17 Sep 2014, 13:57
To: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
Subject: [meta-ti] [Boot Monitor secure device 1/2] boot monitor: un-commen=
t out commands to print sec block size

From: Hao Zhang <hzhang@ti.com>

Signed-off-by: Hao Zhang <hzhang@ti.com>
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
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_B0581B5571079145BA1CD78C126DBDE732104E4EDLEE08entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11p=
t; color:black">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">Are you sure this is the right list?<br>
<br>
<br>
Sent from my Android phone using TouchDown (www.nitrodesk.com)<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Zhang, Hao [hzhang@ti.com]<br>
<b>Received:</b> Wednesday, 17 Sep 2014, 13:57<br>
<b>To:</b> meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]<br>
<b>Subject:</b> [meta-ti] [Boot Monitor secure device 1/2] boot monitor: un=
-comment out commands to print sec block size<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">From: Hao Zhang &lt;hzhang@ti.com&gt;<br>
<br>
Signed-off-by: Hao Zhang &lt;hzhang@ti.com&gt;<br>
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
meta-ti@yoctoproject.org<br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.y=
octoproject.org/listinfo/meta-ti</a><br>
</div>
</span></font>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE732104E4EDLEE08entticom_--
