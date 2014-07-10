Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 333F0E006F3; Thu, 10 Jul 2014 14:15:11 -0700 (PDT)
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
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5D08E0059F
	for <meta-ti@yoctoproject.org>; Thu, 10 Jul 2014 14:15:02 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6ALEs4C026102;
	Thu, 10 Jul 2014 16:14:54 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6ALEs91010578;
	Thu, 10 Jul 2014 16:14:54 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Thu, 10 Jul 2014 16:14:53 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"Joshua.Vanderpool@raymondcorp.com" <Joshua.Vanderpool@raymondcorp.com>
Thread-Topic: [meta-ti] Kernel Config Fragments?
Thread-Index: AQHPnIP+rLtZJcAW/06CqMUtPxUCuA==
Date: Thu, 10 Jul 2014 21:14:53 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE732079D2F@DLEE08.ent.ti.com>
References: <7D1F292BE8E4CC4F93079C1A7A58D5622BAB10CA@usnygrmbx3.raymondcorp.local>
In-Reply-To: <7D1F292BE8E4CC4F93079C1A7A58D5622BAB10CA@usnygrmbx3.raymondcorp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: Kernel Config Fragments?
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
X-List-Received-Date: Thu, 10 Jul 2014 21:15:11 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE732079D2FDLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE732079D2FDLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, it does, please check the recipe for examples.

Denys


Sent from my Android phone using TouchDown (www.nitrodesk.com)

-----Original Message-----
From: Vanderpool Josh [Joshua.Vanderpool@raymondcorp.com]
Received: Thursday, 10 Jul 2014, 16:16
To: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
Subject: [meta-ti] Kernel Config Fragments?

Does the linux-ti-staging allow the use of config fragments.

We would like to have a bbappend that includes the configuration fragment i=
n our upper layer.
Currently we have to use the menuconfig which is a manual process, if there=
 is a better automated process please advise.

Regards,
-Josh

Confidentiality Notice: The preceding e-mail message (including any attachm=
ents) contains information that may be confidential, protected by applicabl=
e legal privileges, or constitute non-public information. It is intended to=
 be conveyed only to the designated recipient(s). If you are not an intende=
d recipient of this message, please notify the sender by replying to this m=
essage and then delete it from your system. Use, dissemination, distributio=
n or reproduction of this message by unintended recipients is not authorize=
d and may be unlawful.

--_000_B0581B5571079145BA1CD78C126DBDE732079D2FDLEE08entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style>
<!--
@font-face
	{font-family:Calibri}
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif"}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline}
span.EmailStyle17
	{font-family:"Calibri","sans-serif";
	color:windowtext}
.MsoChpDefault
	{font-family:"Calibri","sans-serif"}
@page WordSection1
	{margin:1.0in 1.0in 1.0in 1.0in}
div.WordSection1
	{}
-->
</style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">Yes, it does, please check the recipe for examples.<br>
<br>
Denys<br>
<br>
<br>
Sent from my Android phone using TouchDown (www.nitrodesk.com)<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Vanderpool Josh [Joshua.Vanderpool@raymondcorp.com]<br>
<b>Received:</b> Thursday, 10 Jul 2014, 16:16<br>
<b>To:</b> meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]<br>
<b>Subject:</b> [meta-ti] Kernel Config Fragments?<br>
<br>
</span></span>
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Does the linux-ti-staging allow the use of config fr=
agments.</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">We would like to have a bbappend that includes the c=
onfiguration fragment in our upper layer.</p>
<p class=3D"MsoNormal">Currently we have to use the menuconfig which is a m=
anual process, if there is a better automated process please advise.</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">Regards,</p>
<p class=3D"MsoNormal">-Josh</p>
</div>
<p>Confidentiality Notice: The preceding e-mail message (including any atta=
chments) contains information that may be confidential, protected by applic=
able legal privileges, or constitute non-public information. It is intended=
 to be conveyed only to the designated
 recipient(s). If you are not an intended recipient of this message, please=
 notify the sender by replying to this message and then delete it from your=
 system. Use, dissemination, distribution or reproduction of this message b=
y unintended recipients is not authorized
 and may be unlawful.</p>
<p></p>
</div>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE732079D2FDLEE08entticom_--
